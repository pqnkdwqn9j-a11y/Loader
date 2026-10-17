local Library = {
	NotificationList = {},
	IsOpen = false,
	CategoryPause = 0.2,
	CategoryTransitionSpeed = 0.25,
	HighlightSpeed = 0.25,
	PageTransitionSpeed = 0.2,
	Windows = {},
	Flags = {},
	Font = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Medium),
	BoldFont = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold),
	ConfigPath = Name .. "/Config",
	CachePath = Name .. "/Cache",
	Connections = {},
	Keybinds = {
		MouseButton1 = "MB1",
		MouseButton2 = "MB2",
		MouseButton3 = "MB3",

		ButtonA = "A",
		ButtonB = "B",
		ButtonX = "X",
		ButtonY = "Y",
		ButtonStart = "STRT",
		ButtonSelect = "SELT",
		ButtonL1 = "L1",
		ButtonR1 = "R1",
		ButtonL2 = "L2",
		ButtonR2 = "R2",
		ButtonL3 = "L3",
		ButtonR3 = "R3",
		DPadUp = "DUP",
		DPadDown = "DDN",
		DPadLeft = "DLT",
		DPadRight = "DRT",

		W = "W",
		A = "A",
		S = "S",
		D = "D",
		Space = "SPC",
		LeftShift = "LSFT",
		RightShift = "RSFT",
		LeftControl = "LCTL",
		RightControl = "RCTL",
		LeftAlt = "LALT",
		RightAlt = "RALT",
		Enter = "ENT",
		Escape = "ESC",
		Backspace = "BS",
		Tab = "TAB",
		CapsLock = "CAPS",
		Insert = "INS",
		Delete = "DEL",
		Home = "HOME",
		EndKey = "END",
		PageUp = "PGUP",
		PageDown = "PGDN",
		Up = "UP",
		Down = "DN",
		Left = "LT",
		Right = "RT",

		Zero = "0",
		One = "1",
		Two = "2",
		Three = "3",
		Four = "4",
		Five = "5",
		Six = "6",
		Seven = "7",
		Eight = "8",
		Nine = "9",

		F1 = "F1",
		F2 = "F2",
		F3 = "F3",
		F4 = "F4",
		F5 = "F5",
		F6 = "F6",
		F7 = "F7",
		F8 = "F8",
		F9 = "F9",
		F10 = "F10",
		F11 = "F11",
		F12 = "F12",

		Minus = "-",
		Equals = "=",
		LeftBracket = "[",
		RightBracket = "]",
		Semicolon = ";",
		Quote = "'",
		Comma = ",",
		Period = ".",
		Slash = "/",
		Backslash = "\\",
		Grave = "`",
	},
	HotKeysImage = GetImage("HotkeysImage"),
	ShadowImage = "rbxassetid://6014261993",
	OutlineShadowImage = "rbxassetid://93984335181980",
	DropdownImage = "rbxassetid://106970154099045",
	ColorwheelImage = "rbxassetid://6042338876",
	TransparencyImage = "rbxassetid://96978989117558",
	LogoImage = "rbxassetid://71404918936585",
	ModeratorImage = GetImage("ModeratorImage"),
	ArmorImage = GetImage("ArmorImage"),
}

local Theme = {
	Accent = Color3.fromRGB(63, 201, 176),
	DarkAccent = Color3.fromRGB(63, 201, 176),
	AccentedHighlight = Color3.fromRGB(63, 201, 176),
}

local Threads = {
	Render = {},
	Entities = {},
	Character = {},
	Input = {},
}

local Math = {}
local Visuals = {}
local Globals = {}

Globals.LastArmorCheck = tick()
Globals.ArmorIds = {}
Globals.ArmorNames = {}
Globals.FlaggedStaff = {}
Globals.QuickStackFunctions = {}

Globals.ApplyTextStroke = (function(Object)  
	local NewStroke = Globals:Instance("UIStroke", {
		Parent = Object,
		Thickness = 1,
		Color = Color3.fromRGB(),
	})
	return NewStroke
end)

Globals.DeepCopy = (function(Table)  
	local Copy = {}
	for k, v in pairs(Table) do
		if type(v) == "table" then
			Copy[k] = Globals.DeepCopy(v)
		else
			Copy[k] = v
		end
	end
	return Copy
end)

function Globals:TweenTransparencyIns(container, targetTransparency, duration)
	duration = duration or 0.2
	for _, obj in ipairs(container:GetDescendants()) do
		if obj:IsA("GuiObject") then
			local props = {}

			if obj:IsA("TextLabel") or obj:IsA("TextButton") then
				props.TextTransparency = targetTransparency
			end

			if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
				props.ImageTransparency = targetTransparency
			end

			if obj.BackgroundTransparency ~= nil then
				props.BackgroundTransparency = targetTransparency
			end

			Globals:Tween(obj, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props)
		end

		if obj:IsA("UIStroke") then
			Globals:Tween(obj, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Transparency = targetTransparency,
			})
		end
	end

	if container:IsA("GuiObject") then
		Globals:Tween(container, TweenInfo.new(duration, Enum.EasingStyle.Quad), {
			BackgroundTransparency = targetTransparency,
		})
	end
end

function Globals:Tween(...)
	local NewTween = TweenService:Create(...)
	NewTween:Play()
	return NewTween
end

function Globals:Instance(Class, Properties)
	local Element = Instance.new(Class)

	for Key, Value in Properties do
		Element[Key] = Value
	end

	return Element
end

function Globals:Tween(...)
	local Tween = TweenService:Create(...)
	Tween:Play()
	return Tween
end

Library.Theme = Theme
Library.__index = Library

Library.Notifications = Globals:Instance("ScreenGui", {
	Parent = CoreGui,
	DisplayOrder = 1,
	IgnoreGuiInset = true,
})

Library.HeadsUp = Globals:Instance("ScreenGui", {
	Parent = CoreGui,
	DisplayOrder = 1,
	IgnoreGuiInset = true,
	Enabled = true,
})

;(function()  
	function Library:Connection(Name, Signal, Function)
		local Connection = Signal:Connect(Function)

		self.Connections[Name] = {
			Signal = Signal,
			Function = Function,
			Connection = Connection,
		}

		return self.Connections[Name]
	end

	function Library:Disconnect(Name)
		local Conn = self.Connections[Name]
		if Conn then
			Conn.Connection:Disconnect()
			self.Connections[Name] = nil
		end
	end

	function Library:DisconnectAll()
		for Name, Conn in pairs(self.Connections) do
			Conn.Connection:Disconnect()
		end
		table.clear(self.Connections)
	end

	function Library:DoCallback(Callback, Data)
		local Success, Error = pcall(Callback, Data)

		if not Success and Error then
			return "Failed", Error
		end
		return Success
	end

	function Library:FormatValue(incr, val)
		if incr < 1 then
			return string.format("%.2f", val)
		else
			return tostring(math.floor(val + 0.5))
		end
	end

	function Library:GetInputName(input)
		if input and input.UserInputType then
			if input.UserInputType == Enum.UserInputType.Keyboard then
				return input.KeyCode.Name
			elseif input.UserInputType.Name:match("Mouse") then
				return input.UserInputType.Name
			else
				return "Unknown"
			end
		end
	end

	function Library:FormatKeyName(name)
		if Library.Keybinds[name] then
			return Library.Keybinds[name]
		elseif #name > 4 then
			return name:sub(1, 4)
		end

		return name
	end

	function Library:GetConfig()
		local Flags = self.Flags

		local Save = {}
		for Flag, Data in Flags do
			local Class = Data.Class
			local Value = Data.Value

			if Class == "Toggle" then
				Save[Flag] = Value
			end

			if Class == "Colorpicker" then
				Save[Flag] = {
					[1] = { Value[1].R, Value[1].G, Value[1].B },
					[2] = Value[2],
				}
			end

			if Class == "Slider" then
				Save[Flag] = Value
			end

			if Class == "TextBox" then
				Save[Flag] = Value
			end

			if Class == "Dropdown" then
				Save[Flag] = Value
			end

			if Class == "Keybind" then
				if Data.Key then
					local Key = {
						Type = Data.Key.Type,
						Value = Data.Key.Value.Name,
					}

					Save[Flag] = Key
				end
			end
		end

		return HttpService:JSONEncode(Save)
	end

	function Library:SaveConfig(Name)
		local CurrentConfig = Library:GetConfig()

		writefile(ConfigsFolder .. "/" .. Name .. ".json", CurrentConfig)
	end

	function Library:LoadConfig(Name)
		local FilePath = ConfigsFolder .. "/" .. Name .. ".json"

		if not isfile(FilePath) then
			Library:Notify(
				"Configuration failed to load\nFile, " .. FilePath .. " does not exist!",
				4,
				Color3.fromRGB(255, 0, 0)
			)
			return
		end

		local Config = readfile(FilePath)
		local okJ, DecodedConfig = pcall(HttpService.JSONDecode, HttpService, Config)
		if not okJ or type(DecodedConfig) ~= "table" then
			Library:Notify("Configuration failed to load\nFile is corrupted", 4, Color3.fromRGB(255, 0, 0))
			return
		end

		for Flag, FlagData in DecodedConfig do
			local RealFlag = Library.Flags[Flag]

			if not RealFlag or type(RealFlag) ~= "table" or type(RealFlag.Set) ~= "function" then
				continue
			end

			if RealFlag.Class == "Colorpicker" then
				local Color = Color3.new(FlagData[1][1], FlagData[1][2], FlagData[1][3])
				task.spawn(function()
					RealFlag:Set({
						Color,
						FlagData[2],
					})
				end)

				continue
			end

			if RealFlag.Class == "Keybind" then
				task.spawn(function()
					local KeyData = FlagData

					local input = {}

					if KeyData.Type == "MouseButton" then
						input.UserInputType = Enum.UserInputType[KeyData.Value]
					elseif KeyData.Type == "KeyCode" then
						input.UserInputType = Enum.UserInputType.Keyboard
						input.KeyCode = Enum.KeyCode[KeyData.Value]
					else
						input.UserInputType = Enum.UserInputType[KeyData.Value]
					end

					RealFlag:SetKey(input)
				end)
				continue
			end

			task.spawn(function()
				pcall(function()
					RealFlag:Set(FlagData)
				end)
			end)
		end
		Library:Notify("Configuration loaded", 3)
	end
end)()


do

	function Library:CreateHotkeysPanel()
		local Hotkeys = {
			Keys = 0,
		}

		local Components = {}

		Hotkeys.__index = Hotkeys

		Components["Hotkeys"] = Globals:Instance("Frame", {
			BackgroundColor3 = Color3.fromRGB(7, 10, 9),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 20, 0.5, 0),
			Size = UDim2.new(0, 215, 0, 30),
			Name = "Hotkeys",
			Parent = Library.HeadsUp,
			Visible = false,
		})

		Components["HotkeysCorner"] = Globals:Instance("UICorner", {
			CornerRadius = UDim.new(0, 0),
			Name = "HotkeysCorner",
			Parent = Components["Hotkeys"],
		})

		Components["HotkeysStroke"] = Globals:Instance("UIStroke", {
			Color = Color3.fromRGB(15, 24, 21),
			Name = "HotkeysStroke",
			Parent = Components["Hotkeys"],
		})

		Components["HotkeysTitleArea"] = Globals:Instance("Frame", {
			BackgroundColor3 = Color3.fromRGB(10, 16, 14),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 25),
			Name = "HotkeysTitleArea",
			Parent = Components["Hotkeys"],
		})

		Components["HotkeysTitleCorner"] = Globals:Instance("UICorner", {
			CornerRadius = UDim.new(0, 0),
			Name = "HotkeysTitleCorner",
			Parent = Components["HotkeysTitleArea"],
		})

		Components["HotkeysTitlestroke"] = Globals:Instance("UIStroke", {
			Color = Color3.fromRGB(15, 24, 21),
			Name = "HotkeysTitlestroke",
			Parent = Components["HotkeysTitleArea"],
		})

		Components["HotkeysTitle"] = Globals:Instance("TextLabel", {
			Font = Enum.Font.SourceSansSemibold,
			Text = "Hotkeys",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 35, 0, 0),
			Size = UDim2.new(1, -35, 1, 0),
			Name = "HotkeysTitle",
			Parent = Components["HotkeysTitleArea"],
		})

		Components["HotkeysImage"] = Globals:Instance("ImageLabel", {
			Image = Library.HotKeysImage,
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 5, 0.5, 0),
			Size = UDim2.new(0.0116279069, 20, 1, -5),
			Name = "HotkeysImage",
			Parent = Components["HotkeysTitleArea"],
		})

		Components["HotkeysActive"] = Globals:Instance("Frame", {
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 10, 0, 30),
			Size = UDim2.new(1, -10, 0, 33),
			Name = "HotkeysActive",
			Parent = Components["Hotkeys"],
		})

		Components["UIListLayout"] = Globals:Instance("UIListLayout", {
			Padding = UDim.new(0, 5),
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = Components["HotkeysActive"],
		})

		Components["HotkeysShadowHolder"] = Globals:Instance("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = 0,
			Name = "HotkeysShadowHolder",
			Parent = Components["Hotkeys"],
		})

		Components["HotkeysShadow"] = Globals:Instance("ImageLabel", {
			Image = Library.ShadowImage,
			ImageColor3 = Color3.fromRGB(0, 0, 0),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(49, 49, 450, 450),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			ImageTransparency = 0.8,
			BorderSizePixel = 0,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, 47, 1, 47),
			ZIndex = 0,
			Name = "HotkeysShadow",
			Parent = Components["HotkeysShadowHolder"],
		})

		Hotkeys.Components = Components

		function Hotkeys:Add(Name, Key)
			self.Keys += 1
			Globals:Tween(self.Components.HotkeysShadow, TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad), {
				ImageTransparency = self.Keys > 0 and 0 or 0.8,
			})

			local Hotkey = {}

			Hotkey["Container"] = Globals:Instance("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 14),
				Name = Name,
				Parent = Components["HotkeysActive"],
			})

			Hotkey["NameLabel"] = Globals:Instance("TextLabel", {
				Font = Enum.Font.SourceSansSemibold,
				Text = Name,
				TextColor3 = Color3.fromRGB(110, 150, 140),
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundTransparency = 1,
				Size = UDim2.new(0.5, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				Name = "NameLabel",
				Parent = Hotkey.Container,
			})

			Hotkey["KeyLabel"] = Globals:Instance("TextLabel", {
				Font = Enum.Font.SourceSansSemibold,
				Text = "[" .. tostring(Key) .. "]",
				TextColor3 = Color3.fromRGB(110, 150, 140),
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Right,
				BackgroundTransparency = 1,
				Size = UDim2.new(0.5, -5, 1, 0),
				Position = UDim2.new(0.5, -3, 0, 0),
				Name = "KeyLabel",
				Parent = Hotkey.Container,
			})

			Globals:Tween(self.Components.Hotkeys, TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad), {
				Size = UDim2.new(0, 215, 0, 45) + UDim2.new(0, 0, 0, self.Keys * 17),
			})

		end

		function Hotkeys:UpdateStatus(Name, On, Key, Destroy)
			local Container = self.Components["HotkeysActive"]:FindFirstChild(Name)
			if Container then
				if Key and Key ~= "" then
					Container.KeyLabel.Text = "[" .. tostring(Key) .. "]"
				end

				local targetColor = On and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(110, 150, 140)
				Globals:Tween(Container.NameLabel, TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad), {
					TextColor3 = targetColor,
				})
				Globals:Tween(Container.KeyLabel, TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad), {
					TextColor3 = targetColor,
				})

				if Destroy then
					self.Keys -= 1
					Container:Destroy()

					Globals:Tween(
						self.Components.Hotkeys,
						TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
						{
							Size = UDim2.new(0, 215, 0, 45) + UDim2.new(0, 0, 0, self.Keys * 17),
						}
					)
				end
			else
				if Key ~= "" then
					self:Add(Name, Key)
				end
			end

			Globals:Tween(self.Components.HotkeysShadow, TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad), {
				ImageTransparency = self.Keys > 0 and 0 or 0.8,
			})
		end

		return Hotkeys
	end


	function Library:CreateWatermark(txt)
		local Components = {}

		Components["Watermark"] = Globals:Instance("Frame", {
			BackgroundColor3 = Color3.fromRGB(10, 16, 14),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 400, 0, 20),
			Size = UDim2.new(0, 35, 0, 24),
			Name = "Watermark",
			Parent = Library.HeadsUp,
		})

		Components["WatermarkCorner"] = Globals:Instance("UICorner", {
			CornerRadius = UDim.new(0, 0),
			Name = "WatermarkCorner",
			Parent = Components["Watermark"],
		})

		Components["WatermarkStroke"] = Globals:Instance("UIStroke", {
			Color = Color3.fromRGB(15, 24, 21),
			Name = "WatermarkStroke",
			Parent = Components["Watermark"],
		})

		Components["WatermarkLogo"] = Globals:Instance("ImageLabel", {
			Image = Library.LogoImage,
			ImageColor3 = Library.Theme.Accent,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 13, 0.5, 0),
			Size = UDim2.new(0, 25, 0, 25),
			Name = "WatermarkLogo",
			Parent = Components["Watermark"],
		})

		Components["WatermarkText"] = Globals:Instance("TextLabel", {
			Font = Enum.Font.SourceSansSemibold,
			Text = txt,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 14,
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 25, 0, 0),
			Size = UDim2.new(0, 0, 1, 0),
			Name = "WatermarkText",
			Parent = Components["Watermark"],
		})

		Components["WatermarkShadowHolder"] = Globals:Instance("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = 0,
			Name = "WatermarkShadowHolder",
			Parent = Components["Watermark"],
		})

		Components["WatermarkShadow"] = Globals:Instance("ImageLabel", {
			Image = Library.ShadowImage,
			ImageColor3 = Color3.fromRGB(0, 0, 0),
			ImageTransparency = 0.5899999737739563,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(49, 49, 450, 450),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0.505405426, 0, 0.501500428, 0),
			Size = UDim2.new(0.935135126, 47, 0.5, 47),
			ZIndex = 0,
			Name = "WatermarkShadow",
			Parent = Components["WatermarkShadowHolder"],
		})

		function Components:SetText(txt)
			local label = Instance.new("TextLabel")
			label.Text = txt
			label.TextSize = 14
			label.Font = Enum.Font.SourceSansSemibold
			label.Position = UDim2.new(-5, 0, 0, 0)
			label.Visible = true
			label.Parent = Library.HeadsUp
			task.wait(0.3)
			Components["WatermarkText"].Text = ""

			task.spawn(function()
				for i = 1, #txt do
					Components["WatermarkText"].Text = string.sub(txt, 1, i)
					task.wait(0.03)
				end
			end)

			local TextBounds = label.TextBounds
			Globals:Tween(Components.Watermark, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
				Size = UDim2.new(0, 35 + TextBounds.X, 0, Components.Watermark.Size.Y.Offset),
			})
		end
		return Components
	end


	function Library:Window(WindowData)
		local Window = {
			Name = WindowData.Name,
			Tabs = {},
			Sections = {},
			Components = {},
			PlayerImage = WindowData.PlayerImage,
			Open = true,
			IsOpen = true,
		}

		Library.IsOpen = true

		Window.Hotkeys = self:CreateHotkeysPanel()
		Window.__index = Window

		local Components = {}

		do
			Components["UI"] = Globals:Instance("ScreenGui", {
				IgnoreGuiInset = true,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
				Name = "UI",
				Parent = CoreGui,
				DisplayOrder = 3,
			})

			Components["Outline"] = Globals:Instance("TextButton", {
				Font = Enum.Font.SourceSans,
				Text = "",
				TextColor3 = Color3.fromRGB(0, 0, 0),
				TextSize = 14,
				AutoButtonColor = false,
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(7, 10, 9),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0.5, 0, 3, 0),
				Size = UDim2.new(0, 650, 0, 470),
				Name = "Outline",
				Parent = Components["UI"],
			})

			Components["OutlineCorner"] = Globals:Instance("UICorner", {
				CornerRadius = UDim.new(0, 8),
				Name = "OutlineCorner",
				Parent = Components["Outline"],
			})

			Components["OutlineGradient"] = Globals:Instance("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.fromRGB(13, 18, 16)),
					ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 9, 8)),
				}),
				Name = "OutlineGradient",
				Parent = Components["Outline"],
			})

			Components["OutlineStroke"] = Globals:Instance("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Thickness = 1.4,
				Color = Theme.Accent,
				Transparency = 0.15,
				Name = "OutlineStroke",
				Parent = Components["Outline"],
			})

			Components["OutlineStrokeGradient"] = Globals:Instance("UIGradient", {
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.fromRGB(63, 201, 176)),
					ColorSequenceKeypoint.new(0.5, Color3.fromRGB(120, 230, 205)),
					ColorSequenceKeypoint.new(1, Color3.fromRGB(46, 158, 138)),
				}),
				Rotation = 0,
				Name = "OutlineStrokeGradient",
				Parent = Components["OutlineStroke"],
			})

			task.spawn(function()
				while Components["OutlineStrokeGradient"] and Components["OutlineStrokeGradient"].Parent do
					Components["OutlineStrokeGradient"].Rotation = (tick() * 45) % 360
					task.wait()
				end
			end)

			Components["WindowNotifications"] = Globals:Instance("Frame", {
				Position = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(1, 1),
				Size = UDim2.new(0, 200, 1, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Name = "Notifications",
				Parent = Components.Outline,
			})

			Components["LeftSideElements"] = Globals:Instance("Frame", {
				BackgroundColor3 = Color3.fromRGB(10, 16, 14),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Size = UDim2.new(0, 50, 1, 0),
				Name = "LeftSideElements",
				Parent = Components["Outline"],
			})

			Components["LeftSideElmentsCorner"] = Globals:Instance("UICorner", {
				CornerRadius = UDim.new(0, 8),
				Name = "LeftSideElmentsCorner",
				Parent = Components["LeftSideElements"],
			})

			Components["LeftSideFixIGNORE"] = Globals:Instance("Frame", {
				BackgroundColor3 = Color3.fromRGB(10, 16, 14),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(1, -2, 0, 0),
				Size = UDim2.new(0, 3, 1, 0),
				Name = "LeftSideFixIGNORE",
				Parent = Components["LeftSideElements"],
			})

			Components["LeftSideOutline"] = Globals:Instance("Frame", {
				BackgroundColor3 = Color3.fromRGB(15, 24, 21),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(0, 1, 1, 0),
				Name = "LeftSideOutline",
				Parent = Components["LeftSideFixIGNORE"],
			})

			Components["LogoSpace"] = Globals:Instance("Frame", {
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 50),
				Name = "LogoSpace",
				Parent = Components["LeftSideElements"],
			})

			Components["Logo"] = Globals:Instance("ImageLabel", {
				Image = Library.LogoImage,
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(1, -10, 1, -10),
				Name = "Logo",
				Parent = Components["LogoSpace"],
			})

			Components["TabsHolder"] = Globals:Instance("Frame", {
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 50),
				Size = UDim2.new(1, 0, 1, -106),
				Name = "TabsHolder",
				Parent = Components["LeftSideElements"],
			})

			Components["TabsScrollingFrame"] = Globals:Instance("ScrollingFrame", {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 1, 0),
				ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
				ScrollBarImageTransparency = 1,
				ScrollBarThickness = 0,
				Active = true,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, -3),
				Size = UDim2.new(1, 0, 1, 3),
				Name = "TabsScrollingFrame",
				Parent = Components["TabsHolder"],
			})

			Components["ScrollingFrameListLayout"] = Globals:Instance("UIListLayout", {
				Padding = UDim.new(0, 13),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Name = "ScrollingFrameListLayout",
				Parent = Components["TabsScrollingFrame"],
			})

			Components["UIPadding"] = Globals:Instance("UIPadding", {
				PaddingLeft = UDim.new(0, 8),
				PaddingTop = UDim.new(0, 1),
				Parent = Components["TabsScrollingFrame"],
			})

			Components["TabFadeTop"] = Globals:Instance("Frame", {
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, -10),
				Size = UDim2.new(1, 0, 0, 20),
				Name = "TabFadeTop",
				Parent = Components["TabsHolder"],
			})

			Components["TabFadeTopGradient"] = Globals:Instance("UIGradient", {
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 16, 14)),
					ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 16, 14)),
				}),
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0.4),
					NumberSequenceKeypoint.new(1, 1),
				}),
				Name = "TabFadeTopGradient",
				Parent = Components["TabFadeTop"],
			})

			Components["TabFadeBottom"] = Globals:Instance("Frame", {
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 1, -20),
				Size = UDim2.new(1, 0, 0, 20),
				Name = "TabFadeBottom",
				Parent = Components["TabsHolder"],
			})

			Components["TabFadeBottomGradient"] = Globals:Instance("UIGradient", {
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 16, 14)),
					ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 16, 14)),
				}),
				Rotation = -90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0.4),
					NumberSequenceKeypoint.new(1, 1),
				}),
				Name = "TabFadeBottomGradient",
				Parent = Components["TabFadeBottom"],
			})

			Components["PlayerIconHolder"] = Globals:Instance("Frame", {
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 1, -50),
				Size = UDim2.new(1, 0, 0, 50),
				Name = "PlayerIconHolder",
				Parent = Components["LeftSideElements"],
			})

			Components["PlayerImageCorner"] = Globals:Instance("UICorner", {
				CornerRadius = UDim.new(0, 0),
				Name = "PlayerImageCorner",
				Parent = Components["PlayerImageButton"],
			})

			Components["TopSideElements"] = Globals:Instance("Frame", {
				BackgroundColor3 = Color3.fromRGB(10, 16, 14),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 52, 0, 0),
				Size = UDim2.new(1, -52, 0, 50),
				Name = "TopSideElements",
				Parent = Components["Outline"],
				ClipsDescendants = true,
			})

			Components["TopSideElementsCorner"] = Globals:Instance("UICorner", {
				CornerRadius = UDim.new(0, 0),
				Name = "TopSideElementsCorner",
				Parent = Components["TopSideElements"],
			})

			Components["TopSideElementsFix"] = Globals:Instance("Frame", {
				BackgroundColor3 = Color3.fromRGB(10, 16, 14),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 1, -2),
				Size = UDim2.new(1, 0, 0, 3),
				Name = "TopSideElementsFix",
				Parent = Components["TopSideElements"],
			})

			Components["TopSideOutline"] = Globals:Instance("Frame", {
				BackgroundColor3 = Color3.fromRGB(15, 24, 21),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				Name = "TopSideOutline",
				Parent = Components["TopSideElementsFix"],
			})

			Components["Categorys"] = Globals:Instance("Frame", {
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 15, 0.5, 0),
				Size = UDim2.new(1, -30, 1, -30),
				Name = "Categorys",
				Parent = Components["TopSideElements"],
			})

			Components["Pages"] = Globals:Instance("Frame", {
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 64, 0, 62),
				Size = UDim2.new(0, 573, 0, 395),
				Name = "Pages",
				Parent = Components["Outline"],
			})

			Components["PageHider"] = Globals:Instance("Frame", {
				BackgroundColor3 = Color3.fromRGB(7, 10, 9),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 64, 0, 62),
				Size = UDim2.new(0, 573, 0, 395),
				Name = "PageHider",
				Parent = Components["Outline"],
			})

			Components["PageFadeBottom"] = Globals:Instance("Frame", {
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 1, -20),
				Size = UDim2.new(1, 0, 0, 20),
				Name = "PageFadeBottom",
				Parent = Components["Pages"],
				ZIndex = 2000,
			})

			Components["PageFadeTopGradient"] = Globals:Instance("UIGradient", {
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 10, 9)),
					ColorSequenceKeypoint.new(1, Color3.fromRGB(7, 10, 9)),
				}),
				Rotation = -90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(0.43, 1),
					NumberSequenceKeypoint.new(1, 1),
				}),
				Name = "PageFadeTopGradient",
				Parent = Components["PageFadeBottom"],
			})

			Components["PageFadeTop"] = Globals:Instance("Frame", {
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, -2),
				Size = UDim2.new(1, 0, 0, 20),
				Name = "PageFadeTop",
				Parent = Components["Pages"],
				ZIndex = 2000,
			})

			Components["PageFadeTopGradient1"] = Globals:Instance("UIGradient", {
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 10, 9)),
					ColorSequenceKeypoint.new(1, Color3.fromRGB(7, 10, 9)),
				}),
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(0.43, 1),
					NumberSequenceKeypoint.new(1, 1),
				}),
				Name = "PageFadeTopGradient",
				Parent = Components["PageFadeTop"],
			})

			Components["OutlineShadowHolder"] = Globals:Instance("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 0,
				Name = "OutlineShadowHolder",
				Parent = Components["Outline"],
			})

			Components["OutlineShadow"] = Globals:Instance("ImageLabel", {
				Image = Library.OutlineShadowImage,
				ImageColor3 = Color3.fromRGB(0, 0, 0),

				ImageTransparency = 0.3,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(49, 49, 450, 450),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(1, 47, 1, 47),
				ZIndex = 0,
				Name = "OutlineShadow",
				Parent = Components["OutlineShadowHolder"],
			})
		end

		do
			local Dragging = false
			local DragStart = nil
			local StartPosition = nil

			Components["Outline"].InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and not Window.InDrag then
					Dragging = true
					DragStart = input.Position
					StartPosition = Components["Outline"].Position
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end)
				end
			end)

			UserInputService.InputChanged:Connect(function(input)
				if Dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
					local delta = input.Position - DragStart
					local newPosition = UDim2.new(
						StartPosition.X.Scale,
						StartPosition.X.Offset + delta.X,
						StartPosition.Y.Scale,
						StartPosition.Y.Offset + delta.Y
					)

					TweenService:Create(
						Components["Outline"],
						TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{
							Position = newPosition,
						}
					):Play()
				end
			end)

			UserInputService.InputBegan:Connect(function(inp)
				if inp.KeyCode == Enum.KeyCode.RightShift and not UserInputService:GetFocusedTextBox() then
					Window.Open = not Window.Open
					Library.IsOpen = Window.Open
					Window:SetVisibility(Window.Open)
				end
			end)
		end

		function Window:Notify(txt, duration)

		end

		function Window:OpenWindow()
			local outline = self.Components.Outline
			self.Components.UI.Enabled = true

			local currentX = outline.Position.X
			local targetPosition = UDim2.new(currentX.Scale, currentX.Offset, 0.5, 0)

			if self.CurrentTween then
				self.CurrentTween:Cancel()
				self.CurrentTween = nil
			end

			outline.Position =
				UDim2.new(currentX.Scale, currentX.Offset, outline.Position.Y.Scale, outline.Position.Y.Offset)

			self.CurrentTween = Globals:Tween(outline, TweenInfo.new(0.25), {
				Position = targetPosition,
			})

			local completedConnection
			completedConnection = self.CurrentTween.Completed:Connect(function()
				self.CurrentTween = nil
				self.IsOpen = true
				if completedConnection then
					completedConnection:Disconnect()
				end
			end)
		end

		function Window:Close()
			local outline = self.Components.Outline

			if self.CurrentTween then
				self.CurrentTween:Cancel()
				self.CurrentTween = nil
			end

			local currentX = outline.Position.X

			self.CurrentTween = Globals:Tween(outline, TweenInfo.new(0.25), {
				Position = UDim2.new(currentX.Scale, currentX.Offset, 2, 0),
			})

			local completedConnection
			completedConnection = self.CurrentTween.Completed:Connect(function()
				self.CurrentTween = nil
				self.Components.UI.Enabled = false
				self.IsOpen = false
				if completedConnection then
					completedConnection:Disconnect()
				end
			end)
		end

		function Window:SetVisibility(force)
			if self.CurrentTween then
				self.CurrentTween:Cancel()
				self.CurrentTween = nil
			end

			local TargetOpen = (force ~= nil) and force or not self.IsOpen
			self.Open = TargetOpen
			self.IsOpen = TargetOpen

			if TargetOpen then
				self:OpenWindow()
			else
				self:Close()
			end
		end

		function Window:SetTab(Tab)
			local TabsContainer = self.Components["TabsScrollingFrame"]
			local TabCategories = self.Components["Categorys"]
			local Pages = self.Components["Pages"]
			local FirstCategory = Tab.Categories[Tab.CategoryOrder[1]]
			local CatToSet

			task.spawn(function()
				Globals:Tween(
					self.Components.Categorys,
					TweenInfo.new(Library.CategoryTransitionSpeed, Enum.EasingStyle.Quad),
					{
						Position = UDim2.new(-0.7, 0, 0.5, 0),
					}
				)
			end)

			task.spawn(function()
				if FirstCategory then
					self:SetCategory({
						Pointer = FirstCategory,
						Name = FirstCategory.Parent.Name .. "_" .. FirstCategory.Name,
						Parent = FirstCategory.Parent,
					})
				end
			end)

			task.spawn(function()
				for _, TabButton in TabsContainer:GetChildren() do
					local Name = TabButton.Name
					local TabCategoryContainer = TabCategories:FindFirstChild(Name)
					if not TabCategoryContainer then
						continue
					end

					local Opened = Name == Tab.Name
					if Opened then
						CatToSet = TabCategoryContainer
					else
						task.spawn(function()
							task.wait(Library.CategoryPause)
							TabCategoryContainer.Visible = Opened
						end)
					end

					TabButton.TabImage:SetAttribute("Opened", Opened)

					Globals:Tween(TabButton.TabImage, TweenInfo.new(0.25), {
						ImageColor3 = Opened and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(96, 140, 128),
					})
				end
			end)

			task.spawn(function()
				task.wait(Library.CategoryPause)
				Globals:Tween(
					self.Components.Categorys,
					TweenInfo.new(Library.CategoryTransitionSpeed, Enum.EasingStyle.Quad),
					{
						Position = UDim2.new(0, 15, 0.5, 0),
					}
				)
				task.wait(0.1)
				CatToSet.Visible = true
			end)
		end

		function Window:SetCategory(Category)
			local Pointer = Category.Pointer
			local Components = Pointer.Components
			local Tab = Category.Parent
			local PageContainer = self.Components["Pages"]
			local hiderIn

			Components.CategoryButton:SetAttribute("Opened", true)

			task.spawn(function()
				hiderIn = Globals:Tween(
					self.Components.PageHider,
					TweenInfo.new(Library.PageTransitionSpeed, Enum.EasingStyle.Quad),
					{
						BackgroundTransparency = 0,
					}
				)
			end)

			task.spawn(function()
				for _, CategoryData in Tab.Categories do
					local Comp = CategoryData.Components
					Globals:Tween(Comp.CategoryButton, TweenInfo.new(0.25), {
						BackgroundColor3 = Color3.fromRGB(7, 10, 9),
					})
					Globals:Tween(Comp.CategoryTitle, TweenInfo.new(0.25), {
						TextColor3 = Color3.fromRGB(96, 140, 128),
					})
					Globals:Tween(Comp.CategoryStroke, TweenInfo.new(0.25), {
						Color = Color3.fromRGB(15, 24, 21),
					})

					Globals:Tween(Comp.TabDropshadow, TweenInfo.new(0.25), {
						ImageTransparency = 1,
					})

					Comp.CategoryButton:SetAttribute("Opened", false)
					CategoryData.IsOpen = false
				end
			end)

			task.spawn(function()
				Globals:Tween(Components.CategoryButton, TweenInfo.new(0.25), {
					BackgroundColor3 = Library.Theme.DarkAccent,
				})
				Globals:Tween(Components.CategoryTitle, TweenInfo.new(0.25), {
					TextColor3 = Color3.fromRGB(255, 255, 255),
				})
				Globals:Tween(Components.CategoryStroke, TweenInfo.new(0.25), {
					Color = Library.Theme.Accent,
				})
				Globals:Tween(Components.TabDropshadow, TweenInfo.new(0.25), {
					ImageTransparency = 0.5,
				})
				Components.CategoryButton:SetAttribute("Opened", true)
			end)

			Pointer.IsOpen = true

			task.spawn(function()
				if hiderIn then
					hiderIn.Completed:Wait()
				end
				Globals:Tween(
					self.Components.PageHider,
					TweenInfo.new(Library.PageTransitionSpeed, Enum.EasingStyle.Quad),
					{
						BackgroundTransparency = 1,
					}
				)

				for _, Page in PageContainer:GetChildren() do
					if not Page:IsA("Frame") or table.find({ "PageFadeTop", "PageFadeBottom" }, Page.Name) then
						continue
					end
					Page.Visible = Page.Name == Category.Name
				end
			end)
		end

		function Window:Tab(TabData)
			local Tab = {
				Name = TabData.Name,
				Image = TabData.Image,
				Categories = {},
				CategoryOrder = {},
			}

			Tab.__index = Tab
			local Components = {}

			do
				Components["NewTabButtonHolder"] = Globals:Instance("TextButton", {
					BackgroundColor3 = Color3.fromRGB(10, 16, 14),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Size = UDim2.new(0, 35, 0, 35),
					Name = Tab.Name,
					Parent = self.Components["TabsScrollingFrame"],
					Text = "",
					AutoButtonColor = false,
				})

				Components["TabImage"] = Globals:Instance("ImageLabel", {
					Image = Tab.Image,
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					ImageColor3 = Color3.fromRGB(96, 140, 128),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(0, 25, 0, 25),
					Name = "TabImage",
					Parent = Components["NewTabButtonHolder"],
				})

				Components["CategoryHolder"] = Globals:Instance("Frame", {
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					Name = Tab.Name,
					Parent = Window.Components["Categorys"],
					Visible = false,
				})

				Components["CategoryListLayout"] = Globals:Instance("UIListLayout", {
					Padding = UDim.new(0, 10),
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Name = "CategoryHolderLayout",
					Parent = Components["CategoryHolder"],
				})
			end

			do
				local TabButton = Components["NewTabButtonHolder"]

				Library:Connection("TabHandler_" .. Tab.Name, TabButton.MouseButton1Down, function()
					Window:SetTab(Tab)
				end)

				Library:Connection("TabMouseEnter_" .. Tab.Name, Components.NewTabButtonHolder.MouseEnter, function()
					Globals:Tween(
						Components["TabImage"],
						TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
						{
							ImageColor3 = Color3.fromRGB(255, 255, 255),
						}
					)
				end)

				Library:Connection("TabMouseLeave_" .. Tab.Name, Components.NewTabButtonHolder.MouseLeave, function()
					if Components["TabImage"]:GetAttribute("Opened") then
						return
					end
					Globals:Tween(
						Components["TabImage"],
						TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
						{
							ImageColor3 = Color3.fromRGB(96, 140, 128),
						}
					)
				end)
			end

			function Tab:Category(CategoryData)
				local Category = {
					Name = CategoryData.Name,
					Sections = {},
					Parent = Tab,
					IsOpen = false,
				}

				Category.__index = Category

				local Components = {}

				do
					Components["CategoryButton"] = Globals:Instance("TextButton", {
						Font = Enum.Font.SourceSansSemibold,
						RichText = true,
						Text = "",
						TextColor3 = Color3.fromRGB(96, 140, 128),
						TextSize = 14,
						TextTransparency = 1,
						AutoButtonColor = false,
						BackgroundColor3 = Color3.fromRGB(7, 10, 9),
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Size = UDim2.new(0, 82, 0, 20),
						Name = Category.Name,
						Parent = self.Components["CategoryHolder"],
					})

					Components["CategoryCorner"] = Globals:Instance("UICorner", {
						CornerRadius = UDim.new(0, 0),
						Name = "CategoryCorner",
						Parent = Components["CategoryButton"],
					})

					Components["CategoryStroke"] = Globals:Instance("UIStroke", {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Color = Color3.fromRGB(15, 24, 21),
						Name = "CategoryStroke",
						Parent = Components["CategoryButton"],
					})

					Components["CategoryTitle"] = Globals:Instance("TextLabel", {
						Font = Enum.Font.SourceSansSemibold,
						Text = Category.Name,
						TextColor3 = Color3.fromRGB(96, 140, 128),
						TextSize = 14,
						BackgroundColor3 = Color3.fromRGB(7, 10, 9),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 1, 0),
						Name = "CategoryTitle",
						Parent = Components["CategoryButton"],
					})

					Components["TabDropshadowContainer"] = Globals:Instance("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 1, 0),
						ZIndex = 0,
						Name = "TabDropshadowContainer",
						Parent = Components["CategoryButton"],
					})

					Components["TabDropshadow"] = Globals:Instance("ImageLabel", {
						Image = Library.ShadowImage,
						ImageColor3 = Library.Theme.Accent,
						ImageTransparency = 1,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(49, 49, 450, 450),
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Size = UDim2.new(1, 30, 1, 30),
						ZIndex = 0,
						Name = "TabDropshadow",
						Parent = Components["TabDropshadowContainer"],
					})

					Components["Page"] = Globals:Instance("Frame", {
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 1, 0),
						Name = Tab.Name .. "_" .. Category.Name,
						Visible = false,
						Parent = Window.Components["Pages"],
					})

					Components["Left"] = Globals:Instance("ScrollingFrame", {
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.new(0, 0, 1, 24),
						ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
						ScrollBarImageTransparency = 1,
						ScrollBarThickness = 0,
						Active = true,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Size = UDim2.new(0.5, -5, 1, 0),
						Name = "Left",
						Parent = Components["Page"],
					})

					Components["LeftListLayout"] = Globals:Instance("UIListLayout", {
						Parent = Components.Left,
						Padding = UDim.new(0, 15),
					})

					Components["LeftPadding"] = Globals:Instance("UIPadding", {
						PaddingLeft = UDim.new(0, 2),
						PaddingTop = UDim.new(0, 4),
						PaddingBottom = UDim.new(0, 5),
						Name = "LeftPadding",
						Parent = Components["Left"],
					})

					Components["Right"] = Globals:Instance("ScrollingFrame", {
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.new(0, 0, 1, 0),
						ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
						ScrollBarImageTransparency = 1,
						ScrollBarThickness = 0,
						Active = true,
						AnchorPoint = Vector2.new(0.5, 0),
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Position = UDim2.new(0.5, 147, 0, 0),
						Size = UDim2.new(0.5, -5, 1, 0),
						Name = "Right",
						Parent = Components["Page"],
					})

					Components["RightPadding"] = Globals:Instance("UIPadding", {
						PaddingLeft = UDim.new(0, 2),
						PaddingTop = UDim.new(0, 4),
						PaddingBottom = UDim.new(0, 5),
						Name = "RightPadding",
						Parent = Components["Right"],
					})

					Components["RightListLayout"] = Globals:Instance("UIListLayout", {
						Parent = Components.Right,
						Padding = UDim.new(0, 15),
					})
				end

				function Category:Section(SectionData)
					local Section = {
						Name = SectionData.Name,
						Side = SectionData.Side or "Left",
						Elements = {},
						ZIndex = 9000,
					}

					Section.__index = Section

					local Components = {}

					do
						Components["Section"] = Globals:Instance("Frame", {
							AutomaticSize = Enum.AutomaticSize.Y,
							BackgroundColor3 = Color3.fromRGB(10, 16, 14),
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Size = UDim2.new(1, -4, 0, 30),
							Name = "Section",
							Parent = self.Components[Section.Side],
						})

						Components["SectionStroke"] = Globals:Instance("UIStroke", {
							Color = Color3.fromRGB(15, 24, 21),
							Name = "SectionStroke",
							Parent = Components["Section"],
						})

						Components["SectionCorner"] = Globals:Instance("UICorner", {
							CornerRadius = UDim.new(0, 0),
							Name = "SectionCorner",
							Parent = Components["Section"],
						})

						Components["SectionTitleLine"] = Globals:Instance("Frame", {
							BackgroundColor3 = Color3.fromRGB(15, 24, 21),
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, 0, 0, 24),
							Size = UDim2.new(1, 0, 0, 1),
							Name = "SectionTitleLine",
							Parent = Components["Section"],
						})

						Components["SectionTitle"] = Globals:Instance("TextLabel", {
							Font = Enum.Font.SourceSansSemibold,
							Text = Section.Name,
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 14,
							TextXAlignment = Enum.TextXAlignment.Left,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, 14, 0, 2),
							Size = UDim2.new(1, -14, 0, 20),
							Name = "SectionTitle",
							Parent = Components["Section"],
						})

						Components["SectionElements"] = Globals:Instance("Frame", {
							AutomaticSize = Enum.AutomaticSize.Y,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, 14, 0, 30),
							Size = UDim2.new(0, 249, 0, -30),
							Name = "SectionElements",
							Parent = Components["Section"],
						})

						Components["SectionElementsListLayout"] = Globals:Instance("UIListLayout", {
							Padding = UDim.new(0, 3),
							SortOrder = Enum.SortOrder.LayoutOrder,
							Name = "SectionElementsListLayout",
							Parent = Components["SectionElements"],
						})
					end

					function Section:SetVisibility(visible)
						self.Visible = visible
					end

					function Section:Seperator()
						local Components = {}
						Components["SectionSeperatorHolder"] = Globals:Instance("Frame", {
							BackgroundColor3 = Color3.fromRGB(15, 24, 21),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, 6),
							Name = "SectionSeperatorHolder",
							Parent = self.Components["SectionElements"],
						})

						Components["SectionSeperatorFrame"] = Globals:Instance("Frame", {
							BackgroundColor3 = Color3.fromRGB(15, 24, 21),
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, 1),
							Name = "SectionSeperatorFrame",
							Parent = Components["SectionSeperatorHolder"],
						})

						function Components:SetVisibility(visible)
							Components.SectionSeperatorHolder.Visible = visible
						end

						return Components
					end

					function Section:Toggle(ToggleData)
						local Toggle = {
							Name = ToggleData.Name,
							Flag = ToggleData.Flag,
							Value = false,
							Default = ToggleData.Default or false,
							Callback = ToggleData.Callback or function() end,
							Tooltip = ToggleData.Tooltip or nil,
							Risky = ToggleData.Risky,
							Class = "Toggle",
						}

						Toggle.__index = Toggle

						local Components = {}

						do
							Components["ToggleHolder"] = Globals:Instance("TextButton", {
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Size = Toggle.Tooltip and UDim2.new(1, 0, 0, 38) or UDim2.new(1, 0, 0, 20),
								Name = "ToggleHolder",
								Parent = self.Components["SectionElements"],
								Text = "",
								AutoButtonColor = false,
							})

							Components["ToggleTitle"] = Globals:Instance("TextLabel", {
								Font = Enum.Font.SourceSansSemibold,
								Text = Toggle.Name,
								TextColor3 = not Toggle.Risky and Color3.fromRGB(96, 140, 128)
									or Color3.fromRGB(150, 14, 23),
								TextSize = 14,
								TextXAlignment = Enum.TextXAlignment.Left,
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Size = UDim2.new(1, 0, 0, 15),
								Name = "ToggleTitle",
								Parent = Components["ToggleHolder"],
							})

							Components["ToggleButton"] = Globals:Instance("TextLabel", {
								Font = Enum.Font.SourceSans,
								Text = "",
								TextColor3 = Color3.fromRGB(0, 0, 0),
								TextSize = 14,
								BackgroundColor3 = Color3.fromRGB(7, 10, 9),
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Position = UDim2.new(1, -15, 0, 0),
								Size = UDim2.new(0, 15, 0, 15),
								Name = "ToggleButton",
								Parent = Components["ToggleHolder"],
							})

							Components["ToggleButtonCorner"] = Globals:Instance("UICorner", {
								CornerRadius = UDim.new(0, 0),
								Name = "ToggleButtonCorner",
								Parent = Components["ToggleButton"],
							})

							Components["ToggleStroke"] = Globals:Instance("UIStroke", {
								ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
								Color = Color3.fromRGB(15, 24, 21),
								Name = "ToggleStroke",
								Parent = Components["ToggleButton"],
							})

							Components["ToggleDropshadowContainer"] = Globals:Instance("Frame", {
								BackgroundTransparency = 1,
								BorderSizePixel = 0,
								Size = UDim2.new(1, 0, 1, 0),
								ZIndex = 0,
								Name = "ToggleDropshadowContainer",
								Parent = Components["ToggleButton"],
							})

							Components["ToggleDropshadow"] = Globals:Instance("ImageLabel", {
								Image = Library.ShadowImage,
								ImageColor3 = Library.Theme.Accent,
								ImageTransparency = 0.5,
								ScaleType = Enum.ScaleType.Slice,
								SliceCenter = Rect.new(49, 49, 450, 450),
								AnchorPoint = Vector2.new(0.5, 0.5),
								BackgroundTransparency = 1,
								BorderSizePixel = 0,
								Position = UDim2.new(0.5, 0, 0.5, 0),
								Size = UDim2.new(1, 20, 1, 20),
								ZIndex = 0,
								Name = "ToggleDropshadow",
								Parent = Components["ToggleDropshadowContainer"],
							})

							if Toggle.Tooltip then
								Components["Tooltip"] = Globals:Instance("TextLabel", {
									Font = Enum.Font.SourceSansSemibold,
									Text = Toggle.Tooltip,
									TextColor3 = Color3.fromRGB(70, 100, 92),
									TextSize = 14,
									TextXAlignment = Enum.TextXAlignment.Left,
									BackgroundColor3 = Color3.fromRGB(255, 255, 255),
									BackgroundTransparency = 1,
									BorderColor3 = Color3.fromRGB(0, 0, 0),
									BorderSizePixel = 0,
									Position = UDim2.new(0, 3, 0, 18),
									Size = UDim2.new(1, 0, 0, 15),
									Name = "Tooltip",
									Parent = Components["ToggleHolder"],
								})
							end
						end

						local Val = false
						Toggle.Components = Components

						function Toggle:Set(Value)
							self.Value = Value
							Val = Value
							if self.Value == true then
								Globals:Tween(
									Components["ToggleDropshadow"],
									TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
									{
										ImageTransparency = 0.5,
									}
								)

								Globals:Tween(
									Components["ToggleButton"],
									TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
									{
										BackgroundColor3 = Library.Theme.DarkAccent,
									}
								)

								Globals:Tween(
									Components["ToggleStroke"],
									TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
									{
										Color = Library.Theme.Accent,
									}
								)

								Globals:Tween(
									Components["ToggleTitle"],
									TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
									{
										TextColor3 = self.Risky and Color3.fromRGB(255, 0, 0)
											or Color3.fromRGB(255, 255, 255),
									}
								)
							else
								Globals:Tween(
									Components["ToggleDropshadow"],
									TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
									{
										ImageTransparency = 1,
									}
								)

								Globals:Tween(
									Components["ToggleButton"],
									TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
									{
										BackgroundColor3 = Color3.fromRGB(7, 10, 9),
									}
								)

								Globals:Tween(
									Components["ToggleStroke"],
									TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
									{
										Color = Color3.fromRGB(15, 24, 21),
									}
								)

								Globals:Tween(
									Components["ToggleTitle"],
									TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
									{
										TextColor3 = self.Risky and Color3.fromRGB(150, 14, 23)
											or Color3.fromRGB(96, 140, 128),
									}
								)
							end

							Library:DoCallback(self.Callback)
						end

						function Toggle:SetVisibility(visible)
							self.Components.ToggleHolder.Visible = visible
						end

						Library:Connection(
							"ToggleHandler" .. Toggle.Flag,
							Components.ToggleHolder.MouseButton1Down,
							function()
								Toggle:Set(not Val)
							end
						)

						Library:Connection(
							"ToggleMouseEnter" .. Toggle.Name,
							Components.ToggleHolder.MouseEnter,
							function()
								Globals:Tween(
									Components["ToggleStroke"],
									TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
									{
										Color = Library.Theme.Accent,
									}
								)
							end
						)

						Library:Connection(
							"ToggleMouseLeave" .. Category.Name,
							Components.ToggleHolder.MouseLeave,
							function()
								if Toggle.Value then
									return
								end
								Globals:Tween(
									Components["ToggleStroke"],
									TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
									{
										Color = Color3.fromRGB(15, 24, 21),
									}
								)
							end
						)

						Library.Flags[Toggle.Flag] = Toggle
						Section.Elements[Toggle.Flag] = Toggle

						Toggle:Set(Toggle.Default)
						return Toggle
					end

					function Section:Slider(SliderData)
						local Slider = {
							Min = SliderData.Min or 0,
							Max = SliderData.Max or 100,
							Default = SliderData.Default or SliderData.Max,
							Increment = SliderData.Increment or 1,
							Name = SliderData.Name,
							Flag = SliderData.Flag,
							Suffix = SliderData.Suffix or "",
							Callback = SliderData.Callback or function() end,
							Class = "Slider",
						}

						Slider.__index = Slider

						local Components = {}

						do
							Components["Slider"] = Globals:Instance("Frame", {
								BackgroundColor3 = Color3.fromRGB(255, 0, 4),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Size = UDim2.new(1, 0, 0, 44),
								Name = "Slider",
								Parent = self.Components["SectionElements"],
							})

							Components["SliderTitle"] = Globals:Instance("TextLabel", {
								Font = Enum.Font.SourceSansSemibold,
								Text = Slider.Name,
								TextColor3 = Color3.fromRGB(96, 140, 128),
								TextSize = 14,
								TextXAlignment = Enum.TextXAlignment.Left,
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Size = UDim2.new(1, 0, 0, 15),
								Name = "SliderTitle",
								Parent = Components["Slider"],
							})

							Components["SliderVisualizer"] = Globals:Instance("Frame", {
								BackgroundColor3 = Color3.fromRGB(7, 10, 9),
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Position = UDim2.new(0, 0, 1, -15),
								Size = UDim2.new(1, 0, 0, 2),
								Name = "SliderVisualizer",
								Parent = Components["Slider"],
							})

							Components["SliderVisualizerFill"] = Globals:Instance("Frame", {
								BackgroundColor3 = Library.Theme.DarkAccent,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Size = UDim2.new(0, 0, 1, 0),
								Name = "SliderVisualizerFill",
								Parent = Components["SliderVisualizer"],
							})

							Components["SliderCircle"] = Globals:Instance("Frame", {
								AnchorPoint = Vector2.new(0, 0.5),
								BackgroundColor3 = Library.Theme.DarkAccent,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Position = UDim2.new(1, -10, 0.5, 0),
								Size = UDim2.new(0, 10, 0, 10),
								Name = "SliderCircle",
								Parent = Components["SliderVisualizerFill"],
							})

							Components["SliderCircleCorner"] = Globals:Instance("UICorner", {
								Name = "SliderCircleCorner",
								Parent = Components["SliderCircle"],
							})

							Components["SliderShadowContainer"] = Globals:Instance("Frame", {
								BackgroundTransparency = 1,
								BorderSizePixel = 0,
								Size = UDim2.new(1, 0, 1, 0),
								ZIndex = 0,
								Name = "SliderShadowContainer",
								Parent = Components["SliderVisualizerFill"],
							})

							Components["SliderShadow"] = Globals:Instance("ImageLabel", {
								Image = Library.ShadowImage,
								ImageColor3 = Library.Theme.Accent,
								ImageTransparency = 0.72,
								ScaleType = Enum.ScaleType.Slice,
								SliceCenter = Rect.new(49, 49, 450, 450),
								AnchorPoint = Vector2.new(0.5, 0.5),
								BackgroundTransparency = 1,
								BorderSizePixel = 0,
								Position = UDim2.new(0.5, -1, 0.5, 0),
								Size = UDim2.new(1, 7, 1, 10),
								ZIndex = 0,
								Name = "SliderShadow",
								Parent = Components["SliderShadowContainer"],
							})

							Components["SliderValue"] = Globals:Instance("TextLabel", {
								Font = Enum.Font.SourceSansSemibold,
								Text = tostring(Slider.Default) .. Slider.Suffix,
								TextColor3 = Color3.fromRGB(96, 140, 128),
								TextSize = 14,
								TextXAlignment = Enum.TextXAlignment.Right,
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Size = UDim2.new(1, 0, 0, 15),
								Name = "SliderValue",
								Parent = Components["Slider"],
							})
						end

						function Slider:Set(Value)
							Value = Math.RoundToIncrement(math.clamp(Value, self.Min, self.Max), self.Increment)
							self.Value = Value

							local percent = (Value - self.Min) / (self.Max - self.Min)

							Globals:Tween(
								Components["SliderVisualizerFill"],
								TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
								{
									Size = UDim2.new(percent, 0, 1, 0),
								}
							)

							Globals:Tween(
								Components["SliderCircle"],
								TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
								{
									Position = UDim2.new(1, -10, 0.5, 0),
								}
							)

							Components["SliderValue"].Text = Library:FormatValue(Slider.Increment, Value)
								.. Slider.Suffix

							Library:DoCallback(self.Callback, Value)
						end

						function Slider:SetVisibility(visible)
							self.Slider.Visible = visible
						end

						Slider.Components = Components

						do
							local Dragging = false

							local function UpdateFromInput(XPosition)
								local SliderVisualizer = Components["SliderVisualizer"]
								local SliderVisualizerFill = Components["SliderVisualizerFill"]
								local Circle = Components["SliderCircle"]
								local ValueLabel = Components["SliderValue"]

								local RelativeX = math.clamp(
									(XPosition - SliderVisualizer.AbsolutePosition.X) / SliderVisualizer.AbsoluteSize.X,
									0,
									1
								)
								local RawValue = (Slider.Max - Slider.Min) * RelativeX + Slider.Min

								Slider:Set(RawValue)
							end

							UserInputService.InputEnded:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseButton1 then
									Dragging = false
									Window.InDrag = false
								end
							end)

							UserInputService.InputChanged:Connect(function(input)
								if Dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
									UpdateFromInput(input.Position.X)
								end
							end)

							Library:Connection("Slider" .. Slider.Flag, Components.Slider.InputBegan, function(Input)
								if Input.UserInputType == Enum.UserInputType.MouseButton1 then
									Dragging = true
									Window.InDrag = true
									UpdateFromInput(Input.Position.X)
								end
							end)
						end

						Slider:Set(Slider.Default)

						Library.Flags[Slider.Flag] = Slider
						Section.Elements[Slider.Flag] = Slider
						return Slider
					end

					function Section:Button(ButtonData)
						local Button = {
							Name = ButtonData.Name,
							Flag = ButtonData.Flag,
							Class = "Button",
							Callback = ButtonData.Callback or function() end,
						}

						local Components = {}

						do
							Components["ButtonHolder"] = Globals:Instance("Frame", {
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Size = UDim2.new(1, 0, 0, 24),
								Name = "ButtonHolder",
								Parent = self.Components["SectionElements"],
							})

							Components["Button"] = Globals:Instance("TextButton", {
								Font = Enum.Font.SourceSansSemibold,
								TextColor3 = Color3.fromRGB(96, 140, 128),
								TextSize = 14,
								AutoButtonColor = false,
								BackgroundColor3 = Color3.fromRGB(7, 10, 9),
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Position = UDim2.new(0, 0, 0, 2),
								Size = UDim2.new(1, 0, 0, 18),
								Name = "Button",
								Parent = Components["ButtonHolder"],
								Text = Button.Name,
							})

							Components["ButtonCorner"] = Globals:Instance("UICorner", {
								CornerRadius = UDim.new(0, 0),
								Name = "ButtonCorner",
								Parent = Components["Button"],
							})

							Components["ButtonStroke"] = Globals:Instance("UIStroke", {
								ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
								Color = Color3.fromRGB(15, 24, 21),
								Name = "ButtonStroke",
								Parent = Components["Button"],
							})
						end

						Library:Connection("MouseEnter" .. Button.Flag, Components.Button.MouseEnter, function()
							Globals:Tween(
								Components["ButtonStroke"],
								TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
								{
									Color = Library.Theme.Accent,
								}
							)
						end)

						Library:Connection("MouseLeave" .. Button.Flag, Components.Button.MouseLeave, function()
							Globals:Tween(
								Components["ButtonStroke"],
								TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
								{
									Color = Color3.fromRGB(15, 24, 21),
								}
							)
						end)

						Library:Connection(
							"ButtonHandler" .. Button.Flag,
							Components.Button.MouseButton1Down,
							function()
								Library:DoCallback(Button.Callback)
								task.spawn(function()
									Globals:Tween(
										Components["Button"],
										TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
										{
											BackgroundColor3 = Library.Theme.Accent,
										}
									)
									task.wait(0.2)
									Globals:Tween(
										Components["Button"],
										TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
										{
											BackgroundColor3 = Color3.fromRGB(7, 10, 9),
										}
									)
								end)
							end
						)

						function Button:AddButton(NewData)
							if self.SecondButton then
								return
							end

							local newFlag = NewData.Flag or (self.Flag .. "_2")
							local newName = NewData.Name or "Button"
							local newCallback = NewData.Callback or function() end

							Components.Button.Size = UDim2.new(0.5, -1, 0, 18)
							Components.Button.Position = UDim2.new(0, 0, 0, 2)

							local Second = Globals:Instance("TextButton", {
								Font = Enum.Font.SourceSansSemibold,
								TextColor3 = Color3.fromRGB(96, 140, 128),
								TextSize = 14,
								AutoButtonColor = false,
								BackgroundColor3 = Color3.fromRGB(7, 10, 9),
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Position = UDim2.new(0.5, 1, 0, 2),
								Size = UDim2.new(0.5, -1, 0, 18),
								Name = "Button2",
								Parent = Components["ButtonHolder"],
								Text = newName,
							})

							Globals:Instance("UICorner", {
								CornerRadius = UDim.new(0, 0),
								Parent = Second,
							})

							local Stroke = Globals:Instance("UIStroke", {
								ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
								Color = Color3.fromRGB(15, 24, 21),
								Parent = Second,
							})

							Library:Connection("ButtonHandler" .. newFlag, Second.MouseButton1Down, function()
								Library:DoCallback(newCallback)
								task.spawn(function()
									Globals:Tween(
										Second,
										TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
										{
											BackgroundColor3 = Library.Theme.Accent,
										}
									)
									task.wait(0.2)
									Globals:Tween(
										Second,
										TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
										{
											BackgroundColor3 = Color3.fromRGB(7, 10, 9),
										}
									)
								end)
							end)

							Library:Connection("MouseEnter" .. newFlag, Second.MouseEnter, function()
								Globals:Tween(Stroke, TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad), {
									Color = Library.Theme.Accent,
								})
							end)

							Library:Connection("MouseLeave" .. newFlag, Second.MouseLeave, function()
								Globals:Tween(Stroke, TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad), {
									Color = Color3.fromRGB(15, 24, 21),
								})
							end)

							self.SecondButton = {
								Name = newName,
								Flag = newFlag,
								Callback = newCallback,
								Instance = Second,
							}

							return self.SecondButton
						end

						Button.Components = Components
						Button.__index = Button
						Section.Elements[Button.Flag] = Button
						return Button
					end

					function Section:Dropdown(DropdownData)
						local Dropdown = {
							Name = DropdownData.Name,
							Flag = DropdownData.Flag,
							Multi = DropdownData.Multi or false,
							Value = not DropdownData.Multi and "" or {},
							Default = DropdownData.Default,
							Callback = DropdownData.Callback or function() end,
							Class = "Dropdown",
						}

						self.ZIndex -= 1
						Dropdown.__index = Dropdown
						local vis = false
						local Components = {}

						do
							Components["Dropdown"] = Globals:Instance("Frame", {
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Size = UDim2.new(1, 0, 0, 44),
								ZIndex = 2,
								Name = "Dropdown",
								Parent = self.Components["SectionElements"],
								ZIndex = self.ZIndex,
							})

							Components["DropdownTitle"] = Globals:Instance("TextLabel", {
								Font = Enum.Font.SourceSansSemibold,
								Text = Dropdown.Name,
								TextColor3 = Color3.fromRGB(96, 140, 128),
								TextSize = 14,
								TextXAlignment = Enum.TextXAlignment.Left,
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Size = UDim2.new(1, 0, 0, 15),
								Name = "DropdownTitle",
								Parent = Components["Dropdown"],
							})

							Components["DropdownButton"] = Globals:Instance("TextButton", {
								Font = Enum.Font.SourceSansSemibold,
								Text = "   ",
								TextColor3 = Color3.fromRGB(96, 140, 128),
								TextSize = 14,
								TextXAlignment = Enum.TextXAlignment.Left,
								AutoButtonColor = false,
								BackgroundColor3 = Color3.fromRGB(7, 10, 9),
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Position = UDim2.new(0, 0, 0, 18),
								Size = UDim2.new(1, 0, 0, 22),
								Name = "DropdownButton",
								Parent = Components["Dropdown"],
								ClipsDescendants = false,
							})

							Components["DropdownButtonCorner"] = Globals:Instance("UICorner", {
								CornerRadius = UDim.new(0, 0),
								Name = "DropdownButtonCorner",
								Parent = Components["DropdownButton"],
							})

							Components["DropdownStroke"] = Globals:Instance("UIStroke", {
								ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
								Color = Color3.fromRGB(15, 24, 21),
								Name = "DropdownStroke",
								Parent = Components["DropdownButton"],
							})

							Components["DropdownImage"] = Globals:Instance("ImageLabel", {
								Image = Library.DropdownImage,
								AnchorPoint = Vector2.new(0, 0.5),
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Position = UDim2.new(1, -15, 0.5, 0),
								Size = UDim2.new(0, 15, 0, 15),
								Name = "DropdownImage",
								Parent = Components["DropdownButton"],
								ZIndex = 3,
							})

							Components["DropdownItemsOutline"] = Globals:Instance("Frame", {
								BackgroundColor3 = Color3.fromRGB(7, 10, 9),
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Position = UDim2.new(0, 0, 0, 21),
								Size = UDim2.new(1, 0, 0, 0),
								Name = "DropdownItemsOutline",
								Visible = false,
								Parent = Components["DropdownButton"],
								ClipsDescendants = true,
								ZIndex = 2,
							})

							Components["DropdownItemsStroke"] = Globals:Instance("UIStroke", {
								ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
								Color = Color3.fromRGB(15, 24, 21),
								Name = "DropdownItemsStroke",
								Parent = Components["DropdownItemsOutline"],
								Transparency = 1,
							})

							Components["DropdownItems"] = Globals:Instance("ScrollingFrame", {
								AutomaticCanvasSize = Enum.AutomaticSize.Y,
								CanvasSize = UDim2.new(0, 0, 1, 0),
								ScrollBarImageColor3 = Library.Theme.Accent,
								ScrollBarImageTransparency = 0.67,
								ScrollBarThickness = 3,
								Visible = true,
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Position = UDim2.new(0, 2, 0, 2),
								Size = UDim2.new(1, -4, 1, -4),
								Name = "DropdownItems",
								Parent = Components["DropdownItemsOutline"],
								ClipsDescendants = true,
							})

							Components["DropdownListLayout"] = Globals:Instance("UIListLayout", {
								Padding = UDim.new(0, 3),
								SortOrder = Enum.SortOrder.LayoutOrder,
								Name = "DropdownListLayout",
								Parent = Components["DropdownItems"],
							})

							Components["DropdownFadeBottom"] = Globals:Instance("Frame", {
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Position = UDim2.new(0, 0, 1, -20),
								Size = UDim2.new(1, 0, 0, 20),
								Name = "DropdownFadeBottom",
								Parent = Components["DropdownItemsOutline"],
							})

							Components["DropdownFadeTopGradient"] = Globals:Instance("UIGradient", {
								Color = ColorSequence.new({
									ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 10, 9)),
									ColorSequenceKeypoint.new(1, Color3.fromRGB(7, 10, 9)),
								}),
								Rotation = -90,
								Transparency = NumberSequence.new({
									NumberSequenceKeypoint.new(0, 0.4),
									NumberSequenceKeypoint.new(1, 1),
								}),
								Name = "DropdownFadeTopGradient",
								Parent = Components["DropdownFadeBottom"],
							})

							Components["DropdownFadeTop"] = Globals:Instance("Frame", {
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Size = UDim2.new(1, 0, 0, 20),
								Name = "DropdownFadeTop",
								Parent = Components["DropdownItemsOutline"],
							})

							Components["DropdownFadeTopGradient1"] = Globals:Instance("UIGradient", {
								Color = ColorSequence.new({
									ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 10, 9)),
									ColorSequenceKeypoint.new(1, Color3.fromRGB(7, 10, 9)),
								}),
								Rotation = 90,
								Transparency = NumberSequence.new({
									NumberSequenceKeypoint.new(0, 0.4),
									NumberSequenceKeypoint.new(1, 1),
								}),
								Name = "DropdownFadeTopGradient",
								Parent = Components["DropdownFadeTop"],
							})

							Components["DropdownText"] = Globals:Instance("TextLabel", {
								Parent = Components["DropdownButton"],
								BackgroundTransparency = 1,
								TextXAlignment = Enum.TextXAlignment.Left,
								TextColor3 = Color3.fromRGB(96, 140, 128),
								Size = UDim2.new(1, 0, 1, 0),
								ZIndex = 1,
								Font = Enum.Font.SourceSansSemibold,
								TextSize = 14,
								ClipsDescendants = true,
							})

							Components["DropdownHider"] = Instance.new("Frame")
							Components["DropdownHider"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							Components["DropdownHider"].BorderColor3 = Color3.fromRGB(0, 0, 0)
							Components["DropdownHider"].BorderSizePixel = 0
							Components["DropdownHider"].Position = UDim2.new(1, -20, 0.5, 0)
							Components["DropdownHider"].Size = UDim2.new(0, 20, 1, -2)
							Components["DropdownHider"].AnchorPoint = Vector2.new(0, 0.5)
							Components["DropdownHider"].Parent = Components["DropdownButton"]

							Components["HiderGradient"] = Instance.new("UIGradient")
							Components["HiderGradient"].Color = ColorSequence.new({
								ColorSequenceKeypoint.new(
									0,
									Color3.fromRGB(11.000000294297934, 11.000000294297934, 11.000000294297934)
								),
								ColorSequenceKeypoint.new(
									1,
									Color3.fromRGB(11.000000294297934, 11.000000294297934, 11.000000294297934)
								),
							})
							Components["HiderGradient"].Rotation = -180
							Components["HiderGradient"].Transparency = NumberSequence.new({
								NumberSequenceKeypoint.new(0, 0),
								NumberSequenceKeypoint.new(0.7219451665878296, 0),
								NumberSequenceKeypoint.new(0.7842893004417419, 0),
								NumberSequenceKeypoint.new(0.8690773248672485, 0.44999998807907104),
								NumberSequenceKeypoint.new(0.9650872945785522, 0.7062499523162842),
								NumberSequenceKeypoint.new(1, 0.36250001192092896),
							})
							Components["HiderGradient"].Name = "PageFadeTopGradient"
							Components["HiderGradient"].Parent = Components["DropdownHider"]
						end

						Dropdown.Components = Components

						Dropdown.Options = {}

						function Dropdown:SetVisibility(visible)
							self.Components.Dropdown.Visible = visible
						end

						function Dropdown:AddOption(Name)
							local Option = {
								Name = Name,
								Value = false,
								Components = {},
							}

							local OptionComponents = {}

							OptionComponents["Option"] = Globals:Instance("TextButton", {
								Font = Enum.Font.SourceSans,
								Text = "",
								TextColor3 = Color3.fromRGB(0, 0, 0),
								TextSize = 14,
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Size = UDim2.new(1, 0, 0, 20),
								Name = "Option",
								Parent = Components["DropdownItems"],
							})

							OptionComponents["OptionOnTitle"] = Globals:Instance("TextLabel", {
								Font = Enum.Font.SourceSansSemibold,
								Text = Name,
								TextColor3 = Color3.fromRGB(96, 140, 128),
								TextSize = 14,
								TextXAlignment = Enum.TextXAlignment.Left,
								BackgroundColor3 = Color3.fromRGB(96, 140, 128),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Position = UDim2.new(0, 10, 0, 0),
								Size = UDim2.new(1, -10, 1, 0),
								Name = "OptionOnTitle",
								Parent = OptionComponents["Option"],
							})

							OptionComponents["OptionIndicator"] = Globals:Instance("Frame", {
								BackgroundColor3 = Library.Theme.Accent,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Size = UDim2.new(0, 3, 1, 0),
								Name = "OptionIndicator",
								Visible = true,
								BackgroundTransparency = 1,
								Parent = OptionComponents["Option"],
							})

							Library:Connection(
								"OptionHandler" .. Option.Name .. "_" .. Dropdown.Flag,
								OptionComponents.Option.MouseButton1Down,
								function()
									if Dropdown.Multi then
										Option.Value = not Option.Value
										Globals:Tween(
											OptionComponents["OptionIndicator"],
											TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
											{
												BackgroundTransparency = Option.Value and 0 or 1,
											}
										)
										Globals:Tween(
											OptionComponents["OptionOnTitle"],
											TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
											{
												TextColor3 = Option.Value and Color3.fromRGB(255, 255, 255)
													or Color3.fromRGB(96, 140, 128),
											}
										)
									else
										for _, other in ipairs(Dropdown.Options) do
											other.Value = false

											Globals:Tween(
												other.Components["OptionIndicator"],
												TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
												{
													BackgroundTransparency = other.Value and 0 or 1,
												}
											)

											Globals:Tween(
												other.Components["OptionOnTitle"],
												TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
												{
													TextColor3 = other.Value and Color3.fromRGB(255, 255, 255)
														or Color3.fromRGB(96, 140, 128),
												}
											)
										end
										Option.Value = true
										Globals:Tween(
											OptionComponents["OptionIndicator"],
											TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
											{
												BackgroundTransparency = 0,
											}
										)

										Globals:Tween(
											OptionComponents["OptionOnTitle"],
											TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
											{
												TextColor3 = Option.Value and Color3.fromRGB(255, 255, 255)
													or Color3.fromRGB(96, 140, 128),
											}
										)

										Components["DropdownText"].Text = "   " .. Name
										local SizeTween = Globals:Tween(
											Components["DropdownItemsOutline"],
											TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
											{
												Size = UDim2.new(1, 0, 0, 0),
											}
										)
										Globals:Tween(
											Components["DropdownItemsStroke"],
											TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
											{
												Transparency = 1,
											}
										)
										task.spawn(function()
											task.wait(Library.HighlightSpeed)
											Components.DropdownItemsOutline.Visible = false
										end)
									end

									if Dropdown.Multi then
										local selected = {}
										for _, opt in ipairs(Dropdown.Options) do
											if opt.Value then
												table.insert(selected, opt.Name)
											end
										end
										Dropdown:Set(selected)
									else
										Dropdown:Set(Name)
									end
								end
							)

							Option.Components = OptionComponents
							table.insert(Dropdown.Options, Option)
							return Option
						end

						for Index, Name in DropdownData.Options do
							Dropdown:AddOption(Name)
						end

						function Dropdown:Set(Value)
							if not Dropdown.Multi then
								local found = false
								for _, opt in ipairs(self.Options) do
									if opt.Name == Value then
										found = true
										break
									end
								end
								if not found then
									return
								end
							end
							self.Value = Value

							if Dropdown.Multi then
								local selectedNames = {}
								for _, opt in ipairs(self.Options) do
									local selected = table.find(Value, opt.Name) ~= nil
									opt.Value = selected

									Globals:Tween(
										opt.Components["OptionIndicator"],
										TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
										{
											BackgroundTransparency = selected and 0 or 1,
										}
									)

									Globals:Tween(
										opt.Components["OptionOnTitle"],
										TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
										{
											TextColor3 = selected and Color3.fromRGB(255, 255, 255)
												or Color3.fromRGB(96, 140, 128),
										}
									)

									if selected then
										table.insert(selectedNames, opt.Name)
									end
								end

								if #selectedNames == 0 then
									Components["DropdownText"].Text = "   None"
								else
									Components["DropdownText"].Text = "   " .. table.concat(selectedNames, ", ")
								end
							else
								for _, opt in ipairs(self.Options) do
									local selected = opt.Name == Value
									opt.Value = selected

									Globals:Tween(
										opt.Components["OptionIndicator"],
										TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
										{
											BackgroundTransparency = selected and 0 or 1,
										}
									)

									Globals:Tween(
										opt.Components["OptionOnTitle"],
										TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
										{
											TextColor3 = selected and Color3.fromRGB(255, 255, 255)
												or Color3.fromRGB(96, 140, 128),
										}
									)
								end

								Globals:Tween(
									Components["Dropdown"],
									TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
									{
										Size = UDim2.new(1, 0, 0, 44),
									}
								)

								Components["DropdownText"].Text = "   " .. tostring(Value)
							end

							Library:DoCallback(self.Callback, Value)
						end

						Library:Connection(
							"DropdownHandler_" .. Dropdown.Flag .. "Main",
							Components["DropdownButton"].MouseButton1Down,
							function()
								vis = not vis
								if vis then
									local itemCount = #Dropdown.Options
									local itemHeight = 24
									local expandedItemHeight = math.min(itemCount, 3) * itemHeight
									local fullHeight = 44 + expandedItemHeight

									Components.DropdownItemsOutline.Visible = true

									Globals:Tween(
										Components["DropdownItemsOutline"],
										TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
										{
											Size = UDim2.new(1, 0, 0, expandedItemHeight),
										}
									)

									Globals:Tween(
										Components["Dropdown"],
										TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
										{
											Size = UDim2.new(1, 0, 0, fullHeight),
										}
									)

									Globals:Tween(
										Components["DropdownItemsStroke"],
										TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
										{
											Transparency = 0,
										}
									)
								else
									Globals:Tween(
										Components["DropdownItemsOutline"],
										TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
										{
											Size = UDim2.new(1, 0, 0, 0),
										}
									)

									Globals:Tween(
										Components["Dropdown"],
										TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
										{
											Size = UDim2.new(1, 0, 0, 44),
										}
									)

									Globals:Tween(
										Components["DropdownItemsStroke"],
										TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
										{
											Transparency = 1,
										}
									)

									task.spawn(function()
										task.wait(Library.HighlightSpeed)
										Components.DropdownItemsOutline.Visible = false
									end)
								end
							end
						)

						if not Dropdown.Default or (Dropdown.Multi and #Dropdown.Default == 0) then
							if Dropdown.Multi then
								Dropdown.Default = { DropdownData.Options[1] }
							else
								Dropdown.Default = DropdownData.Options[1]
							end
						end

						Dropdown:Set(Dropdown.Default)
						Library.Flags[Dropdown.Flag] = Dropdown
						Section.Elements[Dropdown.Flag] = Dropdown
						return Dropdown
					end

					function Section:Textbox(TextboxData)
						local TextBox = {
							Name = TextboxData.Name,
							Flag = TextboxData.Flag,
							Default = TextboxData.Default or "",
							Callback = TextboxData.Callback or function() end,
							Value = "",
							Class = "TextBox",
						}

						local Components = {}

						Components.Holder = Globals:Instance("Frame", {
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 40),
							Parent = self.Components.SectionElements,
						})

						Components.Title = Globals:Instance("TextLabel", {
							Font = Enum.Font.SourceSansSemibold,
							Text = TextBox.Name,
							TextColor3 = Color3.fromRGB(96, 140, 128),
							TextSize = 14,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 15),
							TextXAlignment = Enum.TextXAlignment.Left,
							Parent = Components.Holder,
						})

						local BoxFrame = Globals:Instance("Frame", {
							BackgroundColor3 = Color3.fromRGB(7, 10, 9),
							Position = UDim2.new(0, 0, 0, 18),
							Size = UDim2.new(1, 0, 0, 18),
							ClipsDescendants = true,
							Parent = Components.Holder,
						})
						Globals:Instance("UICorner", { CornerRadius = UDim.new(0, 0), Parent = BoxFrame })
						local Stroke = Globals:Instance("UIStroke", {
							Color = Color3.fromRGB(15, 24, 21),
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							Parent = BoxFrame,
						})

						local Label = Globals:Instance("TextLabel", {
							Font = Enum.Font.SourceSansSemibold,
							Text = "",
							TextColor3 = Color3.fromRGB(210, 235, 228),
							TextSize = 14,
							TextXAlignment = Enum.TextXAlignment.Left,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, -5, 1, 0),
							Position = UDim2.new(0, 5, 0, 0),
							Parent = BoxFrame,
						})

						local Mask = Globals:Instance("Frame", {
							BackgroundColor3 = Color3.fromRGB(7, 10, 9),
							Size = UDim2.new(1, -2, 1, -2),
							Position = UDim2.new(0, 1, 0, 1),
							Parent = BoxFrame,
						})

						Globals:Instance("UICorner", { CornerRadius = UDim.new(0, 0), Parent = Mask })

						local Cursor = Globals:Instance("Frame", {
							BackgroundColor3 = Color3.fromRGB(210, 235, 228),
							Size = UDim2.new(0, 1, 0.8, 0),
							Position = UDim2.new(0, 0, 0.1, 0),
							Parent = BoxFrame,
							ZIndex = Mask.ZIndex + 1,
							Visible = false,
						})
						Globals:Instance("UICorner", { CornerRadius = UDim.new(0, 0), Parent = Cursor })

						local InputBox = Globals:Instance("TextBox", {
							Font = Label.Font,
							TextSize = Label.TextSize,
							TextTransparency = 1,
							Text = "",
							BackgroundTransparency = 1,
							ClearTextOnFocus = false,
							Size = UDim2.new(1, -5, 1, 0),
							Position = UDim2.new(0, 5, 0, 0),
							Parent = BoxFrame,
						})

						local TweenService = TweenService

						local BlinkTweenInfo =
							TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)
						local BlinkTween = TweenService:Create(Cursor, BlinkTweenInfo, { BackgroundTransparency = 1 })

						local function UpdateMaskAndCursor()
							local FullText = Label.Text
							local TextWidth = Label.TextBounds.X
							local BoxWidth = BoxFrame.AbsoluteSize.X

							local RevealX = math.clamp(TextWidth, 0, BoxWidth - 7)

							if FullText:sub(-1) == " " then
								RevealX = RevealX + 3
							end

							Mask:TweenPosition(
								UDim2.new(0, 1 + 5 + RevealX, 0, 1),
								Enum.EasingDirection.Out,
								Enum.EasingStyle.Sine,
								0.1,
								true
							)
							Cursor:TweenPosition(
								UDim2.new(0, 5 + RevealX, 0.1, 0),
								Enum.EasingDirection.Out,
								Enum.EasingStyle.Sine,
								0.1,
								true
							)
						end

						function TextBox:Set(Value)
							self.Value = Value
							Label.Text = Value
							InputBox.Text = Value

							task.defer(UpdateMaskAndCursor)

							Library:DoCallback(self.Callback, Value)
						end

						function TextBox:SetVisibility(Visible)
							Components.Holder.Visible = Visible
						end

						InputBox.Focused:Connect(function()
							TweenService:Create(Stroke, TweenInfo.new(0.2), { Color = Library.Theme.Accent }):Play()
							Cursor.Visible = true
							if BlinkTween.PlaybackState ~= Enum.PlaybackState.Playing then
								BlinkTween:Play()
							end
						end)

						InputBox.FocusLost:Connect(function()
							TweenService:Create(Stroke, TweenInfo.new(0.2), { Color = Color3.fromRGB(15, 24, 21) })
								:Play()
							Cursor.Visible = false
							BlinkTween:Pause()
						end)

						InputBox:GetPropertyChangedSignal("Text"):Connect(function()
							local FullText = InputBox.Text
							TextBox.Value = FullText
							Label.Text = FullText
							task.defer(UpdateMaskAndCursor)
							Library:DoCallback(TextboxData.Callback, FullText)
						end)

						TextBox:Set(TextBox.Default)

						TextBox.Components = Components
						TextBox.__index = TextBox
						Library.Flags[TextBox.Flag] = TextBox
						return TextBox
					end

					function Section:Colorpicker(ColorpickerData)
						local Colorpicker = {
							Name = ColorpickerData.Name,
							Flag = ColorpickerData.Flag,
							Default = ColorpickerData.Default or { Color3.fromRGB(255, 255, 255), 0 },
							Callback = ColorpickerData.Callback or function() end,
							Class = "Colorpicker",
						}

						Colorpicker.__index = Colorpicker

						local Components = {}

						Components["Colorpicker"] = Globals:Instance("Frame", {
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 20),
							Name = "Colorpicker",
							Parent = self.Components["SectionElements"],
							BorderSizePixel = 0,
						})

						Components["ColorpickerTitle"] = Globals:Instance("TextLabel", {
							Font = Enum.Font.SourceSans,
							Text = Colorpicker.Name,
							TextColor3 = Color3.fromRGB(96, 140, 128),
							TextSize = 14,
							TextXAlignment = Enum.TextXAlignment.Left,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 15),
							Name = "ColorpickerTitle",
							Parent = Components["Colorpicker"],
							BorderSizePixel = 0,
						})

						Components["ColorpickerButton"] = Globals:Instance("TextButton", {
							Font = Enum.Font.SourceSans,
							Text = "",
							TextColor3 = Color3.fromRGB(0, 0, 0),
							TextSize = 14,
							AutoButtonColor = false,
							BackgroundColor3 = Colorpicker.Default[1],
							Position = UDim2.new(1, -15, 0, 0),
							Size = UDim2.new(0, 15, 0, 15),
							Name = "ColorpickerButton",
							Parent = Components["Colorpicker"],
							BorderSizePixel = 0,
						})

						Globals:Instance("UICorner", {
							CornerRadius = UDim.new(0, 0),
							Parent = Components["ColorpickerButton"],
						})

						Globals:Instance("UIStroke", {
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							Color = Color3.fromRGB(15, 24, 21),
							Parent = Components["ColorpickerButton"],
						})

						Components["ColorpickerFrame"] = Globals:Instance("Frame", {
							BackgroundColor3 = Color3.fromRGB(7, 10, 9),
							BackgroundTransparency = 1,
							Position = UDim2.new(1, 20, 0, 0),
							Size = UDim2.new(0, 215, 0, 210),
							Name = "ColorpickerFrame",
							Parent = Window.Components.Outline,
							BorderSizePixel = 0,
							Visible = false,
						})

						Globals:Instance("UICorner", {
							CornerRadius = UDim.new(0, 0),
							Parent = Components["ColorpickerFrame"],
						})

						Globals:Instance("UIStroke", {
							Color = Color3.fromRGB(15, 24, 21),
							Transparency = 1,
							Thickness = 1.5,
							Parent = Components["ColorpickerFrame"],
						})

						Components["ColorpickerTitleLine"] = Globals:Instance("Frame", {
							BackgroundColor3 = Color3.fromRGB(15, 24, 21),
							BackgroundTransparency = 1,
							Position = UDim2.new(0, 0, 0, 25),
							Size = UDim2.new(1, 0, 0, 1),
							Name = "ColorpickerTitleLine",
							Parent = Components["ColorpickerFrame"],
							BorderSizePixel = 0,
						})

						Components["ColorpickerTitleHeader"] = Globals:Instance("TextLabel", {
							Font = Enum.Font.SourceSansSemibold,
							Text = "    " .. Colorpicker.Name,
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 14,
							TextXAlignment = Enum.TextXAlignment.Left,
							BackgroundTransparency = 1,
							BackgroundColor3 = Color3.fromRGB(10, 16, 14),
							Position = UDim2.new(0, 0, 0, 0),
							Size = UDim2.new(1, 0, 0, 25),
							Name = "ColorpickerTitleHeader",
							Parent = Components["ColorpickerFrame"],
							BorderSizePixel = 0,
						})

						Components["ColorpickerElements"] = Globals:Instance("Frame", {
							BackgroundColor3 = Color3.fromRGB(7, 10, 9),
							BackgroundTransparency = 1,
							Position = UDim2.new(0, 10, 0, 208),
							Size = UDim2.new(1, -20, -0.548837364, -50),
							Name = "ColorpickerElements",
							Parent = Components["ColorpickerFrame"],
							BorderSizePixel = 0,
						})

						Components["Colorwheel"] = Globals:Instance("ImageLabel", {
							Image = Library.ColorwheelImage,
							AnchorPoint = Vector2.new(0.5, 0),
							BackgroundTransparency = 1,
							Position = UDim2.new(0.5, -20, 0, 0),
							Size = UDim2.new(0, 150, 0, 150),
							Name = "Colorwheel",
							Parent = Components["ColorpickerElements"],
							BorderSizePixel = 0,
						})

						Globals:Instance("UICorner", {
							CornerRadius = UDim.new(0, 0),
							Parent = Components["Colorwheel"],
						})

						Globals:Instance("UIStroke", {
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							Color = Color3.fromRGB(15, 24, 21),
							Transparency = 1,
							Thickness = 3,
							Parent = Components["Colorwheel"],
						})

						Components["BrightnessPicker"] = Globals:Instance("TextButton", {
							Text = "",
							AutoButtonColor = false,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							Position = UDim2.new(1, -35, 0, 0),
							Size = UDim2.new(0, 10, 0, 150),
							Name = "BrightnessPicker",
							Parent = Components["ColorpickerElements"],
							BorderSizePixel = 0,
						})

						Globals:Instance("UICorner", {
							CornerRadius = UDim.new(0, 0),
							Parent = Components["BrightnessPicker"],
						})

						Globals:Instance("UIStroke", {
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							Color = Color3.fromRGB(15, 24, 21),
							Transparency = 1,
							Parent = Components["BrightnessPicker"],
						})

						Globals:Instance("UIGradient", {
							Color = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
							}),
							Rotation = 90,
							Parent = Components["BrightnessPicker"],
						})

						Components["TransparencyPickerButton"] = Globals:Instance("TextButton", {
							Text = "",
							AutoButtonColor = false,
							BackgroundColor3 = Colorpicker.Default[1],
							Position = UDim2.new(1, -15, 0, 0),
							Size = UDim2.new(0, 10, 0, 150),
							Name = "TransparencyPickerButton",
							Parent = Components["ColorpickerElements"],
							BorderSizePixel = 0,
						})

						local TransparencyPicture = Globals:Instance("ImageLabel", {
							Image = Library.TransparencyImage,
							ScaleType = Enum.ScaleType.Tile,
							TileSize = UDim2.new(8, 0, 0.5, 0),
							BackgroundColor3 = Colorpicker.Default[1],
							Size = UDim2.new(1, 0, 1, 0),
							Name = "TransparencyPicture",
							Parent = Components["TransparencyPickerButton"],
							BorderSizePixel = 0,
							Rotation = 180,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.new(0.5, 0, 0.5, 0),
						})

						Globals:Instance("UIGradient", {
							Transparency = NumberSequence.new({
								NumberSequenceKeypoint.new(0, 0),
								NumberSequenceKeypoint.new(1, 1),
							}),
							Rotation = 90,
							Parent = TransparencyPicture,
						})

						Globals:Instance("UICorner", {
							CornerRadius = UDim.new(0, 0),
							Parent = Components["TransparencyPickerButton"],
						})

						Globals:Instance("UIStroke", {
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							Color = Color3.fromRGB(15, 24, 21),
							Parent = Components["TransparencyPickerButton"],
						})

						local WheelIndicator = Globals:Instance("Frame", {
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 2,
							Size = UDim2.new(0, 6, 0, 6),
							Name = "WheelIndicator",
							Parent = Components["Colorwheel"],
						})
						Globals:Instance("UICorner", { CornerRadius = UDim.new(0, 0), Parent = WheelIndicator })

						local BrightnessIndicator = Globals:Instance("Frame", {
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BorderSizePixel = 1,
							Size = UDim2.new(1, 0, 0, 2),
							Name = "BrightnessIndicator",
							Parent = Components["BrightnessPicker"],
						})

						local TransparencyIndicator = Globals:Instance("Frame", {
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BorderSizePixel = 1,
							Size = UDim2.new(1, 0, 0, 2),
							Name = "TransparencyIndicator",
							Parent = Components["TransparencyPickerButton"],
						})

						Colorpicker.Components = Components

						local function FadeInFrame(frame)
							frame.Visible = true
							Globals:TweenTransparencyIns(frame, 0, 0.2)
						end

						local function FadeOutFrame(frame)
							Globals:TweenTransparencyIns(frame, 1, 0.2)
							task.delay(0.2, function()
								if frame and frame.Parent then
									frame.Visible = false
								end
							end)
						end

						Components["ColorpickerButton"].MouseButton1Down:Connect(function()
							local thisFrame = Components["ColorpickerFrame"]
							local isOpening = not (thisFrame.Visible and thisFrame.BackgroundTransparency < 1)

							for _, child in ipairs(Window.Components.Outline:GetChildren()) do
								if child.Name == "ColorpickerFrame" and child ~= thisFrame and child.Visible then
									FadeOutFrame(child)
								end
							end

							if isOpening then
								FadeInFrame(thisFrame)
							else
								FadeOutFrame(thisFrame)
							end
						end)

						local function UpdateIndicators()
							local col, transparency = Colorpicker.Value[1], Colorpicker.Value[2]
							local h, s, v = col:ToHSV()

							local radius = Components["Colorwheel"].AbsoluteSize.X / 2
							local angle = h * 2 * math.pi
							local distance = s * radius
							local offset = Vector2.new(math.cos(angle), math.sin(angle)) * distance

							Globals:Tween(WheelIndicator, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
								Position = UDim2.new(0.5, offset.X, 0.5, offset.Y),
							})

							Globals:Tween(BrightnessIndicator, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
								Position = UDim2.new(0, 0, 1 - v, -1),
							})

							Globals:Tween(TransparencyIndicator, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
								Position = UDim2.new(0, 0, transparency, -1),
							})
						end

						function Colorpicker:Set(Value)
							self.Value = Value

							local col = Value[1]
							local transparency = Value[2]

							Globals:Tween(Components["ColorpickerButton"], TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
								BackgroundColor3 = col,
							})

							Globals:Tween(TransparencyPicture, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
								BackgroundColor3 = col,
							})

							Globals:Tween(
								Components["TransparencyPickerButton"],
								TweenInfo.new(0.15, Enum.EasingStyle.Quad),
								{
									BackgroundColor3 = col,
								}
							)

							local h, s, v = col:ToHSV()
							if v > 0 then
								self._LastHue = h
								self._LastSaturation = s
							end

							UpdateIndicators()
							Library:DoCallback(self.Callback, Value)
						end

						function Colorpicker:SetVisibility(visible)
							self.Colorpicker.Visible = visible
							if self.ColorpickerFrame.Visible and not visible then
								self.ColorpickerFrame.Visible = visible
							end
						end

						local function ColorFromWheel(x, y, wheel)
							local center = wheel.AbsolutePosition + wheel.AbsoluteSize / 2
							local radius = wheel.AbsoluteSize.X / 2
							local rel = Vector2.new(x, y) - center
							local distance = rel.Magnitude

							local hue, sat = 0, 0

							if distance > 0 then
								hue = math.atan2(rel.Y, rel.X) / (2 * math.pi)
								if hue < 0 then
									hue = hue + 1
								end
								sat = math.clamp(distance / radius, 0, 1)
							end

							local _, _, v = Colorpicker.Value[1]:ToHSV()
							return Color3.fromHSV(hue, sat, v)
						end

						local function EnableDragging(Component, onDrag)
							Component.InputBegan:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseButton1 then
									local moveConn, upConn
									moveConn = RunService.RenderStepped:Connect(function()
										local mousePos = UserInputService:GetMouseLocation()
										local adjustedMousePos = Vector2.new(mousePos.X, mousePos.Y - MouseConstant)

										onDrag(adjustedMousePos)
									end)
									upConn = UserInputService.InputEnded:Connect(function(endInput)
										if endInput.UserInputType == Enum.UserInputType.MouseButton1 then
											moveConn:Disconnect()
											upConn:Disconnect()
										end
									end)
								end
							end)
						end

						EnableDragging(Components["Colorwheel"], function(mousePosRaw)
							local mousePos = Vector2.new(mousePosRaw.X, mousePosRaw.Y - MouseConstant)
							local col = ColorFromWheel(mousePos.X, mousePos.Y, Components["Colorwheel"])
							Colorpicker:Set({ col, Colorpicker.Value[2] })
						end)

						EnableDragging(Components["BrightnessPicker"], function(mousePosRaw)
							local mousePos = Vector2.new(mousePosRaw.X, mousePosRaw.Y - MouseConstant)
							local top = Components["BrightnessPicker"].AbsolutePosition.Y
							local height = Components["BrightnessPicker"].AbsoluteSize.Y
							local valueY = math.clamp((mousePos.Y - top) / height, 0, 1)

							local h, s = Colorpicker._LastHue or 0, Colorpicker._LastSaturation or 0
							local v = 1 - valueY

							local newColor = Color3.fromHSV(h, s, v)
							Colorpicker:Set({ newColor, Colorpicker.Value[2] })
						end)

						EnableDragging(Components["TransparencyPickerButton"], function(mousePosRaw)
							local mousePos = Vector2.new(mousePosRaw.X, mousePosRaw.Y - MouseConstant)
							local top = Components["TransparencyPickerButton"].AbsolutePosition.Y
							local height = Components["TransparencyPickerButton"].AbsoluteSize.Y
							local yVal = math.clamp((mousePos.Y - top) / height, 0, 1)
							Colorpicker:Set({ Colorpicker.Value[1], yVal })
						end)

						Colorpicker:Set(Colorpicker.Default)

						Library.Flags[Colorpicker.Flag] = Colorpicker
						return Colorpicker
					end

					function Section:Keybind(KeybindData)
						local Keybind = {
							Name = KeybindData.Name,
							Flag = KeybindData.Flag,
							Default = KeybindData.Default or nil,
							Callback = KeybindData.Callback or function() end,
							Key = KeybindData.Key or nil,
							Mode = KeybindData.Mode or "Toggle",
							Active = false,
							Class = "Keybind",
						}

						Keybind.__index = Keybind

						local Components = {}

						do
							Components["KeybindHolder"] = Globals:Instance("Frame", {
								BackgroundTransparency = 1,
								Size = UDim2.new(1, 0, 0, 20),
								Name = "KeybindHolder",
								Parent = self.Components["SectionElements"],
							})

							Components["KeybindTitle"] = Globals:Instance("TextLabel", {
								Font = Enum.Font.SourceSansSemibold,
								Text = Keybind.Name,
								TextColor3 = Color3.fromRGB(96, 140, 128),
								TextSize = 14,
								TextXAlignment = Enum.TextXAlignment.Left,
								BackgroundTransparency = 1,
								Size = UDim2.new(1, 0, 0, 15),
								Name = "KeybindTitle",
								Parent = Components["KeybindHolder"],
							})

							Components["KeybindButton"] = Globals:Instance("TextButton", {
								Font = Enum.Font.SourceSansSemibold,
								Text = "None",
								TextColor3 = Color3.fromRGB(96, 140, 128),
								TextSize = 14,
								TextXAlignment = Enum.TextXAlignment.Center,
								AutoButtonColor = false,
								BackgroundColor3 = Color3.fromRGB(7, 10, 9),
								BorderSizePixel = 0,
								Position = UDim2.new(1, -50, 0, 0),
								Size = UDim2.new(0, 50, 0, 15),
								Name = "KeybindButton",
								Parent = Components["KeybindHolder"],
							})

							Globals:Instance("UICorner", {
								CornerRadius = UDim.new(0, 0),
								Parent = Components["KeybindButton"],
							})

							Globals:Instance("UIStroke", {
								ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
								Color = Color3.fromRGB(15, 24, 21),
								Parent = Components["KeybindButton"],
							})
						end

						Keybind.Components = Components

						function Keybind:SetVisibility(visible)
							self.KeybindHolder.Visible = visible
						end

						function Keybind:SetKey(input)
							if input then
								if typeof(input.UserInputType) == "string" then
									input.UserInputType = Enum.UserInputType[input.UserInputType]

									if input.UserInputType == "KeyCode" then
										input.KeyCode = Enum.KeyCode[input.KeyCode]
									end
								end

								local keyType
								local keyValue

								if
									input.UserInputType == Enum.UserInputType.MouseButton1
									or input.UserInputType == Enum.UserInputType.MouseButton2
									or input.UserInputType == Enum.UserInputType.MouseButton3
								then
									keyType = "MouseButton"
									keyValue = input.UserInputType
								elseif input.UserInputType == Enum.UserInputType.Keyboard then
									keyType = "KeyCode"
									keyValue = input.KeyCode
								else
									keyType = "UserInputType"
									keyValue = input.UserInputType
								end

								self.Key = {
									Type = keyType,
									Value = keyValue,
								}

								Window.Hotkeys:UpdateStatus(
									self.Name,
									self.Active,
									Library:FormatKeyName(Library:GetInputName(input))
								)
								Components["KeybindButton"].Text = Library:FormatKeyName(Library:GetInputName(input))
							else
								Window.Hotkeys:UpdateStatus(self.Name, self.Active, "", true)
								self.Key = nil
								Components["KeybindButton"].Text = "None"
							end

							Globals:Tween(
								Components["KeybindButton"],
								TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
								{
									TextColor3 = Color3.fromRGB(96, 140, 128),
								}
							)
						end

						function Keybind:SetState(state)
							self.Active = state
							Window.Hotkeys:UpdateStatus(self.Name, self.Active)
							Library:DoCallback(self.Callback, state)
						end

						function Keybind:Set(value)
							self.Value = value
							self:SetKey(value)
						end

						function Keybind:Matches(input)
							if not self.Key then
								return false
							end

							if self.Key.Type == "KeyCode" then
								return input.KeyCode == self.Key.Value
							elseif self.Key.Type == "MouseButton" then
								return input.UserInputType == self.Key.Value
							elseif self.Key.Type == "UserInputType" then
								return input.UserInputType == self.Key.Value
							end

							return false
						end

						local Listening = false
						Library:Connection(
							"Keybind_" .. Keybind.Flag .. "_StartListen",
							Components["KeybindButton"].MouseButton1Click,
							function()
								if Listening then
									return
								end
								Listening = true

								Globals:Tween(
									Components["KeybindButton"],
									TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
									{
										TextColor3 = Color3.fromRGB(7, 10, 9),
									}
								)

								Components["KeybindButton"].Text = "..."

								Globals:Tween(
									Components["KeybindButton"],
									TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
									{
										TextColor3 = Color3.fromRGB(255, 255, 255),
									}
								)

								local ConnectionName = "Keybind_" .. Keybind.Flag .. "_InputListen"
								task.wait(0.06)
								Library:Connection(ConnectionName, UserInputService.InputBegan, function(input, gpe)
									if not Listening then
										return
									end
									Listening = false
									Library:Disconnect(ConnectionName)

									if input.KeyCode == Enum.KeyCode.Backspace then
										Keybind:Set(nil)
										return
									end

									if
										input.UserInputType == Enum.UserInputType.MouseButton1
										or input.UserInputType == Enum.UserInputType.MouseButton2
										or input.UserInputType == Enum.UserInputType.MouseButton3
										or input.UserInputType == Enum.UserInputType.Keyboard
									then
										Keybind:SetKey(input)
									end
								end)
							end
						)

						Library:Connection(
							"Keybind_" .. Keybind.Flag .. "_InputBegan",
							UserInputService.InputBegan,
							function(input, gpe)
								if gpe or Listening or not Keybind.Key then
									return
								end

								if Keybind:Matches(input) then
									if Keybind.Mode == "Toggle" then
										Keybind:SetState(not Keybind.Active)
									elseif Keybind.Mode == "Callback" then
										Library:DoCallback(Keybind.Callback)
									elseif Keybind.Mode == "Hold" then
										Keybind:SetState(true)
										Keybind.Active = true
									end
								end
							end
						)

						Library:Connection(
							"Keybind_" .. Keybind.Flag .. "_InputEnded",
							UserInputService.InputEnded,
							function(input, gpe)
								if gpe or Listening or not Keybind.Key then
									return
								end

								if Keybind:Matches(input) and Keybind.Mode == "Hold" and Keybind.Active then
									Keybind:SetState(false)
									Keybind.Active = false
								end
							end
						)

						Keybind:Set(Keybind.Default)
						Library.Flags[Keybind.Flag] = Keybind
						return Keybind
					end

					Section.Components = Components
					Category.Sections[Section.Name] = Section
					return Section
				end

				Category.Components = Components

				do
					Library:Connection(
						"PageHandler" .. Category.Name,
						Components["CategoryButton"].MouseButton1Down,
						function()
							Window:SetCategory({
								Name = Tab.Name .. "_" .. Category.Name,
								Pointer = Category,
								Parent = Tab,
							})
						end
					)

					Library:Connection(
						"CategoryMouseEnter" .. Category.Name,
						Components.CategoryButton.MouseEnter,
						function()
							Globals:Tween(
								Components["CategoryStroke"],
								TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
								{
									Color = Library.Theme.AccentedHighlight,
								}
							)
						end
					)

					Library:Connection(
						"CategoryMouseLeave" .. Category.Name,
						Components.CategoryButton.MouseLeave,
						function()
							if Components["CategoryButton"]:GetAttribute("Opened") then
								return
							end
							Globals:Tween(
								Components["CategoryStroke"],
								TweenInfo.new(Library.HighlightSpeed, Enum.EasingStyle.Quad),
								{
									Color = Color3.fromRGB(15, 24, 21),
								}
							)
						end
					)
				end

				table.insert(Tab.CategoryOrder, Category.Name)
				Tab.Categories[Category.Name] = Category
				return Category
			end

			Tab.Components = Components
			Window.Tabs[TabData.Name] = Tab
			return Tab
		end

		function Window:TabSeperator()
			local Components = {}

			Components["TabSeparatorHolder"] = Globals:Instance("Frame", {
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				Name = "TabSeparatorHolder",
				Parent = self.Components["TabsScrollingFrame"],
			})

			Components["TabSeparatorLine"] = Globals:Instance("Frame", {
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = Color3.fromRGB(15, 24, 21),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0.5, 0),
				Size = UDim2.new(1, -7, 1, 0),
				Name = "TabSeparatorLine",
				Parent = Components["TabSeparatorHolder"],
			})

			return Components
		end

		Window.Components = Components
		Library.Window = Window
		return Window
	end

	function Library:Notify(txt, duration, color)
		duration = duration or 3
		color = color or Color3.fromRGB(63, 201, 176)

		local Components = {}
		local Padding = 12
		local IconSize = 25
		local TextPadding = 5
		local LabelFontSize = 14
		local BottomBufferSize = 4

		local TemporaryLabel = Instance.new("TextLabel")
		TemporaryLabel.Size = UDim2.new(1, 0, 1, 0)
		TemporaryLabel.TextSize = LabelFontSize
		TemporaryLabel.Font = Enum.Font.SourceSansBold
		TemporaryLabel.Text = txt
		TemporaryLabel.TextWrapped = true
		TemporaryLabel.Parent = Library.Notifications
		TemporaryLabel.Visible = false

		task.wait()
		local TextBounds = TemporaryLabel.TextBounds
		TemporaryLabel:Destroy()

		local NotificationHeight = math.max(TextBounds.Y + BottomBufferSize, IconSize)
		local NotificationWidth = IconSize + TextBounds.X + TextPadding * 2

		local YPosition = 75
		for _, NotificationData in ipairs(Library.NotificationList) do
			YPosition = YPosition + NotificationData.Height + Padding
		end

		Components["NewNotification"] = Globals:Instance("Frame", {
			BackgroundColor3 = Color3.fromRGB(7, 10, 9),
			BorderSizePixel = 0,
			Position = UDim2.new(0, -NotificationWidth - 20, 0, YPosition),
			Size = UDim2.new(0, NotificationWidth, 0, NotificationHeight),
			Name = "NewNotification",
			Parent = Library.Notifications,
		})

		Globals:Instance("UICorner", {
			CornerRadius = UDim.new(0, 0),
			Parent = Components["NewNotification"],
		})

		Globals:Instance("ImageLabel", {
			Image = Library.ShadowImage,
			ImageColor3 = color,
			ImageTransparency = 0.7,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(49, 49, 450, 450),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, 30, 1, 30),
			ZIndex = 0,
			Parent = Components["NewNotification"],
		})

		Globals:Instance("UIStroke", {
			Color = Color3.fromRGB(15, 24, 21),
			Parent = Components["NewNotification"],
		})

		Globals:Instance("TextLabel", {
			Font = Enum.Font.SourceSansBold,
			Text = txt,
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = LabelFontSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, IconSize + TextPadding, 0, 0),
			Size = UDim2.new(1, -IconSize - TextPadding * 2, 1, 0),
			TextWrapped = true,
			Parent = Components["NewNotification"],
		})

		Globals:Instance("ImageLabel", {
			Image = Library.LogoImage,
			ImageColor3 = color,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, IconSize, 0, IconSize),
			Position = UDim2.new(0, 0, 0.5, -IconSize / 2),
			Parent = Components["NewNotification"],
		})

		table.insert(Library.NotificationList, {
			Frame = Components["NewNotification"],
			Height = NotificationHeight,
		})

		Globals:Tween(
			Components["NewNotification"],
			TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{
				Position = UDim2.new(0, 10, 0, YPosition),
			}
		)

		local CurrentY = 75
		for _, NotificationData in ipairs(Library.NotificationList) do
			Globals:Tween(
				NotificationData.Frame,
				TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{
					Position = UDim2.new(0, 10, 0, CurrentY),
				}
			)
			CurrentY = CurrentY + NotificationData.Height + Padding
		end

		task.delay(duration, function()
			for _, child in pairs(Components["NewNotification"]:GetChildren()) do
				if child:IsA("TextLabel") then
					Globals:Tween(
						child,
						TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
						{ TextTransparency = 1 }
					)
				elseif child:IsA("ImageLabel") then
					Globals:Tween(
						child,
						TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
						{ ImageTransparency = 1 }
					)
				elseif child:IsA("UIStroke") then
					Globals:Tween(
						child,
						TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
						{ Transparency = 1 }
					)
				end
			end

			task.wait(0.2)
			local IterationToRemove
			for i, NotificationData in ipairs(Library.NotificationList) do
				if NotificationData.Frame == Components["NewNotification"] then
					IterationToRemove = i
					break
				end
			end

			if IterationToRemove then
				Library.NotificationList[IterationToRemove].Frame:Destroy()
				table.remove(Library.NotificationList, IterationToRemove)
			end

			CurrentY = 75
			for _, NotificationData in ipairs(Library.NotificationList) do
				Globals:Tween(
					NotificationData.Frame,
					TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{
						Position = UDim2.new(0, 10, 0, CurrentY),
					}
				)
				CurrentY = CurrentY + NotificationData.Height + Padding
			end
		end)
	end

end


Threads.__index = Threads

Threads.Run = (function(self)  
	local Success, Error = pcall(self.Function)
	if not Success and Error then
		Library:Notify("Error occured. " .. tostring(Error), 1, Color3.fromRGB(255, 0, 0))
	end
end)

Threads.New = (function(Name, Function, Priority)  
	local Thread = setmetatable({
		Name = Name,
		Function = Function,
		Priority = Priority,
	}, Threads)

	if not Priority then
		Priority = "Render"
	end
	Thread.Priority = Priority

	local Index = #Threads[Priority] + 1
	Threads[Priority][Index] = Thread
	return Threads[Priority][Index]
end)

Math.RoundToIncrement = (function(value, increment)  
	return math.round(value / increment) * increment
end)

Math.FloorVector = (function(Vector)  
	if typeof(Vector) == "Vector2" then
		return Vector2.new(math.floor(Vector.X), math.floor(Vector.Y))
	else
		return Vector3.new(math.floor(Vector.X), math.floor(Vector.Y), math.floor(Vector.Z))
	end
end)
