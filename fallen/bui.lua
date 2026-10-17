local BUI = {}
local function svc(n) local s = game:GetService(n) return (cloneref and cloneref(s)) or s end
local UIS = svc("UserInputService")
local RS = svc("RunService")
local TS = svc("TweenService")
local Stats = svc("Stats")
local Camera = workspace.CurrentCamera
local GuiParent = (function()
	local ok, h = pcall(function() return gethui and gethui() end)
	if ok and typeof(h) == "Instance" then return h end
	return svc("CoreGui")
end)()
local rgb = Color3.fromRGB
local C = {
	ac = rgb(47, 155, 255), ac2 = rgb(25, 120, 220), bg = rgb(11, 11, 14), bg2 = rgb(16, 16, 22), nav = rgb(13, 13, 18),
	card = rgb(19, 19, 26), line = rgb(31, 31, 40), txt = rgb(232, 232, 236), mut = rgb(139, 139, 150), dim = rgb(79, 79, 92),
	red = rgb(224, 108, 108), grn = rgb(63, 191, 127), sw = rgb(32, 32, 42), swb = rgb(42, 42, 54), kb = rgb(23, 23, 31), row = rgb(24, 24, 32),
}
local FONT, FONTB = Enum.Font.GothamMedium, Enum.Font.GothamBold
local VERSION = "v1.0 beta"
local function new(class, props, parent)
	local o = Instance.new(class)
	for k, v in props do o[k] = v end
	if parent then o.Parent = parent end
	return o
end
local function tw(o, t, props, style)
	local tween = TS:Create(o, TweenInfo.new(t, style or Enum.EasingStyle.Quint, Enum.EasingDirection.Out), props)
	tween:Play()
	return tween
end
local function corner(o, r) return new("UICorner", {CornerRadius = UDim.new(0, r or 8)}, o) end
local function stroke(o, col, t) return new("UIStroke", {Color = col or C.line, Thickness = t or 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}, o) end
local function pad(o, t, r, b, l) return new("UIPadding", {PaddingTop = UDim.new(0, t), PaddingRight = UDim.new(0, r or t), PaddingBottom = UDim.new(0, b or t), PaddingLeft = UDim.new(0, l or r or t)}, o) end
local function list(o, gap, dir) return new("UIListLayout", {Padding = UDim.new(0, gap or 4), FillDirection = dir or Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder}, o) end
local function frame(props, parent)
	local p = {BackgroundColor3 = C.card, BorderSizePixel = 0}
	for k, v in props do p[k] = v end
	return new("Frame", p, parent)
end
local function label(props, parent)
	local p = {BackgroundTransparency = 1, Font = FONT, TextSize = 12, TextColor3 = C.txt, TextXAlignment = Enum.TextXAlignment.Left, BorderSizePixel = 0}
	for k, v in props do p[k] = v end
	return new("TextLabel", p, parent)
end
local function button(props, parent)
	local p = {BackgroundColor3 = C.kb, BorderSizePixel = 0, Font = FONTB, TextSize = 11, TextColor3 = C.mut, AutoButtonColor = false, Text = ""}
	for k, v in props do p[k] = v end
	return new("TextButton", p, parent)
end
local function mkflag(kind, value, elem)
	local f = {type = kind, value = value, key = nil, self = elem, funcs = {}, kfuncs = {}}
	f.Changed = function(...) for _, fn in f.funcs do pcall(fn, ...) end end
	f.KeyChanged = function(...) for _, fn in f.kfuncs do pcall(fn, ...) end end
	f.OnChanged = function(_, fn) table.insert(f.funcs, fn) pcall(fn, f.value) end
	f.OnKeyChanged = function(_, fn) table.insert(f.kfuncs, fn) pcall(fn, f.key) end
	return f
end
local KEYNAMES = {MouseButton1 = "MB1", MouseButton2 = "MB2", MouseButton3 = "MB3", LeftShift = "LShift", RightShift = "RShift", LeftControl = "LCtrl", RightControl = "RCtrl", LeftAlt = "LAlt", RightAlt = "RAlt", Return = "Enter", Escape = "Esc", Delete = "Del", CapsLock = "Caps", Backspace = "Back"}
local function keyOf(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then return input.KeyCode.Name end
	return input.UserInputType.Name
end
local function shortKey(name) return KEYNAMES[name] or name end
local function matches(input, name)
	if not name or name == "None" then return false end
	if input.UserInputType == Enum.UserInputType.Keyboard then return input.KeyCode.Name == name end
	return input.UserInputType.Name == name
end
local TABS = {
	combat = {"Combat", "silent aim, weapon mods", {"Silent aim", "Weapon"}},
	visuals = {"Players ESP", "players and npc", {"Player ESP", "NPC ESP"}},
	entity = {"World", "loot, nodes, vehicles", {"Entity ESP", "World"}},
	["local"] = {"Local", "movement, misc", {"Movement", "Misc"}},
	ui = {"Settings", "configs, hud", {"Configs", "HUD"}},
}
local Window = {}
Window.__index = Window
local Tab = {}
Tab.__index = Tab
local Toggle = {}
Toggle.__index = Toggle
local function randName()
	local s = ""
	for i = 1, 10 do s = s .. string.char(math.random(97, 122)) end
	return s
end
