local toast = new("Frame", { Size = UDim2.new(0, 340, 0, 48), Position = UDim2.new(1, -24, 1, -60), AnchorPoint = Vector2.new(1, 1), BackgroundColor3 = C.card, BackgroundTransparency = 1, Visible = false }, gui)
corner(toast, 6); stroke(toast)
local toastBar = new("Frame", { Size = UDim2.new(0, 3, 1, -12), Position = UDim2.new(0, 0, 0, 6), BackgroundColor3 = C.accent, BorderSizePixel = 0 }, toast)
corner(toastBar, 2)
local toastIcon = icon(toast, "crown", 18, C.accent, UDim2.new(0, 14, 0.5, -9))
local toastText = label(toast, "", 12, C.white, FONT_M, { Position = UDim2.new(0, 42, 0, 0), Size = UDim2.new(1, -52, 1, 0), TextWrapped = true })
local toastTick = 0
local function notify(text, isErr)
	toastTick = toastTick + 1
	local my = toastTick
	toastText.Text = text
	local col = isErr and C.red or C.accent
	toastBar.BackgroundColor3 = col; iconColor(toastIcon, col)
	toast.Visible = true
	toast.BackgroundTransparency = 1; toastText.TextTransparency = 1
	tween(toast, { BackgroundTransparency = 0 }, 0.2); tween(toastText, { TextTransparency = 0 }, 0.2)
	task.delay(3.5, function()
		if toastTick ~= my then return end
		tween(toast, { BackgroundTransparency = 1 }, 0.25); tween(toastText, { TextTransparency = 1 }, 0.25)
		task.delay(0.3, function() if toastTick == my then toast.Visible = false end end)
	end)
end

local s1 = new("Frame", { Size = UDim2.new(1, -30, 1, -100), Position = UDim2.new(0, 30, 0, 100), BackgroundTransparency = 1 }, page)
local sel = new("Frame", { Size = UDim2.new(0, 320, 0, 200), Position = UDim2.new(0.5, -160, 0.5, -110), BackgroundTransparency = 1 }, s1)
icon(sel, "crown", 34, C.accent, UDim2.new(0.5, -17, 0, 0))
local hint = label(sel, T.hint, 12, C.grey, FONT, { Position = UDim2.new(0, 0, 0, 44), Size = UDim2.new(1, 0, 0, 18), TextXAlignment = Enum.TextXAlignment.Center })
local selBtn = new("TextButton", { Size = UDim2.new(1, 0, 0, 44), Position = UDim2.new(0, 0, 0, 74), BackgroundColor3 = C.card, Text = "", AutoButtonColor = false }, sel)
corner(selBtn, 6); local selStroke = stroke(selBtn)
local selText = label(selBtn, T.select, 13, C.white, FONT_M, { Position = UDim2.new(0, 16, 0, 0), Size = UDim2.new(1, -50, 1, 0) })
local selArrow = label(selBtn, "▾", 14, C.accent, FONT_B, { Position = UDim2.new(1, -30, 0, 0), Size = UDim2.new(0, 16, 1, 0), TextXAlignment = Enum.TextXAlignment.Center })
local list = new("Frame", { Size = UDim2.new(1, 0, 0, #GAMES * 48 + 2), Position = UDim2.new(0, 0, 0, 124), BackgroundColor3 = C.card, Visible = false, ClipsDescendants = true }, sel)
corner(list, 6); stroke(list)
local listOpen = false
local function setList(open)
	listOpen = open
	list.Visible = open
	selArrow.Text = open and "▴" or "▾"
	selStroke.Color = open and C.accent or C.border
end
selBtn.MouseButton1Click:Connect(function() setList(not listOpen) end)
selBtn.MouseEnter:Connect(function() selStroke.Color = C.accent end)
selBtn.MouseLeave:Connect(function() if not listOpen then selStroke.Color = C.border end end)

local selectedGame = nil
local showScreen
local gameTags = {}
for i, g in ipairs(GAMES) do
	local item = new("TextButton", { Size = UDim2.new(1, -2, 0, 48), Position = UDim2.new(0, 1, 0, 1 + (i - 1) * 48), BackgroundColor3 = Color3.fromRGB(22, 22, 27), BackgroundTransparency = 1, Text = "", AutoButtonColor = false }, list)
	corner(item, 5)
	local ib = new("Frame", { Size = UDim2.new(0, 28, 0, 28), Position = UDim2.new(0, 12, 0.5, -14), BackgroundColor3 = g.ready and Color3.fromRGB(22, 44, 70) or C.dark }, item)
	corner(ib, 6)
	icon(ib, "crown", 16, g.ready and C.accent or C.dim, UDim2.new(0.5, -8, 0.5, -8))
	label(item, g.name, 13, g.ready and C.white or C.dim, FONT_M, { Position = UDim2.new(0, 52, 0, 0), Size = UDim2.new(1, -170, 1, 0) })
	local tag
	if g.ready then
		tag = icon(item, "arrow", 14, C.accent, UDim2.new(1, -30, 0.5, -7))
	else
		local pill = new("Frame", { Size = UDim2.new(0, 104, 0, 20), Position = UDim2.new(1, -116, 0.5, -10), BackgroundColor3 = C.dark }, item)
		corner(pill, 10)
		tag = label(pill, T.indev, 10, C.dim, FONT_M, { Size = UDim2.new(1, 0, 1, 0), TextXAlignment = Enum.TextXAlignment.Center })
	end
	gameTags[i] = tag
	item.MouseEnter:Connect(function() if g.ready then item.BackgroundTransparency = 0 end end)
	item.MouseLeave:Connect(function() item.BackgroundTransparency = 1 end)
	item.MouseButton1Click:Connect(function()
		if not g.ready then
			tag.TextColor3 = C.red
			notify(T.tdev, true)
			task.delay(2.5, function() tag.TextColor3 = C.dim end)
			return
		end
		selectedGame = g
		setList(false)
		showScreen(2)
	end)
end
if #GAMES > 0 then
	local sep = new("Frame", { Size = UDim2.new(1, -24, 0, 1), Position = UDim2.new(0, 12, 0, 48), BackgroundColor3 = C.border, BorderSizePixel = 0 }, list)
	sep.Visible = #GAMES > 1
end

local s2 = new("Frame", { Size = UDim2.new(1, -30, 1, -134), Position = UDim2.new(0, 30, 0, 112), BackgroundTransparency = 1, Visible = false }, page)
local col = new("Frame", { Size = UDim2.new(0, 272, 1, 0), BackgroundTransparency = 1 }, s2)

local function card(x, w, h, y)
	local f = new("Frame", { Size = UDim2.new(0, w, 0, h), Position = UDim2.new(0, x, 0, y or 0), BackgroundColor3 = C.card }, col)
	corner(f, 6); stroke(f)
	return f
end
local function cardHead(f, iconName, text)
	icon(f, iconName, 14, C.accent, UDim2.new(0, 12, 0, 10))
	return label(f, text, 12, C.grey, FONT, { Position = UDim2.new(0, 32, 0, 8), Size = UDim2.new(1, -40, 0, 18) })
end
local timeCard = card(0, 131, 80)
local timeHead = cardHead(timeCard, "clock", T.time)
local clockL = label(timeCard, "--", 14, C.white, FONT_M, { Position = UDim2.new(0, 12, 0, 32), Size = UDim2.new(1, -20, 0, 18) })
local dateL = label(timeCard, "--", 11, C.grey, FONT, { Position = UDim2.new(0, 12, 0, 52), Size = UDim2.new(1, -20, 0, 16) })
local userCard = card(141, 131, 80)
local userHead = cardHead(userCard, "user", T.user)
local userL = label(userCard, LP.DisplayName or LP.Name, 14, C.white, FONT_M, { Position = UDim2.new(0, 12, 0, 32), Size = UDim2.new(1, -20, 0, 18), TextTruncate = Enum.TextTruncate.AtEnd })

local keyBox = new("TextBox", { Size = UDim2.new(0, 184, 0, 36), Position = UDim2.new(0, 0, 0, 90), BackgroundColor3 = C.card, Text = fread(KEY_FILE) or "", PlaceholderText = T.ph, PlaceholderColor3 = C.dim, TextColor3 = C.white, TextSize = 12, Font = FONT_M, ClearTextOnFocus = false, TextXAlignment = Enum.TextXAlignment.Left }, col)
corner(keyBox, 6); local keyStroke = stroke(keyBox)
new("UIPadding", { PaddingLeft = UDim.new(0, 32), PaddingRight = UDim.new(0, 10) }, keyBox)
icon(col, "key", 14, C.dim, UDim2.new(0, 11, 0, 101))
local chkBtn = new("TextButton", { Size = UDim2.new(0, 80, 0, 36), Position = UDim2.new(0, 192, 0, 90), BackgroundColor3 = C.accent, BackgroundTransparency = 1, Text = T.check, TextSize = 11, Font = FONT_B, TextColor3 = C.accent, AutoButtonColor = false }, col)
corner(chkBtn, 6); stroke(chkBtn, C.accent)
chkBtn.MouseEnter:Connect(function() chkBtn.BackgroundTransparency = 0; chkBtn.TextColor3 = C.panel end)
chkBtn.MouseLeave:Connect(function() chkBtn.BackgroundTransparency = 1; chkBtn.TextColor3 = C.accent end)

local launchBtn = new("TextButton", { Size = UDim2.new(1, 0, 0, 40), Position = UDim2.new(0, 0, 0, 136), BackgroundColor3 = C.white, Text = "", AutoButtonColor = false }, col)
corner(launchBtn, 6)
local launchGrad = hgrad(launchBtn, C.dark, C.dark, 0)
local launchText = label(launchBtn, "", 13, C.dim, FONT_B, { Size = UDim2.new(1, -40, 1, 0), Position = UDim2.new(0, 16, 0, 0), TextXAlignment = Enum.TextXAlignment.Center })
local launchArrow = icon(launchBtn, "arrow", 14, C.dim, UDim2.new(1, -30, 0.5, -7))
local launchGlow = stroke(launchBtn, C.accent, 1, 1)
