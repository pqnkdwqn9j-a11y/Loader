local status = card(0, 272, 206, 186)
local statusHead = label(status, T.status, 12, C.grey, FONT, { Position = UDim2.new(0, 12, 0, 9), Size = UDim2.new(1, -24, 0, 16) })
local statePill = new("Frame", { Size = UDim2.new(0, 70, 0, 18), Position = UDim2.new(1, -82, 0, 8), BackgroundColor3 = C.dark, Visible = false }, status)
corner(statePill, 9)
local statePillText = label(statePill, "", 9, C.white, FONT_B, { Size = UDim2.new(1, 0, 1, 0), TextXAlignment = Enum.TextXAlignment.Center })
local shieldIcon = icon(status, "shield", 18, C.dim, UDim2.new(0, 12, 0, 31))
local licL = label(status, T.nolic, 13, C.white, FONT_M, { Position = UDim2.new(0, 38, 0, 30), Size = UDim2.new(1, -48, 0, 20) })
local subL = label(status, T.enterkey, 11, C.grey, FONT, { Position = UDim2.new(0, 12, 0, 54), Size = UDim2.new(1, -24, 0, 18), TextTruncate = Enum.TextTruncate.AtEnd })
local timerF = new("Frame", { Size = UDim2.new(1, -24, 0, 40), Position = UDim2.new(0, 12, 0, 78), BackgroundTransparency = 1, Visible = false }, status)
local timerNums, timerCaps = {}, {}
for i, cap in ipairs({ "days", "hours", "mins" }) do
	local x = (i - 1) / 3
	timerNums[i] = label(timerF, "0", 20, C.accent, FONT_M, { Position = UDim2.new(x, 0, 0, 0), Size = UDim2.new(1 / 3, 0, 0, 22), TextXAlignment = Enum.TextXAlignment.Center })
	timerCaps[i] = label(timerF, T[cap], 10, C.grey, FONT, { Position = UDim2.new(x, 0, 0, 24), Size = UDim2.new(1 / 3, 0, 0, 14), TextXAlignment = Enum.TextXAlignment.Center })
	if i < 3 then
		local dot = new("Frame", { Size = UDim2.new(0, 5, 0, 5), Position = UDim2.new(x + 1 / 3, -2, 0, 9), BackgroundColor3 = C.accent }, timerF)
		corner(dot, 3)
	end
end
local divider = new("Frame", { Size = UDim2.new(1, -24, 0, 1), Position = UDim2.new(0, 12, 0, 124), BackgroundColor3 = C.border, BorderSizePixel = 0, Visible = false }, status)
local metaF = new("Frame", { Size = UDim2.new(1, -24, 0, 70), Position = UDim2.new(0, 12, 0, 132), BackgroundTransparency = 1, Visible = false }, status)
icon(metaF, "calendar", 12, C.grey, UDim2.new(0, 0, 0, 1))
local expCap = label(metaF, T.expires, 11, C.grey, FONT, { Position = UDim2.new(0, 18, 0, 0), Size = UDim2.new(1, -18, 0, 14) })
local expL = label(metaF, "-", 12, C.white, FONT_M, { Position = UDim2.new(0, 18, 0, 15), Size = UDim2.new(1, -18, 0, 18) })
icon(metaF, "cart", 12, C.grey, UDim2.new(0, 0, 0, 37))
local resCap = label(metaF, T.reseller, 11, C.grey, FONT, { Position = UDim2.new(0, 18, 0, 36), Size = UDim2.new(1, -18, 0, 14) })
label(metaF, "N/A", 12, C.white, FONT_M, { Position = UDim2.new(0, 18, 0, 51), Size = UDim2.new(1, -18, 0, 18) })

local backBtn = new("TextButton", { Size = UDim2.new(0, 160, 0, 16), Position = UDim2.new(0, 0, 1, 4), BackgroundTransparency = 1, Text = "←  " .. T.back, TextSize = 11, Font = FONT_M, TextColor3 = C.grey, TextXAlignment = Enum.TextXAlignment.Left, AutoButtonColor = false }, col)
backBtn.MouseEnter:Connect(function() backBtn.TextColor3 = C.accent end)
backBtn.MouseLeave:Connect(function() backBtn.TextColor3 = C.grey end)

local pic = new("Frame", { Size = UDim2.new(1, -292, 1, 22), Position = UDim2.new(0, 292, 0, 0), BackgroundTransparency = 1, ClipsDescendants = true }, s2)
local glow = new("ImageLabel", { Size = UDim2.new(0, 460, 0, 460), Position = UDim2.new(0.5, 0, 0.55, 0), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, Image = "", ImageColor3 = C.accent, ImageTransparency = 1 }, pic)
local img = new("ImageLabel", { Size = UDim2.new(1, 0, 1, -16), Position = UDim2.new(0, 0, 0, 16), BackgroundTransparency = 1, ScaleType = Enum.ScaleType.Fit, Image = "", ImageTransparency = 1 }, pic)
new("UIGradient", { Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.14, 0), NumberSequenceKeypoint.new(0.86, 0), NumberSequenceKeypoint.new(1, 1) }) }, img)
task.spawn(function()
	local g = customAsset(GLOW_FILE, GLOW_B64)
	if g then glow.Image = g; tween(glow, { ImageTransparency = 0.72 }, 0.6) end
	local asset = customAsset(IMG_FILE, MASCOT_B64)
	if asset then
		img.Image = asset
		tween(img, { ImageTransparency = 0 }, 0.4)
	end
end)

local state = { screen = 1, key = nil, accepted = false, expires = nil, lifetime = false, busy = false, auth = false, closed = false }

local function pad(n) return (n < 10 and "0" or "") .. n end
local function fmtDate(t, withTime)
	local d = os.date("*t", t)
	local s
	if LANG == "ru" then
		s = d.day .. " " .. MONTHS.ru[d.month] .. " " .. d.year
		if withTime then s = s .. ", " .. pad(d.hour) .. ":" .. pad(d.min) end
	else
		s = MONTHS.en[d.month] .. " " .. d.day .. ", " .. d.year
		if withTime then
			local h, ap = d.hour % 12, d.hour >= 12 and "PM" or "AM"
			if h == 0 then h = 12 end
			s = s .. ", " .. pad(h) .. ":" .. pad(d.min) .. " " .. ap
		end
	end
	return s
end
local function human(sec)
	local d, h, m = math.floor(sec / 86400), math.floor(sec % 86400 / 3600), math.floor(sec % 3600 / 60)
	if d > 0 then return d .. T.d .. h .. T.h end
	if h > 0 then return h .. T.h .. m .. T.m end
	return m .. T.m
end

local function setLaunch(mode, text)
	launchText.Text = text or (T.launch .. (selectedGame and selectedGame.name:upper() or ""))
	if mode == "off" then
		launchGrad.Color = ColorSequence.new(C.dark, C.dark); launchText.TextColor3 = C.dim; iconColor(launchArrow, C.dim); launchGlow.Transparency = 1
	elseif mode == "busy" then
		launchGrad.Color = ColorSequence.new(Color3.fromRGB(36, 118, 196), Color3.fromRGB(22, 92, 170)); launchText.TextColor3 = C.panel; iconColor(launchArrow, C.panel); launchGlow.Transparency = 0.7
	elseif mode == "fail" then
		launchGrad.Color = ColorSequence.new(C.red, Color3.fromRGB(180, 70, 70)); launchText.TextColor3 = C.panel; iconColor(launchArrow, C.panel); launchGlow.Transparency = 1
	else
		launchGrad.Color = ColorSequence.new(C.accent, C.accent2); launchText.TextColor3 = C.panel; iconColor(launchArrow, C.panel); launchGlow.Transparency = 0.4
	end
end

local function renderStatus(kind, line1, line2)

	timerF.Visible = kind == "ok"
	metaF.Visible = kind == "ok"
	divider.Visible = kind == "ok"
	statePill.Visible = kind == "ok" or kind == "bad"
	if kind == "ok" then
		iconColor(shieldIcon, C.accent); licL.TextColor3 = C.white; subL.TextColor3 = C.grey
		statePill.BackgroundColor3 = Color3.fromRGB(22, 44, 70); statePillText.TextColor3 = C.accent; statePillText.Text = T.pillok
	elseif kind == "bad" then
		iconColor(shieldIcon, C.red); licL.TextColor3 = C.red; subL.TextColor3 = C.grey
		statePill.BackgroundColor3 = Color3.fromRGB(62, 30, 32); statePillText.TextColor3 = C.red; statePillText.Text = T.pillbad
	elseif kind == "wait" then
		iconColor(shieldIcon, C.accent); licL.TextColor3 = C.white; subL.TextColor3 = C.grey
	else
		iconColor(shieldIcon, C.dim); licL.TextColor3 = C.white; subL.TextColor3 = C.grey
	end
	if line1 then licL.Text = line1 end
	if line2 then subL.Text = line2 end
end

local function tickClock()
	local now = os.time()
	local d = os.date("*t", now)
	if LANG == "ru" then
		clockL.Text = pad(d.hour) .. ":" .. pad(d.min) .. ":" .. pad(d.sec)
	else
		local h, ap = d.hour % 12, d.hour >= 12 and "PM" or "AM"
		if h == 0 then h = 12 end
		clockL.Text = pad(h) .. ":" .. pad(d.min) .. ":" .. pad(d.sec) .. " " .. ap
	end
	dateL.Text = fmtDate(now, false)
	if state.auth then
		if state.lifetime then
			timerNums[1].Text = "∞"; timerNums[2].Text = "∞"; timerNums[3].Text = "∞"
			subL.Text = T.left .. T.life; expL.Text = T.never
		elseif state.expires then
			local left = math.max(0, state.expires - now)
			timerNums[1].Text = tostring(math.floor(left / 86400))
			timerNums[2].Text = tostring(math.floor(left % 86400 / 3600))
			timerNums[3].Text = tostring(math.floor(left % 3600 / 60))
			subL.Text = T.left .. human(left)
			expL.Text = fmtDate(state.expires, true)
			if left <= 0 then renderStatus("bad", T.expired, "") end
		end
	end
end
