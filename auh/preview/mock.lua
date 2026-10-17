-- minimal roblox mock for luau cli
local function signal()
	local s = { _c = {} }
	function s:Connect(f) table.insert(self._c, f) return { Disconnect = function() end } end
	function s:Fire(...) for _, f in ipairs(self._c) do f(...) end end
	return s
end
local function newInst(class)
	local o = { ClassName = class, _children = {}, _sig = {}, Name = class, Text = "", Visible = true,
		AbsolutePosition = { X = 0, Y = 0 }, Position = { X = { Scale = 0, Offset = 0 }, Y = { Scale = 0, Offset = 0 } } }
	local methods = {
		IsA = function(self, c) return self.ClassName == c end,
		FindFirstChildOfClass = function(self, c) for _, ch in ipairs(self._children) do if ch.ClassName == c then return ch end end end,
		GetDescendants = function(self) local r = {} local function rec(x) for _, ch in ipairs(x._children) do table.insert(r, ch) rec(ch) end end rec(self) return r end,
		CaptureFocus = function() end, Destroy = function(self) self.Parent = nil end,
		GetPropertyChangedSignal = function(self, p) self._sig[p] = self._sig[p] or signal() return self._sig[p] end,
	}
	setmetatable(o, {
		__index = function(t, k)
			if methods[k] then return methods[k] end
			if k:match("^[A-Z]") and (k:match("Click$") or k:match("^Input") or k:match("^Focus") or k:match("^Mouse")) then
				rawset(t, k, signal()) return rawget(t, k)
			end
			return nil
		end,
		__newindex = function(t, k, v)
			if k == "Parent" then
				if v and v._children then table.insert(v._children, t) end
			end
			rawset(t, k, v)
		end,
	})
	return o
end
Instance = { new = newInst }
local function enumtbl() return setmetatable({}, { __index = function(t, k) local v = { Name = k } rawset(t, k, v) return v end }) end
Enum = setmetatable({}, { __index = function(t, k) local e = enumtbl() rawset(t, k, e) return e end })
UDim2 = { new = function(a, b, c, d) return { X = { Scale = a, Offset = b }, Y = { Scale = c, Offset = d } } end }
UDim = { new = function(a, b) return { Scale = a, Offset = b } end }
Color3 = { fromRGB = function(r, g, b) return { r, g, b } end }
Vector2 = { new = function(x, y) return { X = x, Y = y } end }
NumberSequence = { new = function(t) return t end }
NumberSequenceKeypoint = { new = function(a, b) return { a, b } end }
TweenInfo = { new = function() return {} end }
ColorSequence = { new = function(a, b) return { _cs = true, a, b } end }
ColorSequenceKeypoint = { new = function(t, c) return { t, c } end }
local services = {}
local function svc(n)
	if services[n] then return services[n] end
	local s = newInst(n)
	if n == "Players" then s.LocalPlayer = { Name = "tester", DisplayName = "Tester" } end
	if n == "HttpService" then s.GenerateGUID = function() return "ABCDEFGHIJKLMNOP" end end
	if n == "TweenService" then s.Create = function() return { Play = function() end } end end
	services[n] = s
	return s
end
game = { GetService = function(_, n) return svc(n) end, PlaceId = 115795182527997, HttpGet = function() return "ok" end }
workspace = { CurrentCamera = newInst("Camera") }
workspace.CurrentCamera.ViewportSize = { X = 1920, Y = 1080 }
local G = {}
getgenv = function() return G end
local files = {}
isfile = function(n) return files[n] ~= nil end
readfile = function(n) return files[n] end
writefile = function(n, d) files[n] = d end
getcustomasset = function(n) return "rbxasset://custom/" .. n end
setclipboard = function() end
gethui = function() return svc("CoreGui") end
local queue = {}
task = {
	spawn = function(f, ...) local co = coroutine.create(f) local ok, e = coroutine.resume(co, ...) if not ok then error(e) end end,
	defer = function(f, ...) table.insert(queue, { f, { ... } }) end,
	delay = function(t, f) table.insert(queue, { f, {} }) end,
	wait = function() coroutine.yield() end,
}
function FLUSH() local q = queue queue = {} for _, it in ipairs(q) do it[1](table.unpack(it[2])) end end

-- serialize gui tree to JSON
local function val(v)
	local t = type(v)
	if t == "table" then
		if v._cs then
			return string.format('{"cs":[%s,%s]}', val(v[1]), val(v[2]))
		elseif v.X and v.Y and type(v.X) == "table" and v.X.Scale ~= nil then
			return string.format('{"xs":%s,"xo":%s,"ys":%s,"yo":%s}', v.X.Scale, v.X.Offset, v.Y.Scale, v.Y.Offset)
		elseif v.Scale ~= nil and v.Offset ~= nil then
			return string.format('{"s":%s,"o":%s}', v.Scale, v.Offset)
		elseif v.X ~= nil and v.Y ~= nil then
			return string.format('{"x":%s,"y":%s}', v.X, v.Y)
		elseif #v == 3 and type(v[1]) == "number" then
			return string.format('[%s,%s,%s]', v[1], v[2], v[3])
		elseif v.Name then
			return string.format('%q', v.Name)
		elseif #v > 0 and type(v[1]) == "table" and #v[1] == 2 then
			local parts = {}
			for _, kp in ipairs(v) do parts[#parts + 1] = string.format('[%s,%s]', kp[1], kp[2]) end
			return '[' .. table.concat(parts, ',') .. ']'
		end
		return 'null'
	elseif t == "string" then
		return (string.format('%q', v):gsub("\\\n", "\\n"))
	elseif t == "number" or t == "boolean" then
		return tostring(v)
	end
	return 'null'
end
local KEYS = { "ClassName", "Name", "Size", "Position", "AnchorPoint", "BackgroundColor3", "BackgroundTransparency", "Text", "TextSize", "TextColor3", "TextXAlignment", "TextYAlignment", "Visible", "ClipsDescendants", "CornerRadius", "Color", "Thickness", "Transparency", "Image", "ImageTransparency", "Scale", "PaddingLeft", "PaddingRight", "Font", "TextTransparency", "PlaceholderText", "PlaceholderColor3", "TextWrapped", "TextTruncate", "ScaleType", "ImageColor3", "ImageRectOffset", "ImageRectSize", "Rotation", "ZIndex" }
function DUMP(o)
	local parts = {}
	for _, k in ipairs(KEYS) do
		local v = rawget(o, k)
		if v ~= nil then
			local s = val(v)
			if s ~= 'null' then parts[#parts + 1] = string.format('"%s":%s', k, s) end
		end
	end
	local ch = {}
	for _, c in ipairs(o._children) do ch[#ch + 1] = DUMP(c) end
	parts[#parts + 1] = '"children":[' .. table.concat(ch, ',') .. ']'
	return '{' .. table.concat(parts, ',') .. '}'
end
