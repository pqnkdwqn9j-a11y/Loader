
	-- ====================== Potato.hook UI adapter ======================
	local function titleCase(str)
		str = tostring(str or "")
		return (str:gsub("^%l", string.upper))
	end

	local TAB_LAYOUT = {
		combat = {Name = "Combat", Image = "rbxassetid://7485051715", Sections = {"Silent aim", "Weapon"}},
		visuals = {Name = "ESP", Image = "rbxassetid://13321848320", Sections = {"Player ESP", "NPC ESP"}, Esp = true},
		entity = {Name = "World", Image = "rbxassetid://18870359747", Sections = {"Entity ESP", "World"}, Sides = {"Left", "Left"}},
		["local"] = {Name = "Local", Image = "rbxassetid://6953992690", Sections = {"Movement", "Misc"}},
		ui = {Name = "Settings", Image = "rbxassetid://11956055886", Sections = {"Configs", "HUD"}},
	}

	-- the original drawing based esp is replaced by the Potato ESP engine;
	-- its flags still exist (hidden) so the rest of the logic keeps working
	local HIDDEN_PREFIXES = {"playerEsp_", "npcEsp_", "entityEsp_", "silentMinicopter_", "disableMinicopterDamage_", "shootWhilePiloted_"}
	local function isHiddenFlag(flag)
		if type(flag) ~= "string" then
			return false
		end
		for _, prefix in HIDDEN_PREFIXES do
			if flag:sub(1, #prefix) == prefix then
				return true
			end
		end
		return false
	end

	local MainWindow = Library:Window({Name = "MainWindow"})
	local FirstTab = nil

	local AdapterWindow = {flags = {}, toggleCallbacks = {}, tabs = {}}

	setmetatable(AdapterWindow, {
		__index = function(_, key)
			if key == "active" then
				return MainWindow.IsOpen == true
			end
			return nil
		end,
	})

	function AdapterWindow:notify(text, duration)
		Library:Notify(tostring(text), duration or 3)
	end

	function AdapterWindow:onToggle(fn)
		table.insert(self.toggleCallbacks, fn)
	end

	function AdapterWindow:toggle(force)
		MainWindow:SetVisibility(force)
	end

	do
		local oldSetVisibility = MainWindow.SetVisibility
		MainWindow.SetVisibility = function(selfWindow, force)
			oldSetVisibility(selfWindow, force)
			local open = selfWindow.IsOpen == true
			for _, fn in AdapterWindow.toggleCallbacks do
				pcall(fn, open)
			end
		end
	end

	local function safeCall(fn, ...)
		local ok, err = pcall(fn, ...)
		if not ok then
			warn("[Potato.hook] " .. tostring(err))
		end
	end

	local function newFlag(kind, value, element)
		local flag = {type = kind, value = value, key = nil, self = element, funcs = {}, keyFuncs = {}}
		flag.Changed = function(...)
			for _, fn in flag.funcs do
				safeCall(fn, ...)
			end
		end
		flag.KeyChanged = function(...)
			for _, fn in flag.keyFuncs do
				safeCall(fn, ...)
			end
		end
		flag.OnChanged = function(selfFlag, fn)
			table.insert(selfFlag.funcs, fn)
			safeCall(fn, selfFlag.value)
		end
		flag.OnKeyChanged = function(selfFlag, fn)
			table.insert(selfFlag.keyFuncs, fn)
			safeCall(fn, selfFlag.key)
		end
		return flag
	end

	local function registerFlag(name, flag)
		if name then
			AdapterWindow.flags[name] = flag
		end
	end

	local Tab = {}
	Tab.__index = Tab

	function AdapterWindow:addTab(name)
		local layout = TAB_LAYOUT[name] or {Name = titleCase(name), Sections = {"Main", "Other"}}
		local potatoTab = MainWindow:Tab({Name = layout.Name, Image = layout.Image})
		if not FirstTab then
			FirstTab = potatoTab
		end
		local tab = setmetatable({name = name, window = self, potatoTab = potatoTab, layout = layout, sections = {}}, Tab)
		if layout.Esp and PH_UI.buildEspTab then
			local ok, err = pcall(PH_UI.buildEspTab, {ESP = potatoTab})
			if not ok then
				warn("[Potato.hook] esp tab error: " .. tostring(err))
			end
		end
		self.tabs[name] = tab
		return tab
	end

	function Tab:section(column)
		column = column == 2 and 2 or 1
		local section = self.sections[column]
		if not section then
			if not self.category then
				self.category = self.potatoTab:Category({Name = "Main"})
			end
			local sides = self.layout.Sides or {"Left", "Right"}
			section = self.category:Section({Name = self.layout.Sections[column], Side = sides[column]})
			self.sections[column] = section
		end
		return section
	end

	-- hidden (ui-less) elements ---------------------------------------------
	local HiddenToggle = {}
	HiddenToggle.__index = HiddenToggle

	local function hiddenValueElement(kind, default, flagName)
		local element = {hidden = true, value = default}
		local flag = newFlag(kind, default, element)
		element.flag = flag
		element.setValue = function(value)
			if value == nil or value == flag.value then
				return
			end
			element.value = value
			flag.value = value
			flag.Changed(value)
		end
		registerFlag(flagName, flag)
		return element, flag
	end

	function HiddenToggle:addKeypicker(cfg)
		local element = {hidden = true, mode = cfg.mode or "toggle", value = "None"}
		local flag = newFlag("keypicker", false, element)
		flag.key = "None"
		element.flag = flag
		element.setValue = function(active, key)
			if key ~= nil and key ~= flag.key then
				flag.key = key
				element.value = key
				flag.KeyChanged(key)
			end
			active = active == true
			if flag.value ~= active then
				flag.value = active
				flag.Changed(active)
			end
		end
		registerFlag(cfg.flag, flag)
		return element
	end

	function HiddenToggle:addColourpicker(cfg)
		local element = hiddenValueElement("colourpicker", cfg.default or Color3.fromRGB(255, 255, 255), cfg.flag)
		return element
	end

	-- toggle --------------------------------------------------------------
	local ToggleElement = {}
	ToggleElement.__index = ToggleElement

	function Tab:addToggle(cfg, column)
		if isHiddenFlag(cfg.flag) then
			local element = hiddenValueElement("toggle", cfg.default == true, cfg.flag)
			element.text = cfg.text
			element.enabled = cfg.default == true
			element.linkedKeybinds = {}
			return setmetatable(element, HiddenToggle)
		end
		local section = self:section(column)
		local element = setmetatable({tab = self, window = self.window, column = column, text = cfg.text or "Toggle", enabled = cfg.default or false, linkedKeybinds = {}}, ToggleElement)
		local flag = newFlag("toggle", element.enabled, element)
		element.flag = flag
		local potato
		potato = section:Toggle({
			Name = titleCase(cfg.text or "Toggle"),
			Flag = cfg.flag or ("auh_toggle_" .. tostring(math.random(1, 1e9))),
			Default = cfg.default or false,
			Risky = cfg.risky,
			Callback = function()
				if not potato then
					return
				end
				local value = potato.Value == true
				if flag.value == value then
					return
				end
				element.enabled = value
				flag.value = value
				flag.Changed(value)
				for _, kb in element.linkedKeybinds do
					kb.Active = value
					if kb.Key then
						pcall(function()
							MainWindow.Hotkeys:UpdateStatus(kb.Name, value)
						end)
					end
				end
			end,
		})
		element.potato = potato
		element.setValue = function(value)
			value = value == true
			if potato.Value ~= value then
				potato:Set(value)
			elseif flag.value ~= value then
				element.enabled = value
				flag.value = value
				flag.Changed(value)
			end
		end
		registerFlag(cfg.flag, flag)
		return element
	end

	-- keypicker (attached to toggle) ----------------------------------------
	local KEY_ALIASES = {MouseButton1 = "MB1", MouseButton2 = "MB2", MouseButton3 = "MB3"}

	local function keyNameFromInput(input)
		if not input then
			return "None"
		end
		local keyType = input.UserInputType
		if keyType == Enum.UserInputType.Keyboard and input.KeyCode then
			return input.KeyCode.Name
		end
		local name = keyType and keyType.Name or "None"
		return KEY_ALIASES[name] or name
	end

	local function inputFromKeyName(name)
		if not name or name == "None" or name == "..." then
			return nil
		end
		for alias, short in KEY_ALIASES do
			if short == name then
				name = alias
			end
		end
		local okKey, keyCode = pcall(function()
			return Enum.KeyCode[name]
		end)
		if okKey and keyCode then
			return {UserInputType = Enum.UserInputType.Keyboard, KeyCode = keyCode}
		end
		local okType, inputType = pcall(function()
			return Enum.UserInputType[name]
		end)
		if okType and inputType then
			return {UserInputType = inputType}
		end
		return nil
	end

	function ToggleElement:addKeypicker(cfg)
		local toggle = self
		local element = {tab = toggle.tab, toggle = toggle, window = toggle.window, mode = cfg.mode or "toggle", value = "None"}
		local flag = newFlag("keypicker", false, element)
		flag.key = "None"
		element.flag = flag
		local blacklisted = {}
		for _, name in cfg.blacklisted or {} do
			blacklisted[name] = true
		end
		local potato = toggle.tab:section(toggle.column):Keybind({
			Name = titleCase(toggle.text) .. " key",
			Flag = cfg.flag or ("auh_key_" .. tostring(math.random(1, 1e9))),
			Mode = (element.mode == "hold") and "Hold" or "Toggle",
			Callback = function(state)
				state = state == true
				if flag.value == state then
					return
				end
				flag.value = state
				flag.Changed(state)
			end,
		})
		element.potato = potato
		table.insert(toggle.linkedKeybinds, potato)
		do
			local oldSetKey = potato.SetKey
			potato.SetKey = function(selfKey, input)
				if input and input.KeyCode and blacklisted[input.KeyCode.Name] then
					return
				end
				oldSetKey(selfKey, input)
				local name = keyNameFromInput(input)
				element.value = name
				flag.key = name
				flag.KeyChanged(name)
			end
		end
		element.setValue = function(active, key)
			if key ~= nil and key ~= flag.key then
				potato:SetKey(inputFromKeyName(key))
			end
			active = active == true
			if potato.Active ~= active then
				potato:SetState(active)
			elseif flag.value ~= active then
				flag.value = active
				flag.Changed(active)
			end
		end
		if cfg.default and cfg.default ~= "None" then
			potato:SetKey(inputFromKeyName(cfg.default))
		end
		registerFlag(cfg.flag, flag)
		return element
	end

	-- colourpicker (attached to toggle) ------------------------------------
	function ToggleElement:addColourpicker(cfg)
		local toggle = self
		local element = {tab = toggle.tab, toggle = toggle, window = toggle.window}
		local default = cfg.default or Color3.fromRGB(255, 255, 255)
		local flag = newFlag("colourpicker", default, element)
		element.flag = flag
		element.value = default
		local potato = toggle.tab:section(toggle.column):Colorpicker({
			Name = titleCase(toggle.text) .. " color",
			Flag = cfg.flag or ("auh_colour_" .. tostring(math.random(1, 1e9))),
			Default = {default, 0},
			Callback = function(value)
				local colour = type(value) == "table" and value[1] or value
				if typeof(colour) ~= "Color3" or colour == flag.value then
					return
				end
				element.value = colour
				flag.value = colour
				flag.Changed(colour)
			end,
		})
		element.potato = potato
		element.setValue = function(colour)
			if typeof(colour) == "Color3" then
				potato:Set({colour, (type(potato.Value) == "table" and potato.Value[2]) or 0})
			end
		end
		registerFlag(cfg.flag, flag)
		return element
	end

	-- slider ----------------------------------------------------------------
	function Tab:addSlider(cfg, column)
		if isHiddenFlag(cfg.flag) then
			local element = hiddenValueElement("slider", cfg.default or cfg.min or 0, cfg.flag)
			element.text = cfg.text
			return element
		end
		local section = self:section(column)
		local element = {tab = self, window = self.window, text = cfg.text}
		local default = cfg.default or cfg.min or 0
		local flag = newFlag("slider", default, element)
		element.flag = flag
		element.value = default
		local potato = section:Slider({
			Name = titleCase(cfg.text or "Slider"),
			Flag = cfg.flag or ("auh_slider_" .. tostring(math.random(1, 1e9))),
			Min = cfg.min or 0,
			Max = cfg.max or 100,
			Default = default,
			Increment = cfg.increment or 1,
			Suffix = cfg.suffix or "",
			Callback = function(value)
				if type(value) ~= "number" or value == flag.value then
					return
				end
				element.value = value
				flag.value = value
				flag.Changed(value)
			end,
		})
		element.potato = potato
		element.setValue = function(value)
			if type(value) == "number" then
				potato:Set(value)
			end
		end
		registerFlag(cfg.flag, flag)
		return element
	end

	-- dropdown --------------------------------------------------------------
	function Tab:addDropdown(cfg, column)
		if isHiddenFlag(cfg.flag) then
			local element = hiddenValueElement("dropdown", cfg.default or (cfg.options or {})[1], cfg.flag)
			element.text = cfg.text
			element.options = cfg.options or {}
			return element
		end
		local section = self:section(column)
		local element = {tab = self, window = self.window, text = cfg.text, options = cfg.options or {}}
		local options = cfg.options or {}
		local default = cfg.default or options[1] or ""
		local flag = newFlag("dropdown", default, element)
		element.flag = flag
		element.value = default
		local potato = section:Dropdown({
			Name = titleCase(cfg.text or "Dropdown"),
			Flag = cfg.flag or ("auh_dropdown_" .. tostring(math.random(1, 1e9))),
			Options = #options > 0 and options or {"None"},
			Default = default ~= "" and default or nil,
			Callback = function(value)
				if value == nil or value == flag.value then
					return
				end
				element.value = value
				flag.value = value
				flag.Changed(value)
			end,
		})
		element.potato = potato
		element.setValue = function(value)
			if value ~= nil then
				potato:Set(value)
			end
		end
		registerFlag(cfg.flag, flag)
		return element
	end

	-- button ----------------------------------------------------------------
	function Tab:addButton(text, fn, column)
		local section = self:section(column)
		local button = section:Button({
			Name = titleCase(text),
			Flag = "auh_button_" .. tostring(text):gsub("%s+", "_") .. tostring(math.random(1, 1e9)),
			Callback = function()
				safeCall(fn)
			end,
		})
		return {potato = button}
	end

	-- configs ---------------------------------------------------------------
	function Tab:addConfigs(column)
		local section = self:section(column)
		local function listConfigs()
			local names = {}
			local ok, files = pcall(listfiles, ConfigsFolder)
			if ok and type(files) == "table" then
				for _, path in files do
					local name = tostring(path):match("([^/\\]+)%.json$")
					if name then
						table.insert(names, name)
					end
				end
			end
			table.sort(names)
			return names
		end

		section:Textbox({Name = "Config name", Flag = "ConfigName"})
		local list = section:Dropdown({
			Name = "Saved configs",
			Flag = "ConfigList",
			Options = (function()
				local names = listConfigs()
				if #names == 0 then
					return {"None"}
				end
				return names
			end)(),
		})

		local function refresh()
			local names = listConfigs()
			for _, option in list.Options do
				pcall(function()
					option.Components.Option:Destroy()
				end)
			end
			list.Options = {}
			if #names == 0 then
				names = {"None"}
			end
			for _, name in names do
				list:AddOption(name)
			end
			list:Set(names[1])
		end

		local function selectedName()
			local typed = Library.Flags.ConfigName and tostring(Library.Flags.ConfigName.Value or "") or ""
			if typed ~= "" then
				return typed
			end
			local picked = Library.Flags.ConfigList and Library.Flags.ConfigList.Value
			if picked and picked ~= "None" and picked ~= "" then
				return tostring(picked)
			end
			return nil
		end

		section:Button({
			Name = "Save",
			Flag = "SaveButton",
			Callback = function()
				local name = selectedName()
				if not name then
					Library:Notify("Enter a config name first", 3, Color3.fromRGB(255, 165, 0))
					return
				end
				local ok, err = pcall(Library.SaveConfig, Library, name)
				if ok then
					Library:Notify("Config saved: " .. name, 3)
					refresh()
				else
					Library:Notify("Save failed: " .. tostring(err), 4, Color3.fromRGB(255, 0, 0))
				end
			end,
		}):AddButton({
			Name = "Load",
			Flag = "LoadButton",
			Callback = function()
				local name = selectedName()
				if not name then
					Library:Notify("Pick a config first", 3, Color3.fromRGB(255, 165, 0))
					return
				end
				local ok, err = pcall(Library.LoadConfig, Library, name)
				if not ok then
					Library:Notify("Load failed: " .. tostring(err), 4, Color3.fromRGB(255, 0, 0))
				end
			end,
		})
		section:Button({
			Name = "Delete",
			Flag = "DeleteButton",
			Callback = function()
				local name = selectedName()
				if not name then
					return
				end
				local path = ConfigsFolder .. "/" .. name .. ".json"
				if isfile(path) then
					pcall(delfile, path)
					Library:Notify("Config deleted: " .. name, 3)
				end
				refresh()
			end,
		}):AddButton({
			Name = "Refresh",
			Flag = "RefreshButton",
			Callback = refresh,
		})
	end

	-- stubs for the old keybind list board -----------------------------------
	local KeybindListStub = {storage = {}, active = false}
	function KeybindListStub:addText(side, text, colour, shown)
		return {side = side, text = text, colour = colour, shown = shown}
	end
	function KeybindListStub:removeText() end
	function KeybindListStub:update() end
	function KeybindListStub:findText() return nil end
	function KeybindListStub:getScale()
		return Vector2.new(1, 1)
	end
	function KeybindListStub:setScale() end
	function KeybindListStub:toggle(state)
		self.active = state == true
		pcall(function()
			MainWindow.Hotkeys.Components.Hotkeys.Visible = self.active
		end)
	end

	-- finishing touches ------------------------------------------------------
	local function finish()
		pcall(function()
			MainWindow.Hotkeys.Components.Hotkeys.Visible = false
		end)
		local watermark = Library:CreateWatermark("")
		pcall(function()
			watermark:SetText("Potato.hook v1.2 foliver")
		end)
		Globals:Tween(MainWindow.Components.Outline, TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad), {
			Position = UDim2.new(0.5, 0, 0.5, 0),
		})
		if FirstTab then
			MainWindow:SetTab(FirstTab)
		end
		if PH_UI.startEsp then
			task.spawn(PH_UI.startEsp)
		end
	end

	PH_UI.Library = Library
	PH_UI.MainWindow = MainWindow
	PH_UI.window = AdapterWindow
	PH_UI.flags = AdapterWindow.flags
	PH_UI.keybindList = KeybindListStub
	PH_UI.finish = finish
	PH_UI.notify = function(text, duration, colour)
		Library:Notify(tostring(text), duration or 4, colour)
	end
