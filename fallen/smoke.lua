local G = {}
getgenv = function() return G end
G.PHOOKGATE = 1347571535
local lp = { Kick = function(_, m) print("KICK", m) end }
local svc = { LocalPlayer = lp }
game = setmetatable({ PlaceId = 112819027197869, IsLoaded = function() return true end,
	GetService = function() return svc end }, {})
workspace = {}
local f = loadstring(FILE_SRC)
local ok, err = pcall(f)
print("ok=", ok, err)
print("ERR=", G.BURMALDA_ERROR)
