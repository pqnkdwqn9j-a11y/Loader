local C = {
	panel = Color3.fromRGB(11, 11, 13), side = Color3.fromRGB(16, 16, 19), card = Color3.fromRGB(14, 14, 17),
	border = Color3.fromRGB(30, 30, 35), accent = Color3.fromRGB(47, 155, 255), accent2 = Color3.fromRGB(25, 120, 220),
	white = Color3.fromRGB(255, 255, 255), grey = Color3.fromRGB(150, 150, 156), dim = Color3.fromRGB(82, 82, 90),
	green = Color3.fromRGB(63, 191, 127), red = Color3.fromRGB(224, 108, 108), dark = Color3.fromRGB(24, 24, 29), black = Color3.fromRGB(0, 0, 0),
}
local FONT, FONT_M, FONT_B = Enum.Font.Gotham, Enum.Font.GothamMedium, Enum.Font.GothamBold
pcall(function() FONT = Enum.Font.Montserrat; FONT_M = Enum.Font.MontserratMedium; FONT_B = Enum.Font.MontserratSemiBold end)

local function new(class, props, parent)
	local o = Instance.new(class)
	for k, v in pairs(props) do
		if k ~= "Parent" then pcall(function() o[k] = v end) end
	end
	if parent then o.Parent = parent end
	return o
end
local function corner(o, r) return new("UICorner", { CornerRadius = UDim.new(0, r or 5) }, o) end
local function stroke(o, col, th, tr) return new("UIStroke", { Color = col or C.border, Thickness = th or 1, Transparency = tr or 0, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, o) end
local function label(parent, text, size, col, font, props)
	local l = new("TextLabel", {
		BackgroundTransparency = 1, Text = text, TextSize = size, TextColor3 = col or C.white,
		Font = font or FONT, TextXAlignment = Enum.TextXAlignment.Left, Size = UDim2.new(1, 0, 0, size + 6),
	}, parent)
	if props then for k, v in pairs(props) do pcall(function() l[k] = v end) end end
	return l
end
local function tween(o, props, t)
	pcall(function() TS:Create(o, TweenInfo.new(t or 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props):Play() end)
end
local function hgrad(o, c1, c2, rot)
	return new("UIGradient", { Color = ColorSequence.new(c1, c2), Rotation = rot or 0 }, o)
end

local function b64decode(s)
	local native = (crypt and (crypt.base64decode or (crypt.base64 and crypt.base64.decode))) or base64_decode or (base64 and base64.decode)
	if native then
		local ok, r = pcall(native, s)
		if ok and type(r) == "string" and #r > 0 then return r end
	end
	local map = {}
	local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	for i = 1, 64 do map[chars:byte(i)] = i - 1 end
	local out, n, bits, acc = {}, 0, 0, 0
	local sub, byteAt = string.char, string.byte
	for i = 1, #s do
		local v = map[byteAt(s, i)]
		if v then
			acc = acc * 64 + v
			bits = bits + 6
			if bits >= 8 then
				bits = bits - 8
				local byte = math.floor(acc / (2 ^ bits))
				acc = acc - byte * (2 ^ bits)
				n = n + 1
				out[n] = sub(byte)
			end
		end
	end
	return table.concat(out)
end

local function customAsset(file, b64)
	if not (writefile and getcustomasset) then return nil end
	local ok, asset = pcall(function()
		if not (isfile and isfile(file)) then
			local data = nil
			if b64 and #b64 > 100 then
				data = b64decode(b64)
			else
				data = game:HttpGet(ASSET_BASE .. file)
			end
			if not (type(data) == "string" and #data > 500) then return nil end
			writefile(file, data)
		end
		return getcustomasset(file)
	end)
	if ok and type(asset) == "string" then return asset end
	return nil
end
local ICONS = customAsset(ICONS_FILE, ICONS_B64)
local ICON_INDEX = { clock = 0, user = 1, shield = 2, calendar = 3, cart = 4, discord = 5, arrow = 6, close = 7, crown = 8, key = 9, globe = 10, check = 11 }
local ICON_GLYPH = { clock = "◷", user = "●", shield = "⛨", calendar = "▦", cart = "▣", discord = "●", arrow = "➜", close = "✕", crown = "♛", key = "⚿", globe = "◎", check = "✓" }
local function icon(parent, name, size, col, pos, props)
	local o
	if ICONS then
		local i = ICON_INDEX[name] or 0
		o = new("ImageLabel", {
			BackgroundTransparency = 1, Image = ICONS, ImageColor3 = col or C.white, Size = UDim2.new(0, size, 0, size), Position = pos,
			ImageRectSize = Vector2.new(64, 64), ImageRectOffset = Vector2.new((i % 6) * 64, math.floor(i / 6) * 64), ScaleType = Enum.ScaleType.Fit,
		}, parent)
	else
		o = new("TextLabel", { BackgroundTransparency = 1, Text = ICON_GLYPH[name] or "", TextSize = size, TextColor3 = col or C.white, Font = FONT_B, Size = UDim2.new(0, size, 0, size), Position = pos }, parent)
	end
	if props then for k, v in pairs(props) do pcall(function() o[k] = v end) end end
	return o
end
local function iconColor(o, col)
	pcall(function() if o:IsA("ImageLabel") then o.ImageColor3 = col else o.TextColor3 = col end end)
end

local parent = game:GetService("CoreGui")
pcall(function() if gethui then parent = gethui() end end)
local gui = new("ScreenGui", {
	Name = HttpService:GenerateGUID(false):sub(1, 10), ResetOnSpawn = false, IgnoreGuiInset = true,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 9999,
})
pcall(function() if syn and syn.protect_gui then syn.protect_gui(gui) end end)
gui.Parent = parent

local W, H = 754, 525
local holder = new("Frame", { Size = UDim2.new(0, W, 0, H), Position = UDim2.new(0.5, 0, 0.5, 0), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1 }, gui)
local scale = new("UIScale", { Scale = 1 }, holder)
local function fit()
	local cam = workspace.CurrentCamera
	if not cam then return end
	local v = cam.ViewportSize
	scale.Scale = math.clamp(math.min((v.X - 40) / W, (v.Y - 60) / H, 1), 0.45, 1)
end
fit()
pcall(function() workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fit) end)

for i = 1, 4 do
	local s = new("Frame", { Size = UDim2.new(1, i * 10, 1, i * 10), Position = UDim2.new(0.5, 0, 0.5, 4 + i * 2), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C.black, BackgroundTransparency = 0.78 + i * 0.05, BorderSizePixel = 0, ZIndex = 0 }, holder)
	corner(s, 10 + i * 3)
end

local panel = new("Frame", { Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = C.white, BorderSizePixel = 0, ClipsDescendants = true }, holder)
corner(panel, 8)
hgrad(panel, Color3.fromRGB(16, 16, 19), Color3.fromRGB(9, 9, 11), 60)
stroke(panel, Color3.fromRGB(34, 34, 40), 1)

do
	local dragging, startPos, startMouse = false, nil, nil
	panel.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 and i.Position.Y - holder.AbsolutePosition.Y < 90 * scale.Scale then
			dragging, startMouse, startPos = true, i.Position, holder.Position
		end
	end)
	UIS.InputChanged:Connect(function(i)
		if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
			local d = i.Position - startMouse
			holder.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
		end
	end)
	UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
end

local side = new("Frame", { Size = UDim2.new(0, 71, 1, 0), BackgroundColor3 = C.side, BorderSizePixel = 0 }, panel)
new("Frame", { Size = UDim2.new(0, 1, 1, 0), Position = UDim2.new(1, -1, 0, 0), BackgroundColor3 = Color3.fromRGB(28, 28, 33), BorderSizePixel = 0 }, side)
icon(side, "crown", 30, C.accent, UDim2.new(0.5, -15, 0, 24))
local dcBtn = new("TextButton", { Size = UDim2.new(0, 28, 0, 28), Position = UDim2.new(0.5, -14, 1, -46), BackgroundTransparency = 1, Text = "", AutoButtonColor = false }, side)
local dcIcon = icon(dcBtn, "discord", 20, C.accent, UDim2.new(0.5, -10, 0.5, -10))

local page = new("Frame", { Size = UDim2.new(1, -71, 1, 0), Position = UDim2.new(0, 71, 0, 0), BackgroundTransparency = 1 }, panel)
local title = label(page, "Burmalda.hook - Loader", 19, C.white, FONT_B, { Position = UDim2.new(0, 30, 0, 20), Size = UDim2.new(0, 400, 0, 26) })
local desc = label(page, T.desc, 12, C.grey, FONT, { Position = UDim2.new(0, 30, 0, 48), Size = UDim2.new(0, 400, 0, 36), TextYAlignment = Enum.TextYAlignment.Top })

local closeBtn = new("TextButton", { Size = UDim2.new(0, 28, 0, 28), Position = UDim2.new(1, -44, 0, 14), BackgroundTransparency = 1, Text = "", AutoButtonColor = false }, page)
local closeIcon = icon(closeBtn, "close", 14, C.grey, UDim2.new(0.5, -7, 0.5, -7))
local langBox = new("Frame", { Size = UDim2.new(0, 92, 0, 24), Position = UDim2.new(1, -44 - 12 - 92, 0, 16), BackgroundColor3 = C.card }, page)
corner(langBox, 6); stroke(langBox)
icon(langBox, "globe", 12, C.grey, UDim2.new(0, 7, 0.5, -6))
local verPill = new("Frame", { Size = UDim2.new(0, 48, 0, 24), Position = UDim2.new(1, -44 - 12 - 92 - 8 - 48, 0, 16), BackgroundColor3 = C.card }, page)
corner(verPill, 6); stroke(verPill)
label(verPill, "v" .. LOADER_VERSION, 10, C.grey, FONT_M, { Size = UDim2.new(1, 0, 1, 0), TextXAlignment = Enum.TextXAlignment.Center })
local langBtns = {}
for i, code in ipairs({ "en", "ru" }) do
	local b = new("TextButton", { Size = UDim2.new(0, 32, 0, 18), Position = UDim2.new(0, 24 + (i - 1) * 33, 0.5, -9), BackgroundColor3 = C.accent, BackgroundTransparency = 1, Text = code:upper(), TextSize = 10, Font = FONT_B, TextColor3 = C.grey, AutoButtonColor = false }, langBox)
	corner(b, 4)
	langBtns[code] = b
end
