local function applyLang(code)
	LANG = code; T = I18N[code]
	fwrite(LANG_FILE, code)
	for c, b in pairs(langBtns) do
		b.BackgroundTransparency = (c == code) and 0 or 1
		b.TextColor3 = (c == code) and C.panel or C.grey
	end
	desc.Text = T.desc; hint.Text = T.hint; selText.Text = T.select
	for i, g in ipairs(GAMES) do if not g.ready then pcall(function() gameTags[i].Text = T.indev end) end end
	timeHead.Text = T.time; userHead.Text = T.user; keyBox.PlaceholderText = T.ph
	if not state.busy then chkBtn.Text = T.check end
	statusHead.Text = T.status; if statePill.Visible then statePillText.Text = (state.auth and T.pillok or T.pillbad) end; expCap.Text = T.expires; resCap.Text = T.reseller; backBtn.Text = "←  " .. T.back
	timerCaps[1].Text = T.days; timerCaps[2].Text = T.hours; timerCaps[3].Text = T.mins
	if state.auth then
		renderStatus("ok", T.active, nil)
		setLaunch(state.busy and "busy" or "on")
	elseif state.accepted then
		renderStatus("wait", T.accepted, T.waitauth)
		setLaunch("off")
	elseif state.badMsg then
		renderStatus("bad", T.invalid, state.badMsg)
		setLaunch("off")
	else
		renderStatus("none", T.nolic, T.enterkey)
		setLaunch("off")
	end
	tickClock()
end
for code, b in pairs(langBtns) do b.MouseButton1Click:Connect(function() applyLang(code) end) end

showScreen = function(n)
	state.screen = n
	s1.Visible = n == 1
	s2.Visible = n == 2
	if n == 2 then setLaunch("off"); task.defer(function() pcall(function() keyBox:CaptureFocus() end) end) end
end

local function closeGui()
	if state.closed then return end
	state.closed = true
	tween(panel, { BackgroundTransparency = 1 }, 0.25)
	for _, d in ipairs(panel:GetDescendants()) do
		pcall(function()
			if d:IsA("TextLabel") or d:IsA("TextButton") or d:IsA("TextBox") then tween(d, { TextTransparency = 1, BackgroundTransparency = 1 }, 0.25)
			elseif d:IsA("Frame") then tween(d, { BackgroundTransparency = 1 }, 0.25)
			elseif d:IsA("ImageLabel") then tween(d, { ImageTransparency = 1 }, 0.25)
			elseif d:IsA("UIStroke") then tween(d, { Transparency = 1 }, 0.25) end
		end)
	end
	task.delay(0.35, function() pcall(function() holder.Visible = false end) end)
	task.delay(4.5, function() pcall(function() gui:Destroy() end) end)
end
closeBtn.MouseEnter:Connect(function() iconColor(closeIcon, C.white) end)
closeBtn.MouseLeave:Connect(function() iconColor(closeIcon, C.grey) end)
closeBtn.MouseButton1Click:Connect(function()
	if not state.accepted then getgenv().UI_CLOSED = true end
	closeGui()
end)
dcBtn.MouseButton1Click:Connect(function()
	local ok = pcall(function() (setclipboard or toclipboard)(DISCORD_INVITE) end)
	notify(ok and T.tdc or DISCORD_INVITE, false)
end)
backBtn.MouseButton1Click:Connect(function() if not state.accepted then showScreen(1) end end)

local Junkie = nil
local function sdk()
	if Junkie ~= nil then return Junkie end
	if JNKIE_SERVICE == "" or JNKIE_IDENTIFIER == "" then Junkie = false return false end
	local ok, lib = pcall(function() return loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))() end)
	if ok and type(lib) == "table" and type(lib.check_key) == "function" then
		lib.service = JNKIE_SERVICE
		lib.identifier = JNKIE_IDENTIFIER
		Junkie = lib
	else
		Junkie = false
	end
	return Junkie
end

local function errText(code)
	code = tostring(code or "")
	return T["e_" .. code] or (T.invalid .. (code ~= "" and (" (" .. code .. ")") or ""))
end

local function acceptKey(key)
	state.key = key
	state.accepted = true
	state.badMsg = nil
	fwrite(KEY_FILE, key)
	keyStroke.Color = C.accent
	renderStatus("wait", T.accepted, T.waitauth)
	setLaunch("off")
	getgenv().AQUA_GAME = selectedGame and selectedGame.id or "hvh"
	getgenv().SCRIPT_KEY = key

	task.delay(15, function()
		if not state.auth and not state.closed then
			state.accepted = false
			state.badMsg = T.trej
			keyStroke.Color = C.red
			renderStatus("bad", T.invalid, T.trej)
			notify(T.trej, true)
		end
	end)
end

local function rejectKey(msg)
	state.accepted = false
	state.badMsg = msg
	keyStroke.Color = C.red
	renderStatus("bad", T.invalid, msg)
	setLaunch("off")
	notify(msg, true)
end

local function checkKey()
	if state.busy or state.accepted then return end
	local key = (keyBox.Text or ""):gsub("^%s+", ""):gsub("%s+$", "")
	if key == "" then notify(T.tkey, true) return end
	state.busy = true
	chkBtn.Text = T.checking
	keyStroke.Color = C.border
	task.spawn(function()
		local lib = sdk()
		if lib then
			local ok, res = pcall(lib.check_key, key)
			state.busy = false
			chkBtn.Text = T.check
			if not ok or type(res) ~= "table" then
				notify(T.tnet, true)
				keyStroke.Color = C.border
				return
			end
			if res.valid then acceptKey(key) else rejectKey(errText(res.error)) end
		else
			state.busy = false
			chkBtn.Text = T.check
			acceptKey(key)
		end
	end)
end
chkBtn.MouseButton1Click:Connect(checkKey)
keyBox.FocusLost:Connect(function(enter) if enter then checkKey() end end)
keyBox.Focused:Connect(function() if not state.accepted then keyStroke.Color = C.accent end end)

local launchCb = nil
launchBtn.MouseButton1Click:Connect(function()
	if state.busy or not state.auth or not launchCb then return end
	state.busy = true
	setLaunch("busy", T.loading)
	task.spawn(function()
		local ok = pcall(launchCb)
		if not ok then
			state.busy = false
			setLaunch("fail", T.failed)
		end
	end)
end)

getgenv().BURMALDA_LOADER = {

	license = function(expiresAt, reason, userName)
		state.auth = true
		state.lifetime = (expiresAt == nil)
		state.expires = expiresAt
		if type(userName) == "string" and userName ~= "" then userL.Text = userName end
		keyStroke.Color = C.accent
		renderStatus("ok", T.active, nil)
		tickClock()
		setLaunch("on")
		local lifeText = state.lifetime and T.life or human(math.max(0, (expiresAt or 0) - os.time()))
		notify(T.active .. " - " .. T.left .. lifeText, false)
	end,
	onLaunch = function(cb) launchCb = cb end,
	progress = function(step)
		if step == "launched" then
			state.busy = false
			setLaunch("on", T.launched)
			notify((selectedGame and selectedGame.name or "script") .. T.tload, false)
			task.delay(0.9, closeGui)
		elseif step == "failed" then
			state.busy = false
			setLaunch("fail", T.failed)
		else
			setLaunch("busy", T[step] or step)
		end
	end,
	fail = function(msg)
		state.busy = false
		setLaunch("fail", T.failed)
		if msg then notify(tostring(msg), true) end
	end,
	notify = notify,
	close = closeGui,
	game = function() return selectedGame and selectedGame.id or "hvh" end,
}

applyLang(LANG)
showScreen(1)
task.spawn(function()
	while not state.closed and gui.Parent do
		pcall(tickClock)
		task.wait(1)
	end
end)

repeat task.wait(0.1) until getgenv().SCRIPT_KEY or getgenv().UI_CLOSED or state.closed
if not getgenv().SCRIPT_KEY then
	getgenv().UI_CLOSED = true
	return
end
