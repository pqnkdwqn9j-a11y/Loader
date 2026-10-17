--[[
	Potato.hook v1.2
	build: fallen / no-ac
]]
local PH_NOTIFY = nil
local PH_MISSING = {}
local PH_UI = {}
local PH_ESP_HEADLESS = true
local Enum2 = Enum
local Workspace = workspace
local Select = select
local GetConnections = getconnections
local Type = type
local Setfflag = setfflag
local GetMetatable = getmetatable
local CFrame2 = CFrame
local GetFenv = getfenv
local CloneFunction = clonefunction
local RaycastParams2 = RaycastParams
local CompareInstances = compareinstances
local AppendFile = appendfile
local Pcall = pcall
local IsFile = isfile
local SetRawMetatable = setrawmetatable
local CheckCaller = checkcaller
local SetReadonly = setreadonly
local Require = require
local Tick = tick
local RawSet = rawset
local ToNumber = tonumber
local Warn = warn
local Task = task
local RawGet = rawget
local Math = math
local GetNamecallMethod = getnamecallmethod
local IsFolder = isfolder
local Next = next
local Drawing2 = Drawing
local ReadFile = readfile
local Request = request
local Game = game
local String = string
local Instance2 = Instance
local _G2 = _G
local Newproxy = newproxy
local CloneRef = cloneref
local Error = error
local NewCClosure = newcclosure
local Assert = assert
local IdentifyExecutor = identifyexecutor
local Rawequal = rawequal
local Unpack = unpack
local Table = table
local TypeOf = typeof
local MakeFolder = makefolder
local Debug = debug
local GetSenv = getsenv
local Os = os
local GetRawMetatable = getrawmetatable
local GetGc = getgc
local SethiddenProperty = sethiddenproperty
local Vector3_2 = Vector3
local LoadFile = loadfile
local HookFunction = hookfunction
local DelFile = delfile
local WriteFile = writefile
local SetFenv = setfenv
local Print = print
local Base64Decode = base64_decode
local Color3_2 = Color3
local Getcallingscript = getcallingscript
local SetMetatable = setmetatable
local Vector2_2 = Vector2
local Rawlen = rawlen
local ToString = tostring
local SetFpsCap = setfpscap
local ListFiles = listfiles
local Split = String
Split = String.split
local V = Table and Table.freeze
local V2 = Table and Table.clone
local V3 = Table and Table.find
local V4 = Table and Table.remove
local Round = Math
Round = Math.round
local V5 = Os and Os.clock
local V6 = Debug and Debug.info
local V7 = Debug and Debug.getupvalues
local V8 = Debug and Debug.getconstants
local Find = String
Find = String.find
local Lower = String
Lower = String.lower
local V9 = Table and Table.clear
local V10 = Table and Table.isfrozen
local V11 = Debug and Debug.getstack
local V12 = Debug and Debug.setstack
local V13 = Debug and Debug.setupvalue
local V14 = Debug and Debug.setconstant
local V15 = Debug and Debug.isvalidlevel
local Clamp = Math
Clamp = Math.clamp
local Abs = Math
Abs = Math.abs
local V16 = Table and Table.insert
local Sub = String
Sub = String.sub
local Max = Math
Max = Math.max
local Ceil = Math
Ceil = Math.ceil
local V17 = Table and Table.sort
local V18 = Table and Table.move
local Min = Math
Min = Math.min
local Format = String
Format = String.format
local Random = Math
Random = Math.random
local V19 = Table and Table.unpack
local Sin = Math
Sin = Math.sin
local Cos = Math
Cos = Math.cos
;(function()
	return true
end)()
if not Game:IsLoaded() then
	Game.Loaded:Wait()
end
local V20 = {
	[2] = (function()
		local V = false
		return {
			kick = function(Arg1)
				Warn("[Potato.hook] internal check failed: " .. tostring(Arg1))
				if PH_NOTIFY then
					Pcall(PH_NOTIFY, "Internal check failed: " .. tostring(Arg1), 6, Color3.fromRGB(255, 80, 80))
				end
			end,
			wasKicked = function()
				return V
			end,
		}
	end)(),
}
V20[1] = (function()
	return function(Arg1, Arg2, Arg3)
		if (not Arg1 or Arg3 and TypeOf(Arg1) ~= Arg3) then
			PH_MISSING[#PH_MISSING + 1] = tostring(Arg2)
			Warn("[Potato.hook] executor is missing: " .. tostring(Arg2))
		end
	end
end)()
V20[3] = (function()
	return {
		print = function()
		end,
		warn = function()
		end,
	}
end)()
V20[4] = (function()
	local V2 = V
	return V2({
		viewmodelController = V2({
			LAST_AIRED_UPVALUE = 12,
			MOUSE_RAYCAST_CALLER_LEVEL = 2,
			CREATE_PROJECTILE_LEVEL = 2,
			SEATPART_CALLER_LEVEL = 3,
			SPREAD_CALLER_LEVEL_MIN = 3,
			SPREAD_CALLER_LEVEL_MAX = 4,
			REGISTER_SLACK = 1,
			SHOOT_AIMING_REGISTER = 31,
			SHOOT_RECOIL_MULT_REGISTER = 35,
			SHOOT_SPREAD_KEY_REGISTER = 37,
			HEARTBEAT_ATTACHMENT_MULT_REGISTER = 52,
			HEARTBEAT_AMMO_STATS_REGISTER = 55,
			HEARTBEAT_AMMO_MULT_REGISTER = 56,
			HEARTBEAT_SPREAD_KEY_REGISTER = 57,
			HEARTBEAT_STATE_KEY_REGISTER = 65,
			TORSO_OFFSET_Y = 1.5,
			EOKA_DURATION_ROLL_LENGTH = 5,
			EOKA_SECOND_ROLL_LENGTH = 4,
		}),
		raycastUtil = V2({
			MOUSE_RAYCAST_IGNORE_ARG = 3,
			SHOOT_IGNORE_LIST_LENGTH = 2,
			RAYCAST_FILTERS_ARG = 5,
			RAYCAST_FILTER_FN_ARG = 7,
		}),
		inventoryController = V2({EQUIP_ARMOR_HANDLER_UPVALUE = 2}),
		stateAssetController = V2({FOOTSTEP_HANDLER_UPVALUE = 1}),
		assetContainer = V2({
			BAN_TABLE_UPVALUE = 2,
			FIRE_KEY = "k@\218v4\1\236\153i\187\169v\148\191\230\193\216\130\176g",
			RELOAD_KEY = "\1887\1g\18\228\158\151\249B`\176\1ti\186\206\201S\r",
			TP_SHOOT_KEY_1 = "d\147e\1R\169#o\249,9\133\153`B4q^W\6",
			TP_SHOOT_KEY_2 = "#\250)\215\28\1U\143\237}\154\218\231Cl-\15H\1\147",
		}),
		animations = V2({DOWNED_ANIMATION_ID = "rbxassetid://13435049596"}),
		staff = V2({GROUP_ID = 1154360, MIN_RANK = 15}),
	})
end)()
V20[5] = (function()
	local V = {
		Wave = {FONT = 1, SIZE = 13},
		Volt = {FONT = 2, SIZE = 15},
		AWP = {FONT = 0, SIZE = 16},
		Zenith = {FONT = 3, SIZE = 15},
	}
	local V2 = {FONT = 1, SIZE = 13}
	local V3, V4 = Pcall(IdentifyExecutor)
	return V3 and V[V4] or V2
end)()
V20[6] = (function()
	local V = {
		silentAim_targetNPCs = "silentAim_targetNpcs",
		forceHit_keybind = "silentAim_instantHitKeybind",
		manipulation_keybind = "silentAim_manipulationKeybind",
		silentAim_manipulation_distance = "silentAim_manipulationDistance",
		hitscan_keybind = "silentAim_hitscanKeybind",
		silentAim_hitscan_distance = "silentAim_hitscanDistance",
		silentAim_dynamicFOV = "silentAim_dynamicFov",
		silentAim_drawFOV = "silentAim_drawFov",
		silentAim_FOVSize = "silentAim_fovSize",
		recoilPercentage = "gunMods_recoilPercentage",
		spreadPercentage = "gunMods_spreadPercentage",
		firerateMultiplier = "gunMods_firerateMultiplier",
		fullyAutomatic = "fullyAutomatic_toggle",
		noMeleeShake = "noMeleeShake_toggle",
		bulletTP_toggle = "bulletTp_toggle",
		bulletTP_keybind = "bulletTp_keybind",
		flingTargetted_toggle = "flingTargeted_toggle",
		flingTargetted_keybind = "flingTargeted_keybind",
		playerESP = "playerEsp_toggle",
		playerESP_keybind = "playerEsp_keybind",
		playerESP_teamCheck = "playerEsp_teamCheck",
		playerESP_name = "playerEsp_name",
		playerESP_name_colour = "playerEsp_nameColour",
		playerESP_box = "playerEsp_box",
		playerESP_box_colour = "playerEsp_boxColour",
		playerESP_healthbar = "playerEsp_healthbar",
		playerESP_distance = "playerEsp_distance",
		playerESP_distance_colour = "playerEsp_distanceColour",
		playerESP_weapon = "playerEsp_weapon",
		playerESP_weapon_colour = "playerEsp_weaponColour",
		npcESP = "npcEsp_toggle",
		npcESP_name = "npcEsp_name",
		npcESP_box = "npcEsp_box",
		npcESP_healthbar = "npcEsp_healthbar",
		npcESP_distance = "npcEsp_distance",
		npcESP_scav = "npcEsp_scav",
		npcESP_scav_colour = "npcEsp_scavColour",
		npcESP_bruno = "npcEsp_bruno",
		npcESP_bruno_colour = "npcEsp_brunoColour",
		npcESP_boris = "npcEsp_boris",
		npcESP_boris_colour = "npcEsp_borisColour",
		npcESP_brutus = "npcEsp_brutus",
		npcESP_brutus_colour = "npcEsp_brutusColour",
		npcESP_bradley = "npcEsp_bradley",
		npcESP_bradley_colour = "npcEsp_bradleyColour",
		npcESP_wolf = "npcEsp_wolf",
		npcESP_wolf_colour = "npcEsp_wolfColour",
		npcESP_deer = "npcEsp_deer",
		npcESP_deer_colour = "npcEsp_deerColour",
		npcESP_boar = "npcEsp_boar",
		npcESP_boar_colour = "npcEsp_boarColour",
		npcESP_maxDistance = "npcEsp_maxDistance",
		entityESP = "entityEsp_toggle",
		entityESP_box = "entityEsp_box",
		entityESP_name = "entityEsp_name",
		entityESP_distance = "entityEsp_distance",
		entityESP_minicopter = "entityEsp_minicopter",
		entityESP_minicopter_colour = "entityEsp_minicopterColour",
		entityESP_bodyBag = "entityEsp_bodyBag",
		entityESP_bodyBag_colour = "entityEsp_bodyBagColour",
		entityESP_airdrop = "entityEsp_airdrop",
		entityESP_airdrop_colour = "entityEsp_airdropColour",
		entityESP_timedCrate = "entityEsp_timedCrate",
		entityESP_timedCrate_colour = "entityEsp_timedCrateColour",
		entityESP_hemp = "entityEsp_hemp",
		entityESP_hemp_colour = "entityEsp_hempColour",
		entityESP_stone = "entityEsp_stone",
		entityESP_stone_colour = "entityEsp_stoneColour",
		entityESP_phosphate = "entityEsp_phosphate",
		entityESP_phosphate_colour = "entityEsp_phosphateColour",
		entityESP_metal = "entityEsp_metal",
		entityESP_metal_colour = "entityEsp_metalColour",
		entityESP_smallGift = "entityEsp_smallGift",
		entityESP_smallGift_colour = "entityEsp_smallGiftColour",
		entityESP_mediumGift = "entityEsp_mediumGift",
		entityESP_mediumGift_colour = "entityEsp_mediumGiftColour",
		entityESP_largeGift = "entityEsp_largeGift",
		entityESP_largeGift_colour = "entityEsp_largeGiftColour",
		entityESP_maxDistance = "entityEsp_maxDistance",
		silentMinicopter = "silentMinicopter_toggle",
		disableMinicopterDamage = "disableMinicopterDamage_toggle",
		shootWhilePiloted = "shootWhilePiloted_toggle",
		xrayTransparency = "xray_transparency",
		disableTraps = "disableTraps_toggle",
		disableSpikes = "disableSpikes_toggle",
		tpToWaypoint_keyBind = "tpToWaypoint_keybind",
		speed_keybind = "speedHack_keybind",
		freemcam_keybind = "freecam_keybind",
		ambientToggle = "ambient_toggle",
		ambientColour = "ambient_colour",
		removeGrassToggle = "removeGrass_toggle",
		staffDetectorToggle = "staffDetector_toggle",
		suicideToggle = "suicide_toggle",
		resolveAntiAimToggle = "resolveAntiAim_toggle",
		targetHUD = "targetHud_toggle",
		keybindList = "keybindList_toggle",
	}
	return {
		FLAGS = V,
		translate = function(Arg1)
			local T = {}
			for Key, Value in Arg1 do
				local V2 = V[Key]
				if V2 then
					if Arg1[V2] == nil then
						T[V2] = Value
					end
				else
					T[Key] = Value
				end
			end
			return T
		end,
	}
end)()
V20[7] = (function()
	local V3 = V2
	local V4 = V
	local RawGet = RawGet
	local RawSet = RawSet
	local GetRawMetatable = GetRawMetatable
	local SetRawMetatable = SetRawMetatable
	local SetReadonly = SetReadonly
	return function(Arg1, Arg2, Arg3)
		local V2 = V3(GetRawMetatable(Arg1))
		local V10 = RawGet(V2, Arg2)
		SetReadonly(V2, false)
		RawSet(V2, Arg2, Arg3)
		V4(V2)
		SetRawMetatable(Arg1, V2)
		return V10
	end
end)()
V20[8] = (function()
	local V = V3
	local V2 = V4
	return {
		find = function(Arg1, Arg2)
			for Key, Value in Next, Arg1 do
				if (Rawequal(Value, Arg2)) then
					return Key
				end
			end
			return
		end,
		remove = function(Arg1, Arg2, Arg3)
			local V3 = V(Arg1, Arg2)
			if (V3) then
				V2(Arg1, V3)
			end
		end,
		foreach = function(Arg1, Arg2)
			for Key, Value in Next, Arg1 do
				Arg2(Key, Value)
			end
		end,
		deepClone = function(Arg1, Arg2)
			if (Type(Arg1) ~= "table") then
				return {}
			end
			local V2
			V2 = function(Arg1, Arg2)
				local T = {}
				for Key, Value in Next, Arg1 do
					local V3 = Type(Value)
					if (V3 == "number" and Arg2) then
						Value *= Arg2
					elseif (V3 == "table") then
						Value = V2(Value, Arg2)
					end
					T[Key] = Value
				end
				return T
			end
			return V2(Arg1, Arg2)
		end,
	}
end)()
local V21 = V20[1]
local V22 = V20[2]
local V23 = V20[3]
;(function()
	V21(_G2, "_G", "table")
	V21(Debug, "debug", "table")
	V21(V6, "debug.info", "function")
	V21(V11, "debug.getstack", "function")
	V21(V12, "debug.setstack", "function")
	V21(V7, "debug.getupvalues", "function")
	V21(V13, "debug.setupvalue", "function")
	V21(V8, "debug.getconstants", "function")
	V21(V14, "debug.setconstant", "function")
	V21(CloneRef, "cloneref", "function")
	V21(CompareInstances, "compareinstances", "function")
	V21(Drawing2, "Drawing", "table")
	V21(Drawing2.new, "Drawing.new", "function")
	V21(GetRawMetatable, "getrawmetatable", "function")
	V21(SetRawMetatable, "setrawmetatable", "function")
	V21(CheckCaller, "checkcaller", "function")
	V21(Getcallingscript, "getcallingscript", "function")
	V21(GetSenv, "getsenv", "function")
	V21(GetGc, "getgc", "function")
	V21(SetFpsCap, "setfpscap", "function")
	V21(NewCClosure, "newcclosure", "function")
	V21(GetNamecallMethod, "getnamecallmethod", "function")
	V21(CloneFunction, "clonefunction", "function")
	V21(HookFunction, "hookfunction", "function")
	V21(Request, "request", "function")
	V21(Setfflag, "setfflag", "function")
	V21(Base64Decode, "base64_decode", "function")
	V21(SetReadonly, "setreadonly", "function")
	V21(GetConnections, "getconnections", "function")
	V21(SethiddenProperty, "sethiddenproperty", "function")
	V21(IdentifyExecutor, "identifyexecutor", "function")
	V21(IsFolder, "isfolder", "function")
	V21(IsFile, "isfile", "function")
	V21(MakeFolder, "makefolder", "function")
	V21(ReadFile, "readfile", "function")
	V21(LoadFile, "loadfile", "function")
	V21(WriteFile, "writefile", "function")
	V21(AppendFile, "appendfile", "function")
	V21(DelFile, "delfile", "function")
	V21(ListFiles, "listfiles", "function")
end)()
local V25 = V11
local V26 = V7
local V27 = V13 or function(Arg1, Arg2, Arg3)
	if Type(Arg1) ~= "number" then
		if TypeOf(V26(Arg1)[Arg2]) ~= TypeOf(Arg3) then
			return Error("setupvalue type mismatch (Wave Compatibility)")
		else
			return V13(Arg1, Arg2, Arg3)
		end
	else
		return Error("debug_setupvalue uses level")
	end
end
local V28 = V15 or function(Arg1)
	local V2 = Pcall(function()
		V25(Arg1 + 3)
	end)
	return V2
end
local CloneRef = CloneRef
local V30 = (function()
	local Spawn = Task.spawn
	local GetFenv = GetFenv
	local SetFenv = SetFenv
	return function(Arg1, ...)
		Spawn(function(...)
			SetFenv(0, GetFenv(Arg1))
			Spawn(Arg1, ...)
		end, ...)
	end
end)()
local function Fn(Arg1)
	if (not Arg1) then
		return nil
	end
	return CloneRef(Arg1)
end
local function Fn2(Arg1, Arg2)
	return TypeOf(Arg1) == Arg2
end
local V31 = CloneRef(Game:GetService("ReplicatedStorage"))
local V32 = CloneRef(Game:GetService("UserInputService"))
local V33 = CloneRef(Game:GetService("HttpService"))
local V34 = CloneRef(Game:GetService("GuiService"))
local V35 = CloneRef(Game:GetService("RunService"))
local V36 = CloneRef(Game:GetService("Lighting"))
local V37 = CloneRef(Game:GetService("Players"))
local V38 = Fn(Workspace.CurrentCamera)
local V39 = CloneRef(V37.LocalPlayer)
local V40 = Fn(V39:WaitForChild("PlayerGui", math.huge))
local V41 = Fn(Workspace:FindFirstChildOfClass("Terrain"))
if not V41 then
	return V22.kick("Potato.hook error (0)")
end
local VFX = Workspace:WaitForChild("VFX", math.huge)
local Plants = Workspace:WaitForChild("Plants", math.huge)
local Drops = Workspace:WaitForChild("Drops", math.huge)
local V42 = CloneRef(VFX:WaitForChild("VMs", math.huge))
local V43 = CloneRef(Workspace:WaitForChild("Trees", math.huge))
local V44 = CloneRef(Workspace:WaitForChild("Vegetation", math.huge))
local V45 = CloneRef(Workspace:WaitForChild("Nodes", math.huge))
local V46 = CloneRef(Workspace:WaitForChild("Bases", math.huge))
local V47 = CloneRef(Workspace:WaitForChild("Events", math.huge))
local V48 = CloneRef(Workspace:WaitForChild("Military", math.huge))
local V49 = CloneRef(V46:WaitForChild("Loners", math.huge))
local V50 = CloneRef(V31:WaitForChild("Modules", math.huge))
local V51 = Require(V50:WaitForChild("Items", math.huge))
local V52 = Require(V50:WaitForChild("ToolInfo", math.huge))
local V53 = Require(V50:WaitForChild("BenchInfo", math.huge))
local V54 = Require(V50:WaitForChild("RaycastUtil", math.huge))
local V55 = Require(V50:WaitForChild("SoundModule", math.huge))
local V56 = Require(V50:WaitForChild("VFXModule", math.huge))
local V57 = (function()
	return (function(...)
		local T2 = {}
		local T3 = {One = "1", Two = "2", Three = "3", Four = "4", Five = "5", Six = "6", Seven = "7", Eight = "8", Nine = "9", Zero = "0", Return = "Enter", LeftBracket = "LBracket", RightBracket = "RBracket", Equals = "=", Minus = "-", Escape = "Esc", LeftShift = "LShift", RightShift = "RShift", RightControl = "RCtrl", LeftControl = "LCtrl", Quote = "'", Semicolon = ";", Delete = "Del", Up = "UpArrow", Down = "DownArrow", Right = "RightArrow", Left = "LeftArrow", RightAlt = "RAlt", LeftAlt = "LAlt", MouseButton2 = "MB2"}
		local V2 = V20[5]
		local FONT = V2.FONT
		local SIZE = V2.SIZE
		local V5 = CloneRef or function(...)
			return ...
		end
		local V6 = Drawing2 and Drawing2.new
		local New = Vector2_2.new
		local FromRGB = Color3_2.fromRGB
		local FromHSV = Color3_2.fromHSV
		local Clamp2 = Clamp
		local Round2 = Round
		local Abs = Abs
		local Spawn = Task.spawn
		local Delay = Task.delay
		local V10 = V16
		local V11 = V3
		local V12 = V4
		local Find = Find
		local Sub = Sub
		local ToString = ToString
		local V17 = V5(Game:GetService("UserInputService"))
		local V18 = V5(Game:GetService("RunService"))
		local V19 = V5(Workspace.CurrentCamera)
		local Fn = function()
			local T2 = {"Potato", "Potato\\Assets"}
			for Index = 1, #T2 do
				local V2 = T2[Index]
				if (not IsFolder(V2)) then
					MakeFolder(V2)
				end
			end
		end
		local Fn2 = function()
			Fn()
			for Key, Value in T2 do
				local V2 = ("Potato\\Assets\\" .. tostring(Key))
				if (not IsFile(V2)) then
					WriteFile(V2, Base64Decode(Value))
				end
			end
		end
		local Fn3 = function(Arg1)
			local V2 = ("Potato\\Assets\\" .. tostring(Arg1) .. ".png")
			if (not T2[(tostring(Arg1) .. ".png")]) then
				return
			end
			Fn2()
			if (not IsFile(V2)) then
				return
			end
			return ReadFile(V2)
		end
		local Fn4 = function()
			local T2 = {Visible = true, Rounding = 0, Size = New(0, 0), Color = Color3_2.new(0, 0, 0), Position = New(0, 0), ZIndex = 0}
			local T3 = {}
			local V2 = V6("Square")
			local T4 = {V6("Square"), V6("Square"), V6("Square"), V6("Square")}
			local T5 = {V6("Circle"), V6("Circle"), V6("Circle"), V6("Circle")}
			V10(T3, V2)
			for Index = 1, #T5 do
				T5[Index].Radius = T2.Rounding + 0.0001
				T5[Index].Thickness = 1
				V10(T3, T5[Index])
			end
			for Index2 = 1, #T4 do
				V10(T3, T4[Index2])
			end
			for Index3 = 1, #T3 do
				local V7 = T3[Index3]
				V7.Visible = T2.Visible
				V7.Color = T2.Color
				V7.ZIndex = T2.ZIndex
				V7.Filled = true
			end
			local Fn2 = function()
				local V6 = New(T2.Size.X - T2.Rounding * 2, T2.Rounding)
				T4[1].Size = V6
				T4[2].Size = V6
				T4[1].Position = New(T2.Position.X + T2.Rounding, T2.Position.Y)
				T4[2].Position = New(T2.Position.X + T2.Rounding, T2.Position.Y + T2.Size.Y - T2.Rounding)
				local V7 = New(T2.Rounding, T2.Size.Y - T2.Rounding * 2)
				T4[3].Size = V7
				T4[4].Size = V7
				T4[3].Position = New(T2.Position.X, T2.Position.Y + T2.Rounding)
				T4[4].Position = New(T2.Position.X + T2.Size.X - T2.Rounding, T2.Position.Y + T2.Rounding)
				T5[1].Position = New(T2.Position.X + T2.Rounding, T2.Position.Y + T2.Rounding)
				T5[2].Position = New(T2.Position.X + T2.Size.X - T2.Rounding, T2.Position.Y + T2.Rounding)
				T5[3].Position = New(T2.Position.X + T2.Size.X - T2.Rounding, T2.Position.Y + T2.Size.Y - T2.Rounding)
				T5[4].Position = New(T2.Position.X + T2.Rounding, T2.Position.Y + T2.Size.Y - T2.Rounding)
				V2.Position = T5[1].Position
				V2.Size = T2.Size - New(T2.Rounding * 2, T2.Rounding * 2)
				for Index = 1, #T5 do
					T5[Index].Radius = T2.Rounding + 0.0001
				end
			end
			Fn2()
			local V8 = Newproxy(true)
			local V9 = GetMetatable(V8)
			V9.__index = function(Arg1, Arg2)
				return T2[Arg2]
			end
			V9.__newindex = function(Arg1, Arg2, Arg3)
				Assert(T2[Arg2] ~= nil, (tostring(Arg2) .. " is not a valid member DrawingObject"))
				Assert(TypeOf(Arg3) == TypeOf(T2[Arg2]), (tostring(TypeOf(T2[Arg2])) .. " expected, got " .. tostring(TypeOf(Arg3))))
				if (T2[Arg2] == Arg3) then
					return
				end
				T2[Arg2] = Arg3
				if (Arg2 == "Visible" or Arg2 == "ZIndex" or Arg2 == "Color") then
					for Index = 1, #T3 do
						T3[Index][Arg2] = Arg3
					end
				elseif (Arg2 == "Rounding" or Arg2 == "Size" or Arg2 == "Position") then
					Fn2()
				end
			end
			return V8
		end
		local Fn5 = function(Arg1, Arg2, ...)
			local V2 = Arg1 == "RoundedSquare" and Fn4() or V6(Arg1)
			for Key, Value in Arg2 do
				V2[Key] = Value
			end
			for Key2, Value2 in {...} do
				V10(Value2, V2)
			end
			return V2
		end
		local Fn6 = function(Arg1)
			local V2 = Arg1 or {}
			V2.__index = V2
			return V2
		end
		local V21 = Fn6()
		local V22 = Fn6()
		local V23 = Fn6()
		local V24 = Fn6({index = 0, notifications = {}})
		local V25 = Fn6()
		local V26 = Fn6()
		local V27 = Fn6()
		local V28 = Fn6()
		local V30 = Fn6()
		local V31 = Fn6()
		local V32 = Fn6()
		V21.new = function(Arg1, Arg2, Arg3)
			local V2 = SetMetatable({window = Arg1, text = Arg2, time = Arg3, active = true, drawings = {}}, V21)
			local V5 = 65
			local Notifications = Arg1.notifications
			for Index = 1, #Notifications do
				V5 += Notifications[Index].offset + 10
			end
			do
				local Drawings = V2.drawings
				Drawings.text = Fn5("Text", {Visible = true, Center = false, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = Arg2, Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), ZIndex = 9})
				Drawings.text.Position = New(-Drawings.text.TextBounds.X - 5, V5 + 5)
				Drawings.background = Fn5("Square", {Visible = true, Filled = true, Transparency = 1, Thickness = 1, Color = FromRGB(39, 39, 39), Position = Drawings.text.Position - New(5, 5), Size = Drawings.text.TextBounds + New(10, 10), ZIndex = 8})
				Drawings.background_outline = Fn5("Square", {Visible = true, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(0, 0, 0), Position = Drawings.background.Position, Size = Drawings.background.Size, ZIndex = 9})
				Drawings.accent = Fn5("Square", {Visible = true, Filled = true, Transparency = 1, Thickness = 1, Color = FromRGB(255, 0, 0), Position = Drawings.background.Position - New(2, 0), Size = Drawings.background.Size + New(2, 2), ZIndex = 7})
			end
			V2.offset = V2.drawings.accent.Size.Y
			V2.goalPos = New(10, V5)
			V2:moveTo(V2.goalPos, 0.2)
			V10(Notifications, V2)
			local V6 = 0
			V2.connection = V18.RenderStepped:Connect(function(Arg1)
				V6 += Arg1
				if (V6 >= Arg3 - 0.05) then
					V2.connection:Disconnect()
					V2:remove()
					return
				end
			end)
			return V2
		end
		V22.new = function(Arg1)
			local V2 = 0
			local V5 = SetMetatable({active = Arg1.active, title = Arg1.title, size = Arg1.size, position = Arg1.position or New(V19.ViewportSize.X - Arg1.size.X - 10, V19.ViewportSize.Y / 2 - Arg1.size.Y / 2), mouseHeld = false, storage = {}, storedText = {}, clickDetectors = {}, drawings = {}, cachedDrawings = {}, allDrawings = {}}, V22)
			do
				local Drawings = V5.drawings
				Drawings.base = Fn5("Square", {Visible = V5.active, Filled = true, Transparency = 1, Thickness = 1, Color = FromRGB(39, 39, 39), Position = V5.position, Size = V5.size, ZIndex = 8}, V5.allDrawings)
				Drawings.onDrag = Fn5("Square", {Visible = V5.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(255, 42, 191), Position = Drawings.base.Position, Size = New(V5.size.X, 22), ZIndex = 0}, V5.allDrawings)
				Drawings.baseOutline = Fn5("Square", {Visible = V5.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = Drawings.base.Position - New(1, 1), Size = Drawings.base.Size + New(2, 2), ZIndex = 9}, V5.allDrawings)
				Drawings.title = Fn5("Text", {Visible = V5.active, Center = true, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V5.title, Color = FromRGB(255, 255, 255), OutlineColor = FromRGB(0, 0, 0), Position = Drawings.base.Position + New(Drawings.base.Size.X / 2, 2), ZIndex = 9}, V5.allDrawings)
			end
			do
				local ClickDetectors = V5.clickDetectors
				V17.InputBegan:Connect(function(Arg1, Arg2)
					if (Arg1.UserInputType ~= Enum2.UserInputType.MouseButton1) then
						return
					end
					V5.mouseHeld = true
					local MouseLocation = V17:GetMouseLocation()
					for Index = 1, #ClickDetectors do
						ClickDetectors[Index](MouseLocation)
					end
				end)
				V17.InputEnded:Connect(function(Arg1, Arg2)
					if (Arg1.UserInputType ~= Enum2.UserInputType.MouseButton1) then
						return
					end
					V5.mouseHeld = false
				end)
				local Fn = function(Arg1)
					local T2 = {}
					for Index = 1, #V5.allDrawings do
						T2[Index] = V5.allDrawings[Index].Position
					end
					local V2
					V2 = V18.RenderStepped:Connect(function()
						if (not V5.mouseHeld) then
							return V2:Disconnect()
						end
						local V6 = V17:GetMouseLocation() - Arg1
						for Index = 1, #T2 do
							V5.allDrawings[Index].Position = T2[Index] + V6
						end
					end)
				end
				V5:onClick(V5.drawings.onDrag, Fn)
			end
			return V5
		end
		V23.new = function(Arg1)
			local V2 = 15
			local V5 = SetMetatable({active = Arg1.active or false, position = Arg1.position or V19.ViewportSize / 2 - New(150, 100), mouseHeld = false, values = {}, clickDetectors = {}, drawings = {}, cachedDrawings = {}, allDrawings = {}}, V23)
			do
				local Drawings = V5.drawings
				Drawings.baseOutline = Fn5("RoundedSquare", {Visible = V5.active, Rounding = 6, Color = FromRGB(0, 0, 0), Position = V5.position, Size = New(300, 100), ZIndex = 15}, V5.allDrawings)
				Drawings.base = Fn5("RoundedSquare", {Visible = V5.active, Rounding = 6, Color = FromRGB(33, 33, 33), Position = Drawings.baseOutline.Position + New(1, 1), Size = Drawings.baseOutline.Size - New(2, 2), ZIndex = 16}, V5.allDrawings)
				Drawings.name = Fn5("Text", {Visible = V5.active, Outline = true, OutlineColor = FromRGB(0, 0, 0), Color = FromRGB(255, 255, 255), Transparency = 1, Size = SIZE, Text = "TARGET_NAME", Font = FONT, Position = Drawings.base.Position + New(10, 10), ZIndex = 17}, V5.allDrawings)
				Drawings.weapon = Fn5("Text", {Visible = V5.active, Outline = true, OutlineColor = FromRGB(0, 0, 0), Color = FromRGB(175, 175, 175), Transparency = 1, Size = SIZE, Text = "weapon: salvaged ak47", Font = FONT, Position = Drawings.name.Position + New(0, 20), ZIndex = 17}, V5.allDrawings)
				Drawings.distance = Fn5("Text", {Visible = V5.active, Outline = true, OutlineColor = FromRGB(0, 0, 0), Color = FromRGB(175, 175, 175), Transparency = 1, Size = SIZE, Text = "distance: 200 studs", Font = FONT, Position = Drawings.weapon.Position + New(0, 20), ZIndex = 17}, V5.allDrawings)
				Drawings.healthbar_outline = Fn5("RoundedSquare", {Visible = V5.active, Rounding = 4, Color = FromRGB(10, 10, 10), Position = Drawings.base.Position + New(10, 80), Size = New(Drawings.base.Size.X - 20, 8), ZIndex = 17}, V5.allDrawings)
				Drawings.healthbar = Fn5("RoundedSquare", {Visible = V5.active, Rounding = 2, Color = FromRGB(0, 255, 21), Position = Drawings.healthbar_outline.Position + New(1, 1), Size = Drawings.healthbar_outline.Size - New(2, 2), ZIndex = 18}, V5.allDrawings)
			end
			do
				local ClickDetectors = V5.clickDetectors
				V17.InputBegan:Connect(function(Arg1, Arg2)
					if (Arg1.UserInputType ~= Enum2.UserInputType.MouseButton1) then
						return
					end
					V5.mouseHeld = true
					local MouseLocation = V17:GetMouseLocation()
					for Index = 1, #ClickDetectors do
						ClickDetectors[Index](MouseLocation)
					end
				end)
				V17.InputEnded:Connect(function(Arg1, Arg2)
					if (Arg1.UserInputType ~= Enum2.UserInputType.MouseButton1) then
						return
					end
					V5.mouseHeld = false
				end)
				local Fn = function(Arg1)
					local T2 = {}
					for Index = 1, #V5.allDrawings do
						T2[Index] = V5.allDrawings[Index].Position
					end
					local V2
					V2 = V18.RenderStepped:Connect(function()
						if (not V5.mouseHeld) then
							return V2:Disconnect()
						end
						local V6 = V17:GetMouseLocation() - Arg1
						for Index = 1, #T2 do
							V5.allDrawings[Index].Position = T2[Index] + V6
						end
					end)
				end
				V5:onClick(V5.drawings.base, Fn)
			end
			return V5
		end
		V24.new = function(Arg1)
			Assert(Type(Arg1) == "table", ("invalid argument #1 to 'windowClass.new' (table expected, got " .. tostring(Type(Arg1)) .. ")"))
			V24.index += 1
			local V2 = SetMetatable({baseZindex = 10, id = V24.index, active = true, title = Arg1.title or "Potato.hook", size = Arg1.size or New(600, 500), position = V19.ViewportSize / 2, tabSettings = {index = 0, tabs = {}}, cachedImages = {}, clickDetectors = {}, keyDetectors = {}, keyEnd = {}, flags = {}, connectedToggles = {}, drawings = {}, allDrawings = {}, overlapDrawings = {}}, V24)
			do
				local Drawings = V2.drawings
				Drawings.base = Fn5("Square", {Visible = V2.active, Filled = true, Transparency = 1, Thickness = 1, Color = FromRGB(39, 39, 39), Position = V2.position - V2.size / 2, Size = V2.size, ZIndex = V2.baseZindex + 1}, V2.allDrawings)
				Drawings.onDrag = Fn5("Square", {Visible = V2.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(255, 42, 191), Position = Drawings.base.Position, Size = New(V2.size.X, 20), ZIndex = 0}, V2.allDrawings)
				Drawings.baseOutline = Fn5("Square", {Visible = V2.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = Drawings.base.Position - New(1, 1), Size = Drawings.base.Size + New(2, 2), ZIndex = V2.baseZindex + 2}, V2.allDrawings)
				Drawings.innerOutline = Fn5("Square", {Visible = V2.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = Drawings.baseOutline.Position + New(0, 20), Size = Drawings.base.Size + New(2, 2) - New(0, 20), ZIndex = V2.baseZindex + 2}, V2.allDrawings)
				Drawings.innerOutline2 = Fn5("Square", {Visible = V2.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = Drawings.innerOutline.Position + New(0, 40), Size = Drawings.innerOutline.Size - New(0, 40), ZIndex = V2.baseZindex + 2}, V2.allDrawings)
				Drawings.sectionOutline1 = Fn5("Square", {Visible = V2.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = Drawings.innerOutline2.Position + New(16, 16), Size = Drawings.innerOutline2.Size - New(Drawings.innerOutline2.Size.X / 2 + 24, 32), ZIndex = V2.baseZindex + 2}, V2.allDrawings)
				Drawings.sectionOutline2 = Fn5("Square", {Visible = V2.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = Drawings.innerOutline2.Position + New(Drawings.innerOutline2.Size.X / 2 + 8, 16), Size = Drawings.sectionOutline1.Size, ZIndex = V2.baseZindex + 2}, V2.allDrawings)
				Drawings.title = Fn5("Text", {Visible = V2.active, Center = false, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V2.title, Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = Drawings.base.Position + New(2, 2), ZIndex = V2.baseZindex + 2}, V2.allDrawings)
			end
			do
				local ClickDetectors = V2.clickDetectors
				local KeyDetectors = V2.keyDetectors
				local KeyEnd = V2.keyEnd
				V17.InputBegan:Connect(function(Arg1, Arg2)
					for Index = 1, #KeyDetectors do
						KeyDetectors[Index](Arg1, Arg2)
					end
					if (Arg1.KeyCode == Enum2.KeyCode.RightShift) then
						return V2:toggle()
					elseif (Arg1.UserInputType ~= Enum2.UserInputType.MouseButton1) then
						return
					end
					V2.mouseHeld = true
					local MouseLocation = V17:GetMouseLocation()
					for Index2 = 1, #ClickDetectors do
						ClickDetectors[Index2](MouseLocation)
					end
				end)
				V17.InputEnded:Connect(function(Arg1, Arg2)
					for Index = 1, #KeyEnd do
						KeyEnd[Index](Arg1, Arg2)
					end
					if (Arg1.UserInputType ~= Enum2.UserInputType.MouseButton1) then
						return
					end
					V2.mouseHeld = false
				end)
				local Fn = function(Arg1)
					local T2 = {}
					for Index = 1, #V2.allDrawings do
						T2[Index] = V2.allDrawings[Index].Position
					end
					local V5
					V5 = V18.RenderStepped:Connect(function()
						if (not V2.mouseHeld) then
							return V5:Disconnect()
						end
						local V6 = V17:GetMouseLocation() - Arg1
						for Index = 1, #T2 do
							V2.allDrawings[Index].Position = T2[Index] + V6
						end
					end)
				end
				V2:onClick(V2.drawings.onDrag, Fn)
			end
			return V2, V2.flags
		end
		V25.new = function(Arg1, Arg2)
			Assert(Type(Arg1) == "table", ("invalid argument #1 to 'tabClass.new' (table expected, got " .. tostring(Type(Arg1)) .. ")"))
			Arg1.tabSettings.index += 1
			local V2 = SetMetatable({id = Arg1.tabSettings.index, active = Arg1.tabSettings.index == 1 and true or false, window = Arg1, name = Arg2 or ("tab" .. tostring(Arg1.tabSettings.index)), offsets = {10, 10}, drawings = {}, allDrawings = {}, toggleDrawings = {}}, V25)
			do
				local Drawings = V2.drawings
				Drawings.outline = Fn5("Square", {Visible = Arg1.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), ZIndex = Arg1.baseZindex + 2}, Arg1.allDrawings)
				Drawings.text = Fn5("Text", {Visible = Arg1.active, Center = true, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V2.name, Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), ZIndex = Arg1.baseZindex + 2}, Arg1.allDrawings)
			end
			V2.onClicked = function()
				if (V2.active) then
					return
				end
				local Tabs = V2.window.tabSettings.tabs
				for Index = 1, #Tabs do
					local V5 = Tabs[Index]
					if (V5 ~= V2) then
						V5:toggle(false)
					end
				end
				V2:toggle(true)
			end
			V2.window:onClick(V2.drawings.outline, V2.onClicked)
			V10(Arg1.tabSettings.tabs, V2)
			V2:toggle(V2.active)
			Arg1:reloadTabs()
			return V2
		end
		V26.new = function(Arg1, Arg2, Arg3)
			Assert(Type(Arg1) == "table", ("invalid argument #1 to 'toggleClass.new' (table expected, got " .. tostring(Type(Arg1)) .. ")"))
			Assert(Type(Arg2) == "table", ("invalid argument #2 to 'toggleClass.new' (table expected, got " .. tostring(Type(Arg2)) .. ")"))
			Assert(Type(Arg3) == "number", ("invalid argument #3 to 'toggleClass.new' (number expected, got " .. tostring(Type(Arg3)) .. ")"))
			Arg3 = Round(Clamp(Arg3, 1, 2))
			local V2 = SetMetatable({tab = Arg1, window = Arg1.window, text = Arg2.text or "Toggle", enabled = Arg2.default or false, risky = Arg2.risky or false, drawings = {}}, V26)
			do
				V2.flag = {type = "toggle", value = V2.enabled, funcs = {}, self = V2}
				V2.flag.Changed = function(...)
					local Funcs = V2.flag.funcs
					for Index = 1, #Funcs do
						Funcs[Index](...)
					end
				end
				if (Arg2.flag) then
					V2.flag.OnChanged = function(Arg1, Arg2)
						V10(V2.flag.funcs, Arg2)
						Arg2(V2.flag.value)
					end
					V2.window.flags[Arg2.flag] = V2.flag
				end
			end
			do
				local Drawings = V2.drawings
				Drawings.outline = Fn5("Square", {Visible = Arg1.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = V2.window.drawings[("sectionOutline" .. tostring(Arg3))].Position + New(15, Arg1.offsets[Arg3]), Size = New(15, 15), ZIndex = V2.window.baseZindex + 2}, V2.window.allDrawings, Arg1.allDrawings)
				Drawings.accent = Fn5("Square", {Visible = Arg1.active, Filled = true, Transparency = V2.enabled and 1 or 0, Thickness = 1, Color = FromRGB(255, 0, 0), Position = Drawings.outline.Position + New(1, 1), Size = New(13.5, 13), ZIndex = V2.window.baseZindex + 2}, V2.window.allDrawings, Arg1.allDrawings)
				Drawings.text = Fn5("Text", {Visible = Arg1.active, Center = false, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V2.text, Color = V2.risky and FromRGB(255, 199, 43) or FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = Drawings.outline.Position + New(20, 1), ZIndex = V2.window.baseZindex + 2}, V2.window.allDrawings, Arg1.allDrawings)
				Drawings.clickDetector = Fn5("Square", {Visible = Arg1.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(255, 42, 191), Position = Drawings.outline.Position, Size = New(22 + Drawings.text.TextBounds.X, 15), ZIndex = 0}, V2.window.allDrawings, Arg1.allDrawings)
			end
			V2.onClicked = function()
				local V5 = not V2.enabled
				V2.enabled = V5
				V2.flag.value = V5
				V2.flag.Changed(V5)
				V2.drawings.accent.Transparency = V5 and 1 or 0
			end
			V2.setValue = function(Arg1)
				V2.enabled = Arg1
				V2.flag.value = Arg1
				V2.flag.Changed(Arg1)
				V2.drawings.accent.Transparency = Arg1 and 1 or 0
			end
			V2.window:onClick(V2.drawings.clickDetector, function()
				V2:onClicked()
			end)
			Arg1.offsets[Arg3] += 20
			return V2
		end
		V27.new = function(Arg1, Arg2, Arg3)
			Assert(Type(Arg1) == "table", ("invalid argument #1 to 'sliderClass.new' (table expected, got " .. tostring(Type(Arg1)) .. ")"))
			Assert(Type(Arg2) == "table", ("invalid argument #2 to 'sliderClass.new' (table expected, got " .. tostring(Type(Arg2)) .. ")"))
			Assert(Type(Arg3) == "number", ("invalid argument #3 to 'sliderClass.new' (number expected, got " .. tostring(Type(Arg3)) .. ")"))
			local V2 = SetMetatable({tab = Arg1, window = Arg1.window, text = Arg2.text, value = Arg2.default or Arg2.min, max = Arg2.max, min = Arg2.min, increment = Arg2.increment or 1, suffix = Arg2.suffix or "", drawings = {}}, V27)
			V2.range = V2.max - V2.min
			local V5 = ToString(V2.increment)
			local V6 = Find(V5, ".", 1, true)
			if (V6) then
				V2.maxIndex = #V5 - V6
			end
			do
				V2.flag = {type = "slider", value = V2.value, self = V2}
				V2.flag.Changed = function(...)
				end
				if (Arg2.flag) then
					V2.flag.OnChanged = function(Arg1, Arg2)
						V2.flag.Changed = Arg2
						Arg2(V2.flag.value)
					end
					V2.window.flags[Arg2.flag] = V2.flag
				end
			end
			do
				local Drawings = V2.drawings
				Drawings.outline = Fn5("Square", {Visible = Arg1.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = V2.window.drawings[("sectionOutline" .. tostring(Arg3))].Position + New(15, Arg1.offsets[Arg3] + 15), Size = New(V2.window.drawings.sectionOutline1.Size.X - 30, 15), ZIndex = V2.window.baseZindex + 2}, V2.window.allDrawings, Arg1.allDrawings)
				Drawings.accent = Fn5("Square", {Visible = Arg1.active, Filled = true, Transparency = 1, Thickness = 1, Color = FromRGB(255, 0, 0), Position = Drawings.outline.Position + New(1, 1), Size = New((Drawings.outline.Size.X - 2) * (V2.value - V2.min) / V2.range, Drawings.outline.Size.Y - 2), ZIndex = V2.window.baseZindex + 2}, V2.window.allDrawings, Arg1.allDrawings)
				Drawings.text = Fn5("Text", {Visible = Arg1.active, Center = false, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V2.text, Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = Drawings.outline.Position + New(1, -15), ZIndex = V2.window.baseZindex + 2}, V2.window.allDrawings, Arg1.allDrawings)
				Drawings.value = Fn5("Text", {Visible = Arg1.active, Center = true, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V2.value .. V2.suffix, Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = Drawings.outline.Position + New(Drawings.outline.Size.X / 2, 1), ZIndex = V2.window.baseZindex + 3}, V2.window.allDrawings, Arg1.allDrawings)
			end
			V2.onClicked = function()
				local X2 = V2.drawings.outline.Position.X
				local X3 = V2.drawings.outline.Size.X
				local V9
				V9 = V18.RenderStepped:Connect(function()
					if (not V2.window.mouseHeld) then
						return V9:Disconnect()
					end
					local V5 = V17:GetMouseLocation().X - X2
					local V6 = Clamp2(V5 / X3, 0, 1)
					V2.value = Round2(V2.range * V6 / V2.increment) * V2.increment + V2.min
					V2.flag.value = V2.value
					V2.flag.Changed(V2.value)
					V2.drawings.accent.Size = New((V2.drawings.outline.Size.X - 2) * (V2.value - V2.min) / V2.range, V2.drawings.accent.Size.Y)
					local Value = V2.value
					if (V2.maxIndex) then
						Value = ToString(Value)
						local V10 = Find(ToString(Value), ".", 1, true)
						if (V10) then
							Value = Sub(ToString(Value), 1, V2.maxIndex + V10)
						end
					end
					V2.drawings.value.Text = Value .. V2.suffix
				end)
			end
			V2.setValue = function(Arg1)
				V2.value = Arg1
				V2.flag.value = V2.value
				V2.flag.Changed(V2.value)
				V2.drawings.accent.Size = New((V2.drawings.outline.Size.X - 2) * (V2.value - V2.min) / V2.range, V2.drawings.accent.Size.Y)
				V2.drawings.value.Text = V2.value .. V2.suffix
			end
			V2.window:onClick(V2.drawings.outline, V2.onClicked)
			Arg1.offsets[Arg3] += 35
			return V2
		end
		V28.new = function(Arg1, Arg2, Arg3)
			Assert(Type(Arg1) == "table", ("invalid argument #1 to 'dropdownClass.new' (table expected, got " .. tostring(Type(Arg1)) .. ")"))
			Assert(Type(Arg2) == "table", ("invalid argument #2 to 'dropdownClass.new' (table expected, got " .. tostring(Type(Arg2)) .. ")"))
			Assert(Type(Arg3) == "number", ("invalid argument #3 to 'dropdownClass.new' (number expected, got " .. tostring(Type(Arg3)) .. ")"))
			local V2 = SetMetatable({tab = Arg1, window = Arg1.window, text = Arg2.text, options = Arg2.options, value = Arg2.default or Arg2.options[1] or "None", drawings = {}}, V28)
			do
				V2.flag = {type = "dropdown", value = V2.value, self = V2}
				V2.flag.Changed = function(...)
				end
				if (Arg2.flag) then
					V2.flag.OnChanged = function(Arg1, Arg2)
						V2.flag.Changed = Arg2
						Arg2(V2.flag.value)
					end
					V2.window.flags[Arg2.flag] = V2.flag
				end
			end
			do
				local Drawings = V2.drawings
				Drawings.outline = Fn5("Square", {Visible = Arg1.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = V2.window.drawings[("sectionOutline" .. tostring(Arg3))].Position + New(15, Arg1.offsets[Arg3] + 15), Size = New(V2.window.drawings.sectionOutline1.Size.X - 30, 15), ZIndex = V2.window.baseZindex + 2}, V2.window.allDrawings, Arg1.allDrawings)
				Drawings.text = Fn5("Text", {Visible = Arg1.active, Center = false, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V2.text, Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = Drawings.outline.Position + New(1, -15), ZIndex = V2.window.baseZindex + 2}, V2.window.allDrawings, Arg1.allDrawings)
				Drawings.value = Fn5("Text", {Visible = Arg1.active, Center = true, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V2.value, Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = Drawings.outline.Position + New(Drawings.outline.Size.X / 2, 1), ZIndex = V2.window.baseZindex + 2}, V2.window.allDrawings, Arg1.allDrawings)
				Drawings.rightText = Fn5("Text", {Visible = Arg1.active, Center = true, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = ">", Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = New(Drawings.outline.Position.X + Drawings.outline.Size.X - 10, Drawings.value.Position.Y), ZIndex = V2.window.baseZindex + 2}, V2.window.allDrawings, Arg1.allDrawings)
				Drawings.leftText = Fn5("Text", {Visible = Arg1.active, Center = true, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = "<", Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = New(Drawings.outline.Position.X + 10, Drawings.value.Position.Y), ZIndex = V2.window.baseZindex + 2}, V2.window.allDrawings, Arg1.allDrawings)
				Drawings.rightClick = Fn5("Square", {Visible = Arg1.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(255, 42, 191), Position = Drawings.rightText.Position - New(Drawings.rightText.TextBounds.X / 2 + 2, 0), Size = New(13, 13), ZIndex = 0}, V2.window.allDrawings, Arg1.allDrawings)
				Drawings.leftClick = Fn5("Square", {Visible = Arg1.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(255, 42, 191), Position = Drawings.leftText.Position - New(Drawings.leftText.TextBounds.X / 2 + 2, 0), Size = New(13, 13), ZIndex = 0}, V2.window.allDrawings, Arg1.allDrawings)
			end
			local Fn = function()
				local V5 = V11(V2.options, V2.value) or 0
				local V6 = V2.options[V5 + 1]
				if (V6 == nil) then
					V6 = V2.options[1] or "None"
				end
				V2.value = V6
				V2.drawings.value.Text = V6
				V2.flag.value = V2.value
				V2.flag.Changed(V2.value)
			end
			local Fn2 = function()
				local V5 = V11(V2.options, V2.value) or 2
				local V6 = V2.options[V5 - 1]
				if (V6 == nil) then
					V6 = V2.options[#V2.options] or "None"
				end
				V2.value = V6
				V2.drawings.value.Text = V6
				V2.flag.value = V2.value
				V2.flag.Changed(V2.value)
			end
			V2.setValue = function(Arg1)
				V2.value = Arg1
				V2.drawings.value.Text = Arg1
				V2.flag.value = V2.value
				V2.flag.Changed(V2.value)
			end
			V2.window:onClick(V2.drawings.rightClick, Fn)
			V2.window:onClick(V2.drawings.leftClick, Fn2)
			Arg1.offsets[Arg3] += 35
			return V2
		end
		V30.new = function(Arg1, Arg2, Arg3, Arg4)
			Assert(Type(Arg1) == "table", ("invalid argument #1 to 'buttonClass.new' (table expected, got " .. tostring(Type(Arg1)) .. ")"))
			Assert(Type(Arg3) == "function", ("invalid argument #2 to 'buttonClass.new' (function expected, got " .. tostring(Type(Arg3)) .. ")"))
			Assert(Type(Arg4) == "number", ("invalid argument #3 to 'buttonClass.new' (number expected, got " .. tostring(Type(Arg4)) .. ")"))
			local V2 = SetMetatable({tab = Arg1, window = Arg1.window, text = Arg2, drawings = {}}, V30)
			do
				local Drawings = V2.drawings
				Drawings.outline = Fn5("Square", {Visible = Arg1.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = V2.window.drawings[("sectionOutline" .. tostring(Arg4))].Position + New(15, Arg1.offsets[Arg4]), Size = New(V2.window.drawings.sectionOutline1.Size.X - 30, 15), ZIndex = V2.window.baseZindex + 2}, V2.window.allDrawings, Arg1.allDrawings)
				Drawings.text = Fn5("Text", {Visible = Arg1.active, Center = true, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V2.text, Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = Drawings.outline.Position + New(Drawings.outline.Size.X / 2, 1), ZIndex = V2.window.baseZindex + 3}, V2.window.allDrawings, Arg1.allDrawings)
			end
			local Fn = function()
				V2.drawings.text.Color = FromRGB(255, 255, 255)
				Delay(0.3, function()
					V2.drawings.text.Color = FromRGB(195, 195, 195)
				end)
				Arg3()
			end
			V2.window:onClick(V2.drawings.outline, Fn)
			Arg1.offsets[Arg4] += 20
			return V2
		end
		V31.new = function(Arg1, Arg2)
			Assert(Type(Arg1) == "table", ("invalid argument #1 to 'keypickerClass.new' (table expected, got " .. tostring(Type(Arg1)) .. ")"))
			Assert(Type(Arg2) == "table", ("invalid argument #2 to 'keypickerClass.new' (table expected, got " .. tostring(Type(Arg2)) .. ")"))
			Fn2()
			local V2 = SetMetatable({tab = Arg1.tab, toggle = Arg1, window = Arg1.window, active = false, value = T3[Arg2.default] or Arg2.default or "None", blacklisted = Arg2.blacklisted or {}, mode = Arg2.mode or "toggle", drawings = {}}, V31)
			do
				V2.flag = {type = "keypicker", key = V2.value, value = false, self = V2}
				V2.flag.KeyChanged = function(...)
				end
				V2.flag.Changed = function(...)
				end
				if (Arg2.flag) then
					V2.flag.OnChanged = function(Arg1_2, Arg2)
						V2.flag.Changed = Arg2
						Arg2(V2.flag.value)
					end
					V2.flag.OnKeyChanged = function(Arg1_2, Arg2)
						V2.flag.KeyChanged = Arg2
						Arg2(V2.flag.key)
					end
					V2.window.flags[Arg2.flag] = V2.flag
				end
			end
			do
				local Drawings = V2.drawings
				Drawings.text = Fn5("Text", {Visible = V2.tab.active, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = "[ loading ]", Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), ZIndex = V2.window.baseZindex + 3}, V2.window.allDrawings, V2.tab.allDrawings)
				Drawings.clickDetector = Fn5("Square", {Visible = V2.tab.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(255, 42, 191), Position = nil, Size = nil, ZIndex = 0}, V2.window.allDrawings, V2.tab.allDrawings)
			end
			local Fn = function(Arg1)
				if (V17:GetFocusedTextBox()) then
					return
				elseif (V2.active) then
					local Name = Arg1.KeyCode.Name
					if (Name == "Unknown") then
						Name = Arg1.UserInputType.Name
						if (Name ~= "MouseButton2") then
							return
						end
					end
					for Key, Value in V2.blacklisted do
						if (Value == Name) then
							return
						end
					end
					V2.active = false
					V2.value = T3[Name] or Name
					V2.flag.key = V2.value
					V2.flag.KeyChanged(V2.value)
					V2:update()
					return
				elseif (V2.value == "None") then
					return
				end
				local Name2 = Arg1.KeyCode.Name
				if (Name2 == "Unknown") then
					Name2 = Arg1.UserInputType.Name
					if (Name2 ~= "MouseButton2") then
						return
					end
				end
				Name2 = T3[Name2] or Name2
				if (V2.value == Name2) then
					local V5 = V2.mode ~= "toggle" and true or not V2.flag.value
					V2.flag.value = V5
					V2.flag.Changed(V5)
				end
			end
			local Fn3 = function(Arg1)
				if (V2.active or V2.value == "None" or V2.mode == "toggle") then
					return
				end
				local Name = Arg1.KeyCode.Name
				if (Name == "Unknown") then
					Name = Arg1.UserInputType.Name
					if (Name ~= "MouseButton2") then
						return
					end
				end
				Name = T3[Name] or Name
				if (V2.value == Name) then
					V2.flag.value = false
					V2.flag.Changed(false)
				end
			end
			local Fn4 = function()
				V2.flag.value = false
				V2.flag.Changed(false)
				if (V2.active) then
					V2.active = false
					V2.value = "None"
					V2.flag.key = "None"
					V2.flag.KeyChanged(V2.value)
					V2:update()
					return
				end
				V2.active = true
				V2.value = "..."
				V2:update()
			end
			V2.window:onClick(V2.drawings.clickDetector, Fn4)
			V2.window:addKeyDetector(Fn)
			V2.window:addKeyEnd(Fn3)
			V2:update()
			V2.setValue = function(Arg1, Arg2)
				V2.value = Arg2
				V2.flag.value = Arg1
				V2.flag.key = Arg2
				V2.flag.Changed(Arg1)
				V2.flag.KeyChanged(Arg2)
				V2:update()
			end
			return V2
		end
		V32.new = function(Arg1, Arg2)
			Assert(Type(Arg1) == "table", ("invalid argument #1 to 'keypickerClass.new' (table expected, got " .. tostring(Type(Arg1)) .. ")"))
			Assert(Type(Arg2) == "table", ("invalid argument #2 to 'keypickerClass.new' (table expected, got " .. tostring(Type(Arg2)) .. ")"))
			local V2 = SetMetatable({tab = Arg1.tab, toggle = Arg1, window = Arg1.window, value = Arg2.default or FromRGB(255, 255, 255), drawings = {}, onToggle = {}}, V32)
			V2.h, V2.s, V2.v = V2.value:ToHSV()
			do
				V2.flag = {type = "colourpicker", value = V2.value, self = V2}
				V2.flag.Changed = function(...)
				end
				if (Arg2.flag) then
					V2.flag.OnChanged = function(Arg1, Arg2)
						V2.flag.Changed = Arg2
						Arg2(V2.flag.value)
					end
					V2.window.flags[Arg2.flag] = V2.flag
				end
			end
			do
				local Drawings = V2.drawings
				Drawings.colour_fill = Fn5("Square", {Visible = V2.tab.active, Filled = true, Transparency = 1, Thickness = 1, Color = V2.value, Position = V2.toggle.drawings.outline.Position + New(V2.window.drawings.sectionOutline1.Size.X - 60, 0), Size = New(30, 15), ZIndex = V2.window.baseZindex + 2}, Arg1.window.allDrawings, V2.tab.allDrawings)
				Drawings.colour_outline = Fn5("Square", {Visible = V2.tab.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(0, 0, 0), Position = Drawings.colour_fill.Position, Size = Drawings.colour_fill.Size, ZIndex = V2.window.baseZindex + 3}, Arg1.window.allDrawings, V2.tab.allDrawings)
				Drawings.background_fill = Fn5("Square", {Visible = false, Filled = true, Transparency = 1, Thickness = 1, Color = FromRGB(39, 39, 39), Position = Drawings.colour_outline.Position + New(0, 20), Size = New(150, 150), ZIndex = V2.window.baseZindex + 4}, Arg1.window.allDrawings, V2.onToggle, V2.tab.toggleDrawings)
				Drawings.background_outline = Fn5("Square", {Visible = false, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(0, 0, 0), Position = Drawings.background_fill.Position, Size = Drawings.background_fill.Size, ZIndex = V2.window.baseZindex + 5}, Arg1.window.allDrawings, V2.window.overlapDrawings, V2.onToggle, V2.tab.toggleDrawings)
				Drawings.colourpicker_fill = Fn5("Square", {Visible = false, Filled = true, Transparency = 1, Thickness = 1, Color = FromHSV(V2.h, 1, 1), Position = Drawings.background_fill.Position + New(5, 5), Size = New(125, 125), ZIndex = V2.window.baseZindex + 5}, Arg1.window.allDrawings, V2.onToggle, V2.tab.toggleDrawings)
				if (not V2.window.cachedImages.cp_overlay) then
					local V5 = Fn5("Image", {Visible = false, Transparency = 1, Data = Fn3("overlay"), Position = Drawings.background_fill.Position + New(5, 5), Size = New(125, 125), ZIndex = V2.window.baseZindex + 6}, Arg1.window.allDrawings)
					V2.window.cachedImages.cp_overlay = {toggle = true, drawing = V5}
				end
				Drawings.colourpicker_outline = Fn5("Square", {Visible = false, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(1, 1, 1), Position = Drawings.colourpicker_fill.Position, Size = Drawings.colourpicker_fill.Size, ZIndex = V2.window.baseZindex + 7}, Arg1.window.allDrawings, V2.onToggle, V2.tab.toggleDrawings)
				if (not V2.window.cachedImages.cp_overlay) then
					local V6 = Fn5("Image", {Visible = false, Transparency = 1, Data = Fn3("overlay"), Position = Drawings.background_fill.Position + New(5, 5), Size = New(125, 125), ZIndex = V2.window.baseZindex + 6}, Arg1.window.allDrawings)
					V2.window.cachedImages.cp_overlay = {toggle = true, drawing = V6}
				end
				if (not V2.window.cachedImages.cp_huefill) then
					local V10 = Fn5("Image", {Visible = false, Transparency = 1, Data = Fn3("hue"), Position = Drawings.colourpicker_fill.Position + New(Drawings.colourpicker_fill.Size.X + 5, 0), Size = New(10, Drawings.colourpicker_fill.Size.Y), ZIndex = V2.window.baseZindex + 5}, Arg1.window.allDrawings)
					V2.window.cachedImages.cp_huefill = {toggle = true, drawing = V10}
				end
				Drawings.hue_outline = Fn5("Square", {Visible = false, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(0, 0, 0), Position = Drawings.colourpicker_fill.Position + New(Drawings.colourpicker_fill.Size.X + 5, 0), Size = New(10, Drawings.colourpicker_fill.Size.Y), ZIndex = V2.window.baseZindex + 6}, Arg1.window.allDrawings, V2.onToggle, V2.tab.toggleDrawings)
				Drawings.huepicker = Fn5("Square", {Visible = false, Filled = true, Transparency = 1, Thickness = 1, Color = FromRGB(255, 255, 255), Size = New(14, 6), ZIndex = V2.window.baseZindex + 7}, Arg1.window.allDrawings, V2.onToggle, V2.tab.toggleDrawings)
				Drawings.huepicker_outline = Fn5("Square", {Visible = false, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(0, 0, 0), Size = Drawings.huepicker.Size, ZIndex = V2.window.baseZindex + 8}, Arg1.window.allDrawings, V2.onToggle, V2.tab.toggleDrawings)
				Drawings.colourpick = Fn5("Square", {Visible = false, Filled = true, Transparency = 1, Thickness = 1, Color = FromRGB(255, 255, 255), Size = New(6, 6), ZIndex = V2.window.baseZindex + 7}, Arg1.window.allDrawings, V2.onToggle, V2.tab.toggleDrawings)
				Drawings.colourpick_outline = Fn5("Square", {Visible = false, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(0, 0, 0), Size = Drawings.colourpick.Size, ZIndex = V2.window.baseZindex + 8}, Arg1.window.allDrawings, V2.onToggle, V2.tab.toggleDrawings)
			end
			V2.setValue = function(Arg1_2)
				V2.value = Arg1_2
				V2.flag.value = Arg1_2
				V2.flag.Changed(Arg1_2)
				V2:update()
			end
			local Fn = function()
				local V5 = not V2.drawings.background_fill.Visible
				local ToggleDrawings = V2.tab.toggleDrawings
				local OnToggle = V2.onToggle
				for Key, Value in V2.window.cachedImages do
					if (Value.toggle) then
						Value.drawing.Visible = false
					end
				end
				for Index = 1, #ToggleDrawings do
					ToggleDrawings[Index].Visible = false
				end
				for Index2 = 1, #OnToggle do
					OnToggle[Index2].Visible = V5
				end
				if (V5) then
					local Drawing3 = V2.window.cachedImages.cp_huefill.drawing
					local Drawing4 = V2.window.cachedImages.cp_overlay.drawing
					Drawing3.Position = V2.drawings.colourpicker_fill.Position + New(V2.drawings.colourpicker_fill.Size.X + 5, 0)
					Drawing4.Position = V2.drawings.background_fill.Position + New(5, 5)
					Drawing3.Visible = true
					Drawing4.Visible = true
				end
			end
			local Fn4 = function()
				local Hue_outline = V2.drawings.hue_outline
				local Y2 = Hue_outline.Position.Y
				local Y3 = Hue_outline.Size.Y
				local V5
				V5 = V18.RenderStepped:Connect(function()
					if (not V2.window.mouseHeld) then
						return V5:Disconnect()
					end
					local V6 = Clamp2((V17:GetMouseLocation().Y - Y2) / Y3, 0, 1)
					V2.h = V6
					local Drawings = V2.drawings
					local Hue_outline = Drawings.hue_outline
					Drawings.huepicker.Position = Hue_outline.Position + New(-2, Round2((Y3 - 6) * V6))
					Drawings.huepicker_outline.Position = Drawings.huepicker.Position
					V2:updateHue()
				end)
			end
			local Fn7 = function()
				local Drawings = V2.drawings
				local Colourpicker_outline = Drawings.colourpicker_outline
				local Size = Colourpicker_outline.Size
				local Position = Colourpicker_outline.Position
				local V5 = Colourpicker_outline.Size - New(6, 6)
				local V6
				V6 = V18.RenderStepped:Connect(function()
					if (not V2.window.mouseHeld) then
						return V6:Disconnect()
					end
					local V10 = (V17:GetMouseLocation() - Position) / Size
					V2.s, V2.v = Clamp2(V10.X, 0, 1), Abs(Clamp2(V10.Y, 0, 1) - 1)
					local V11 = Colourpicker_outline.Position + New(V5.X * V2.s, V5.Y * Abs(V2.v - 1))
					V11 = New(Round2(V11.X), Round2(V11.Y))
					Drawings.colourpick.Position = V11
					Drawings.colourpick_outline.Position = V11
					V2:update_SaturationValue()
				end)
			end
			V2.window:onClick(V2.drawings.colour_outline, Fn)
			V2.window:onClick(V2.drawings.hue_outline, Fn4, nil, true)
			V2.window:onClick(V2.drawings.colourpicker_outline, Fn7, nil, true)
			V2:update()
			return V2
		end
		do
			V21.moveTo = function(Arg1, Arg2, Arg3)
				if (Arg1.move_connection) then
					Arg1.move_connection:Disconnect()
					Arg1.move_connection = nil
				end
				local Drawings = Arg1.drawings
				local Position = Drawings.background.Position
				local V2 = Arg2 - Position
				local T2 = {}
				for Key, Value in Drawings do
					T2[Key] = Value.Position
				end
				local V5 = 0
				Arg1.move_connection = V18.RenderStepped:Connect(function(Arg1_2)
					V5 += Arg1_2
					if (V5 >= Arg3) then
						for Key, Value in T2 do
							Drawings[Key].Position = Value + V2
						end
						Arg1.move_connection:Disconnect()
						Arg1.move_connection = nil
						return
					end
					local V6 = V5 / Arg3
					for Key2, Value2 in T2 do
						Drawings[Key2].Position = Value2 + V2 * V6
					end
				end)
			end
			V21.remove = function(Arg1)
				local Notifications = Arg1.window.notifications
				local Drawings = Arg1.drawings
				local V2 = Arg1.offset + 10
				local V5 = V11(Notifications, Arg1)
				V12(Notifications, V5)
				Arg1:moveTo(New(10, -V2), 0.05)
				local V6 = 0
				Arg1.connection = V18.RenderStepped:Connect(function(Arg1_2)
					V6 += Arg1_2
					if (V6 >= 0.05) then
						for Key, Value in Drawings do
							Value:Remove()
						end
						Arg1.connection:Disconnect()
						return
					end
				end)
				for Index = 1, #Notifications do
					if (Index < V5) then
						continue
					end
					local V7 = Notifications[Index]
					V7.goalPos -= New(0, V2)
					V7:moveTo(V7.goalPos, 0.05)
				end
			end
		end
		do
			V22.toggle = function(Arg1, Arg2)
				if (Arg2 == nil) then
					Arg2 = not Arg1.active
				end
				Arg1.active = Arg2
				Arg1.mouseHeld = false
				for Index = 1, #Arg1.allDrawings do
					Arg1.allDrawings[Index].Visible = Arg2
				end
				if (Arg2) then
					for Key, Value in Arg1.storedText do
						Value.drawing.Visible = Value.shown
					end
				end
			end
			V22.isWithin = function(Arg1, Arg2, Arg3)
				local Size = Arg2.Size
				local V2 = Arg3 - Arg2.Position
				return (V2.X > 0 and V2.Y > 0 and V2.X < Size.X and V2.Y < Size.Y)
			end
			V22.onClick = function(Arg1, Arg2, Arg3)
				local Fn = function(Arg1_2)
					if (Arg2.Visible and Arg1:isWithin(Arg2, Arg1_2)) then
						return Arg3(Arg1_2)
					end
				end
				V10(Arg1.clickDetectors, Fn)
			end
			V22.getScale = function(Arg1)
				return Arg1.drawings.base.Position / V19.ViewportSize
			end
			V22.setScale = function(Arg1, Arg2)
				local V2 = Arg2 * V19.ViewportSize
				local V5 = V2 - Arg1.drawings.base.Position
				Arg1.mouseHeld = false
				for Index = 1, #Arg1.allDrawings do
					Arg1.allDrawings[Index].Position += V5
				end
			end
			V22.addText = function(Arg1, Arg2, Arg3, Arg4, Arg5)
				local T2 = {side = Arg2, text = Arg3, shown = Arg5 == nil and true or Arg5, colour = Arg4, drawing = Arg1.cachedDrawings[1]}
				if (not T2.drawing) then
					T2.drawing = Fn5("Text", {Visible = (Arg1.active and T2.shown) or false, Center = false, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = T2.text, Color = T2.colour, OutlineColor = FromRGB(0, 0, 0), ZIndex = 9}, Arg1.allDrawings)
				else
					V12(Arg1.cachedDrawings, 1)
					T2.drawing.Visible = (Arg1.active and T2.shown) or false
					T2.drawing.Color = T2.colour
					T2.drawing.Text = T2.text
				end
				local V2 = 0
				for Index = 1, #Arg1.storedText do
					if (Arg1.storedText[Index].side == T2.side and T2.shown) then
						V2 += 1
					end
				end
				T2.drawing.Position = Arg1.drawings.base.Position + New(Arg2 == "left" and 2 or Arg1.drawings.base.Size.X - T2.drawing.TextBounds.X - 2, V2 * 20 + 27)
				V10(Arg1.storedText, T2)
				return T2
			end
			V22.removeText = function(Arg1, Arg2, Arg3)
				local V2 = false
				local V5 = 0
				for Key, Value in Arg1.storedText do
					if (Value.side ~= Arg2) then
						continue
					elseif (V2) then
						Arg1.mouseHeld = false
						Value.drawing.Position = Arg1.drawings.base.Position + New(Arg2 == "left" and 2 or Arg1.drawings.base.Size.X - Value.drawing.TextBounds.X - 2, (V5 - 1) * 20 + 27)
					elseif (Value.text == Arg3) then
						V2 = true
						Value.drawing.Visible = false
						V10(Arg1.cachedDrawings, Value.drawing)
						V12(Arg1.storedText, Key)
					end
					V5 += 1
				end
			end
			V22.update = function(Arg1)
				local V2 = 0
				local V5 = 0
				for Key, Value in Arg1.storedText do
					local Drawing3 = Value.drawing
					local Side = Value.side
					Drawing3.Visible = Arg1.active and Value.shown
					if not (Value.text == Drawing3.Text and Value.colour == Drawing3.Color) then
						Drawing3.Text = Value.text
						Drawing3.Color = Value.colour
					end
					if (Value.shown) then
						Value.drawing.Position = Arg1.drawings.base.Position + New(Side == "left" and 2 or Arg1.drawings.base.Size.X - Value.drawing.TextBounds.X - 2, (Side == "left" and V2 or V5) * 20 + 27)
						if (Value.side == "left") then
							V2 += 1
						else
							V5 += 1
						end
					end
				end
				local V6 = 27 + Max(V2, V5) * 20
				local X2 = Arg1.drawings.base.Size.X
				Arg1.drawings.base.Size = New(X2, V6)
				Arg1.drawings.baseOutline.Size = New(X2 + 2, V6 + 2)
			end
			V22.findText = function(Arg1, Arg2, Arg3)
				for Key, Value in Arg1.storedText do
					if (Value.text == Arg3 and Value.side == Arg2) then
						return Value
					end
				end
			end
		end
		do
			V23.toggle = function(Arg1, Arg2)
				if (Arg1.active == Arg2 or Type(Arg2) ~= "boolean") then
					return
				end
				Arg1.active = Arg2
				Arg1.mouseHeld = false
				for Index = 1, #Arg1.allDrawings do
					Arg1.allDrawings[Index].Visible = Arg2
				end
			end
			V23.isWithin = function(Arg1, Arg2, Arg3)
				local Size = Arg2.Size
				local V2 = Arg3 - Arg2.Position
				return (V2.X > 0 and V2.Y > 0 and V2.X < Size.X and V2.Y < Size.Y)
			end
			V23.onClick = function(Arg1, Arg2, Arg3)
				local Fn = function(Arg1_2)
					if (Arg2.Visible and Arg1:isWithin(Arg2, Arg1_2)) then
						return Arg3(Arg1_2)
					end
				end
				V10(Arg1.clickDetectors, Fn)
			end
			V23.getScale = function(Arg1)
				return Arg1.drawings.base.Position / V19.ViewportSize
			end
			V23.setScale = function(Arg1, Arg2)
				local V2 = Arg2 * V19.ViewportSize
				local V5 = V2 - Arg1.drawings.base.Position
				Arg1.mouseHeld = false
				for Index = 1, #Arg1.allDrawings do
					Arg1.allDrawings[Index].Position += V5
				end
			end
			V23.setName = function(Arg1, Arg2)
				if (Arg2 and Arg1.values.name ~= Arg2) then
					Arg1.drawings.name.Text = Arg2
				end
			end
			V23.setDistance = function(Arg1, Arg2)
				if (Arg2 and Arg1.values.distance ~= Arg2) then
					Arg1.drawings.distance.Text = ("distance: " .. tostring(Arg2) .. " studs")
				end
			end
			V23.setWeapon = function(Arg1, Arg2)
				if (Arg2 and Arg1.values.weapon ~= Arg2) then
					Arg1.drawings.weapon.Text = ("weapon: " .. tostring(Arg2))
				end
			end
			V23.setHealth = function(Arg1, Arg2, Arg3)
				if (not Arg2 or not Arg3 or Arg1.values.health == Arg2 or Arg1.values.maxHealth == Arg3) then
					return
				end
				local V2 = 278
				local V5 = Arg2 / Arg3
				local V6 = FromRGB(255, 0, 0):Lerp(FromRGB(0, 255, 0), V5)
				Arg1.drawings.healthbar.Size = New(Max(278 * V5, 0), 6)
				Arg1.drawings.healthbar.Color = V6
			end
		end
		do
			V24.addTab = function(Arg1, Arg2)
				return V25.new(Arg1, Arg2)
			end
			V24.reloadTabs = function(Arg1)
				local Tabs = Arg1.tabSettings.tabs
				for Index = 1, #Tabs do
					Tabs[Index]:reload()
				end
			end
			V24.isWithin = function(Arg1, Arg2, Arg3)
				local Size = Arg2.Size
				local V2 = Arg3 - Arg2.Position
				return (V2.X > 0 and V2.Y > 0 and V2.X < Size.X and V2.Y < Size.Y)
			end
			V24.onClick = function(Arg1, Arg2, Arg3, Arg4, Arg5)
				Arg4 = Arg4 or function(...)
				end
				local Fn = function(Arg1_2)
					if not (Arg2.Visible and Arg1:isWithin(Arg2, Arg1_2)) then
						return Arg4(Arg1_2)
					elseif (Arg5) then
						return Arg3(Arg1_2)
					end
					for Index = 1, #Arg1.overlapDrawings do
						local V2 = Arg1.overlapDrawings[Index]
						if (V2.Visible and Arg1:isWithin(V2, Arg1_2)) then
							return Arg4(Arg1_2)
						end
					end
					return Arg3(Arg1_2)
				end
				V10(Arg1.clickDetectors, Fn)
			end
			V24.toggle = function(Arg1)
				local V2 = not Arg1.active
				Arg1.active = V2
				for Index = 1, #Arg1.connectedToggles do
					Spawn(Arg1.connectedToggles[Index], V2)
				end
				local V5 = V2 and New(99999, 99999) or New(-99999, -99999)
				for Index2 = 1, #Arg1.allDrawings do
					Arg1.allDrawings[Index2].Position += V5
				end
			end
			V24.onToggle = function(Arg1, Arg2)
				V10(Arg1.connectedToggles, Arg2)
			end
			V24.addKeyDetector = function(Arg1, Arg2)
				V10(Arg1.keyDetectors, Arg2)
			end
			V24.addKeyEnd = function(Arg1, Arg2)
				V10(Arg1.keyEnd, Arg2)
			end
			V24.notify = function(Arg1, Arg2, Arg3)
				return V21.new(Arg1, Arg2, Arg3)
			end
		end
		do
			V25.reload = function(Arg1)
				local Window = Arg1.window
				local Index = Window.tabSettings.index
				local X2 = Window.drawings.innerOutline.Size.X
				local V2 = Ceil(X2 / Index)
				local V5 = V2 * (Arg1.id - 1)
				Arg1.drawings.outline.Position = Window.drawings.innerOutline.Position + New(V5, 0)
				if (Arg1.id == Index) then
					Arg1.drawings.outline.Size = New((X2 - V2 * (Index - 1)), 41)
				else
					Arg1.drawings.outline.Size = New(V2 + 1, 41)
				end
				Arg1.drawings.text.Position = Arg1.drawings.outline.Position + New(Arg1.drawings.outline.Size.X / 2, 14)
			end
			V25.toggle = function(Arg1, Arg2)
				if (Arg2 == nil) then
					Arg2 = not Arg1.active
				end
				for Key, Value in Arg1.window.cachedImages do
					if (Value.toggle) then
						Value.drawing.Visible = false
					end
				end
				Arg1.active = Arg2
				local AllDrawings = Arg1.allDrawings
				if (Arg2) then
					Arg1.drawings.text.Color = FromRGB(255, 255, 255)
					for Index = 1, #AllDrawings do
						AllDrawings[Index].Visible = true
					end
				else
					local ToggleDrawings = Arg1.toggleDrawings
					Arg1.drawings.text.Color = FromRGB(195, 195, 195)
					for Index2 = 1, #AllDrawings do
						AllDrawings[Index2].Visible = false
					end
					for Index3 = 1, #ToggleDrawings do
						ToggleDrawings[Index3].Visible = false
					end
				end
			end
			V25.addToggle = function(Arg1, Arg2, Arg3)
				return V26.new(Arg1, Arg2, Arg3)
			end
			V25.addSlider = function(Arg1, Arg2, Arg3)
				return V27.new(Arg1, Arg2, Arg3)
			end
			V25.addDropdown = function(Arg1, Arg2, Arg3)
				return V28.new(Arg1, Arg2, Arg3)
			end
			V25.addButton = function(Arg1, Arg2, Arg3, Arg4)
				return V30.new(Arg1, Arg2, Arg3, Arg4)
			end
		end
		do
			V31.update = function(Arg1)
				local Drawings = Arg1.drawings
				local Text = Drawings.text
				local ClickDetector = Drawings.clickDetector
				Text.Text = ("[" .. tostring(Arg1.value) .. "]")
				local TextBounds = Text.TextBounds
				local V2 = Arg1.toggle.drawings.outline.Position + New(Arg1.window.drawings.sectionOutline1.Size.X - 30 - TextBounds.X, 0)
				Text.Position = V2
				ClickDetector.Size = TextBounds
				ClickDetector.Position = V2
			end
		end
		do
			V32.update = function(Arg1)
				local Drawings = Arg1.drawings
				Arg1.h, Arg1.s, Arg1.v = Arg1.value:ToHSV()
				Drawings.colourpicker_fill.Color = FromHSV(Arg1.h, 1, 1)
				Drawings.colour_fill.Color = Arg1.value
				local Hue_outline = Drawings.hue_outline
				local Colourpicker_outline = Drawings.colourpicker_outline
				local V2 = Colourpicker_outline.Size - New(6, 6)
				local V5 = Hue_outline.Size.Y - 6
				Drawings.huepicker.Position = Hue_outline.Position + New(-2, V5 * Arg1.h)
				Drawings.huepicker_outline.Position = Drawings.huepicker.Position
				Drawings.colourpick.Position = Colourpicker_outline.Position + New(V2.X * Arg1.s, V2.Y * Abs(Arg1.v - 1))
				Drawings.colourpick_outline.Position = Drawings.colourpick.Position
			end
			V32.updateHue = function(Arg1)
				local Drawings = Arg1.drawings
				local V2 = FromHSV(Arg1.h, Arg1.s, Arg1.v)
				Drawings.colourpicker_fill.Color = FromHSV(Arg1.h, 1, 1)
				Drawings.colour_fill.Color = V2
				Arg1.value = V2
				Arg1.flag.value = V2
				Arg1.flag.Changed(V2)
			end
			V32.update_SaturationValue = function(Arg1)
				local V2 = FromHSV(Arg1.h, Arg1.s, Arg1.v)
				Arg1.drawings.colour_fill.Color = V2
				Arg1.value = V2
				Arg1.flag.value = V2
				Arg1.flag.Changed(V2)
			end
		end
		do
			V26.onClicked = function(Arg1)
				local V2 = not Arg1.enabled
				Arg1.enabled = V2
				Arg1.flag.value = V2
				Arg1.flag.Changed(V2)
				Arg1.drawings.accent.Transparency = V2 and 1 or 0
			end
			V26.addKeypicker = function(Arg1, Arg2)
				return V31.new(Arg1, Arg2)
			end
			V26.addColourpicker = function(Arg1, Arg2)
				return V32.new(Arg1, Arg2)
			end
		end
		return {windowClass = V24, boardClass = V22, targethudClass = V23}
	end)()
end)()
local V58 = (function()
	local UserInputService = V32
	local RunService = V35
	local Players = V37
	local Camera = V38
	local LocalPlayer = V39
	local DrawingNew = Drawing2.new
	local Vector2New = Vector2_2.new
	local Vector3New = Vector3_2.new
	local FromRGB = Color3_2.fromRGB
	local Insert = Table.insert
	local Floor = Math.floor
	local Huge = Math.huge
	local CFrameNew = CFrame2.new

	local WHITE = FromRGB(255, 255, 255)
	local BLACK = FromRGB(0, 0, 0)
	local RED = FromRGB(255, 0, 0)
	local GREEN = FromRGB(0, 255, 0)

	-- headless mode: rendering is handled by the Potato ESP engine, this
	-- library only tracks entities for the aimbot / target hud / weapon detection
	local HEADLESS = PH_ESP_HEADLESS == true
	local function createDrawing(class, props)
		local obj = HEADLESS and {Remove = function() end} or DrawingNew(class)
		for k, v in props do
			obj[k] = v
		end
		return obj
	end

	local function makeDrawings(withWeapon, withHealth)
		local d = {}
		d.boxOutline = createDrawing("Square", {Visible = false, Filled = false, Thickness = 3, Transparency = 1, Color = BLACK, ZIndex = 1})
		d.box = createDrawing("Square", {Visible = false, Filled = false, Thickness = 1, Transparency = 1, Color = WHITE, ZIndex = 2})
		d.name = createDrawing("Text", {Visible = false, Center = true, Outline = true, OutlineColor = BLACK, Color = WHITE, Transparency = 1, Size = 13, Font = 2, ZIndex = 3})
		d.distance = createDrawing("Text", {Visible = false, Center = true, Outline = true, OutlineColor = BLACK, Color = WHITE, Transparency = 1, Size = 13, Font = 2, ZIndex = 3})
		if withWeapon then
			d.weapon = createDrawing("Text", {Visible = false, Center = true, Outline = true, OutlineColor = BLACK, Color = WHITE, Transparency = 1, Size = 13, Font = 2, ZIndex = 3})
		end
		if withHealth then
			d.healthbarOutline = createDrawing("Square", {Visible = false, Filled = true, Thickness = 1, Transparency = 1, Color = BLACK, ZIndex = 1})
			d.healthbar = createDrawing("Square", {Visible = false, Filled = true, Thickness = 1, Transparency = 1, Color = GREEN, ZIndex = 2})
		end
		return d
	end

	local function hideAll(d)
		for _, obj in d do
			if obj.Visible then
				obj.Visible = false
			end
		end
	end

	local function removeAll(d)
		for k, obj in d do
			pcall(obj.Remove, obj)
			d[k] = nil
		end
	end

	local corners = {
		Vector3New(1, 1, 1), Vector3New(1, 1, -1), Vector3New(1, -1, 1), Vector3New(1, -1, -1),
		Vector3New(-1, 1, 1), Vector3New(-1, 1, -1), Vector3New(-1, -1, 1), Vector3New(-1, -1, -1),
	}

	local function project(cf, size)
		local half = size * 0.5
		local minX, minY, maxX, maxY = Huge, Huge, -Huge, -Huge
		local anyFront = false
		for i = 1, 8 do
			local world = cf:PointToWorldSpace(half * corners[i])
			local v, onScreen = Camera:WorldToViewportPoint(world)
			if v.Z > 0 then
				anyFront = true
			end
			if v.X < minX then minX = v.X end
			if v.X > maxX then maxX = v.X end
			if v.Y < minY then minY = v.Y end
			if v.Y > maxY then maxY = v.Y end
		end
		if not anyFront then
			return nil
		end
		local vp = Camera.ViewportSize
		if maxX < 0 or maxY < 0 or minX > vp.X or minY > vp.Y then
			return nil
		end
		return minX, minY, maxX - minX, maxY - minY
	end

	local function modelBounds(inst)
		if inst:IsA("Model") then
			local ok, cf, size = pcall(inst.GetBoundingBox, inst)
			if ok then
				return cf, size
			end
			return inst:GetPivot(), Vector3New(2, 2, 2)
		elseif inst:IsA("BasePart") then
			return inst.CFrame, inst.Size
		end
		return inst:GetPivot(), Vector3New(2, 2, 2)
	end

	local function drawBox(d, x, y, w, h, settings)
		if settings.box then
			d.boxOutline.Position = Vector2New(x, y)
			d.boxOutline.Size = Vector2New(w, h)
			d.boxOutline.Visible = true
			d.box.Position = Vector2New(x, y)
			d.box.Size = Vector2New(w, h)
			d.box.Visible = true
		else
			d.boxOutline.Visible = false
			d.box.Visible = false
		end
	end

	local function drawTexts(d, x, y, w, h, settings, nameText, distanceText, weaponText)
		local bottom = y + h + 2
		if settings.name then
			d.name.Text = nameText
			d.name.Position = Vector2New(x + w / 2, y - 16)
			d.name.Visible = true
		else
			d.name.Visible = false
		end
		if settings.distance then
			d.distance.Text = distanceText
			d.distance.Position = Vector2New(x + w / 2, bottom)
			d.distance.Visible = true
			bottom += 14
		else
			d.distance.Visible = false
		end
		if d.weapon then
			if settings.weapon and weaponText and weaponText ~= "" then
				d.weapon.Text = weaponText
				d.weapon.Position = Vector2New(x + w / 2, bottom)
				d.weapon.Visible = true
			else
				d.weapon.Visible = false
			end
		end
	end

	local function drawHealth(d, x, y, w, h, settings, health, maxHealth)
		if not d.healthbar then
			return
		end
		if settings.healthbar and health and maxHealth and maxHealth > 0 then
			local frac = health / maxHealth
			if frac < 0 then frac = 0 elseif frac > 1 then frac = 1 end
			d.healthbarOutline.Position = Vector2New(x - 6, y - 1)
			d.healthbarOutline.Size = Vector2New(4, h + 2)
			d.healthbarOutline.Visible = true
			local fillH = Floor(h * frac)
			d.healthbar.Position = Vector2New(x - 5, y + (h - fillH))
			d.healthbar.Size = Vector2New(2, fillH)
			d.healthbar.Color = RED:Lerp(GREEN, frac)
			d.healthbar.Visible = true
		else
			d.healthbarOutline.Visible = false
			d.healthbar.Visible = false
		end
	end

	local function fireAll(list, ...)
		for i = 1, #list do
			local ok, err = pcall(list[i], ...)
			if not ok then
				warn(err)
			end
		end
	end

	local function disconnectAll(list)
		for i = #list, 1, -1 do
			pcall(function()
				list[i]:Disconnect()
			end)
			list[i] = nil
		end
	end

	-- ============================== PLAYER ESP ==============================
	local PlayerESP = {playerCache = {}, drawingAdded = {}, childAdded = {}, childRemoved = {}}
	local PlayerObject = {}
	PlayerObject.__index = PlayerObject

	function PlayerESP.onDrawingAdded(fn)
		Insert(PlayerESP.drawingAdded, fn)
	end
	function PlayerESP.onChildAdded(fn)
		Insert(PlayerESP.childAdded, fn)
	end
	function PlayerESP.onChildRemoved(fn)
		Insert(PlayerESP.childRemoved, fn)
	end

	function PlayerObject:hideDrawings()
		hideAll(self.drawings)
	end

	function PlayerObject:loop(settings)
		local current = self.current
		if not (current and current.active and current.character) then
			return self:hideDrawings()
		end
		local character = current.character
		if character.Parent == nil then
			return self:hideDrawings()
		end
		local humanoid = current.humanoid
		if not humanoid then
			return self:hideDrawings()
		end
		local health = humanoid.Health
		if health <= 0 then
			return self:hideDrawings()
		end
		local cf, size = modelBounds(character)
		local x, y, w, h = project(cf, size)
		if not x then
			return self:hideDrawings()
		end
		local d = self.drawings
		drawBox(d, x, y, w, h, settings)
		local dist = Floor((Camera.CFrame.Position - cf.Position).Magnitude)
		local weapon = current.weapon
		local weaponText = weapon and weapon.Name or nil
		drawTexts(d, x, y, w, h, settings, self.player.DisplayName or self.player.Name, ("[" .. tostring(dist) .. " studs]"), weaponText)
		drawHealth(d, x, y, w, h, settings, health, humanoid.MaxHealth)
	end

	function PlayerObject:setCharacter(character)
		disconnectAll(self.characterConnections)
		if not character then
			if self.current then
				self.current.active = false
			end
			self:hideDrawings()
			return
		end
		local current = {active = true, character = character, humanoid = nil, rootPart = nil, weapon = nil, health = 100, maxHealth = 100}
		self.current = current
		local conns = self.characterConnections
		local function hookHumanoid(humanoid)
			current.humanoid = humanoid
			current.health = humanoid.Health
			current.maxHealth = humanoid.MaxHealth
			Insert(conns, humanoid.HealthChanged:Connect(function(h)
				current.health = h
				current.maxHealth = humanoid.MaxHealth
			end))
			Insert(conns, humanoid.Died:Connect(function()
				current.active = false
			end))
		end
		local function onChild(child)
			if child:IsA("Humanoid") then
				hookHumanoid(child)
			elseif child.Name == "HumanoidRootPart" then
				current.rootPart = child
			end
			fireAll(PlayerESP.childAdded, self, child)
		end
		Insert(conns, character.ChildAdded:Connect(onChild))
		Insert(conns, character.ChildRemoved:Connect(function(child)
			if child == current.humanoid then
				current.active = false
			end
			fireAll(PlayerESP.childRemoved, self, child)
		end))
		for _, child in character:GetChildren() do
			onChild(child)
		end
	end

	function PlayerObject:destroy()
		disconnectAll(self.characterConnections)
		disconnectAll(self.connections)
		removeAll(self.drawings)
		if self.current then
			self.current.active = false
		end
	end

	function PlayerESP.new(player)
		if not player or player == LocalPlayer or PlayerESP.playerCache[player] then
			return PlayerESP.playerCache[player]
		end
		local self = setmetatable({
			player = player,
			drawings = makeDrawings(true, true),
			current = nil,
			connections = {},
			characterConnections = {},
		}, PlayerObject)
		PlayerESP.playerCache[player] = self
		fireAll(PlayerESP.drawingAdded, self)
		Insert(self.connections, player.CharacterAdded:Connect(function(character)
			self:setCharacter(character)
		end))
		Insert(self.connections, player.CharacterRemoving:Connect(function()
			self:setCharacter(nil)
		end))
		if player.Character then
			self:setCharacter(player.Character)
		end
		return self
	end

	function PlayerESP.remove(player)
		local self = PlayerESP.playerCache[player]
		if not self then
			return
		end
		PlayerESP.playerCache[player] = nil
		self:destroy()
	end

	-- ============================== GENERIC (NPC / ENTITY) ==============================
	local function makeGeneric(cacheName, withHealth)
		local Lib = {[cacheName] = {}, drawingAdded = {}}
		local cache = Lib[cacheName]
		local Object = {}
		Object.__index = Object

		function Lib.onDrawingAdded(fn)
			Insert(Lib.drawingAdded, fn)
		end

		function Object:hideDrawings()
			hideAll(self.drawings)
		end

		function Object:destroy()
			disconnectAll(self.connections)
			removeAll(self.drawings)
			if self.current then
				self.current.active = false
			end
			cache[self.entity] = nil
		end

		function Object:loop(settings, magnitude)
			local entity = self.entity
			if entity.Parent == nil then
				return self:destroy()
			end
			local current = self.current
			local humanoid = current and current.humanoid
			if humanoid and humanoid.Health <= 0 then
				return self:hideDrawings()
			end
			local cf, size
			if self.staticSize then
				cf, size = entity:GetPivot(), self.staticSize
			else
				cf, size = modelBounds(entity)
			end
			local x, y, w, h = project(cf, size)
			if not x then
				return self:hideDrawings()
			end
			local d = self.drawings
			drawBox(d, x, y, w, h, settings)
			local dist = magnitude and Floor(magnitude) or Floor((Camera.CFrame.Position - cf.Position).Magnitude)
			drawTexts(d, x, y, w, h, settings, self.displayName, ("[" .. tostring(dist) .. " studs]"), nil)
			if withHealth then
				local health, maxHealth
				if humanoid then
					health, maxHealth = humanoid.Health, humanoid.MaxHealth
				else
					health, maxHealth = entity:GetAttribute("Health"), entity:GetAttribute("MaxHealth")
				end
				if current then
					current.health, current.maxHealth = health, maxHealth
					self.health, self.maxHealth = health, maxHealth
				end
				drawHealth(d, x, y, w, h, settings, health, maxHealth)
			end
		end

		function Lib.new(entity, settingName, shortName, colour, isAnimal)
			if not entity or cache[entity] then
				return cache[entity]
			end
			local self = setmetatable({
				entity = entity,
				settingName = settingName,
				name = shortName,
				displayName = shortName,
				isAnimal = isAnimal or false,
				drawings = makeDrawings(false, withHealth),
				connections = {},
				current = nil,
			}, Object)
			if colour then
				self.drawings.box.Color = colour
				self.drawings.name.Color = colour
				self.drawings.distance.Color = colour
			end
			if withHealth then
				local humanoid = entity:FindFirstChildOfClass("Humanoid")
				self.current = {active = true, character = entity, humanoid = humanoid, health = humanoid and humanoid.Health or entity:GetAttribute("Health"), maxHealth = humanoid and humanoid.MaxHealth or entity:GetAttribute("MaxHealth")}
				if not humanoid then
					Insert(self.connections, entity.ChildAdded:Connect(function(child)
						if child:IsA("Humanoid") then
							self.current.humanoid = child
						end
					end))
				end
			else
				local ok, size = pcall(function()
					if entity:IsA("Model") then
						return entity:GetExtentsSize()
					elseif entity:IsA("BasePart") then
						return entity.Size
					end
				end)
				if ok and size then
					self.staticSize = size
				end
			end
			cache[entity] = self
			Insert(self.connections, entity.AncestryChanged:Connect(function(_, parent)
				if parent == nil then
					self:destroy()
				end
			end))
			fireAll(Lib.drawingAdded, self)
			return self
		end

		function Lib.remove(entity)
			local self = cache[entity]
			if self then
				self:destroy()
			end
		end

		return Lib
	end

	local NpcESP = makeGeneric("npcCache", true)
	local EntityESP = makeGeneric("entityCache", false)

	return {playerESP = PlayerESP, npcESP = NpcESP, entityESP = EntityESP}
end)()
local PlayerESP = V58.playerESP
local NpcESP = V58.npcESP
local EntityESP = V58.entityESP
local V59, V60
do
	local function Log() end
	local Name = "Potato"
	local Directory = "Potato"
	local ConfigsFolder = Directory .. "/Configs"
	pcall(makefolder, Directory)
	pcall(makefolder, ConfigsFolder)
	local function GetImage() return "" end
	local function GetService(Service)
		local S = game:GetService(Service)
		return (cloneref and cloneref(S)) or S
	end
	local HttpService = GetService("HttpService")
	local UserInputService = GetService("UserInputService")
	local Workspace = GetService("Workspace")
	local RunService = GetService("RunService")
	local TweenService = GetService("TweenService")
	local TextService = GetService("TextService")
	local Players = GetService("Players")
	local GuiService = GetService("GuiService")
	local CoreGui = (function()
		local ok, hidden = pcall(function() return gethui and gethui() end)
		if ok and hidden then return hidden end
		return GetService("CoreGui")
	end)()
	local Camera = Workspace.CurrentCamera
	local Client = Players.LocalPlayer
	local Mouse = Client:GetMouse()
	local MouseConstant = 30
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
	local HIDDEN_PREFIXES = {"playerEsp_", "npcEsp_", "entityEsp_"}
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
	;(function()
	-- ====================== Potato.hook ESP engine ======================
	local ReplicatedStorage = GetService("ReplicatedStorage")
	local Lighting = GetService("Lighting")
	local Fonts = {}
	do
		local Fallback = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold)
		Fonts.SmallestPixel = Fallback
		Fonts.Pixel = Fallback
		local function RegisterFont(Name, Asset)
			if not (getcustomasset and isfile and writefile and crypt and crypt.base64) then
				return nil
			end
			if not isfile(Asset.Id) then
				writefile(Asset.Id, crypt.base64.decode(Asset.Font))
			end
			local Data = {
				name = Name,
				faces = {{name = "Regular", weight = 400, style = "normal", assetId = getcustomasset(Asset.Id)}},
			}
			if not isfile(Name .. ".font") then
				writefile(Name .. ".font", HttpService:JSONEncode(Data))
			end
			return Font.new(getcustomasset(Name .. ".font"))
		end
		local Cached = false
		pcall(function()
			if getcustomasset and isfile and isfile("SmallestPixel7.font") and isfile("Minecraft.font") then
				Fonts.SmallestPixel = Font.new(getcustomasset("SmallestPixel7.font"))
				Fonts.Pixel = Font.new(getcustomasset("Minecraft.font"))
				Cached = true
			end
		end)
		if not Cached then
			local ok, err = pcall(function()
				local Base = "https:" .. "//" .. "raw.githubusercontent.com/pqnkdwqn9j-a11y/potatoh/refs/heads/main/"
				local Minecraft = game:HttpGet(Base .. "Minecraft.txt")
				local Small = game:HttpGet(Base .. "smallfont.txt")
				local F1 = RegisterFont("SmallestPixel7", {Id = "smallest-pixel7.ttf", Font = Small})
				local F2 = RegisterFont("Minecraft", {Id = "Minecraft.ttf", Font = Minecraft})
				if F1 then
					Fonts.SmallestPixel = F1
				end
				if F2 then
					Fonts.Pixel = F2
				end
			end)
			if not ok then
				warn("[Potato.hook] font load failed: " .. tostring(err))
			end
		end
	end

	local TEAMMATE_COLOR = Color3.fromRGB(90, 220, 120)
	local TEAMMATE_COLOR_DIM = Color3.fromRGB(46, 120, 66)

	local clanControllerShared = { cachedTeamModels = {} }
	do
		local ok, cc = pcall(function()
			local ps = Client:FindFirstChild("PlayerScripts")
			return ps and ps:FindFirstChild("ClanController")
		end)
		if ok and cc then
			local ok2, env = pcall(function()
				return getsenv(cc)
			end)
			if ok2 and type(env) == "table" and type(env.shared) == "table" then
				clanControllerShared = env.shared
			end
		end
	end
	task.spawn(function()
		local ok, cc = pcall(function()
			return Client:WaitForChild("PlayerScripts", 15):WaitForChild("ClanController", 15)
		end)
		if ok and cc then
			local ok2, env = pcall(function()
				return getsenv(cc)
			end)
			if ok2 and type(env) == "table" and type(env.shared) == "table" then
				clanControllerShared = env.shared
			end
		end
	end)

	local isTeam = (function(Player)  
		if typeof(Player) ~= "Instance" or not Player:IsA("Player") then
			return false
		end
		local teamCache = clanControllerShared and clanControllerShared.cachedTeamModels
		if type(teamCache) ~= "table" then
			return false
		end
		return teamCache[Player.UserId] and true or false
	end)

	local EntityClass = {
		Main = {
			Cache = {},
			Functions = {},
		},

		Misc = {
			Cache = {},
			Functions = {},
		},

		Global = {},
		Flags = {},

		AnimationSpeed = 0.15,
		WeaponImages = {
			["Salvaged Skorpion"] = GetImage("Salvaged Skorpion"),
			["Salvaged P250"] = GetImage("Salvaged P250"),
			["Salvaged Python"] = GetImage("Salvaged Python"),
			["Salvaged AK47"] = GetImage("Salvaged AK47"),
			["Salvaged AK74u"] = GetImage("Salvaged AK74u"),
			["Wooden Bow"] = GetImage("Wooden Bow"),
			["Nail Gun"] = GetImage("Salvaged Nailgun"),
			["Salvaged SMG"] = GetImage("Salvaged SMG"),
			["Crossbow"] = GetImage("Crossbow"),
			["Salvaged M14"] = GetImage("Salvaged M14"),

			["Salvaged Sniper"] = GetImage("Salvaged Sniper"),
			["Military M4A1"] = GetImage("Military M4A1"),
			["Bruno's M4A1"] = GetImage("Bruno's M4A1"),
			["Military USP"] = GetImage("Military USP"),
			["Salvaged Pump Action"] = GetImage("Salvaged Pump Action"),
			["Military Barrett"] = GetImage("Military Barrett"),
			["Military PKM"] = GetImage("Military PKM"),
			["Salvaged Break Action"] = GetImage("Salvaged Break Action"),
			["Salvaged Pipe Rifle"] = GetImage("Salvaged Pipe Rifle"),
			["Salvaged Double Barrel"] = GetImage("Salvaged Double Barrel"),
			["Salvaged Shotgun"] = GetImage("Salvaged Shotgun"),
			["Pumpkin Launcher"] = GetImage("Pumpkin Launcher"),
			["Salvaged RPG"] = GetImage("Salvaged RPG"),

			["Steel Axe"] = GetImage("Steel Axe"),
			["Steel Pickaxe"] = GetImage("Steel Pickaxe"),
			["Wooden Spear"] = GetImage("Wooden Spear"),
			["Stone Spear"] = GetImage("Stone Spear"),
			["Small Medkit"] = GetImage("Small Medkit"),
			["Military Grenade"] = GetImage("Military Grenade"),
			["Military Grenade Launcher"] = GetImage("Military Grenade Launcher"),

			["Chainsaw"] = GetImage("Chainsaw"),
			["Mining Drill"] = GetImage("Mining Drill"),
		},

		ItemList = {
			"Bandage",
			"Blueprint",
			"Wooden External Wall",
			"Stone External Wall",
			"Barricade",
			"Care Package Signal",
			"Salvaged Skorpion",
			"Salvaged P250",
			"Salvaged AK47",
			"Salvaged Python",
			"Salvaged AK74u",
			"Wooden Bow",
			"Nail Gun",
			"Salvaged SMG",
			"Crossbow",
			"Salvaged M14",
			"Salvaged Sniper",
			"Military M4A1",
			"Bruno's M4A1",
			"Military USP",
			"Salvaged Pump Action",
			"Military Barrett",
			"Military PKM",
			"Salvaged Break Action",
			"Salvaged Pipe Rifle",
			"Salvaged Double Barrel",
			"Salvaged Shotgun",
			"Pumpkin Launcher",
			"Salvaged RPG",

			"Iron Shard Pickaxe",
			"Iron Shard Hatchet",
			"Stone Hatchet",
			"Stone Pickaxe",
			"Steel Axe",
			"Steel Pickaxe",
			"Wooden Spear",
			"Stone Spear",
			"Small Medkit",
			"Military Grenade",
			"Military Grenade Launcher",

			"Chainsaw",
			"Mining Drill",
		},

		OffscreenImages = {
			["GlowingArrow"] = "",
			["GlowingArc"] = "",
			["Arc"] = "",
			["Arrow"] = "",
			["OpaqueArrow"] = "",
		},

		IgnoreNames = {
			["HumanoidRootPart"] = true,
		},
		Font = Fonts.Pixel,
		FontSize = 10.00,
	}

	if ReplicatedStorage:FindFirstChild("Modules") and ReplicatedStorage.Modules:FindFirstChild("Items") then
		local Items = Globals.DeepCopy(require(ReplicatedStorage.Modules.Items))
		for Index, ItemData in Items do
			if ItemData.Type == "Armor" then
				Globals.ArmorIds[Index] = {
					Name = ItemData.Name,
				}
			end
		end

		Globals.ItemInfoTable = Items
	end

	Visuals.MiscSpace = Globals:Instance("ScreenGui", {
		Parent = CoreGui,
		IgnoreGuiInset = true,
		DisplayOrder = 0,
		Name = "Misc Space",
	})

	Visuals.ESPSpace = Globals:Instance("ScreenGui", {
		Parent = CoreGui,
		IgnoreGuiInset = true,
		DisplayOrder = 0,
		Name = "ESP Space",
	})

	Visuals.LOSFrame = Globals:Instance("Frame", {
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 500, 0, 500),
		Parent = Visuals.ESPSpace,
		Position = UDim2.new(0.5, 0, 0, 100),
	})

	Visuals.LOSLayout = Globals:Instance("UIListLayout", {
		Parent = Visuals.LOSFrame,
		Padding = UDim.new(0, 3),
	})

	Visuals.DrawLine = (function()  
		local Frame = Drawing.new("Line")
		Frame.Visible = false
		Frame.ZIndex = 2
		Frame.Color = Color3.fromRGB(255, 255, 255)
		return Frame
	end)

	Visuals.DrawOutline = (function()  
		local Frame = Drawing.new("Line")
		Frame.Visible = false
		Frame.ZIndex = 1
		Frame.Thickness = 3
		Frame.Color = Color3.fromRGB(0, 0, 0)
		return Frame
	end)

	local VisibilityCache = setmetatable({}, { __mode = "k" })

	Visuals.IsPartVisible = (function(Part, Origin)  
		if not Part then
			return nil
		end

		local Cached = not Origin and VisibilityCache[Part]
		if Cached and (tick() - Cached.t) < 0.12 then
			return Cached.v
		end

		if not Origin then
			Origin = Camera.CFrame.p
		end

		local Direction = (Part.CFrame.p - Origin).Unit * ((Part.CFrame.p - Origin).Magnitude + 10)

		local Params = Globals.RaycastParams

		local RayResult = Workspace:Raycast(Origin, Direction, Params)

		local Result = (RayResult and RayResult.Instance and RayResult.Instance:IsDescendantOf(Part.Parent)) or nil

		if not Origin then
			VisibilityCache[Part] = { t = tick(), v = Result }
		end

		return Result
	end)

	Visuals.GetDistanceFromCenter = (function(part)  
		local position = part
		if typeof(part) == "Instance" then
			position = part.CFrame.p
		end
		local ScreenPosition, OnScreen = Camera:WorldToViewportPoint(position)
		if OnScreen then
			local Center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
			return (Center - Vector2.new(ScreenPosition.X, ScreenPosition.Y)).Magnitude
		end
		return math.huge
	end)

	EntityClass.__index = EntityClass
	EntityClass.Global.__index = EntityClass.Global
	EntityClass.Main.__index = EntityClass.Main
	EntityClass.Main.Functions.__index = EntityClass.Main.Functions
	Globals.RaycastParams = (function()
		local Params = RaycastParams.new()
		Params.FilterType = Enum.RaycastFilterType.Exclude
		Params.FilterDescendantsInstances = { Camera, Client.Character, Workspace:FindFirstChild("VFX") }
		return Params
	end)()
	Client.CharacterAdded:Connect(function(Character)
		pcall(function()
			Globals.RaycastParams.FilterDescendantsInstances = { Camera, Character, Workspace:FindFirstChild("VFX") }
		end)
	end)

	EntityClass.Global.Create = (function(self, Object, Data)  
		if typeof(Object) ~= "Instance" then
			warn(
				"corescript",
				"invalid argument #2 <instance> expected. Did you index instead of namecall?",
				"Type recieved:",
				typeof(Object)
			)
			return
		end

		if typeof(Data) ~= "table" then
			warn(
				"corescript",
				"invalid argument #3 <table> expected. Did you index instead of namecall?",
				"Type recieved:",
				typeof(Data)
			)
			return
		end

		local Entity = setmetatable({
			Name = Data.Name or Object.Name,
			Character = Data.Character or (Object:IsA("Player") and Object.Character),
			DisplayName = Object:IsA("Player") and Object.DisplayName or (Data.Name or Object.Name),
			Components = {},
			LastOffscreenRefresh = tick(),
			LastChamsRefresh = tick(),
			LastUpdate = tick(),
			Components = EntityClass.Main.Functions.CreateComponents(),
			CachedArmor = {},
			CachedItem = nil,
			CachedAttachments = {},
			ItemHistory = {},
			Class = Data.Class,
			ClassType = Data.ClassType,
			Pointer = Object,
			Adornments = {},
		}, EntityClass.Main.Functions)

		EntityClass.Main.Cache[Object] = Entity
		return Entity
	end)

	EntityClass.FlagProperties = {
		Size = UDim2.new(0, 200, 0, 7),
		FontFace = Fonts.SmallestPixel,
		TextSize = 8,
		BackgroundTransparency = 1,
		TextTransparency = 1,
		TextStrokeTransparency = 1,
		Text = "",
		ClipsDescendants = false,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
	}

	EntityClass.Main.Functions.__index = EntityClass.Main.Functions

	EntityClass.Main.Functions.Remove = (function(self, Instance)  
		local ObjectPointer = EntityClass.Main.Cache[Instance]
		if not ObjectPointer then
			return
		end

		ObjectPointer.Components.LookAngle:Remove()
		ObjectPointer.Components.LookAngleOutline:Remove()

		for Index, Value in ObjectPointer.Components do
			if Index == "Corners" or Index == "LookAngle" or Index == "Skeleton" or Index == "LookAngleOutline" then
				continue
			end
			Value:Destroy()
		end

		for Index, Value in ObjectPointer.Components.Corners do
			Value:Destroy()
		end

		for Index, Value in ObjectPointer.Components.Skeleton do
			Value:Remove()
		end

		EntityClass.Main.Cache[Instance] = nil
	end)

	EntityClass.Main.Functions.ApplyArmorVisuals = (function(self, Instance)  
		if Instance:IsA("MeshPart") and Instance.Transparency ~= 1 then
			Instance:SetAttribute("OriginalMaterial", Instance.Material)
			Instance:SetAttribute("OriginalColor", Instance.Color)
			Instance:SetAttribute("OriginalTextureId", Instance.TextureID)
			Instance:SetAttribute("OriginalReflectance", Instance.Reflectance)
			Instance.CanQuery = false

			if Library.Flags["Sandbox" .. self.ClassType] and Library.Flags["Sandbox" .. self.ClassType].Value then
				Instance.Color = Library.Flags[self.ClassType .. "ArmorColor"].Value[1]
				Instance.Reflectance = Library.Flags[self.ClassType .. "ArmorReflectance"].Value
					* Library.Flags[self.ClassType .. "ArmorReflectanceMul"].Value
				Instance.Material = Library.Flags[self.ClassType .. "ArmorMaterial"].Value
				if Instance:IsA("MeshPart") and Instance.Material == Enum.Material.ForceField then
					Instance.TextureID = "rbxassetid://10913193650"
				elseif Instance:IsA("MeshPart") and Instance.Material ~= Enum.Material.ForceField then
					Instance.TextureID = ""
				end
			else
				Instance.Color = Instance:GetAttribute("OriginalColor")
				Instance.Material = Instance:GetAttribute("OriginalMaterial")
				Instance.Reflectance = Instance:GetAttribute("OriginalReflectance")
				if Instance:IsA("MeshPart") then
					Instance.TextureID = Instance:GetAttribute("OriginalTextureId")
				end
			end
		end
	end)

	EntityClass.Main.Functions.OnCharacterAdded = (function(self, Character)  
		self.CachedArmor = {}
		self.CachedItem = nil
		if not Character then
			warn("invalid argument #1, <Instance> expected, got", typeof(Character))
			return
		end

		for Index, Child in next, Character:GetChildren() do
			if table.find(EntityClass.ItemList, Child.Name) then
				self.CachedItem = Child
			end

			if Child.Name:find("Armor") then
				for Index, MeshPart in Child:GetChildren() do
					self:ApplyArmorVisuals(MeshPart)
				end

				if Globals.ArmorNames[Child.Name] then
					local Info = Globals.ArmorNames[Child.Name]
					self.CachedArmor[Child] = {
						Name = Info.Name,
						Skin = Info.Skin,
					}
				else
					local ModelName = Child.Name

					local ArmorSplit = ModelName:split("/")

					if not ArmorSplit then
						return
					end
					local ArmorFormat = ArmorSplit[1]
					local Skin = ArmorSplit[2]

					local ArmorFormatSplit = ArmorFormat:split("_")
					local ArmorId = ArmorFormatSplit[2]
					ArmorId = tonumber(ArmorId)
					local ArmorInfo = Globals.ArmorIds[ArmorId]

					if ArmorInfo then
						self.CachedArmor[Child] = {
							Name = ArmorInfo.Name,
							Skin = Skin,
						}

						Globals.ArmorNames[Child.Name] = {
							Name = ArmorInfo.Name,
							Skin = Skin,
						}
					end
				end
			end
		end

		Character.ChildAdded:Connect(function(Child)
			task.wait(0.3)
			if Child and table.find(EntityClass.ItemList, Child.Name) then
				self.CachedItem = Child
			end

			if Child and Child.Name:find("Armor") then
				for Index, MeshPart in Child:GetChildren() do
					self:ApplyArmorVisuals(MeshPart)
				end

				if Globals.ArmorNames[Child.Name] then
					local Info = Globals.ArmorNames[Child.Name]
					self.CachedArmor[Child] = {
						Name = Info.Name,
						Skin = Info.Skin,
					}
				else
					local ModelName = Child.Name

					local ArmorSplit = ModelName:split("/")

					if not ArmorSplit then
						return
					end
					local ArmorFormat = ArmorSplit[1]
					local Skin = ArmorSplit[2]

					local ArmorFormatSplit = ArmorFormat:split("_")
					local ArmorId = ArmorFormatSplit[2]
					ArmorId = tonumber(ArmorId)
					local ArmorInfo = Globals.ArmorIds[ArmorId]
					if not ArmorInfo then
						return
					end

					self.CachedArmor[Child] = {
						Name = ArmorInfo.Name,
						Skin = Skin,
					}

					Globals.ArmorNames[Child.Name] = {
						Name = ArmorInfo.Name,
						Skin = Skin,
					}
				end
			end
		end)

		Character.ChildRemoved:Connect(function(Child)
			if self.CachedItem == Child then
				self.CachedItem = nil
			end

			if self.CachedArmor[Child] then
				self.CachedArmor[Child] = nil
			end
		end)
	end)

	EntityClass.Main.Functions.CreateComponents = (function(self)  
		local Components = {}

		Components.BoxOutline = Globals:Instance("Frame", {
			Parent = Visuals.ESPSpace,
			Visible = false,
			BackgroundTransparency = 1,
			ZIndex = 2,
		})

		Components.BoxOutlineStroke = Globals:Instance("UIStroke", {
			Parent = Components.BoxOutline,
			Thickness = 3,
			Color = Color3.fromRGB(0, 0, 0),
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			LineJoinMode = Enum.LineJoinMode.Miter,
		})

		Components.BoxInline = Globals:Instance("Frame", {
			Parent = Components.BoxOutline,
			Visible = true,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, -1, 0, -1),
			Size = UDim2.new(1, 2, 1, 2),
			ZIndex = 2,
		})

		Components.BoxInlineStroke = Globals:Instance("UIStroke", {
			Parent = Components.BoxInline,
			LineJoinMode = Enum.LineJoinMode.Miter,
			Color = Color3.fromRGB(255, 255, 255),
		})

		Components.FakeCornerBox = Globals:Instance("Frame", {
			Parent = Components.BoxOutline,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 4, 1, 2),
			Position = UDim2.new(0, -2, 0, -1),
		})

		local Corners = {}

		local CornerWidth = 0.3
		local CornerHeight = 0.3
		local Thickness = 1
		local Offset = -Thickness

		Corners[1] = Instance.new("Frame")
		Corners[1].Parent = Components.FakeCornerBox
		Corners[1].Size = UDim2.new(CornerWidth, 0, 0, Thickness)
		Corners[1].Position = UDim2.new(0, 0, 0, Offset)
		Corners[1].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Corners[1].BorderSizePixel = 0
		Corners[1].Visible = false

		Corners[2] = Instance.new("Frame")
		Corners[2].Parent = Components.FakeCornerBox
		Corners[2].Size = UDim2.new(0, Thickness, CornerHeight, 0)
		Corners[2].Position = UDim2.new(0, 0, 0, Offset)
		Corners[2].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Corners[2].BorderSizePixel = 0

		Corners[3] = Instance.new("Frame")
		Corners[3].Parent = Components.FakeCornerBox
		Corners[3].Size = UDim2.new(CornerWidth, 0, 0, Thickness)
		Corners[3].Position = UDim2.new(1 - CornerWidth, 0, 0, Offset)
		Corners[3].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Corners[3].BorderSizePixel = 0

		Corners[4] = Instance.new("Frame")
		Corners[4].Parent = Components.FakeCornerBox
		Corners[4].Size = UDim2.new(0, Thickness, CornerHeight, 0)
		Corners[4].Position = UDim2.new(1, -Thickness, 0, Offset)
		Corners[4].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Corners[4].BorderSizePixel = 0

		Corners[5] = Instance.new("Frame")
		Corners[5].Parent = Components.FakeCornerBox
		Corners[5].Size = UDim2.new(0, Thickness, CornerHeight, 0)
		Corners[5].Position = UDim2.new(0, 0, 1 - CornerHeight, 0)
		Corners[5].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Corners[5].BorderSizePixel = 0

		Corners[6] = Instance.new("Frame")
		Corners[6].Parent = Components.FakeCornerBox
		Corners[6].Size = UDim2.new(CornerWidth, 0, 0, Thickness)
		Corners[6].Position = UDim2.new(0, 0, 1, 0)
		Corners[6].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Corners[6].BorderSizePixel = 0

		Corners[7] = Instance.new("Frame")
		Corners[7].Parent = Components.FakeCornerBox
		Corners[7].Size = UDim2.new(0, Thickness, CornerHeight, 0)
		Corners[7].Position = UDim2.new(1, -Thickness, 1 - CornerHeight, 0)
		Corners[7].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Corners[7].BorderSizePixel = 0

		Corners[8] = Instance.new("Frame")
		Corners[8].Parent = Components.FakeCornerBox
		Corners[8].Size = UDim2.new(CornerWidth, 0, 0, Thickness)
		Corners[8].Position = UDim2.new(1 - CornerWidth, 0, 1, 0)
		Corners[8].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Corners[8].BorderSizePixel = 0

		for i = 9, 16 do
			local base = Corners[i - 8]:Clone()
			base.Parent = Components.FakeCornerBox
			base.BorderSizePixel = 1
			base.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Corners[i] = base
		end

		Components.Corners = Corners

		Components["Healthbar"] = Globals:Instance("Frame", {
			Parent = Components.BoxOutline,
			Size = UDim2.new(0, 1, 1, 4),
			Position = UDim2.new(0, -6, 0, -2),
			BackgroundColor3 = Color3.fromRGB(255, 0, 0),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 1,
			Visible = false,
		})

		Components["HealthbarBlackout"] = Globals:Instance("Frame", {
			BackgroundColor3 = Color3.fromRGB(),
			Size = UDim2.new(0, 0, 0, 0),
			Parent = Components.Healthbar,
			BorderSizePixel = 0,
			Visible = false,
		})

		Components.Health = Globals:Instance("TextLabel", {
			BackgroundTransparency = 1,
			Parent = Components.HealthbarBlackout,
			Visible = false,
			FontFace = EntityClass.Font,
			TextSize = EntityClass.FontSize,
			TextXAlignment = Enum.TextXAlignment.Right,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			Text = "",
			Size = UDim2.new(0, 20, 0, 12),
			Position = UDim2.new(-1, -23, 0, -2),
		})

		Components.HealthStroke = Globals.ApplyTextStroke(Components.Health)

		Components.Name = Globals:Instance("TextLabel", {
			Parent = Components.BoxOutline,
			FontFace = EntityClass.Font,
			TextSize = EntityClass.FontSize,
			BackgroundTransparency = 1,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			Size = UDim2.new(1, 0, 0, 14),
			Position = UDim2.new(0, 0, 0, -17),
			TextStrokeTransparency = 1,
			Visible = false,
		})

		Components.NameStroke = Globals.ApplyTextStroke(Components.Name)

		Components.Distance = Globals:Instance("TextLabel", {
			Parent = Components.BoxOutline,
			ZIndex = 1,
			TextSize = EntityClass.FontSize,
			Size = UDim2.new(1, 0, 0, 14),
			Position = UDim2.new(0, 0, 1, 6),
			TextStrokeTransparency = 1,
			Visible = false,
			Text = "",
			BackgroundTransparency = 1,
			FontFace = EntityClass.Font,
			TextColor3 = Color3.fromRGB(255, 255, 255),
		})
		Components.DistanceStroke = Globals.ApplyTextStroke(Components.Distance)

		Components.Weapon = Globals:Instance("TextLabel", {
			Parent = Components.BoxOutline,
			ZIndex = 1,
			TextSize = EntityClass.FontSize,
			Size = UDim2.new(1, 0, 0, 14),
			Position = UDim2.new(0, 0, 1, 6),
			TextStrokeTransparency = 1,
			Visible = false,
			Text = "",
			BackgroundTransparency = 1,
			FontFace = EntityClass.Font,
			TextColor3 = Color3.fromRGB(255, 255, 255),
		})
		Components.WeaponStroke = Globals.ApplyTextStroke(Components.Weapon)

		Components.WeaponImage = Globals:Instance("ImageLabel", {
			Parent = Components.BoxOutline,
			ZIndex = 1,
			Image = GetImage("Salvaged AK47"),
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.new(0, 25, 0, 25),
			ScaleType = Enum.ScaleType.Fit,
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
		})

		Components.FlagsContainer = Globals:Instance("Frame", {
			Parent = Components.BoxOutline,
			ClipsDescendants = true,
			Size = UDim2.new(0, 150, 1, 12),
			Position = UDim2.new(1, 2, 0, -6),
			BackgroundTransparency = 1,
		})

		Components.FlagsListLayout = Globals:Instance("UIListLayout", {
			Padding = UDim.new(0, 0),
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = Components.FlagsContainer,
		})

		Components.FlagsPadding = Globals:Instance("UIPadding", {
			PaddingTop = UDim.new(0, 2),
			Parent = Components.FlagsContainer,
			PaddingLeft = UDim.new(0, 2),
		})

		for FlagName, FlagData in EntityClass.Flags do
			Components["Flag_" .. FlagName] = Globals:Instance("TextLabel", EntityClass.FlagProperties)
			Components["Flag_" .. FlagName].Parent = Components.FlagsContainer
			Components["FlagStroke_" .. FlagName] = Globals.ApplyTextStroke(Components["Flag_" .. FlagName])
			Components["FlagStroke_" .. FlagName].Transparency = 1
		end

		Components.OffscreenArrow = Globals:Instance("TextLabel", {
			Text = "▲",
			TextSize = 14,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 20, 0, 20),
			Visible = false,
			Parent = Visuals.ESPSpace,
		})

		Components.ArrowStroke = Globals.ApplyTextStroke(Components.OffscreenArrow)

		Components.LOSIndicator = Globals:Instance("TextLabel", {
			Parent = Visuals.LOSFrame,
			FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold),
			TextSize = 15,
			BackgroundTransparency = 1,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			Size = UDim2.new(1, 0, 0, 0),
			Position = UDim2.new(0, 0, 0, -18),
			TextStrokeTransparency = 1,
			TextTransparency = 1,
			Visible = false,
			TextYAlignment = Enum.TextYAlignment.Top,
		})

		Components.LOSStroke = Globals.ApplyTextStroke(Components.LOSIndicator)
		Components.LOSStroke.Transparency = 1

		Components["LookAngle"] = Visuals.DrawLine()
		Components["LookAngleOutline"] = Visuals.DrawOutline()

		Components["Skeleton"] = {
			Main = Visuals.DrawLine(),

			RL_line = Visuals.DrawLine(),
			LL_line = Visuals.DrawLine(),

			RightFoot = Visuals.DrawLine(),
			LeftFoot = Visuals.DrawLine(),

			LeftArm = Visuals.DrawLine(),
			RightArm = Visuals.DrawLine(),

			RightElbow = Visuals.DrawLine(),
			LeftElbow = Visuals.DrawLine(),

			Hips = Visuals.DrawLine(),
			Shoulders = Visuals.DrawLine(),

			MainOutline = Visuals.DrawOutline(),

			RL_lineOutline = Visuals.DrawOutline(),
			LL_lineOutline = Visuals.DrawOutline(),

			RightFootOutline = Visuals.DrawOutline(),
			LeftFootOutline = Visuals.DrawOutline(),

			LeftArmOutline = Visuals.DrawOutline(),
			RightArmOutline = Visuals.DrawOutline(),

			RightElbowOutline = Visuals.DrawOutline(),
			LeftElbowOutline = Visuals.DrawOutline(),

			HipsOutline = Visuals.DrawOutline(),
			ShouldersOutline = Visuals.DrawOutline(),
		}

		return Components
	end)

	EntityClass.Main.Functions.GetBoxSize = (function(self)  
		local Character = self.Character
		local Root = self.Root
		local CameraPosition = Camera.CFrame.Position

		if not Character or not Root then
			return { Visible = false, OnScreen = false, Root = nil }
		end

		if (CameraPosition - Root.Position).Magnitude > 4000 then
			return { Visible = false, OnScreen = false, Root = Root }
		end

		local MaxWidth, MaxHeight, MaxDepth = 10, 20, 10
		local BoundingPosition, BoundingSize = self:GetBoundingBox(Character, Root.CFrame)
		local HalfSize = BoundingSize / 2

		local ClampedSize = Vector3.new(
			math.min(HalfSize.X, MaxWidth / 2) * 2,
			math.min(HalfSize.Y, MaxHeight / 2) * 2,
			math.min(HalfSize.Z, MaxDepth / 2) * 2
		)

		local CornerOffsets = {
			Vector3.new(ClampedSize.X / 2, ClampedSize.Y / 2, ClampedSize.Z / 2),
			Vector3.new(ClampedSize.X / 2, ClampedSize.Y / 2, -ClampedSize.Z / 2),
			Vector3.new(ClampedSize.X / 2, -ClampedSize.Y / 2, ClampedSize.Z / 2),
			Vector3.new(ClampedSize.X / 2, -ClampedSize.Y / 2, -ClampedSize.Z / 2),
			Vector3.new(-ClampedSize.X / 2, ClampedSize.Y / 2, ClampedSize.Z / 2),
			Vector3.new(-ClampedSize.X / 2, ClampedSize.Y / 2, -ClampedSize.Z / 2),
			Vector3.new(-ClampedSize.X / 2, -ClampedSize.Y / 2, ClampedSize.Z / 2),
			Vector3.new(-ClampedSize.X / 2, -ClampedSize.Y / 2, -ClampedSize.Z / 2),
		}

		local MinX, MinY = math.huge, math.huge
		local MaxX, MaxY = -math.huge, -math.huge
		local OnScreenCount = 0

		local WorldToViewportPoint = Camera.WorldToViewportPoint

		for _, Offset in ipairs(CornerOffsets) do
			local WorldCorner = BoundingPosition:PointToWorldSpace(Offset)
			local ScreenPos, OnScreen = WorldToViewportPoint(Camera, WorldCorner)
			if OnScreen then
				OnScreenCount += 1
				MinX = math.min(MinX, ScreenPos.X)
				MinY = math.min(MinY, ScreenPos.Y)
				MaxX = math.max(MaxX, ScreenPos.X)
				MaxY = math.max(MaxY, ScreenPos.Y)
			end
		end

		if OnScreenCount == 0 and Character:FindFirstChild("Head") then
			local Visible = Visuals.IsPartVisible(Character.Head)
			return {
				Root = Root,
				OnScreen = false,
				RootPosition = Root.Position,
				Visible = Visible,
				VisiblePart = Visible and Character.Head or nil,
			}
		end

		local VisiblePart = nil
		local PartsToCheck = {
			Character:FindFirstChild("HumanoidRootPart"),
			Character:FindFirstChild("RightLowerLeg"),
			Character:FindFirstChild("LeftLowerLeg"),
			Character:FindFirstChild("RightUpperArm"),
			Character:FindFirstChild("LeftUpperArm"),
		}

		for _, Part in ipairs(PartsToCheck) do
			if Part and Part:IsA("BasePart") and Visuals.IsPartVisible(Part) then
				VisiblePart = Part
				break
			end
		end

		local Width = MaxX - MinX
		local Height = MaxY - MinY
		local Size = Math.FloorVector(Vector2.new(Width, Height))
		local Position = Math.FloorVector(Vector2.new(MinX, MinY))
		local Center2D = Vector2.new(Position.X + Size.X / 2, Position.Y + Size.Y / 2)

		return {
			Visible = VisiblePart ~= nil,
			VisiblePart = VisiblePart,
			Root = Root,
			RootPosition = Root.Position,
			Height = Height,
			Width = Width,
			Size = Size,
			Position = Position,
			Center2D = Center2D,
			OnScreen = OnScreenCount > 0,
		}
	end)

	EntityClass.Main.Functions.GetBoundingBox = (function(self, Model, Orientation)  
		local Parts = typeof(Model) == "Instance" and Model:GetChildren() or Model
		Orientation = Orientation or CFrame.new()

		local Inf = math.huge
		local MinX, MinY, MinZ = Inf, Inf, Inf
		local MaxX, MaxY, MaxZ = -Inf, -Inf, -Inf

		for _, Part in ipairs(Parts) do
			if Part:IsA("BasePart") then
				local Cf = Orientation:ToObjectSpace(Part.CFrame)
				local Sx, Sy, Sz = Part.Size.X, Part.Size.Y, Part.Size.Z
				local X, Y, Z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = Cf:components()

				local Wsx = 0.5 * (math.abs(R00) * Sx + math.abs(R01) * Sy + math.abs(R02) * Sz)
				local Wsy = 0.5 * (math.abs(R10) * Sx + math.abs(R11) * Sy + math.abs(R12) * Sz)
				local Wsz = 0.5 * (math.abs(R20) * Sx + math.abs(R21) * Sy + math.abs(R22) * Sz)

				MinX = math.min(MinX, X - Wsx)
				MinY = math.min(MinY, Y - Wsy)
				MinZ = math.min(MinZ, Z - Wsz)

				MaxX = math.max(MaxX, X + Wsx)
				MaxY = math.max(MaxY, Y + Wsy)
				MaxZ = math.max(MaxZ, Z + Wsz)
			end
		end

		local MinVec = Vector3.new(MinX, MinY, MinZ)
		local MaxVec = Vector3.new(MaxX, MaxY, MaxZ)
		local Middle = (MaxVec + MinVec) / 2
		local Cf = Orientation - Orientation.Position + Orientation:PointToWorldSpace(Middle)
		local Size = MaxVec - MinVec

		return Cf, Size
	end)

	EntityClass.Main.Functions.GetDistance = (function(self)  
		local root = self.Root
		if not root then
			return 9e9
		end
		return math.floor((root.Position - Camera.CFrame.Position).Magnitude)
	end)

	EntityClass.Main.Functions.GetHealth = (function(self)  
		if (self.Class == "Player" or self.Class == "AI") and self.Character then
			if self.Character.Name == "BTR" then
				return self.Character:GetAttribute("Health"), self.Character:GetAttribute("MaxHealth")
			end

			local Humanoid = self.Humanoid
			if not Humanoid then
				return 0, 100
			end
			return Humanoid.Health, Humanoid.MaxHealth
		end

		return 0, 100
	end)

	EntityClass.Main.Functions.GetRoot = (function(self)  
		local character = self.Character
		if not character then
			return
		end

		local Humanoid = character:FindFirstChildOfClass("Humanoid")
		if Humanoid then
			self.Humanoid = Humanoid
		end

		if self.Class == "Player" or self.Class == "AI" then
			return Humanoid and Humanoid.RootPart or character:FindFirstChild("HumanoidRootPart")
		end
	end)

	EntityClass.Main.Functions.GetCharacter = (function(self)  
		if self.Class == "AI" then
			return self.Pointer
		end

		if self.Class == "Player" then
			return self.Pointer.Character
		end
	end)

	EntityClass.Main.Functions.ProjectSkeletonLine = (function(self, part, offset)  
		local pos = part.Position + (offset or Vector3.zero)
		local screenPos = Camera:WorldToViewportPoint(pos)
		return Math.FloorVector(Vector2.new(screenPos.X, screenPos.Y))
	end)

	EntityClass.Main.Functions.SetSkeletonLine = (function(self, name, from, to, transparency, color)  
		local line = self.Components.Skeleton[name]
		if line then
			line.Visible = true
			line.From = from
			line.To = to
			line.Color = color
			line.Transparency = 1 - transparency
		end

		local outline = self.Components.Skeleton[name .. "Outline"]
		if outline then
			outline.Visible = true
			outline.From = from
			outline.To = to
			outline.Transparency = 1 - transparency
		end
	end)

	EntityClass.Main.Functions.SetSkeletonsInvisible = (function(self)  
		if self.Components.Skeleton.RL_line.Visible then
			for _, Line in self.Components.Skeleton do
				Line.Visible = false
			end
		end
	end)

	EntityClass.Main.Functions.Update = (function(self)  
		self.Character = self:GetCharacter()
		self.Root = self:GetRoot()
		self.Distance = self:GetDistance()
		self.CoreInformation = self:GetBoxSize() or {}

		local Components = self.Components

		if not self.Root then
			Components.LOSIndicator.Visible = false
			Components.OffscreenArrow.Visible = false
			Components.BoxOutline.Visible = false
			Components.LookAngle.Visible = false
			Components.LookAngleOutline.Visible = false
			self:SetSkeletonsInvisible()
			return
		end

		do
			local MaxDistFlag = Library.Flags[self.ClassType .. "MaxDistance"]
			if MaxDistFlag and self.Distance and self.Distance > MaxDistFlag.Value then
				Components.LOSIndicator.Visible = false
				Components.OffscreenArrow.Visible = false
				Components.BoxOutline.Visible = false
				Components.LookAngle.Visible = false
				Components.LookAngleOutline.Visible = false
				self:SetSkeletonsInvisible()
				return
			end
		end

		local Health, MaxHealth = self:GetHealth()
		local CoreInformation = self.CoreInformation
		local Visible = CoreInformation.Visible
		local ClassType = self.ClassType
		local Flags = Library.Flags
		local StatusColor = not Visible and Flags[ClassType .. "OccludedColor"].Value[1]
			or Flags[ClassType .. "VisibleColor"].Value[1]

		if self == EntityClass.TargetData then
			StatusColor = Flags.TargetColor.Value[1]
			if EntityClass.ManipulatedPlayer == self.Pointer and Flags.ManipColor then
				StatusColor = Flags.ManipColor.Value[1]
			end
		end

		if ClassType == "Player" and isTeam(self.Pointer) then
			self.Friendly = true
			StatusColor = TEAMMATE_COLOR
		else
			self.Friendly = false
		end

		self.IsDead = Health <= 0.1
		local Transparency = self.IsDead and 1 or 0

		Globals:Tween(Components.BoxInlineStroke, TweenInfo.new(EntityClass.AnimationSpeed, Enum.EasingStyle.Quad), {
			Color = StatusColor,
		})

		Globals:Tween(
			Components.BoxOutlineStroke,
			TweenInfo.new(EntityClass.AnimationSpeed + 0.25, Enum.EasingStyle.Quad),
			{
				Transparency = Transparency,
			}
		)

		local ComponentColor = Components.BoxInlineStroke.Color
		Transparency = Components.BoxOutlineStroke.Transparency
		local BoxCorners = Components.Corners
		local BottomBounds = 1
		local HasItem = self.CachedItem ~= nil

		if Flags.LockOnIndicator.Value and ClassType == "Player" and Flags.PlayerESP.Value then
			local ClientHead = Client.Character and Client.Character:FindFirstChild("Head")
			local EnemyHead = self.Character and self.Character:FindFirstChild("Head")

			if EnemyHead and ClientHead then
				local Delta = (ClientHead.Position - EnemyHead.Position)
				local Distance = Delta.Magnitude
				local Direction = Delta.Unit
				local LookVector = EnemyHead.CFrame.LookVector
				local DotProduct = LookVector:Dot(Direction)
				local CrossProduct = LookVector:Cross(Direction).Magnitude
				local Angle = math.deg(math.atan2(CrossProduct, DotProduct))
				local MaxAngle = math.clamp(60 - (Distance / 10), 15, 60)
				local Percentage = math.floor(math.clamp(100 - (Angle / MaxAngle * 100), 0, 100))
				local IsLooking = Angle <= MaxAngle
				local ThroughWalls = not Visible
				local Color = Percentage >= Flags.LockOnRisk.Value and Color3.fromRGB(255, 0, 0)
					or Color3.fromRGB(255, 255, 255)

				if IsLooking and Percentage >= Flags.LockOnThreshold.Value then
					Components.LOSIndicator.LayoutOrder = tick()
					Components.LOSIndicator.Visible = true
					Components.LOSIndicator.Text = string.format(
						"%s %s (%d%%) [%d studs]\n",
						self.Name,
						ThroughWalls and "is looking at you through walls" or "is looking at you",
						Percentage,
						math.floor(Distance)
					)

					if not Components.LOSIndicator:GetAttribute("IsTweening") then
						Components.LOSIndicator:SetAttribute("IsTweening", true)
						local Tween = Globals:Tween(
							Components.LOSIndicator,
							TweenInfo.new(EntityClass.AnimationSpeed, Enum.EasingStyle.Quad),
							{
								TextColor3 = Color,
								Size = UDim2.new(1, 0, 0, Components.LOSIndicator.TextSize),
								TextTransparency = 0,
							}
						)
						Components.LOSStroke.Transparency = Components.LOSIndicator.TextTransparency
						Tween.Completed:Connect(function()
							Components.LOSIndicator:SetAttribute("IsTweening", false)
						end)
					end
					Components.LOSStroke.Transparency = Components.LOSIndicator.TextTransparency
				else
					if not Components.LOSIndicator:GetAttribute("IsTweening") then
						Components.LOSIndicator:SetAttribute("IsTweening", true)
						local Tween = Globals:Tween(
							Components.LOSIndicator,
							TweenInfo.new(EntityClass.AnimationSpeed, Enum.EasingStyle.Quad),
							{
								Size = UDim2.new(1, 0, 0, 0),
								TextTransparency = 1,
							}
						)
						Tween.Completed:Connect(function()
							task.wait(0.1)
							Components.LOSIndicator:SetAttribute("IsTweening", false)
							Components.LOSIndicator.Visible = false
						end)
					end
					Components.LOSStroke.Transparency = Components.LOSIndicator.TextTransparency
				end
			end
		else
			Components.LOSIndicator.Visible = false
		end

		if CoreInformation.OnScreen and Flags[ClassType .. "ESP"].Value and (not self.Friendly or Flags.ShowTeammates.Value) then
			Components.OffscreenArrow.Visible = false
			local CanShowWeapon = ClassType == "Player" and Flags[ClassType .. "Weapon"]
			local CanShowWeaponImage = ClassType == "Player" and Flags[ClassType .. "WeaponImage"]
			local TweenProperties = TweenInfo.new(EntityClass.AnimationSpeed, Enum.EasingStyle.Quad)

			if tick() - self.LastChamsRefresh > Flags.ChamsRefreshRate.Value then
				self.LastChamsRefresh = tick()
				for _, Part in self.Character:GetChildren() do
					if Part:IsA("Model") and Part.Name:find("Armor") then
						for Index, MeshPart in Part:GetChildren() do
							self:ApplyArmorVisuals(MeshPart)
						end
					end

					if Part:IsA("BasePart") and not EntityClass.IgnoreNames[Part.Name] then
						if not self.Adornments[Part] then
							local Adornments = {}
							local Adornment
							for Vis = 1, 2 do
								if Part.Name == "Head" then
									Adornment = Globals:Instance("CylinderHandleAdornment", {
										Name = "",
										Adornee = Part,
										Parent = Part,
										ZIndex = Vis == 1 and 2 or 1,
										Height = Vis == 1 and 0.87 or 1.02,
										Radius = Vis == 1 and 0.5 or 0.65,
										CFrame = CFrame.new(Vector3.new(), Vector3.new(0, 1, 0)),
										Visible = false,
										AlwaysOnTop = Vis == 1,
									})
								else
									local SizeOffset = Vis == 1 and -0.05 or 0.05
									Adornment = Globals:Instance("BoxHandleAdornment", {
										Name = "",
										Adornee = Part,
										Parent = Part,
										ZIndex = Vis == 1 and 2 or 1,
										AlwaysOnTop = Vis == 1,
										Size = Part.Size + Vector3.new(SizeOffset, SizeOffset, SizeOffset),
										Visible = false,
									})
								end
								Adornments[Vis] = Adornment
							end
							self.Adornments[Part] = Adornments
						else
							local Adornments = self.Adornments[Part]
							if Adornments then
								local OccludedColor = self.Friendly and TEAMMATE_COLOR_DIM or Flags[ClassType .. "ChamsOccludedColor"].Value[1]
								local OccludedTransparency = Flags[ClassType .. "ChamsOccludedColor"].Value[2]
								local ShouldShow = Flags[ClassType .. "Chams"].Value
								local GlowChams = Flags[ClassType .. "ChamsStyle"].Value == "Glow"
								local VisibleColor = self.Friendly and TEAMMATE_COLOR or Flags[ClassType .. "ChamsVisibleColor"].Value[1]
								local VisibleTransparency = Flags[ClassType .. "ChamsVisibleColor"].Value[2]

								Adornments[1].Visible = ShouldShow
								Adornments[1].Color3 = OccludedColor
								Adornments[1].Transparency = OccludedTransparency

								Adornments[2].Visible = ShouldShow
								Adornments[2].ZIndex = GlowChams and 9e9 or 1
								Adornments[2].AlwaysOnTop = GlowChams
								Adornments[2].Color3 = VisibleColor
								Adornments[2].Transparency = VisibleTransparency
							end
						end
					end
				end
			end

			Components.BoxOutline.Position = UDim2.new(0, CoreInformation.Position.X, 0, CoreInformation.Position.Y)
			Components.BoxOutline.Size = UDim2.new(0, CoreInformation.Size.X, 0, CoreInformation.Size.Y)
			Components.BoxOutline.Visible = true

			local CanUseSolid = Flags[ClassType .. "BoundingBox"].Value and Flags[ClassType .. "BoxStyle"].Value == "Solid"
			Components.BoxOutlineStroke.Enabled = CanUseSolid
			Components.BoxInlineStroke.Enabled = CanUseSolid

			ComponentColor = Components.BoxInlineStroke.Color

			Components.BoxInlineStroke.Transparency = Transparency

			for Index = 1, 16 do
				BoxCorners[Index].Visible = Flags[ClassType .. "BoundingBox"].Value
					and Flags[ClassType .. "BoxStyle"].Value == "Corner"

				if BoxCorners[Index].Visible then
					if Index <= 8 then
						BoxCorners[Index].ZIndex = 3
						BoxCorners[Index].BackgroundColor3 = ComponentColor
					end
					BoxCorners[Index].BackgroundTransparency = Transparency
				end
			end

			if Flags[ClassType .. "Healthbar"].Value then
				local HealthPercent = Health / MaxHealth
				if tostring(HealthPercent) == "nan" then
					HealthPercent = 0
				end

				local CalculatedSize = UDim2.new(1, 0, 1 - HealthPercent, 0)

				Components.HealthbarBlackout.Visible = true
				Components.Healthbar.Visible = true
				Components.Healthbar.BackgroundTransparency = Transparency
				Components.HealthbarBlackout.BackgroundTransparency = Transparency

				local ShowIfDamaged = Flags[ClassType .. "ShowHealthIfDamaged"].Value
				local CanShowHealth = not ShowIfDamaged or (ShowIfDamaged and Health < MaxHealth)

				if Flags[ClassType .. "Health"].Value and CanShowHealth then
					Components.Health.Visible = true
					Components.Health.Text = tostring(math.floor(HealthPercent * 100))
					Components.Health.TextTransparency = Transparency
					Components.HealthStroke.Transparency = (Flags.ESPTextOutline == nil or Flags.ESPTextOutline.Value) and Transparency or 1
				else
					Components.Health.Visible = false
				end

				if Health ~= self.LastHealth then
					self.LastHealth = Health
					Globals:Tween(
						Components.HealthbarBlackout,
						TweenInfo.new(EntityClass.AnimationSpeed, Enum.EasingStyle.Quad),
						{
							Size = CalculatedSize,
						}
					)

					local LerpedColor = Flags[ClassType .. "LowerHealthColor"].Value[1]:lerp(
						Flags[ClassType .. "HigherHealthColor"].Value[1],
						Health / MaxHealth
					)

					Globals:Tween(Components.Healthbar, TweenInfo.new(EntityClass.AnimationSpeed, Enum.EasingStyle.Quad), {
						BackgroundColor3 = LerpedColor,
					})
				end
			else
				Components.Healthbar.Visible = false
			end

			if Flags[ClassType .. "Name"].Value then
				Components.Name.Visible = true
				Components.NameStroke.Transparency = (Flags.ESPTextOutline == nil or Flags.ESPTextOutline.Value) and Transparency or 1
				Components.Name.TextTransparency = Transparency
				Components.Name.Text = self.Name
				Components.Name.TextColor3 = ComponentColor
			else
				Components.Name.Visible = false
			end

			if Flags[ClassType .. "Distance"].Value then
				Components.Distance.Visible = true
				Components.DistanceStroke.Transparency = (Flags.ESPTextOutline == nil or Flags.ESPTextOutline.Value) and Transparency or 1
				Components.Distance.Text = tostring(self.Distance) .. "s"
				Components.Distance.TextColor3 = ComponentColor
				Components.Distance.TextTransparency = Transparency
				Components.Distance.Position = UDim2.new(0, 0, 1, BottomBounds)
				BottomBounds += 8
			else
				Components.Distance.Visible = false
			end

			if CanShowWeapon and CanShowWeapon.Value then
				Components.Weapon.Visible = true

				if HasItem and self.CachedItem then
					Components.Weapon.Text = self.CachedItem.Name
				end

				Components.Weapon.TextColor3 = ComponentColor

				if not Components.Weapon:GetAttribute("IsTweening") then
					Components.Weapon:SetAttribute("IsTweening", true)

					local TargetY = HasItem and BottomBounds or (BottomBounds - 4)
					local WeaponTween = Globals:Tween(Components.Weapon, TweenProperties, {
						TextTransparency = HasItem and Transparency or 1,
						Position = UDim2.new(0, 0, 1, TargetY),
					})

					Globals:Tween(Components.WeaponStroke, TweenProperties, {
						Transparency = HasItem and Transparency or 1,
					})

					WeaponTween.Completed:Connect(function()
						Components.Weapon:SetAttribute("IsTweening", false)
					end)
				end

				BottomBounds += 6
			else
				Components.Weapon.Visible = false
			end

			if CanShowWeaponImage and CanShowWeaponImage.Value then
				if not Components.Weapon.Visible then
					BottomBounds -= 4
				end

				local WeaponImage = (HasItem and self.CachedItem and EntityClass.WeaponImages[self.CachedItem.Name]) or nil
				local HasImage = HasItem and WeaponImage ~= nil

				Components.WeaponImage.Visible = HasImage
				if HasImage then
					Components.WeaponImage.Image = WeaponImage
				end

				if not Components.WeaponImage:GetAttribute("IsTweening") then
					Components.WeaponImage:SetAttribute("IsTweening", true)

					local TargetY = HasImage and BottomBounds or (BottomBounds - 5)
					local ImageTween = Globals:Tween(Components.WeaponImage, TweenProperties, {
						ImageTransparency = HasImage and Transparency or 1,
						Position = UDim2.new(0.5, 0, 1, TargetY),
					})

					ImageTween.Completed:Connect(function()
						Components.WeaponImage:SetAttribute("IsTweening", false)
					end)
				end
			else
				Components.WeaponImage.Visible = false
			end

			if ClassType == "Player" and Flags[ClassType .. "Flags"].Value then
				Components.FlagsContainer.Visible = true
				local AnimationSpeed = EntityClass.AnimationSpeed
				local EasingStyle = Enum.EasingStyle.Quad
				local TweenInfo = TweenInfo.new(AnimationSpeed, EasingStyle)

				for FlagName, FlagData in EntityClass.Flags do
					local ShouldShow = FlagData.Allow(self)
					local Flag = Components["Flag_" .. FlagName]
					local FlagStroke = Components["FlagStroke_" .. FlagName]

					if not Flag then
						Flag = Globals:Instance("TextLabel", EntityClass.FlagProperties)
						Flag.Parent = Components.FlagsContainer
						FlagStroke = Globals.ApplyTextStroke(Flag)
						FlagStroke.Transparency = 1
						Components["Flag_" .. FlagName] = Flag
						Components["FlagStroke_" .. FlagName] = FlagStroke
					end

					if Flag then
						local Text = FlagData.Text(self) or ""
						Flag.TextColor3 = FlagData.Color and FlagData.Color(self) or Flags[FlagName .. "FlagColor"].Value[1]
						Flag.Text = " " .. Text

						if not Flag:GetAttribute("IsTweening") then
							Flag:SetAttribute("IsTweening", true)
							if ShouldShow then
								Flag.Visible = true
								Flag.LayoutOrder = tick()
							end

							local FlagTween = Globals:Tween(Flag, TweenInfo, {
								TextTransparency = ShouldShow and Transparency or 1,
								Size = ShouldShow and UDim2.new(0, 200, 0, Flag.TextBounds.Y) or UDim2.new(0, 200, 0, 0),
							})

							Globals:Tween(FlagStroke, TweenInfo, {
								Transparency = ShouldShow and Transparency or 1,
							})

							FlagTween.Completed:Connect(function()
								Flag:SetAttribute("IsTweening", false)
								Flag.Visible = ShouldShow
							end)
						end
					end
				end
			else
				Components.FlagsContainer.Visible = false
			end

			if Flags[ClassType .. "LookAngle"].Value and self.Character:FindFirstChild("Head") and not Library.IsOpen then
				local Head = self.Character.Head
				local HeadPos, HeadOnScreen = Camera:WorldToViewportPoint(Head.Position)
				local LookPos, LookOnScreen = Camera:WorldToViewportPoint(Head.Position + Head.CFrame.LookVector * 5)

				local Line = Components.LookAngle
				local Outline = Components.LookAngleOutline

				if HeadOnScreen and LookOnScreen then
					local From = Vector2.new(HeadPos.X, HeadPos.Y)
					local To = Vector2.new(LookPos.X, LookPos.Y)

					From = Math.FloorVector(From)
					To = Math.FloorVector(To)

					Line.Visible = true
					Line.From = From
					Line.To = To
					Line.Color = ComponentColor
					Line.Transparency = 1 - Transparency

					Outline.Visible = true
					Outline.From = From
					Outline.To = To
					Outline.Transparency = 1 - Transparency
				else
					Line.Visible = false
					Outline.Visible = false
				end
			else
				Components.LookAngle.Visible = false
				Components.LookAngleOutline.Visible = false
			end

			if Flags[ClassType .. "Skeleton"].Value and self.Character:FindFirstChild("Head") and not Library.IsOpen then
				local Valid = true
				for _, Part in
					{
						"UpperTorso",
						"RightUpperLeg",
						"LeftFoot",
						"RightFoot",
						"LeftUpperLeg",
						"LeftUpperArm",
						"RightUpperArm",
						"RightLowerArm",
						"RightHand",
						"LeftHand",
					}
				do
					if not self.Character:FindFirstChild(Part) then
						Valid = false
						break
					end
				end

				if Valid then
					local Head = self:ProjectSkeletonLine(self.Character.Head)
					local RL = self:ProjectSkeletonLine(self.Character.RightUpperLeg)
					local LL = self:ProjectSkeletonLine(self.Character.LeftUpperLeg)

					local RightLeg = self:ProjectSkeletonLine(self.Character.RightUpperLeg, Vector3.new(0, 0.5, 0))
					local LeftLeg = self:ProjectSkeletonLine(self.Character.LeftUpperLeg, Vector3.new(0, 0.5, 0))

					local RightFoot = self:ProjectSkeletonLine(self.Character.RightFoot)
					local LeftFoot = self:ProjectSkeletonLine(self.Character.LeftFoot)

					local RightArm = self:ProjectSkeletonLine(self.Character.RightUpperArm, Vector3.new(0, 0.2, 0))
					local LeftArm = self:ProjectSkeletonLine(self.Character.LeftUpperArm, Vector3.new(0, 0.2, 0))

					local RightElbow = self:ProjectSkeletonLine(self.Character.RightLowerArm, Vector3.new(0, 0.2, 0))
					local LeftElbow = self:ProjectSkeletonLine(self.Character.LeftLowerArm, Vector3.new(0, 0.2, 0))

					local RightHand = self:ProjectSkeletonLine(self.Character.RightHand)
					local LeftHand = self:ProjectSkeletonLine(self.Character.LeftHand)

					self:SetSkeletonLine("RightFoot", RightFoot, RL, Transparency, ComponentColor)
					self:SetSkeletonLine("LeftFoot", LeftFoot, LL, Transparency, ComponentColor)

					self:SetSkeletonLine("LL_line", LeftLeg, LL, Transparency, ComponentColor)
					self:SetSkeletonLine("RL_line", RightLeg, RL, Transparency, ComponentColor)

					self:SetSkeletonLine("RightArm", RightArm, RightElbow, Transparency, ComponentColor)
					self:SetSkeletonLine("RightElbow", RightElbow, RightHand, Transparency, ComponentColor)

					self:SetSkeletonLine("LeftArm", LeftArm, LeftElbow, Transparency, ComponentColor)
					self:SetSkeletonLine("LeftElbow", LeftElbow, LeftHand, Transparency, ComponentColor)

					self:SetSkeletonLine(
						"Main",
						Vector2.new((LeftLeg.X + RightLeg.X) / 2, LeftLeg.Y),
						Head,
						Transparency,
						ComponentColor
					)
					self:SetSkeletonLine("Hips", LeftLeg, RightLeg, Transparency, ComponentColor)
					self:SetSkeletonLine("Shoulders", RightArm, LeftArm, Transparency, ComponentColor)
				else
					self:SetSkeletonsInvisible()
				end
			else
				self:SetSkeletonsInvisible()
			end
		else
			Components.BoxOutline.Visible = false
			Components.LookAngle.Visible = false
			Components.LookAngleOutline.Visible = false
			self:SetSkeletonsInvisible()

			if CoreInformation.Root and Flags[ClassType .. "Offscreen"] and Flags[ClassType .. "Offscreen"].Value then
				local ArrowRadius = Flags[ClassType .. "OffscreenRadius"].Value
				local Size = Flags[ClassType .. "OffscreenSize"].Value

				local Arrow = Components.OffscreenArrow
				local CameraPosition = Camera.CFrame.p
				local ViewAngle = Camera.CFrame.lookVector

				local ScreenPos = Camera:WorldToScreenPoint(CoreInformation.Root.Position)
				local Center = Camera.ViewportSize / 2
				local Direction = (Vector2.new(ScreenPos.X, ScreenPos.Y) - Vector2.new(Center.X, Center.Y)).Unit

				local OffscreenRadius = ArrowRadius
				local ClampedPosition = Vector2.new(Center.X, Center.Y) + Direction * OffscreenRadius

				Arrow.TextSize = Size
				Arrow.Size = UDim2.new(0, 25, 0, 25)
				Arrow.Position = UDim2.new(
					0,
					ClampedPosition.X - Arrow.Size.X.Offset / 2,
					0,
					ClampedPosition.Y - Arrow.Size.Y.Offset / 2
				)
				Arrow.Rotation = math.deg(math.atan2(Direction.Y, Direction.X)) + 90
				Arrow.Visible = true
				Arrow.TextColor3 = ComponentColor
				Arrow.TextTransparency = Transparency
				Components.ArrowStroke.Transparency = Transparency
			else
				Components.OffscreenArrow.Visible = false
			end
		end
	end)

	EntityClass.Main.Functions.AddFlag = (function(self, Data)  
		EntityClass.Flags[Data.Name] = Data
		return EntityClass.Flags[Data.Name]
	end)

	EntityClass.Misc.Functions.__index = EntityClass.Misc.Functions

	EntityClass.Misc.Functions.CreateComponents = (function(self)  
		local Components = {}

		Components.Name = Globals:Instance("TextLabel", {
			Parent = Visuals.MiscSpace,
			ZIndex = 1,
			BackgroundTransparency = 1,
			TextSize = EntityClass.FontSize,
			Text = "",
			FontFace = EntityClass.Font,
			Size = UDim2.new(0, 0, 0, EntityClass.FontSize),
			Visible = false,
			Position = UDim2.new(0, 0, 0, 0),
			TextYAlignment = Enum.TextYAlignment.Top,
			AutomaticSize = Enum.AutomaticSize.Y,
		})

		Components.NameStroke = Globals.ApplyTextStroke(Components.Name)

		return Components
	end)

	EntityClass.Misc.Functions.ScanParent = (function(self)  
		local ParentFolder = self.Parent
		local ClassName = self.ClassName
		local Name = self.Name
		for Index, Object in ParentFolder:GetChildren() do
			if Object.ClassName == ClassName or Name == Object.Name then
				self.Object = Object
				EntityClass.Misc.Cache[Object] = {
					Components = self:CreateComponents(),
					Listener = self,
					Object = Object,
				}
			end
		end

		ParentFolder.ChildAdded:Connect(function(Object)
			task.wait(0.5)
			if ParentFolder == Workspace:FindFirstChild("Drops") then
				task.wait(2)
			end

			if
				(Object.ClassName == ClassName or Name == Object.Name)
				and not Object:GetAttribute("IsThrow")
				and not EntityClass.Misc.Cache[Object]
			then
				EntityClass.Misc.Cache[Object] = {
					Components = self:CreateComponents(),
					Listener = self,
					Object = Object,
				}
				Object:GetPropertyChangedSignal("Parent"):Connect(function()
					if Object.Parent ~= ParentFolder and EntityClass.Misc.Cache[Object] then
						for _, Component in EntityClass.Misc.Cache[Object].Components do
							Component:Destroy()
						end
						EntityClass.Misc.Cache[Object] = nil
					end
				end)
				Object:GetAttributeChangedSignal("IsThrow"):Connect(function()
					task.wait(0.1)
					if Object:GetAttribute("IsThrow") then
						for _, Component in EntityClass.Misc.Cache[Object].Components do
							Component:Destroy()
						end
						EntityClass.Misc.Cache[Object] = nil
					end
				end)
			end
		end)

		ParentFolder.ChildRemoved:Connect(function(Object)
			if EntityClass.Misc.Cache[Object] then
				for _, Component in EntityClass.Misc.Cache[Object].Components do
					Component:Destroy()
				end
				EntityClass.Misc.Cache[Object] = nil
			end
		end)
	end)

	EntityClass.Misc.Functions.AddListener = (function(Data)  

	end)

	EntityClass.Misc.Functions.AddListener = function(Data)
		if typeof(Data) ~= "table" or typeof(Data.Parent) ~= "Instance" then
			return
		end
		local Listener = setmetatable(Data, EntityClass.Misc.Functions)
		if not Listener.GetColor then
			Listener.GetColor = function(D)
				local F = Library.Flags[D.Listener.Flag .. "MiscColor"]
				return F and F.Value[1] or Color3.fromRGB(255, 255, 255)
			end
		end
		if not Listener.GetAlpha then
			Listener.GetAlpha = function(D)
				local F = Library.Flags[D.Listener.Flag .. "MiscColor"]
				return F and F.Value[2] or 0
			end
		end
		if not Listener.Validate then
			Listener.Validate = function() return true end
		end
		task.spawn(function()
			local ok, err = pcall(Listener.ScanParent, Listener)
			if not ok then
				warn("[Potato.hook] listener error: " .. tostring(err))
			end
		end)
		return Listener
	end

	local function PH_BuildESPTab(Pages)

		local ESPCategories = {
			Players = Pages.ESP:Category({ Name = "Players" }),
			AI = Pages.ESP:Category({ Name = "AI" }),
			Boss = Pages.ESP:Category({ Name = "Bosses" }),
			World = Pages.ESP:Category({ Name = "World" }),
		}

		do
			do
				local PlayersMain = ESPCategories.Players:Section({
					Name = "Main",
					Side = "Left",
				})

				local PlayersSettings = ESPCategories.Players:Section({
					Name = "Settings",
					Side = "Left",
				})

				local PlayersColors = ESPCategories.Players:Section({
					Name = "Colors",
					Side = "Right",
				})

				local PlayerModels = ESPCategories.Players:Section({
					Name = "Character model",
					Side = "Right",
				})

				local LockOn = ESPCategories.Players:Section({
					Name = "Lock on indicators",
					Side = "Left",
				})

				do
					LockOn:Toggle({
						Name = "Enabled",
						Flag = "LockOnIndicator",
					})

					LockOn:Slider({
						Name = "Lock on threshold",
						Flag = "LockOnThreshold",
						Min = 30,
						Max = 90,
						Default = 70,
					})

					LockOn:Slider({
						Name = "Lock on danger threshold",
						Flag = "LockOnRisk",
						Min = 30,
						Max = 90,
						Default = 70,
					})
				end

				do
					PlayersMain:Toggle({
						Name = "Enabled",
						Flag = "PlayerESP",
					})

					PlayersMain:Toggle({
						Name = "Show Teammates",
						Flag = "ShowTeammates",
						Default = true,
						Tooltip = "Clan teammates are drawn in green; off = hidden completely",
					})

					PlayersMain:Toggle({
						Name = "Bounding box",
						Flag = "PlayerBoundingBox",
					})

					PlayersMain:Toggle({
						Name = "Skeleton",
						Flag = "PlayerSkeleton",
					})

					PlayersMain:Toggle({
						Name = "View angle",
						Flag = "PlayerLookAngle",
					})

					PlayersMain:Toggle({
						Name = "Healthbar",
						Flag = "PlayerHealthbar",
					})

					PlayersMain:Toggle({
						Name = "Name",
						Flag = "PlayerName",
					})

					PlayersMain:Toggle({
						Name = "Distance",
						Flag = "PlayerDistance",
					})

					PlayersMain:Toggle({
						Name = "Item",
						Flag = "PlayerWeapon",
					})

					PlayersMain:Toggle({
						Name = "Health",
						Flag = "PlayerHealth",
						Tooltip = "Displays players health on text",
					})

					PlayersMain:Toggle({
						Name = "Weapon image",
						Flag = "PlayerWeaponImage",
						Tooltip = "2d icon of held weapon",
					})

					PlayersMain:Toggle({
						Name = "Flags",
						Flag = "PlayerFlags",
						Tooltip = "Flag certain actions/attributes",
					})

					PlayersMain:Dropdown({
						Multi = true,
						Name = "Selected flags",
						Flag = "PlayerFlagsList",
						Options = {
							"Aiming",
							"Reloading",
							"Healing",
							"Clan",
							"VIP",
							"Staff",
						},
					})

					PlayersMain:Toggle({
						Name = "Offscreen indicators",
						Flag = "PlayerOffscreen",
					})
				end

				do
					PlayersSettings:Toggle({
						Name = "Text outline",
						Flag = "ESPTextOutline",
						Default = true,
						Tooltip = "Black outline around ESP text for readability",
					})

					PlayersSettings:Slider({
						Name = "Max distance",
						Flag = "PlayerMaxDistance",
						Min = 100,
						Max = 4000,
						Default = 4000,
						Suffix = " studs",
						Tooltip = "Hides player ESP beyond this distance",
					})

					PlayersSettings:Toggle({
						Name = "Ignore friends",
						Flag = "IgnoreFriends",
						Tooltip = "Doesn't render in players marked as friendly",
					})

					PlayersSettings:Dropdown({
						Name = "Bounding box type",
						Flag = "PlayerBoxStyle",
						Options = {
							"Solid",
							"Corner",
						},
					})

					PlayersSettings:Toggle({
						Name = "Only show health if damaged",
						Flag = "PlayerShowHealthIfDamaged",
					})

					PlayersSettings:Slider({
						Name = "Offscreen arrow size",
						Flag = "PlayerOffscreenSize",
						Min = 10,
						Max = 30,
						Increment = 0.1,
					})

					PlayersSettings:Slider({
						Name = "Offscreen arrow radius",
						Flag = "PlayerOffscreenRadius",
						Min = 100,
						Max = 700,
						Increment = 0.1,
					})
				end

				do
					PlayersColors:Colorpicker({
						Name = "Visible color",
						Flag = "PlayerVisibleColor",
						Default = { Color3.fromRGB(255, 0, 0), 0 },
					})

					PlayersColors:Colorpicker({
						Name = "Occluded color",
						Flag = "PlayerOccludedColor",
						Default = { Color3.fromRGB(255, 255, 255), 0 },
					})

					PlayersColors:Colorpicker({
						Name = "Higher health color",
						Flag = "PlayerHigherHealthColor",
						Default = { Color3.fromRGB(120, 255, 100), 0 },
					})

					PlayersColors:Colorpicker({
						Name = "Lower health color",
						Flag = "PlayerLowerHealthColor",
						Default = { Color3.fromRGB(255, 0, 0), 0 },
					})

					PlayersColors:Seperator()
					PlayersColors:Colorpicker({
						Name = "Aiming flag color",
						Flag = "AimingFlagColor",
						Default = { Color3.fromRGB(3, 169, 252), 0 },
					})

					PlayersColors:Colorpicker({
						Name = "Reloading flag color",
						Flag = "ReloadingFlagColor",
						Default = { Color3.fromRGB(255, 255, 255), 0 },
					})

					PlayersColors:Colorpicker({
						Name = "Healing flag color",
						Flag = "HealingFlagColor",
						Default = { Color3.fromRGB(120, 255, 100), 0 },
					})

					PlayersColors:Colorpicker({
						Name = "VIP flag color",
						Flag = "VIPFlagColor",
						Default = { Color3.fromRGB(252, 211, 3), 0 },
					})

					PlayersColors:Colorpicker({
						Name = "Safezone flag color",
						Flag = "SafezoneFlagColor",
						Default = { Color3.fromRGB(0, 211, 0), 0 },
					})

					PlayersColors:Colorpicker({
						Name = "Clan flag color",
						Flag = "ClanFlagColor",
						Default = { Color3.fromRGB(255, 255, 255), 0 },
					})

					PlayersColors:Colorpicker({
						Name = "Staff flag color",
						Flag = "StaffFlagColor",
						Default = { Color3.fromRGB(255, 255, 255), 0 },
					})
				end

				do
					PlayerModels:Toggle({
						Name = "Chams",
						Flag = "PlayerChams",
					})

					PlayerModels:Dropdown({
						Name = "Chams style",
						Flag = "PlayerChamsStyle",
						Options = {
							"Solid",
							"Glow",
						},
					})

					PlayerModels:Colorpicker({
						Name = "Chams visible color",
						Flag = "PlayerChamsVisibleColor",
						Default = { Library.Theme.Accent, 0.2 },
					})

					PlayerModels:Colorpicker({
						Name = "Chams occluded color",
						Flag = "PlayerChamsOccludedColor",
						Default = { Library.Theme.Accent, 0.8 },
					})

					PlayerModels:Seperator()

					PlayerModels:Toggle({
						Name = "Sandbox armor models",
						Flag = "SandboxPlayer",
					})

					PlayerModels:Dropdown({
						Name = "Material",
						Flag = "PlayerArmorMaterial",
						Options = {
							"ForceField",
							"Neon",
							"SmoothPlastic",
							"Plastic",
							"Glass",
						},
					})

					PlayerModels:Slider({
						Name = "Reflectance",
						Flag = "PlayerArmorReflectance",
						Min = 0,
						Max = 1,
						Increment = 0.001,
					})

					PlayerModels:Slider({
						Name = "Reflectance multiplier",
						Flag = "PlayerArmorReflectanceMul",
						Min = 0,
						Max = 100,
					})

					PlayerModels:Colorpicker({
						Name = "Color",
						Flag = "PlayerArmorColor",
						Default = { Library.Theme.Accent, 0.2 },
					})
				end
			end

			do
				local AIMain = ESPCategories.AI:Section({
					Name = "Main",
					Side = "Left",
				})

				local AISettings = ESPCategories.AI:Section({
					Name = "Settings",
					Side = "Left",
				})

				local AIColors = ESPCategories.AI:Section({
					Name = "Colors",
					Side = "Right",
				})

				local AIModels = ESPCategories.AI:Section({
					Name = "Character model",
					Side = "Right",
				})

				do
					AIMain:Toggle({
						Name = "Enabled",
						Flag = "AIESP",
					})

					AIMain:Toggle({
						Name = "Bounding box",
						Flag = "AIBoundingBox",
					})

					AIMain:Toggle({
						Name = "Skeleton",
						Flag = "AISkeleton",
					})

					AIMain:Toggle({
						Name = "View angle",
						Flag = "AILookAngle",
					})

					AIMain:Toggle({
						Name = "Healthbar",
						Flag = "AIHealthbar",
					})

					AIMain:Toggle({
						Name = "Name",
						Flag = "AIName",
					})

					AIMain:Toggle({
						Name = "Distance",
						Flag = "AIDistance",
					})

					AIMain:Toggle({
						Name = "Health",
						Flag = "AIHealth",
						Tooltip = "Displays AIs health on text",
					})
				end

				do
					AISettings:Dropdown({
						Name = "Bounding box type",
						Flag = "AIBoxStyle",
						Options = {
							"Solid",
							"Corner",
						},
					})

					AISettings:Toggle({
						Name = "Only show health if damaged",
						Flag = "AIShowHealthIfDamaged",
					})

					AISettings:Slider({
						Name = "Maximum distance",
						Flag = "AIMaxDistance",
						Min = 100,
						Max = 4000,
						Suffix = "studs",
					})
				end

				do
					AIColors:Colorpicker({
						Name = "Visible color",
						Flag = "AIVisibleColor",
						Default = { Color3.fromRGB(255, 0, 0), 0 },
					})

					AIColors:Colorpicker({
						Name = "Occluded color",
						Flag = "AIOccludedColor",
						Default = { Color3.fromRGB(255, 255, 255), 0 },
					})

					AIColors:Colorpicker({
						Name = "Higher health color",
						Flag = "AIHigherHealthColor",
						Default = { Color3.fromRGB(120, 255, 100), 0 },
					})

					AIColors:Colorpicker({
						Name = "Lower health color",
						Flag = "AILowerHealthColor",
						Default = { Color3.fromRGB(255, 0, 0), 0 },
					})
				end

				do
					AIModels:Toggle({
						Name = "Chams",
						Flag = "AIChams",
					})

					AIModels:Dropdown({
						Name = "Chams style",
						Flag = "AIChamsStyle",
						Options = {
							"Solid",
							"Glow",
						},
					})

					AIModels:Colorpicker({
						Name = "Chams visible color",
						Flag = "AIChamsVisibleColor",
						Default = { Library.Theme.Accent, 0.2 },
					})

					AIModels:Colorpicker({
						Name = "Chams occluded color",
						Flag = "AIChamsOccludedColor",
						Default = { Library.Theme.Accent, 0.8 },
					})
				end
			end

			do
				local BossMain = ESPCategories.Boss:Section({
					Name = "Main",
					Side = "Left",
				})

				local BossSettings = ESPCategories.Boss:Section({
					Name = "Settings",
					Side = "Left",
				})

				local BossColors = ESPCategories.Boss:Section({
					Name = "Colors",
					Side = "Right",
				})

				local BossModels = ESPCategories.Boss:Section({
					Name = "Character model",
					Side = "Right",
				})

				do
					BossMain:Toggle({
						Name = "Enabled",
						Flag = "BossESP",
					})

					BossMain:Toggle({
						Name = "Bounding box",
						Flag = "BossBoundingBox",
					})

					BossMain:Toggle({
						Name = "Skeleton",
						Flag = "BossSkeleton",
					})

					BossMain:Toggle({
						Name = "View angle",
						Flag = "BossLookAngle",
					})

					BossMain:Toggle({
						Name = "Healthbar",
						Flag = "BossHealthbar",
					})

					BossMain:Toggle({
						Name = "Name",
						Flag = "BossName",
					})

					BossMain:Toggle({
						Name = "Distance",
						Flag = "BossDistance",
					})

					BossMain:Toggle({
						Name = "Health",
						Flag = "BossHealth",
						Tooltip = "Displays Bosses health on text",
					})
				end

				do
					BossSettings:Dropdown({
						Name = "Bounding box type",
						Flag = "BossBoxStyle",
						Options = {
							"Solid",
							"Corner",
						},
					})

					BossSettings:Toggle({
						Name = "Only show health if damaged",
						Flag = "BossShowHealthIfDamaged",
					})

					BossSettings:Slider({
						Name = "Maximum distance",
						Flag = "BossMaxDistance",
						Min = 100,
						Max = 4000,
						Suffix = "studs",
					})
				end

				do
					BossColors:Colorpicker({
						Name = "Visible color",
						Flag = "BossVisibleColor",
						Default = { Color3.fromRGB(255, 0, 0), 0 },
					})

					BossColors:Colorpicker({
						Name = "Occluded color",
						Flag = "BossOccludedColor",
						Default = { Color3.fromRGB(255, 255, 255), 0 },
					})

					BossColors:Colorpicker({
						Name = "Higher health color",
						Flag = "BossHigherHealthColor",
						Default = { Color3.fromRGB(120, 255, 100), 0 },
					})

					BossColors:Colorpicker({
						Name = "Lower health color",
						Flag = "BossLowerHealthColor",
						Default = { Color3.fromRGB(255, 0, 0), 0 },
					})
				end

				do
					BossModels:Toggle({
						Name = "Chams",
						Flag = "BossChams",
					})

					BossModels:Dropdown({
						Name = "Chams style",
						Flag = "BossChamsStyle",
						Options = {
							"Solid",
							"Glow",
						},
					})

					BossModels:Colorpicker({
						Name = "Chams visible color",
						Flag = "BossChamsVisibleColor",
						Default = { Library.Theme.Accent, 0.2 },
					})

					BossModels:Colorpicker({
						Name = "Chams occluded color",
						Flag = "BossChamsOccludedColor",
						Default = { Library.Theme.Accent, 0.8 },
					})
				end
			end

			do

				local Global = ESPCategories.World:Section({
					Name = "Global settings",
					Side = "Left",
				})

				Global:Keybind({
					Name = "Combat Hide",
					Flag = "CombatHide",
					Mode = "Toggle",
				})

				Global:Toggle({
					Name = "Smart ESP Fade",
					Tooltip = "Fades objects not in center",
					Flag = "SmartESP",
				})

				Global:Slider({
					Name = "Smart ESP Radius",
					Flag = "FadeRadius",
					Min = 0,
					Max = 1000,
				})

				local Wool = ESPCategories.World:Section({
					Side = "Left",
					Name = "Cloth plants",
				})

				Wool:Toggle({
					Name = "Enabled",
					Flag = "ESPWoolPlants",
				})

				Wool:Colorpicker({
					Name = "Color",
					Flag = "WoolPlantsMiscColor",
					Default = { Color3.fromRGB(25, 107, 0), 1 },
				})

				Wool:Slider({
					Min = 10,
					Max = 4000,
					Suffix = "s",
					Name = "Distance",
					Flag = "WoolPlantsDistance",
				})

				local Nodes = ESPCategories.World:Section({
					Side = "Right",
					Name = "Nodes",
				})

				Nodes:Toggle({
					Name = "Enabled",
					Flag = "ESPNodes",
				})

				Nodes:Seperator()

				Nodes:Toggle({
					Name = "Stone",
					Flag = "Stone nodeCanShow",
				})

				Nodes:Colorpicker({
					Name = "Stone color",
					Flag = "Stone nodeColor",
					Default = { Color3.fromRGB(255, 255, 255), 1 },
				})

				Nodes:Seperator()

				Nodes:Toggle({
					Name = "Metal",
					Flag = "Metal nodeCanShow",
				})

				Nodes:Colorpicker({
					Name = "Metal color",
					Flag = "Metal nodeColor",
					Default = { Color3.fromRGB(214, 135, 153), 1 },
				})

				Nodes:Seperator()

				Nodes:Toggle({
					Name = "Phosphate",
					Flag = "Phosphate nodeCanShow",
				})

				Nodes:Colorpicker({
					Name = "Phosphate color",
					Flag = "Phosphate nodeColor",
					Default = { Color3.fromRGB(237, 193, 104), 1 },
				})

				Nodes:Seperator()

				Nodes:Slider({
					Min = 10,
					Max = 4000,
					Suffix = "s",
					Name = "Distance",
					Flag = "NodesDistance",
				})

				local Bodybags = ESPCategories.World:Section({
					Name = "Body bags",
					Side = "Left",
				})

				Bodybags:Toggle({
					Name = "Enabled",
					Flag = "ESPBodyBags",
					Default = { Color3.fromRGB(244, 80, 40), 0 },
				})

				Bodybags:Colorpicker({
					Name = "Color",
					Flag = "BodyBagsMiscColor",
					Default = { Color3.fromRGB(255, 255, 255), 0 },
				})
				Bodybags:Slider({
					Name = "Distance",
					Flag = "BodyBagsDistance",
					Min = 50,
					Max = 4000,
					Suffix = "s",
				})

				local Items = ESPCategories.World:Section({
					Name = "Items",
					Side = "Right",
				})

				Items:Toggle({
					Name = "Enabled",
					Flag = "ESPItems",
				})

				Items:Seperator()

				Items:Toggle({
					Name = "Guns",
					Flag = "IncludeGun",
				})

				Items:Toggle({
					Name = "Consumable ammo",
					Flag = "IncludeConsumableAmmo",
				})

				Items:Toggle({
					Name = "Consumable armor",
					Flag = "IncludeConsumableAmmoArmor",
				})

				Items:Toggle({
					Name = "Ammo",
					Flag = "IncludeAmmo",
				})

				Items:Toggle({
					Name = "Armor",
					Flag = "IncludeArmor",
				})

				Items:Toggle({
					Name = "Tools",
					Flag = "IncludeTool",
				})

				Items:Toggle({
					Name = "Locks",
					Flag = "IncludeLock",
				})

				Items:Toggle({
					Name = "Benches",
					Flag = "IncludeBench",
				})

				Items:Toggle({
					Name = "Resources",
					Flag = "IncludeResource",
				})

				Items:Toggle({
					Name = "Components / Misc",
					Flag = "IncludeMisc",
				})

				Items:Toggle({
					Name = "Attachments",
					Flag = "IncludeAttachment",
				})

				Items:Toggle({
					Name = "Consumables",
					Flag = "IncludeConsumable",
				})

				Items:Seperator()

				Items:Colorpicker({
					Name = "Color",
					Flag = "ItemsColor",
				})

				Items:Slider({ Name = "Distance", Flag = "ItemsDistance", Min = 50, Max = 4000, Suffix = "s" })

				local TimedCrates = ESPCategories.World:Section({ Name = "Timed Crates", Side = "Left" })
				TimedCrates:Toggle({
					Name = "Enabled",
					Flag = "ESPTimedCrates",
				})

				TimedCrates:Colorpicker({
					Flag = "TimedCratesMiscColor",
					Default = {
						Color3.fromRGB(0, 122, 8),
						0,
					},
					Name = "Color",
				})

				TimedCrates:Slider({
					Name = "Distance",
					Flag = "TimedCratesDistance",
					Min = 50,
					Max = 4000,
					Suffix = "s",
				})

				local CarePackages = ESPCategories.World:Section({
					Name = "Care Packages",
					Side = "Right",
				})

				CarePackages:Toggle({
					Name = "Enabled",
					Flag = "ESPCarePackages",
				})

				CarePackages:Colorpicker({
					Name = "Color",
					Flag = "CarePackagesMiscColor",
					Default = {
						Color3.fromRGB(0, 244, 8),
						0,
					},
				})

				CarePackages:Slider({
					Name = "Distance",
					Flag = "CarePackagesDistance",
					Min = 50,
					Max = 10000,
					Suffix = "s",
				})

				local Sleepers = ESPCategories.World:Section({
					Name = "Sleepers",
					Side = "Right",
				})

				Sleepers:Toggle({
					Name = "Enabled",
					Flag = "ESPSleepers",
				})

				Sleepers:Colorpicker({
					Name = "Color",
					Flag = "SleepersMiscColor",
				})

				Sleepers:Slider({
					Name = "Distance",
					Flag = "SleepersDistance",
					Min = 50,
					Max = 4000,
					Suffix = "s",
				})

			end
		end

		do
			local GlobalChams = ESPCategories.World:Section({ Name = "Chams", Side = "Right" })
			GlobalChams:Slider({
				Name = "Chams refresh rate",
				Flag = "ChamsRefreshRate",
				Min = 0,
				Max = 10,
				Default = 1,
				Suffix = "s",
				Increment = 0.1,
			})
		end
	end

	local AimingAnimationId = "rbxassetid://10982316984"
	local HealingAnimationIds = {
		["rbxassetid://14860445359"] = true,
		["rbxassetid://2529243689"] = true,
	}

	EntityClass.Main.Functions:AddFlag({
		Name = "Aiming",
		ClassTypes = { "Player" },
		Text = (function(self)  
			return "Scope"
		end),
		Allow = (function(self)  
			if not (self.Character and self.Character:FindFirstChild("Humanoid")) then
				return false
			end

			local Root = self.Character.Humanoid.RootPart
			if not Root then
				return false
			end

			local Weapon = self.CachedItem
			if Weapon and Weapon.Name == "Wooden Bow" then
				local DrawAnim = Root:FindFirstChild("Wooden BowDraw")
				return DrawAnim and DrawAnim.IsPlaying
			end

			for _, track in ipairs(self.Character.Humanoid:GetPlayingAnimationTracks()) do
				if track.Animation.AnimationId == AimingAnimationId then
					return true
				end
			end
			return false
		end),
	})

	EntityClass.Main.Functions:AddFlag({
		Name = "Reloading",
		ClassTypes = { "Player" },
		Text = (function(self)  
			return "Reload"
		end),
		Allow = (function(self)  
			local Root = self.Character and self.Character:FindFirstChild("HumanoidRootPart")
			local Weapon = self.CachedItem
			if not (Root and Weapon) then
				return false
			end

			local WeaponName = Weapon.Name
			local MagIn, MagOut

			if WeaponName == "Crossbow" then
				MagIn = Root:FindFirstChild("CrossbowPlaceArrow")
				MagOut = Root:FindFirstChild("CrossbowPull")
			else
				MagIn = Root:FindFirstChild(WeaponName .. "MagIn")
				MagOut = Root:FindFirstChild(WeaponName .. "MagOut")
			end

			return (MagIn and MagIn.IsPlaying) or (MagOut and MagOut.IsPlaying)
		end),
	})

	EntityClass.Main.Functions:AddFlag({
		Name = "Healing",
		ClassTypes = { "Player" },
		Text = (function(self)  
			return "Heal"
		end),
		Allow = (function(self)  
			if not (self.Character and self.Character:FindFirstChild("Humanoid")) then
				return false
			end

			for _, track in ipairs(self.Character.Humanoid:GetPlayingAnimationTracks()) do
				if HealingAnimationIds[track.Animation.AnimationId] then
					return true
				end
			end
			return false
		end),
	})

	EntityClass.Main.Functions:AddFlag({
		Name = "VIP",
		ClassTypes = { "Player" },
		Text = (function(self)  
			return "VIP"
		end),
		Allow = (function(self)  
			return self.Pointer and self.Pointer:GetAttribute("VIP")
		end),
	})

	EntityClass.Main.Functions:AddFlag({
		Name = "Clan",
		ClassTypes = { "Player" },
		Text = (function(self)  
			if self.Pointer:GetAttribute("ClanTag") then
				return "C: " .. self.Pointer:GetAttribute("ClanTag")
			end
			return ""
		end),
		Allow = (function(self)  
			return self.Pointer and self.Pointer:GetAttribute("ClanTag")
		end),
	})

	EntityClass.Main.Functions:AddFlag({
		Name = "Staff",
		ClassTypes = { "Player" },
		Text = (function(self)  
			return self.Pointer and Globals.FlaggedStaff[self.Pointer] and "STAFF: " .. Globals.FlaggedStaff[self.Pointer]
				or nil
		end),
		Allow = (function(self)  
			return self.Pointer and Globals.FlaggedStaff[self.Pointer]
		end),
	})


	local function PH_RegisterEntities()

		for Index, Player in Players:GetChildren() do
			if Player ~= Client then
				local EntityObject = EntityClass.Global:Create(Player, {
					Class = "Player",
					ClassType = "Player",
				})

				Player.CharacterAdded:Connect(function(Character)
					EntityObject:OnCharacterAdded(Character)
				end)

				if Player.Character then
					EntityObject:OnCharacterAdded(Player.Character)
				end

			end
		end

		Players.PlayerAdded:Connect(function(Player)
			local EntityObject = EntityClass.Global:Create(Player, {
				Class = "Player",
				ClassType = "Player",
			})

			Player.CharacterAdded:Connect(function(Character)
				EntityObject:OnCharacterAdded(Character)
			end)

			if Player.Character then
				EntityObject:OnCharacterAdded(Player.Character)
			end

		end)

		Players.ChildRemoved:Connect(function(Player)
			EntityClass.Main.Functions:Remove(Player)
		end)

		local Military = Workspace:FindFirstChild("Military")
		if Military then
			local Events = Workspace:FindFirstChild("Events") or Instance.new("Folder")
			local function CacheSoldier(Soldier)
				if table.find({ "Brutus", "Bruno", "BTR", "Boris", "Soldier" }, Soldier.Name) then
					local ClassType = "AI"
					if
						Soldier.Name == "Brutus"
						or Soldier.Name == "Bruno"
						or Soldier.Name == "Boris"
						or Soldier.Name == "BTR"
					then
						ClassType = "Boss"
					end

					local EntityObject = EntityClass.Global:Create(Soldier, {
						Class = "AI",
						ClassType = ClassType,
					})
				else
					return
				end
			end

			for Index, BTR in Events:GetChildren() do
				if BTR.Name == "BTR" then
					CacheSoldier(BTR)
				end
			end

			Events.ChildAdded:Connect(function(BTR)
				task.wait(1)
				if BTR.Name == "BTR" then
					CacheSoldier(BTR)
				end
			end)

			Events.ChildRemoved:Connect(function(BTR)
				EntityClass.Main.Functions:Remove(BTR)
			end)

			for _, Folder in Military:GetChildren() do
				for Index, Soldier in Folder:GetChildren() do
					if Soldier:IsA("Model") then
						CacheSoldier(Soldier)
					end
				end

				Folder.ChildAdded:Connect(function(Soldier)
					task.wait(1)
					if Soldier:IsA("Model") then
						CacheSoldier(Soldier)
					end
				end)

				Folder.ChildRemoved:Connect(function(Soldier)
					EntityClass.Main.Functions:Remove(Soldier)
				end)
			end
		end

		local Nodes = Workspace:FindFirstChild("Nodes")
		local Drops = Workspace:FindFirstChild("Drops")
		local Bases = Workspace:FindFirstChild("Bases")
		local Plants = Workspace:FindFirstChild("Plants")

		local FixedNames = {
			["Metal_Node"] = "Metal node",
			["Phosphate_Node"] = "Phosphate node",
			["Stone_Node"] = "Stone node",
		}

		if Nodes then
			EntityClass.Misc.Functions.AddListener({
				Parent = Nodes,
				ClassName = "Model",
				Listener = "NodeListener",
				Flag = "Nodes",
				GetColor = (function(Data)  
					local Name = FixedNames[Data.Object.Name]
					return Library.Flags[Name .. "Color"].Value[1]
				end),

				GetAlpha = (function(Data)  
					local Name = FixedNames[Data.Object.Name]
					return Library.Flags[Name .. "Color"].Value[2]
				end),

				GetName = (function(Data)  
					local HealthPercent =
						math.floor((Data.Object:GetAttribute("Health") / Data.Object:GetAttribute("MaxHealth")) * 100)
					local Name = FixedNames[Data.Object.Name]

					return Name .. " " .. tostring(HealthPercent) .. "%"
				end),

				GetPosition = (function(Data)  
					return Data.Object:FindFirstChild("Main") and Data.Object:FindFirstChild("Main").CFrame.p
				end),

				GetDistance = (function(Data)  
					return Data.Object:FindFirstChild("Main")
						and math.floor((Camera.CFrame.p - Data.Object:FindFirstChild("Main").CFrame.p).Magnitude)
				end),

				Validate = (function(Data)  
					local Name = FixedNames[Data.Object.Name]
					return Library.Flags[Name .. "CanShow"].Value
				end),
			})

		end

		if Drops then
			local ItemColors = {
				["Misc"] = Color3.fromRGB(210, 210, 210),
				["Gun"] = Color3.fromRGB(214, 20, 20),
				["Ammo"] = Color3.fromRGB(214, 50, 50),
				["Consumable"] = Color3.fromRGB(50, 214, 50),
				["Bench"] = Color3.fromRGB(210, 210, 210),
				["Attachment"] = Color3.fromRGB(252, 215, 3),
				["Resource"] = Color3.fromRGB(3, 252, 161),
				["Lock"] = Color3.fromRGB(210, 210, 210),
				["Tool"] = Color3.fromRGB(255, 255, 255),
				["Armor"] = Color3.fromRGB(255, 0, 183),
			}

			EntityClass.Misc.Functions.AddListener({
				Parent = Drops,
				ClassName = "Model",
				Listener = "ItemListener",
				Flag = "Items",
				GetColor = (function(Data)  
					return Library.Flags["ItemsColor"].Value[1]
				end),

				GetAlpha = (function(Data)  
					return Library.Flags["ItemsColor"].Value[2]
				end),

				GetName = (function(Data)  
					if not Data.DecodedInformation then
						local Item = Data.Object:FindFirstChild("Item")
						Item = HttpService:JSONDecode(Item.Value or "{}")
						if type(Item) ~= "table" then Item = {} end
						local ID = Item.ID
						local Amount = tonumber(Item.Amount) or 1

						local ItemInfo = (Globals.ItemInfoTable or {})[ID]
						local Type = ItemInfo and ItemInfo.Type or "Misc"
						Data.Type = Type
						Data.DecodedInformation = {
							ID = ID,
							Amount = Amount,
						}
					end

					local Color = ItemColors[Data.Type]
					local Name = Data.Object.Name

					if Data.DecodedInformation.Amount > 1 then
						Name = Name .. " x" .. tostring(Data.DecodedInformation.Amount)
					end

					return Name
				end),

				GetPosition = (function(Data)  
					return Data.Object.PrimaryPart and Data.Object.PrimaryPart.CFrame.p
				end),

				GetDistance = (function(Data)  
					return Data.Object.PrimaryPart
						and math.floor((Camera.CFrame.p - Data.Object.PrimaryPart.CFrame.p).Magnitude)
				end),

				Validate = (function(Data)  
					if Data.Object:FindFirstChild("Item") then
						if not Data.DecodedInformation then
							local Item = Data.Object:FindFirstChild("Item")
							Item = HttpService:JSONDecode(Item.Value or "{}")
						if type(Item) ~= "table" then Item = {} end
							local ID = Item.ID
							local Amount = tonumber(Item.Amount) or 1

							local ItemInfo = (Globals.ItemInfoTable or {})[ID]
							local Type = ItemInfo and ItemInfo.Type or "Misc"
							Data.Type = Type
							Data.DecodedInformation = {
								ID = ID,
								Amount = Amount,
							}
						end
						local IncludeFlag = Library.Flags["Include" .. tostring(Data.Type)]
						return IncludeFlag and IncludeFlag.Value or false
					end
				end),
			})

		end

		if Bases then
			local Loners = Bases:FindFirstChild("Loners") or Instance.new("Folder")
			local TimedCrate = Loners:FindFirstChild("Timed Crate")
			local Sleeper = Loners:FindFirstChild("Sleeper")

			if TimedCrate then
				EntityClass.Misc.Functions.AddListener({
					Parent = TimedCrate,
					ClassName = "Model",
					Listener = "TimedCrateListener",
					Flag = "TimedCrates",
					GetName = (function(Data)  
						local Name = Data.Object.Name
						local Timer = Data.Object:FindFirstChild("Timer")
						local GuiHolder = Timer and Timer:FindFirstChild("GuiHolder")
						local SurfaceGui = GuiHolder and GuiHolder:FindFirstChild("Label")
						local TextLabel = SurfaceGui and SurfaceGui:FindFirstChild("TextLabel")
						local TimeRemaining = TextLabel and TextLabel.Text or "12:00"

						return Name .. " [" .. TimeRemaining .. "]"
					end),

					GetPosition = (function(Data)  
						return Data.Object.PrimaryPart and Data.Object.PrimaryPart.CFrame.p
					end),

					GetDistance = (function(Data)  
						return Data.Object.PrimaryPart
							and math.floor((Camera.CFrame.p - Data.Object.PrimaryPart.CFrame.p).Magnitude)
					end),

					Validate = (function(Data)  
						return true
					end),
				})

			end

			if Loners then
				local CarePackage = Loners:FindFirstChild("Care Package")
				local BodyBag = Loners:FindFirstChild("Body Bag")
				if CarePackage then
					EntityClass.Misc.Functions.AddListener({
						Parent = CarePackage,
						ClassName = "Model",
						Listener = "CarePackageListener",
						Flag = "CarePackages",
						GetName = (function(Data)  
							local Name = Data.Object.Name
							return Name
						end),

						GetPosition = (function(Data)  
							return Data.Object.PrimaryPart and Data.Object.PrimaryPart.CFrame.p
						end),

						GetDistance = (function(Data)  
							return Data.Object.PrimaryPart
								and math.floor((Camera.CFrame.p - Data.Object.PrimaryPart.CFrame.p).Magnitude)
						end),

						Validate = (function(Data)  
							return true
						end),
					})

				end

				if BodyBag then
					EntityClass.Misc.Functions.AddListener({
						Parent = BodyBag,
						ClassName = "Model",
						Name = "Body Bag",
						Listener = "BodyBagListener",
						Flag = "BodyBags",
						GetName = (function(Data)  
							local Name = Data.Object.Name
							local OwnerName = Data.Object:GetAttribute("OwnerName")

							local FixedName = Name .. " - " .. OwnerName
							return FixedName
						end),

						GetPosition = (function(Data)  
							return Data.Object.PrimaryPart and Data.Object.PrimaryPart.CFrame.p
						end),

						GetDistance = (function(Data)  
							return Data.Object.PrimaryPart
								and math.floor((Camera.CFrame.p - Data.Object.PrimaryPart.CFrame.p).Magnitude)
						end),

						Validate = (function(Data)  
							return true
						end),
					})

				end
			end

			if Sleeper then
				EntityClass.Misc.Functions.AddListener({
					Parent = Sleeper,
					ClassName = "Model",
					Listener = "SleeperListener",
					Flag = "Sleepers",
					GetName = (function(Data)  
						local Name = Data.Object.Name
						local OwnerName = "Owner"
						local NameTag = Data.Object:FindFirstChild("NameTag")
						local Label = NameTag and NameTag:FindFirstChild("Label")
						OwnerName = Label and Label.Text or OwnerName

						local FixedName = Name .. " - " .. OwnerName
						return FixedName
					end),

					GetPosition = (function(Data)  
						return Data.Object.PrimaryPart and Data.Object.PrimaryPart.CFrame.p
					end),

					GetDistance = (function(Data)  
						return Data.Object.PrimaryPart
							and math.floor((Camera.CFrame.p - Data.Object.PrimaryPart.CFrame.p).Magnitude)
					end),

					Validate = (function(Data)  
						return true
					end),
				})

			end
		end

		if Plants then
			EntityClass.Misc.Functions.AddListener({
				Parent = Plants,
				Name = "Wool Plant",
				Listener = "WoolListener",
				Flag = "WoolPlants",
				GetName = (function(Data)  
					return "Cloth Plant"
				end),

				GetPosition = (function(Data)  
					return Data.Object.PrimaryPart and Data.Object.PrimaryPart.CFrame.p
				end),

				GetDistance = (function(Data)  
					return Data.Object.PrimaryPart
						and math.floor((Camera.CFrame.p - Data.Object.PrimaryPart.CFrame.p).Magnitude)
				end),

				Validate = (function(Data)  
					return true
				end),
			})

		end

	end

	local function PH_StartESPThreads()
		Threads.New("Entity Handler", function()
			local Now = tick()
			for Entity, Object in EntityClass.Main.Cache do
				if Now - Object.LastUpdate > 0.0145 then
					Object.LastUpdate = Now
					Object:Update()
				end
			end
		end, "Entities")


	local MiscLoop = Threads.New(
		"Misc entity loop",
		(function()  
			local SmartESP = Library.Flags.SmartESP.Value
			local CombatHide = Library.Flags.CombatHide.Active
			local FadeRadius = Library.Flags.FadeRadius.Value
			local Font = EntityClass.Font
			local FontSize = EntityClass.FontSize

			if not CombatHide then
				Visuals.MiscSpace.Enabled = true
				for Entity, Data in EntityClass.Misc.Cache do
					local Listener = Data.Listener
					local Components = Data.Components
					local Object = Entity

					if not Object or not Components or not Components.Name then
						if Components and Components.Name then
							Components.Name:Destroy()
						end
						continue
					end

					local Flag = Listener.Flag
					local EnabledFlag = Library.Flags["ESP" .. Flag]
					local MaxDistanceFlag = Library.Flags[Flag .. "Distance"]

					if CombatHide or not EnabledFlag or not EnabledFlag.Value or not Listener.Validate(Data) then
						Components.Name.Visible = false
						continue
					end

					local Position = Listener.GetPosition(Data)
					if not Position then
						Components.Name.Visible = false
						continue
					end

					local Distance = Listener.GetDistance(Data)
					if not Distance or Distance > MaxDistanceFlag.Value then
						Components.Name.Visible = false
						continue
					end

					local ScreenPos, OnScreen = Camera:WorldToViewportPoint(Position)
					if not OnScreen then
						Components.Name.Visible = false
						continue
					end

					local Name = Listener.GetName(Data)
					local NameColor = Listener.GetColor(Data)
					local Alpha = Listener.GetAlpha(Data)

					Components.Name.Text = Name
					Components.Name.TextColor3 = NameColor

					Components.Name.Position = UDim2.new(0, ScreenPos.X, 0, ScreenPos.Y)
					Components.Name.Name = Name
					Components.Name.FontFace = Font
					Components.Name.TextSize = FontSize
					Components.Name.Visible = true

					if SmartESP then
						local CenterDist = Visuals.GetDistanceFromCenter(Position)
						local Fade = math.clamp(CenterDist / FadeRadius, 0, 1)
						Components.Name.TextTransparency = Fade
						Components.Name.UIStroke.Transparency = Fade
					else
						Components.Name.TextTransparency = Alpha
						Components.Name.UIStroke.Transparency = Alpha
					end
				end
			else
				Visuals.MiscSpace.Enabled = false
			end
		end),
		"Render"
	)

		RunService.RenderStepped:Connect(function(Delta)
			Globals.Delta = Delta
			for Index, Thread in Threads.Input do
				Thread:Run()
			end
			for Index, Thread in Threads.Entities do
				Thread:Run()
			end
			for Index, Thread in Threads.Character do
				Thread:Run()
			end
			for Index, Thread in Threads.Render do
				Thread:Run()
			end
		end)
	end

	PH_UI.buildEspTab = PH_BuildESPTab
	PH_UI.startEsp = function()
		local ok, err = pcall(PH_RegisterEntities)
		if not ok then
			warn("[Potato.hook] esp registration failed: " .. tostring(err))
		end
		PH_StartESPThreads()
	end
	PH_UI.EntityClass = EntityClass
	end)()
end
V59 = PH_UI.window
V60 = PH_UI.flags
PH_NOTIFY = PH_UI.notify
local V61 = PH_UI.keybindList
local V62 = V57.targethudClass.new({active = false})
local V63 = {
	client = {},
	services = {
		replicatedStorage = V31,
		userInputService = V32,
		httpService = V33,
		guiService = V34,
		runService = V35,
		lighting = V36,
		players = V37,
		camera = V38,
		terrain = V41,
	},
	world = {
		vfx = VFX,
		plants = Plants,
		drops = Drops,
		vms = V42,
		trees = V43,
		vegetation = V44,
		nodes = V45,
		bases = V46,
		events = V47,
		military = V48,
		loners = V49,
		modules = V50,
		playerGui = V40,
	},
	gameModules = {
		items = V51,
		toolinfo = V52,
		benchInfo = V53,
		raycastUtil = V54,
		soundModule = V55,
		vfxModule = V56,
	},
	localplayer = V39,
	localcharacter = V39.Character,
	localrootpart = V39.Character and V39.Character:WaitForChild("HumanoidRootPart", math.huge),
	localhumanoid = V39.Character and V39.Character:WaitForChild("Humanoid", math.huge),
	uiLibrary = V57,
	espLibrary = V58,
	window = V59,
	flags = V60,
	keybindList = V61,
	targetHUD = V62,
	playerESP = PlayerESP,
	npcESP = NpcESP,
	entityESP = EntityESP,
	protectedCall = V30,
	_cloneref = Fn,
	checkType = Fn2,
	debug_setupvalue = V27,
	debug_isvalidlevel = V28,
	const = {CHRISTMAS_UPDATE = false, MATH_HUGE = math.huge},
}
local V64 = (function()
	local V = (function()
		local FromRGB = Color3_2.fromRGB
		return function(Arg1)
			Arg1:addToggle({flag = "silentAim_toggle", text = "silent aim", default = false}, 1):addKeypicker({
				flag = "silentAim_keybind",
				default = "None",
				blacklisted = {"W", "A", "S", "D", "Space"},
				mode = "toggle",
			})
			Arg1:addSlider({
				flag = "silentAim_hitchance",
				text = "hitchance",
				max = 100,
				min = 1,
				suffix = "%",
				increment = 1,
				default = 100,
			}, 1)
			Arg1:addDropdown({
				flag = "silentAim_hitpart",
				text = "hitpart",
				options = {"head", "torso", "closest"},
				default = "head",
			}, 1)
			Arg1:addToggle({flag = "silentAim_targetNpcs", text = "target npcs", default = true}, 1)
			Arg1:addToggle({flag = "silentAim_teamCheck", text = "team check", default = true}, 1)
			Arg1:addToggle({flag = "silentAim_instantHit", text = "force hit", default = false}, 1):addKeypicker({
				flag = "silentAim_instantHitKeybind",
				default = "None",
				blacklisted = {"W", "A", "S", "D", "Space"},
				mode = "toggle",
			})
			Arg1:addToggle({flag = "silentAim_prediction", text = "prediction", default = true}, 1)
			Arg1:addToggle({flag = "silentAim_manipulation", text = "manipulation", default = false}, 1):addKeypicker({
				flag = "silentAim_manipulationKeybind",
				default = "None",
				blacklisted = {"W", "A", "S", "D", "Space"},
				mode = "toggle",
			})
			Arg1:addToggle({flag = "silentAim_manipulationIndicator", text = "manipulation indicator", default = true}, 1):addColourpicker({flag = "silentAim_manipulationIndicatorColour", default = FromRGB(255, 0, 0)})
			Arg1:addSlider({
				flag = "silentAim_manipulationDistance",
				text = "manipulation distance",
				max = 8,
				min = 3,
				suffix = " studs",
				increment = 0.1,
				default = 8,
			}, 1)
			Arg1:addToggle({flag = "silentAim_hitscan", text = "hitscan", default = false}, 1):addKeypicker({
				flag = "silentAim_hitscanKeybind",
				default = "None",
				blacklisted = {"W", "A", "S", "D", "Space"},
				mode = "toggle",
			})
			Arg1:addToggle({flag = "silentAim_hitscanIndicator", text = "hitscan indicator", default = true}, 1):addColourpicker({flag = "silentAim_hitscanIndicatorColour", default = FromRGB(255, 196, 0)})
			Arg1:addSlider({
				flag = "silentAim_hitscanDistance",
				text = "hitscan distance",
				max = 8.9,
				min = 1,
				suffix = " studs",
				increment = 0.1,
				default = 8.5,
			}, 1)
			Arg1:addToggle({flag = "silentAim_visibleCheck", text = "visible check", default = false}, 1)
			Arg1:addToggle({flag = "silentAim_snapline", text = "snapline", default = false}, 1):addColourpicker({flag = "silentAim_snaplineColour", default = FromRGB(255, 255, 255)})
			Arg1:addToggle({flag = "silentAim_dynamicFov", text = "dynamic fov", default = true}, 1)
			Arg1:addToggle({flag = "silentAim_drawFov", text = "draw fov", default = false}, 1):addColourpicker({flag = "silentAim_fovColour", default = FromRGB(255, 255, 255)})
			Arg1:addSlider({
				flag = "silentAim_fovSize",
				text = "fov size",
				max = 1500,
				min = 10,
				suffix = "px",
				increment = 1,
				default = 300,
			}, 1)
			Arg1:addSlider({
				flag = "gunMods_recoilPercentage",
				text = "recoil",
				max = 100,
				min = 0,
				suffix = "%",
				increment = 1,
				default = 100,
			}, 2)
			Arg1:addSlider({
				flag = "gunMods_spreadPercentage",
				text = "spread",
				max = 100,
				min = 0,
				suffix = "%",
				increment = 1,
				default = 100,
			}, 2)
			Arg1:addSlider({
				flag = "gunMods_firerateMultiplier",
				text = "firerate",
				max = 2.5,
				min = 1,
				suffix = "x",
				increment = 0.1,
				default = 1,
			}, 2)
			Arg1:addToggle({flag = "fullyAutomatic_toggle", text = "always automatic", default = false}, 2)
			Arg1:addToggle({flag = "noMeleeShake_toggle", text = "no melee shake", default = false}, 2)
			Arg1:addToggle({flag = "increaseMeleeSpeed_toggle", text = "increase melee speed", default = false}, 2)
			Arg1:addSlider({
				flag = "increaseMeleeSpeed_amount",
				text = "amount",
				max = 1.3,
				min = 1,
				suffix = "x",
				increment = 0.1,
				default = 1,
			}, 2)
			Arg1:addToggle({flag = "increaseMeleeRange_toggle", text = "increase melee range", default = false}, 2)
			Arg1:addSlider({
				flag = "increaseMeleeRange_amount",
				text = "amount",
				max = 2.5,
				min = 1,
				suffix = "x",
				increment = 0.1,
				default = 1,
			}, 2)
			Arg1:addToggle({flag = "instantEoka_toggle", text = "instant eoka", default = false}, 2)
			Arg1:addToggle({flag = "alwaysShoot_toggle", text = "always shoot", default = false}, 2)
			Arg1:addToggle({flag = "autoReload_toggle", text = "auto reload", default = false, risky = true}, 2)
			Arg1:addToggle({flag = "bulletTp_toggle", text = "tp to bullet", default = false, risky = true}, 2):addKeypicker({
				flag = "bulletTp_keybind",
				default = "None",
				blacklisted = {"W", "A", "S", "D", "Space"},
				mode = "toggle",
			})
		end
	end)()
	local V2 = (function()
		local FromRGB = Color3_2.fromRGB
		return function(Arg1)
			Arg1:addToggle({flag = "playerEsp_toggle", text = "player esp", default = false}, 1):addKeypicker({
				flag = "playerEsp_keybind",
				default = "None",
				blacklisted = {"W", "A", "S", "D", "Space"},
				mode = "toggle",
			})
			Arg1:addToggle({flag = "playerEsp_teamCheck", text = "teamcheck", default = true}, 1)
			Arg1:addToggle({flag = "playerEsp_name", text = "name", default = false}, 1):addColourpicker({flag = "playerEsp_nameColour", default = FromRGB(255, 255, 255)})
			Arg1:addToggle({flag = "playerEsp_box", text = "box", default = false}, 1):addColourpicker({flag = "playerEsp_boxColour", default = FromRGB(255, 255, 255)})
			Arg1:addToggle({flag = "playerEsp_healthbar", text = "healthbar", default = false}, 1)
			Arg1:addToggle({flag = "playerEsp_distance", text = "distance", default = false}, 1):addColourpicker({flag = "playerEsp_distanceColour", default = FromRGB(255, 255, 255)})
			Arg1:addToggle({flag = "playerEsp_weapon", text = "weapon", default = false}, 1):addColourpicker({flag = "playerEsp_weaponColour", default = FromRGB(255, 255, 255)})
			Arg1:addToggle({flag = "npcEsp_toggle", text = "npc esp", default = false}, 2)
			Arg1:addToggle({flag = "npcEsp_name", text = "name", default = false}, 2)
			Arg1:addToggle({flag = "npcEsp_box", text = "box", default = false}, 2)
			Arg1:addToggle({flag = "npcEsp_healthbar", text = "healthbar", default = false}, 2)
			Arg1:addToggle({flag = "npcEsp_distance", text = "distance", default = false}, 2)
			Arg1:addToggle({flag = "npcEsp_scav", text = "scav", default = false}, 2):addColourpicker({flag = "npcEsp_scavColour", default = FromRGB(62, 87, 55)})
			Arg1:addToggle({flag = "npcEsp_bruno", text = "bruno", default = false}, 2):addColourpicker({flag = "npcEsp_brunoColour", default = FromRGB(81, 99, 40)})
			Arg1:addToggle({flag = "npcEsp_boris", text = "boris", default = false}, 2):addColourpicker({flag = "npcEsp_borisColour", default = FromRGB(21, 26, 10)})
			Arg1:addToggle({flag = "npcEsp_brutus", text = "brutus", default = false}, 2):addColourpicker({flag = "npcEsp_brutusColour", default = FromRGB(38, 41, 33)})
			Arg1:addToggle({flag = "npcEsp_bradley", text = "bradley", default = false}, 2):addColourpicker({flag = "npcEsp_bradleyColour", default = FromRGB(39, 49, 16)})
			Arg1:addToggle({flag = "npcEsp_wolf", text = "wolf", default = false}, 2):addColourpicker({flag = "npcEsp_wolfColour", default = FromRGB(105, 95, 68)})
			Arg1:addToggle({flag = "npcEsp_deer", text = "deer", default = false}, 2):addColourpicker({flag = "npcEsp_deerColour", default = FromRGB(63, 57, 41)})
			Arg1:addToggle({flag = "npcEsp_boar", text = "boar", default = false}, 2):addColourpicker({flag = "npcEsp_boarColour", default = FromRGB(43, 35, 13)})
			Arg1:addSlider({
				flag = "npcEsp_maxDistance",
				text = "max distance",
				max = 7500,
				min = 400,
				suffix = " studs",
				increment = 1,
				default = 1000,
			}, 2)
		end
	end)()
	local V3 = (function()
		local FromRGB = Color3_2.fromRGB
		return function(Arg1, Arg2)
			Arg1:addToggle({flag = "entityEsp_toggle", text = "entity esp", default = false}, 1)
			Arg1:addToggle({flag = "entityEsp_box", text = "box", default = false}, 1)
			Arg1:addToggle({flag = "entityEsp_name", text = "name", default = false}, 1)
			Arg1:addToggle({flag = "entityEsp_distance", text = "distance", default = false}, 1)
			Arg1:addToggle({flag = "entityEsp_minicopter", text = "minicopter", default = false}, 1):addColourpicker({flag = "entityEsp_minicopterColour", default = FromRGB(44, 236, 19)})
			Arg1:addToggle({flag = "entityEsp_bodyBag", text = "body bag", default = false}, 1):addColourpicker({flag = "entityEsp_bodyBagColour", default = FromRGB(255, 101, 40)})
			Arg1:addToggle({flag = "entityEsp_airdrop", text = "airdrop", default = false}, 1):addColourpicker({flag = "entityEsp_airdropColour", default = FromRGB(80, 49, 20)})
			Arg1:addToggle({flag = "entityEsp_timedCrate", text = "timed crate", default = false}, 1):addColourpicker({flag = "entityEsp_timedCrateColour", default = FromRGB(41, 41, 41)})
			Arg1:addToggle({flag = "entityEsp_hemp", text = "hemp", default = false}, 1):addColourpicker({flag = "entityEsp_hempColour", default = FromRGB(168, 168, 168)})
			Arg1:addToggle({flag = "entityEsp_stone", text = "stone", default = false}, 1):addColourpicker({flag = "entityEsp_stoneColour", default = FromRGB(87, 87, 87)})
			Arg1:addToggle({flag = "entityEsp_phosphate", text = "phosphate", default = false}, 1):addColourpicker({flag = "entityEsp_phosphateColour", default = FromRGB(235, 229, 158)})
			Arg1:addToggle({flag = "entityEsp_metal", text = "metal", default = false}, 1):addColourpicker({flag = "entityEsp_metalColour", default = FromRGB(145, 85, 62)})
			if Arg2 then
				Arg1:addToggle({flag = "entityEsp_smallGift", text = "small gift", default = false}, 1):addColourpicker({flag = "entityEsp_smallGiftColour", default = FromRGB(255, 7, 11)})
				Arg1:addToggle({flag = "entityEsp_mediumGift", text = "medium gift", default = false}, 1):addColourpicker({flag = "entityEsp_mediumGiftColour", default = FromRGB(255, 215, 15)})
				Arg1:addToggle({flag = "entityEsp_largeGift", text = "large gift", default = false}, 1):addColourpicker({flag = "entityEsp_largeGiftColour", default = FromRGB(60, 255, 16)})
			end
			Arg1:addSlider({
				flag = "entityEsp_maxDistance",
				text = "max distance",
				max = 7500,
				min = 400,
				suffix = " studs",
				increment = 1,
				default = 1000,
			}, 1)
			Arg1:addToggle({flag = "silentMinicopter_toggle", text = "silent minicopter", default = false}, 2)
			Arg1:addToggle({flag = "disableMinicopterDamage_toggle", text = "disable minicopter damage", default = false}, 2)
			Arg1:addToggle({flag = "shootWhilePiloted_toggle", text = "shoot while piloted", default = false}, 2)
			Arg1:addToggle({flag = "xray_toggle", text = "xray", default = false}, 2):addKeypicker({
				flag = "xray_keybind",
				default = "None",
				blacklisted = {"W", "A", "S", "D", "Space"},
				mode = "toggle",
			})
			Arg1:addSlider({
				flag = "xray_transparency",
				text = "xray transparency",
				max = 100,
				min = 1,
				suffix = "%",
				increment = 1,
				default = 70,
			}, 2)
			Arg1:addToggle({flag = "disableTraps_toggle", text = "disable traps", default = false}, 2)
			Arg1:addToggle({flag = "disableSpikes_toggle", text = "disable spikes", default = false}, 2)
		end
	end)()
	local V4 = (function()
		local FromRGB = Color3_2.fromRGB
		return function(Arg1)
			Arg1:addToggle({flag = "speedHack_toggle", text = "speedhack", default = false}, 1):addKeypicker({
				flag = "speedHack_keybind",
				default = "None",
				blacklisted = {"W", "A", "S", "D", "Space"},
				mode = "toggle",
			})
			Arg1:addSlider({
				flag = "speedHack_amount",
				text = "speed",
				max = 40,
				min = 16,
				suffix = "studs/s",
				increment = 1,
				default = 16,
			}, 1)
			Arg1:addToggle({flag = "fly_toggle", text = "flight", default = false}, 1):addKeypicker({
				flag = "fly_keybind",
				default = "None",
				blacklisted = {"W", "A", "S", "D", "Space"},
				mode = "toggle",
			})
			Arg1:addSlider({
				flag = "fly_speed",
				text = "speed",
				max = 40,
				min = 16,
				suffix = "studs/s",
				increment = 1,
				default = 16,
			}, 1)
			Arg1:addToggle({flag = "antiaim_toggle", text = "underground antiaim", default = false}, 1):addKeypicker({
				flag = "antiaim_keybind",
				default = "None",
				blacklisted = {"W", "A", "S", "D", "Space"},
				mode = "toggle",
			})
			Arg1:addSlider({
				flag = "antiaim_depth",
				text = "antiaim depth",
				max = 3,
				min = 1,
				suffix = " studs",
				increment = 0.1,
				default = 2,
			}, 1)
			Arg1:addToggle({flag = "noFallDamage_toggle", text = "no fall damage (buggy)", default = false}, 1):addKeypicker({
				flag = "noFallDamage_keybind",
				default = "None",
				blacklisted = {"W", "A", "S", "D", "Space"},
				mode = "toggle",
			})
			Arg1:addToggle({flag = "alwaysCriticals_toggle", text = "always farm criticals", default = false}, 1)
			Arg1:addToggle({flag = "instantEquip_toggle", text = "instant equip", default = false}, 1)
			Arg1:addToggle({flag = "silentWalk_toggle", text = "silent walk", default = false}, 1)
			Arg1:addToggle({flag = "instantLoot_toggle", text = "instant loot", default = false}, 1)
			Arg1:addToggle({flag = "localChams_toggle", text = "local chams", default = false}, 2):addColourpicker({flag = "localChams_colour", default = FromRGB(255, 255, 255)})
			Arg1:addSlider({
				flag = "localChams_transparency",
				text = "transparency",
				max = 100,
				min = 0,
				suffix = "%",
				increment = 1,
				default = 50,
			}, 2)
			Arg1:addDropdown({
				flag = "localChams_material",
				text = "material",
				options = {"forcefield", "neon", "smoothplastic"},
				default = "forcefield",
			}, 2)
			Arg1:addToggle({flag = "fovChanger_toggle", text = "fov changer", default = false}, 2)
			Arg1:addSlider({
				flag = "fovChanger_amount",
				text = "fov amount",
				max = 120,
				min = 30,
				suffix = "°",
				increment = 1,
				default = 70,
			}, 2)
			Arg1:addToggle({flag = "zoom_toggle", text = "zoom", default = false}, 2):addKeypicker({
				flag = "zoom_keybind",
				default = "None",
				blacklisted = {"W", "A", "S", "D", "Space"},
				mode = "hold",
			})
			Arg1:addSlider({
				flag = "zoom_amount",
				text = "zoom fov",
				max = 120,
				min = 5,
				suffix = "°",
				increment = 1,
				default = 40,
			}, 2)
			Arg1:addToggle({flag = "freecam_toggle", text = "freecam", default = false}, 2):addKeypicker({
				flag = "freecam_keybind",
				default = "None",
				blacklisted = {"W", "A", "S", "D", "Space"},
				mode = "toggle",
			})
			Arg1:addSlider({
				flag = "freecam_speed",
				text = "freecam speed",
				max = 200,
				min = 30,
				suffix = " studs/s",
				increment = 1,
				default = 45,
			}, 2)
			Arg1:addToggle({flag = "ambient_toggle", text = "ambient", default = false}, 2):addColourpicker({flag = "ambient_colour", default = FromRGB(255, 255, 255)})
			Arg1:addToggle({flag = "removeGrass_toggle", text = "remove grass", default = false}, 2)
			Arg1:addToggle({flag = "staffDetector_toggle", text = "staff detector", default = false}, 2)
			Arg1:addToggle({flag = "suicide_toggle", text = "suicide", default = false}, 2):addKeypicker({
				flag = "suicide_keybind",
				default = "None",
				blacklisted = {"W", "A", "S", "D", "Space"},
				mode = "toggle",
			})
			Arg1:addToggle({flag = "resolveAntiAim_toggle", text = "resolve antiaim", default = false}, 2)
			Arg1:addToggle({flag = "combatMode_toggle", text = "combat mode", default = false}, 2):addKeypicker({
				flag = "combatMode_keybind",
				default = "None",
				blacklisted = {"W", "A", "S", "D", "Space"},
				mode = "toggle",
			})
		end
	end)()
	return function(Arg1, Arg2)
		local V5 = {
			combat = Arg1:addTab("combat"),
			visuals = Arg1:addTab("visuals"),
			entity = Arg1:addTab("entity"),
			_local = Arg1:addTab("local"),
			ui = Arg1:addTab("ui"),
		}
		V(V5.combat)
		V2(V5.visuals)
		V3(V5.entity, Arg2)
		V4(V5._local)
		return V5
	end
end)()
local V65 = (function()
	return function(Arg1)
		local Tabs = Arg1.tabs
		Tabs.ui:addConfigs(1)
		Tabs.ui:addToggle({flag = "targetHud_toggle", text = "target hud", default = false}, 2)
		Tabs.ui:addToggle({flag = "keybindList_toggle", text = "keybind list", default = false}, 2)
	end
end)()
local V66 = (function()
	return function(Arg1)
		local function Fn(Arg1_2)
			if (not Arg1_2) then
				Arg1.targetHUD:toggle(false)
				return
			end
			Arg1.targetHUD:toggle(Arg1.flags.targetHud_toggle.value)
		end
		Arg1.window:onToggle(Fn)
		Fn(Arg1.window.active)
	end
end)()
local V67 = (function()
	local FromRGB = Color3_2.fromRGB
	local V = (function()
		local New = Drawing2.new
		local V = V16
		return function(Arg1, Arg2, ...)
			local V2 = New(Arg1)
			for Key, Value in Arg2 do
				V2[Key] = Value
			end
			for Key2, Value2 in {...} do
				V(Value2, V2)
			end
			return V2
		end
	end)()
	local V2 = V20[5]
	return function(Arg1)
		local Camera = Arg1.services.camera
		local Lighting = Arg1.services.lighting
		local ChristmasUpdate = Arg1.const.CHRISTMAS_UPDATE
		Arg1.drawings = {
			silent = {
				fov = V("Circle", {Visible = false, Filled = false, Thickness = 1, ZIndex = 30, Color = FromRGB(1, 1, 1)}),
				snapline = V("Line", {Visible = false, Thickness = 1, ZIndex = 30, Color = FromRGB(1, 1, 1)}),
				manipulation_indicator = V("Text", {
					Visible = false,
					Text = "manipulated",
					Font = V2.FONT,
					Center = true,
					Outline = true,
					OutlineColor = FromRGB(1, 1, 1),
					Size = V2.SIZE,
					ZIndex = 30,
					Color = FromRGB(1, 1, 1),
					Position = Camera.ViewportSize / 2 + Vector2_2.new(0, 30),
				}),
				hitscan_indicator = V("Text", {
					Visible = false,
					Text = "hitscanning",
					Font = V2.FONT,
					Center = true,
					Outline = true,
					OutlineColor = FromRGB(1, 1, 1),
					Size = V2.SIZE,
					ZIndex = 30,
					Color = FromRGB(1, 1, 1),
					Position = Camera.ViewportSize / 2 + Vector2_2.new(0, 43),
				}),
			},
		}
		Arg1.target = {
			silent = {
				player = nil,
				vector2 = nil,
				vector3 = nil,
				character = nil,
				rootPart = nil,
				origin = nil,
				hitPosition = nil,
				notVisible = nil,
				hitscanned = nil,
				manipulated = nil,
			},
			aimbot = {},
			highlighted = {},
		}
		Arg1.client = {
			ALLOW_FFLAGS = false,
			FULLY_LOADED = false,
			staticOffset = nil,
			mousepos = Arg1.services.userInputService:GetMouseLocation(),
			scanOrigin = nil,
			realCameraPos = nil,
			hitMeleeFilter = nil,
			targetingTime = 0,
			reloadTime = 0,
			characterAdded = nil,
			mouseButton1DownFunc = nil,
			fireRemote = nil,
			toolInfo = nil,
			itemInfo = nil,
			animationTable = nil,
		}
		Arg1.keyHandlers = {}
		Arg1.moderators = {}
		Arg1.GLOBAL_HIT_IGNORE = {}
		Arg1.CACHED = {hitscanAngles = {}, manipulationAngles = {}}
		Arg1.HIDDEN_SETTINGS = {targetTime = 0.016666666666666666, maxRayAmount = 160}
		Arg1.BODY_PARTS = {
			"Head",
			"UpperTorso",
			"RightHand",
			"RightUpperArm",
			"LeftHand",
			"LeftUpperArm",
			"RightUpperLeg",
			"LeftUpperLeg",
		}
		Arg1.entityESP_settings = {
			["Wool Plant"] = {"hemp", FromRGB(168, 168, 168)},
			Stone_Node = {"stone", FromRGB(87, 87, 87)},
			Phosphate_Node = {"phosphate", FromRGB(235, 229, 158)},
			Metal_Node = {"metal", FromRGB(145, 85, 62)},
			["Body Bag"] = {"body bag", FromRGB(255, 101, 40)},
			["Care Package"] = {"airdrop", FromRGB(80, 49, 20)},
			["Timed Crate"] = {"timed crate", FromRGB(41, 41, 41)},
			["Salvaged Flycopter"] = {"minicopter", FromRGB(44, 236, 19)},
		}
		if ChristmasUpdate then
			Arg1.entityESP_settings["Small Gift"] = {"small present", FromRGB(255, 7, 11)}
			Arg1.entityESP_settings["Medium Gift"] = {"medium present", FromRGB(255, 215, 15)}
			Arg1.entityESP_settings["Large Gift"] = {"large present", FromRGB(60, 255, 16)}
		end
		Arg1.npcESP_settings = {
			Soldier = {"scav", FromRGB(62, 87, 55)},
			Bruno = {"bruno", FromRGB(81, 99, 40)},
			Boris = {"boris", FromRGB(21, 26, 10)},
			Brutus = {"brutus", FromRGB(38, 41, 33)},
			BTR = {"bradley", FromRGB(39, 49, 16)},
			PREFAB_ANIMAL_WOLF = {"wolf", FromRGB(105, 95, 68)},
			PREFAB_ANIMAL_DEER = {"deer", FromRGB(63, 57, 41)},
			PREFAB_ANIMAL_WILDBOAR = {"boar", FromRGB(43, 35, 13)},
		}
		Arg1.lightingSpoof = {Ambient = Lighting.Ambient}
		Arg1.cameraSpoof = {FieldOfView = Camera.FieldOfView}
		Arg1.lightingIgnore = {}
	end
end)()
local V68 = (function()
	local New = Vector2_2.new
	local V = V20[7]
	return function(Arg1)
		local Camera = Arg1.services.camera
		local Vfx = Arg1.world.vfx
		local Plants = Arg1.world.plants
		local Drops = Arg1.world.drops
		local Client = Arg1.client
		local V2 = V
		local function Fn(Arg1_2, Arg2, Arg3)
			local V2 = RaycastParams2.new()
			V2.RespectCanCollide = true
			V2.FilterDescendantsInstances = {Arg3, Camera, Vfx, Plants, Drops, Arg1.localcharacter, Unpack(Arg1.GLOBAL_HIT_IGNORE)}
			local V3 = Workspace:Raycast(Arg1_2, Arg2 - Arg1_2, V2)
			return not V3, V3
		end
		local function Fn2(Arg1)
			local V2, V3 = Camera:WorldToViewportPoint(Arg1)
			return New(V2.X, V2.Y), V3, V2.Z
		end
		local function Fn3(Arg1)
			local NameTag = Arg1:FindFirstChild("NameTag")
			return NameTag and NameTag.AlwaysOnTop
		end
		local function Fn4(Arg1)
			return Arg1:GetAttribute("Downed") or Arg1.Health <= 0
		end
		local function Fn5(Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8)
			return {distance = Arg1, player = Arg2, character = Arg3, vector3 = Arg4, vector2 = Arg5, humanoid = Arg6, instance = Arg7, rootPart = Arg8, origin = Client.scanOrigin and Client.scanOrigin.Position}
		end
		Arg1.replacemetamethod = V2
		Arg1.isVisible = Fn
		Arg1.world2viewport = Fn2
		Arg1.isTeammate = Fn3
		Arg1.isDowned = Fn4
		Arg1.generateTarget = Fn5
		Arg1.tempInstance = nil
	end
end)()
local V69 = (function()
	local V = V16
	local V2 = V17
	local V3 = (function()
		local V = V9
		local V2 = V18
		local SetMetatable = SetMetatable
		local New = CFrame2.new
		return function(Arg1)
			local Cached = Arg1.CACHED
			local HiddenSettings = Arg1.HIDDEN_SETTINGS
			local GlobalHitIgnore = Arg1.GLOBAL_HIT_IGNORE
			local Client = Arg1.client
			local Camera = Arg1.services.camera
			local Vfx = Arg1.world.vfx
			local Plants = Arg1.world.plants
			local Drops = Arg1.world.drops
			local V4 = RaycastParams2.new()
			V4.RespectCanCollide = true
			local T = {}
			local V5 = true
			local V6 = nil
			local V7 = 0
			local V8 = SetMetatable({}, {__mode = "k"})
			local V9 = SetMetatable({}, {__mode = "k"})
			local function Fn()
				V7 = HiddenSettings.maxRayAmount
				V5 = true
			end
			local function Fn2()
				V(T)
				T[1] = Camera
				T[2] = Camera
				T[3] = Vfx
				T[4] = Plants
				T[5] = Drops
				local V3 = 5
				local Localcharacter = Arg1.localcharacter
				if (Localcharacter) then
					V3 += 1
					T[V3] = Localcharacter
				end
				V2(GlobalHitIgnore, 1, #GlobalHitIgnore, V3 + 1, T)
				V5 = false
				V6 = nil
			end
			local function Fn3(Arg1, Arg2, Arg3)
				if (V7 <= 0) then
					return false, nil
				end
				V7 -= 1
				if V5 then
					Fn2()
				end
				local V2 = Arg3 or Camera
				if (V2 ~= V6) then
					T[1] = V2
					V4.FilterDescendantsInstances = T
					V6 = V2
				end
				local V3 = Workspace:Raycast(Arg1, Arg2 - Arg1, V4)
				return not V3, V3
			end
			local function Fn4(Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8)
				local V2 = Arg2[Arg3]
				if (V2 and Arg1[V2]) then
					local V3, V4 = Arg4(Arg1[V2], Arg5, Arg6, Arg7, Arg8)
					if (V3) then
						return V3, V4
					end
				end
				for Index = 1, #Arg1 do
					if (Index == V2) then
						continue
					end
					local V5, V6 = Arg4(Arg1[Index], Arg5, Arg6, Arg7, Arg8)
					if (V5) then
						Arg2[Arg3] = Index
						return V5, V6
					end
				end
				return nil, nil
			end
			local function Fn5(Arg1, Arg2, Arg3, Arg4)
				local V2 = Arg3 + Arg1
				local V3, V4 = Fn3(Arg3, V2, Arg4)
				if (not V3) then
					if (not V4) then
						return nil
					end
					V2 = Arg3 + ((V2 - Arg3).Unit * (V4.Distance - 0.2))
				end
				if (Fn3(Arg2, V2, Arg4)) then
					return V2
				end
				return nil
			end
			local function Fn6(Arg1, Arg2, Arg3)
				return Fn4(Cached.hitscanAngles, V8, Arg3, Fn5, Arg1, Arg2, Arg3)
			end
			local function Fn7(Arg1, Arg2, Arg3, Arg4, Arg5)
				local Position = Arg2.Position
				local Position2 = (Arg2 * New(Arg1)).Position
				local V2, V3 = Fn3(Position, Position2)
				if (not V2) then
					if (not V3) then
						return nil, nil
					end
					Position2 = Position + ((Position2 - Position).Unit * (V3.Distance - 0.2))
				end
				if (Fn3(Position2, Arg3, Arg4)) then
					return Position2, nil
				elseif (Arg5) then
					local V4 = Fn6(Position2, Arg3, Arg4)
					if (V4) then
						return Position2, V4
					end
				end
				return nil, nil
			end
			return {
				beginTick = Fn,
				cast = Fn3,
				canHitscan = Fn6,
				canManipulate = function(Arg1, Arg2, Arg3)
					local V2 = Client.scanOrigin or Camera.CFrame
					return Fn4(Cached.manipulationAngles, V9, Arg2, Fn7, V2, Arg1, Arg2, Arg3)
				end,
			}
		end
	end)()
	local V4 = 1300
	local V5 = {Soldier = true, Bruno = true, Boris = true, Brutus = true}
	local function Fn(Arg1, Arg2)
		return Arg1.distance < Arg2.distance
	end
	return function(Arg1)
		local Target = Arg1.target
		local Drawings = Arg1.drawings
		local Client = Arg1.client
		local Camera = Arg1.services.camera
		local Players = Arg1.services.players
		local Military = Arg1.world.military
		local Flags = Arg1.flags
		local BodyParts = Arg1.BODY_PARTS
		local IsTeammate = Arg1.isTeammate
		local IsDowned = Arg1.isDowned
		local World2viewport = Arg1.world2viewport
		local GenerateTarget = Arg1.generateTarget
		local V6 = V3(Arg1)
		local BeginTick = V6.beginTick
		local Cast = V6.cast
		local CanHitscan = V6.canHitscan
		local CanManipulate = V6.canManipulate
		local function Fn2(Arg1, Arg2, Arg3, Arg4, Arg5, Arg6)
			local V2 = Flags.silentAim_hitpart.value == "torso" and Arg4:FindFirstChild("UpperTorso") or Arg4:FindFirstChild("Head")
			if (not V2) then
				return
			end
			local Position = V2.Position
			local V3, V4 = World2viewport(Position)
			if (not V4) then
				return
			end
			local Magnitude = (V3 - Client.mousepos).Magnitude
			if (Magnitude > Arg2) then
				return
			end
			V(Arg1, GenerateTarget(Magnitude, Arg3, Arg4, Position, V3, Arg5, V2, Arg6))
		end
		local function Fn3(Arg1, Arg2)
			local Character = Arg2.character
			local Name = Arg2.instance.Name
			for Index = 1, #BodyParts do
				local V2 = BodyParts[Index]
				if (V2 == Name) then
					continue
				end
				local V3 = Character:FindFirstChild(V2)
				if (not V3) then
					continue
				end
				local Position = V3.Position
				local V4, V5 = World2viewport(Position)
				if (not V5) then
					continue
				end
				local Magnitude = (V4 - Client.mousepos).Magnitude
				V(Arg1, GenerateTarget(Magnitude, Arg2.player, Character, Position, V4, Arg2.humanoid, V3, Arg2.rootPart))
			end
		end
		local function Fn4(Arg1, Arg2)
			local Value = Flags.silentAim_teamCheck.value
			local ScanOrigin = Client.scanOrigin
			local Players2 = Players:GetPlayers()
			for Index = 2, #Players2 do
				local V2 = Players2[Index]
				local Character = V2.Character
				local V3 = Character and Character:FindFirstChild("Humanoid")
				local V5 = Character and Character.PrimaryPart
				if (not V3 or not V5 or IsDowned(V3) or ScanOrigin and (V5.Position - ScanOrigin.Position).Magnitude > V4 or Value and IsTeammate(Character)) then
					continue
				end
				Fn2(Arg1, Arg2, V2, Character, V3, V5)
			end
		end
		local function Fn5(Arg1, Arg2)
			local Children = Military:GetChildren()
			for Index = 1, #Children do
				local Children2 = Children[Index]:GetChildren()
				for Index2 = 1, #Children2 do
					local V2 = Children2[Index2]
					if (not V5[V2.Name]) then
						continue
					end
					local Humanoid = V2:FindFirstChildOfClass("Humanoid")
					if (not Humanoid or Humanoid.Health <= 0) then
						continue
					end
					Fn2(Arg1, Arg2, V2, V2, Humanoid, nil)
				end
			end
		end
		local function Fn6(Arg1)
			local V3 = Flags.silentAim_hitpart.value == "closest"
			local Value = Flags.silentAim_visibleCheck.value
			local Value2 = Flags.silentAim_manipulation.value
			local Value3 = Flags.silentAim_hitscan.value
			if (not Value and not Value2 and not Value3) then
				local V4 = nil
				for Index = 1, #Arg1 do
					local V5 = Arg1[Index]
					if (not V4 or V5.distance <= V4.distance) then
						V4 = V5
					end
				end
				if (V4 and V3) then
					local T = {}
					Fn3(T, V4)
					for Index2 = 1, #T do
						if (T[Index2].distance < V4.distance) then
							V4 = T[Index2]
						end
					end
				end
				return V4
			end
			if (V3) then
				for Index3 = 1, #Arg1 do
					Fn3(Arg1, Arg1[Index3])
				end
			end
			V2(Arg1, Fn)
			local V6 = Client.scanOrigin and Client.scanOrigin.Position or Camera.CFrame.Position
			for Index4 = 1, #Arg1 do
				local V7 = Arg1[Index4]
				if (Cast(V6, V7.vector3, V7.character)) then
					return V7
				end
				if (Value3) then
					local V8 = CanHitscan(V6, V7.vector3, V7.character)
					if (V8) then
						V7.hitscanned = true
						V7.hitPosition = V8
						return V7
					end
				end
				if (Value2) then
					local V9, V10 = CanManipulate(V7.vector3, V7.character, Value3)
					if (V9) then
						V7.manipulated = true
						V7.origin = V9
						V7.hitscanned = V10 ~= nil
						V7.hitPosition = V10
						return V7
					end
				end
			end
			local V11 = Arg1[1]
			if (not Value and V11) then
				V11.notVisible = true
				return V11
			end
			return nil
		end
		function Arg1.getClosestPlayer()
			if (not Flags.silentAim_toggle.value) then
				Target.silent = {}
				return
			end
			BeginTick()
			local Radius = Drawings.silent.fov.Radius
			local T = {}
			Fn4(T, Radius)
			local V2 = Fn6(T)
			if (not V2 and Flags.silentAim_targetNpcs.value) then
				T = {}
				Fn5(T, Radius)
				V2 = Fn6(T)
			end
			if (not V2) then
				Target.silent = {}
				return
			end
			if (not V2.vector2) then
				V2.vector2 = World2viewport(V2.vector3)
			end
			Target.silent = V2
		end
	end
end)()
local V70 = (function()
	return function(Arg1)
		local Items = Arg1.gameModules.items
		local ToolInfo = Arg1.gameModules.toolinfo
		return function()
			local Localcharacter = Arg1.localcharacter
			if (not Localcharacter) then
				return
			end
			local ViewmodelController = Localcharacter:FindFirstChild("ViewmodelController")
			local InventoryController = Localcharacter:FindFirstChild("InventoryController")
			if (not (InventoryController and ViewmodelController)) then
				return
			end
			local Fetch = InventoryController:FindFirstChild("Fetch")
			if (not Fetch) then
				return
			end
			local V2, V3 = Pcall(Fetch.Invoke, Fetch)
			if (not V2 or Type(V3) ~= "table") then
				return
			end
			local Toolbar = V3.Toolbar
			local Attribute = ViewmodelController:GetAttribute("Equipped")
			if (Type(Toolbar) ~= "table" or not Attribute) then
				return
			end
			local V4 = Toolbar[Attribute]
			local V5 = Type(V4) == "table" and Items[V4.ID]
			if (Type(V5) ~= "table") then
				return
			end
			local Name = V5.Name
			local V6 = Name and ToolInfo[Name]
			if (Type(V6) ~= "table") then
				return
			end
			return V6, V5
		end
	end
end)()
local V71 = (function()
	return function(Arg1)
		local Client = Arg1.client
		local New = Vector3_2.new
		local Min = Min
		local Max = Max
		local Abs = Abs
		local Ceil = Ceil
		local RawGet = RawGet
		local V6 = 196.2
		local V7 = 0.016666666666666666
		local function Fn(Arg1, Arg2, Arg3, Arg4, Arg5, Arg6)
			local V2 = Arg2 * Arg3
			local V4 = Arg1
			local V5 = 0
			local T = {{pos = Arg1, vel = V2, traveled = 0}}
			for Index = 1, Arg6 do
				local V8 = Min(V5 + Arg3 * V7, Arg5) - V5
				local V9 = V4 + V2.Unit * V8
				V5 = V5 + V8
				V2 = V2 - New(0, V6 * Arg4, 0) * V7
				V4 = V9
				T[Index + 1] = {pos = V4, vel = V2, traveled = V5}
				if (Abs(Arg5 - V5) <= 1) then
					break
				end
			end
			return T
		end
		local function Fn2(Arg1, Arg2, Arg3, Arg4, Arg5)
			for Index = 2, #Arg2 do
				local V3 = Arg2[Index]
				local V4 = Arg2[Index - 1]
				local Magnitude = New(V3.pos.X - Arg1.X, 0, V3.pos.Z - Arg1.Z).Magnitude
				if (Magnitude >= Arg3) then
					local Magnitude2 = New(V4.pos.X - Arg1.X, 0, V4.pos.Z - Arg1.Z).Magnitude
					local V5 = (Arg3 - Magnitude2) / Max(Magnitude - Magnitude2, 0.0001)
					local V6 = V5 * V7
					local Vel = V4.vel
					local V8 = Min(V4.traveled + Arg4 * V6, Arg5) - V4.traveled
					local V9 = V4.pos + Vel.Unit * V8
					local V10 = (Index - 2 + V5) * V7
					return V9.Y, V10
				end
			end
			return nil, nil
		end
		return function(Arg1, Arg2)
			if not Client.toolInfo then
				return Arg2
			end
			local V2 = RawGet(Client.toolInfo, "Bullet")
			if Type(V2) ~= "table" then
				return Arg2
			end
			local V6 = RawGet(V2, "Gravity") or 0
			local V7 = RawGet(V2, "Speed") or math.huge
			if Type(V6) ~= "number" or Type(V7) ~= "number" then
				return Arg2
			end
			local V8 = Arg2 - Arg1
			local V9 = New(V8.X, 0, V8.Z)
			local Magnitude = V9.Magnitude
			local Unit = V9.Unit
			if Magnitude < 0.001 then
				return Arg2, Abs(V8.Y) / V7
			end
			local V10 = Min(Ceil(Magnitude / V7 * 4 / 0.016666666666666666), 10000)
			local V11 = -V7
			local V12 = V7
			local Unit3 = Unit
			;(function()
				for Index = 1, 64 do
					local V2 = (V11 + V12) / 2
					local Unit2 = New(Unit.X, V2 / V7, Unit.Z).Unit
					local V4 = Fn(Arg1, Unit2, V7, V6, 9000000000, V10)
					local V5, V8 = Fn2(Arg1, V4, Magnitude, V7, 9000000000)
					if (V5 == nil) then
						Unit3 = (Arg2 - Arg1).Unit
						break
					end
					local V9 = V5 - Arg2.Y
					if (Abs(V9) < 0.001) then
						Unit3 = Unit2
						break
					end
					if (V9 > 0) then
						V12 = V2
					else
						V11 = V2
					end
					Unit3 = Unit2
				end
			end)()
			local V14 = Fn(Arg1, Unit3, V7, V6, 9000000000, V10)
			local V15, V16 = Fn2(Arg1, V14, Magnitude, V7, 9000000000)
			return Arg1 + Unit3 * 9999, V16 or Magnitude / V7
		end
	end
end)()
local V72 = (function()
	local V = V3
	local V2 = V16
	local V5 = V4
	local Format = Format
	local Spawn = Task.spawn
	local Wait = Task.wait
	local V7 = V20[4]
	return function(Arg1)
		local Flags = Arg1.flags
		local Moderators = Arg1.moderators
		local Window = Arg1.window
		local PlayerESP = Arg1.playerESP
		local LocalPlayer = Arg1.localplayer
		local Fn = nil
		Fn = function(Arg1, Arg2)
			if (not (Flags.staffDetector_toggle.value and Arg1 and Arg1.Parent)) then
				return
			end
			local V3, V4 = Pcall(Arg1.GetRankInGroupAsync, Arg1, V7.staff.GROUP_ID)
			if (not V3) then
				Spawn(function()
					Wait(0.5)
					Fn(Arg1, Arg2)
				end)
				return
			elseif (V4 >= V7.staff.MIN_RANK) then
				if (not V(Moderators, Arg1)) then
					V2(Moderators, Arg1)
				end
				Window:notify(Format(Arg2 or "Staff Detector: %* has joined your game!", Arg1.DisplayName), 5)
			end
		end
		local function Fn2(Arg1)
			Fn(Arg1)
			PlayerESP.new(Arg1)
		end
		local function Fn3(Arg1)
			if (CompareInstances(Arg1, LocalPlayer)) then
				Pcall(Setfflag, "FRMMinGrassDistance", "100")
				Pcall(Setfflag, "FRMMaxGrassDistance", "290")
				return
			end
			local V2 = V(Moderators, Arg1)
			if (V2) then
				V5(Moderators, V2)
				Window:notify(Format("Staff Detector: %* has left your game!", Arg1.DisplayName), 5)
			end
			PlayerESP.remove(Arg1)
		end
		Arg1.staffDetectorHandler = Fn
		Arg1.playerAdded = Fn2
		Arg1.playerRemoved = Fn3
	end
end)()
local V73 = (function()
	local RawGet = RawGet
	local New = Vector3_2.new
	local YAxis = Vector3_2.yAxis
	local New2 = CFrame2.new
	local FromOrientation = CFrame2.fromOrientation
	local V2 = V20[4]
	return function(Arg1)
		local Flags = Arg1.flags
		local Client = Arg1.client
		local KeyHandlers = Arg1.keyHandlers
		local RunService = Arg1.services.runService
		local Camera = Arg1.services.camera
		local ProtectedCall = Arg1.protectedCall
		local function Fn(Arg1_2)
			if (not Flags.fly_toggle.value) then
				return
			elseif (Flags.freecam_toggle.value) then
				if (not Arg1.localrootpart.Anchored) then
					Arg1.localrootpart.Anchored = true
				end
				return
			end
			local V2 = New(0, 0, 0)
			local CFrame2 = Arg1.localrootpart.CFrame
			local V3, V4, V5 = CFrame2:ToOrientation()
			CFrame2 = New2(CFrame2.Position) * FromOrientation(0, V4, V5)
			local V6 = "W"
			local V7 = "S"
			local V8 = "D"
			local V9 = "A"
			local V10 = "C"
			local V11 = "Space"
			do
				if (KeyHandlers.W) then
					V2 += CFrame2.LookVector
				end
				if (KeyHandlers.S) then
					V2 -= CFrame2.LookVector
				end
				if (KeyHandlers.D) then
					V2 += CFrame2.RightVector
				end
				if (KeyHandlers.A) then
					V2 -= CFrame2.RightVector
				end
				if (KeyHandlers.Space) then
					V2 += YAxis
				end
				if (KeyHandlers.C) then
					V2 -= YAxis
				end
			end
			if (V2.Magnitude == 0) then
				Arg1.localrootpart.Anchored = true
				return
			elseif (Arg1.localrootpart.Anchored) then
				Arg1.localrootpart.Anchored = false
			end
			V2 = V2.Unit * New(Flags.fly_speed.value, 16, Flags.fly_speed.value)
			if (V2 ~= V2) then
				V2 = New()
			end
			Arg1.localrootpart.Velocity = V2
		end
		local function Fn2(Arg1_2)
			if (not Flags.speedHack_toggle.value) then
				return
			end
			local MoveDirection = Arg1.localhumanoid.MoveDirection
			local Velocity = Arg1.localrootpart.Velocity
			local Value = Flags.speedHack_amount.value
			Arg1.localrootpart.Velocity = New(MoveDirection.X * Value, Velocity.Y, MoveDirection.Z * Value)
		end
		local function Fn3(Arg1)
			Client.reloadTime = Client.reloadTime + Arg1
			if not Client.fireRemote or not Flags.autoReload_toggle.value or not (0.3 <= Client.reloadTime) or not Client.toolInfo then
				return
			end
			local V3 = RawGet(Client.toolInfo, "Weapon")
			local V4 = RawGet(Client.itemInfo, "BaseMaxAmmo")
			local V5 = Type(V3) == "table" and RawGet(V3, "RPM")
			if Type(V5) == "number" and RawGet(V3, "ReloadDuration") and Type(V4) == "number" then
				if V5 / 60 / (Flags.gunMods_firerateMultiplier.value * 1.15) / 10 <= Client.reloadTime then
					Client.reloadTime = 0
					ProtectedCall(Client.fireRemote, "Fire", V2.assetContainer.FIRE_KEY, V2.assetContainer.RELOAD_KEY, Workspace:GetServerTimeNow(), "None")
				end
				return
			else
				return
			end
		end
		local function Fn4(Arg1_2)
			local Velocity = Arg1.localrootpart.Velocity
			local CFrame2 = Arg1.localrootpart.CFrame
			local V2 = Flags.antiaim_toggle.value and CFrame2 + New(0, -Flags.antiaim_depth.value, 0)
			local V3 = (Flags.noFallDamage_toggle.value and Velocity.Magnitude > 1 or Flags.fly_toggle.value) and New(0, 16384, 0)
			if (V3) then
				Arg1.localrootpart.Velocity = V3
			end
			if (V2) then
				Client.rootCFrame = CFrame2
				Arg1.localrootpart.CFrame = V2
			else
				Client.rootCFrame = nil
			end
			RunService.PreRender:Wait()
			if (V3) then
				if (Velocity.Magnitude > 80 and Flags.noFallDamage_toggle.value) then
					Velocity = New(0, 0, 0)
				end
				Arg1.localrootpart.Velocity = Velocity
			end
			if (V2) then
				Arg1.localrootpart.CFrame = CFrame2
			end
		end
		local function Fn5(Arg1_2)
			if (not Arg1.localrootpart or not Flags.freecam_toggle.value) then
				return
			end
			SethiddenProperty(Arg1.localrootpart, "NetworkIsSleeping", true)
			local V2 = New(0, 0, 0)
			local CFrame2 = Camera.CFrame
			local V3 = "W"
			local V4 = "S"
			local V5 = "D"
			local V6 = "A"
			local V7 = "C"
			local V8 = "Space"
			do
				if (KeyHandlers.W) then
					V2 += CFrame2.LookVector
				end
				if (KeyHandlers.S) then
					V2 -= CFrame2.LookVector
				end
				if (KeyHandlers.D) then
					V2 += CFrame2.RightVector
				end
				if (KeyHandlers.A) then
					V2 -= CFrame2.RightVector
				end
				if (KeyHandlers.Space) then
					V2 += YAxis
				end
				if (KeyHandlers.C) then
					V2 -= YAxis
				end
			end
			if (V2.Magnitude <= 0) then
				return
			end
			local V9 = Flags.freecam_speed.value * Arg1_2
			if (KeyHandlers.LeftShift) then
				V9 *= 2.5
			end
			Arg1.localrootpart.CFrame = Arg1.localrootpart.CFrame + (V2.Unit * V9)
		end
		Arg1.flyHandler = Fn
		Arg1.speedHandler = Fn2
		Arg1.autoReloadHandler = Fn3
		Arg1.flingTargetHandler = false
		Arg1.desyncHandler = Fn4
		Arg1.freecamHandler = Fn5
	end
end)()
local V74 = (function()
	local Spawn = Task.spawn
	local V = V7
	local LastAiredUpvalue = V20[4].viewmodelController.LAST_AIRED_UPVALUE
	return function(Arg1)
		local Client = Arg1.client
		local Flags = Arg1.flags
		local Drawings = Arg1.drawings
		local Target = Arg1.target
		local HiddenSettings = Arg1.HIDDEN_SETTINGS
		local UserInputService = Arg1.services.userInputService
		local Camera = Arg1.services.camera
		local PlayerESP = Arg1.playerESP
		local NpcESP = Arg1.npcESP
		local TargetHUD = Arg1.targetHUD
		local Window = Arg1.window
		local GetEquipped = Arg1.getEquipped
		local GetClosestPlayer = Arg1.getClosestPlayer
		local FreecamHandler = Arg1.freecamHandler
		local AutoReloadHandler = Arg1.autoReloadHandler
		local FlyHandler = Arg1.flyHandler
		local SpeedHandler = Arg1.speedHandler
		local DesyncHandler = Arg1.desyncHandler
		local DebugSetUpvalue = Arg1.debug_setupvalue
		local function Fn(Arg1)
			Client.targetingTime += Arg1
			Client.mousepos = UserInputService:GetMouseLocation()
			Client.toolInfo, Client.itemInfo = GetEquipped()
			if (Drawings.silent.fov.Visible) then
				Drawings.silent.fov.Position = Client.mousepos
			end
			if (Client.targetingTime >= HiddenSettings.targetTime) then
				Client.targetingTime = 0
				do
					GetClosestPlayer()
					local Player = Target.silent.player
					local V2 = false
					if (Player) then
						if (Flags.targetHud_toggle.value) then
							local V3 = PlayerESP.playerCache[Player] or NpcESP.npcCache[Player]
							local V4 = V3 and V3.current
							local V5 = V3 and (V3.health or V4 and V4.health)
							local V6 = V3 and (V3.maxHealth or V4 and V4.maxHealth)
							TargetHUD:setName(Player.Name)
							TargetHUD:setDistance(math.floor((Target.silent.vector3 - Camera.CFrame.Position).Magnitude))
							TargetHUD:setWeapon(V4 and V4.weapon or "none")
							TargetHUD:setHealth(V5 or 0, V6 or 100)
							TargetHUD:toggle(true)
						end
						if (Flags.silentAim_snapline.value) then
							V2 = true
							Drawings.silent.snapline.To = Target.silent.vector2
							Drawings.silent.snapline.From = Client.mousepos
						end
						Drawings.silent.hitscan_indicator.Visible = Target.silent.hitscanned and Flags.silentAim_hitscanIndicator.value or false
						Drawings.silent.manipulation_indicator.Visible = Target.silent.manipulated and Flags.silentAim_manipulationIndicator.value or false
					else
						if (not Window.active) then
							TargetHUD:toggle(false)
						end
						Drawings.silent.hitscan_indicator.Visible = false
						Drawings.silent.manipulation_indicator.Visible = false
					end
					Drawings.silent.snapline.Visible = V2
				end
			end
			if (Flags.alwaysShoot_toggle.value) then
				local V7 = Client.mouseButton1DownFunc and V(Client.mouseButton1DownFunc)[LastAiredUpvalue]
				if (Type(V7) == "number") then
					DebugSetUpvalue(Client.mouseButton1DownFunc, LastAiredUpvalue, -0.1)
				end
			end
			FreecamHandler(Arg1)
		end
		local function Fn2(Arg1_2)
			if (not (Arg1.localrootpart and Arg1.localhumanoid and Arg1.localhumanoid.Health > 0)) then
				return
			end
			AutoReloadHandler(Arg1_2)
			if (not Arg1.localhumanoid.SeatPart) then
				FlyHandler(Arg1_2)
				SpeedHandler(Arg1_2)
				Spawn(DesyncHandler, Arg1_2)
			end
		end
		Arg1.rendersteppedLoop = Fn
		Arg1.heartbeatLoop = Fn2
	end
end)()
local V75 = (function()
	local V = V20[3]
	local V3 = (function()
		local V = V6
		local V2 = V7
		local RawGet = RawGet
		local Find = Find
		local V5 = V20[2]
		local function Fn(Arg1)
			if Type(Arg1) ~= "function" or V(Arg1, "s") == "[C]" then
				return false
			else
				for _, Value in V2(Arg1) do
					if Type(Value) == "function" and Find(V(Arg1, "s"), "AssetContainer") then
						return true
					end
				end
				return false
			end
		end
		return function(Arg1)
			return true
		end
	end)()
	local V4 = (function()
		local RawGet = RawGet
		local RawSet = RawSet
		local Select = Select
		local V4 = V19
		local V5 = V20[8]
		return function(Arg1, Arg2)
			local Flags = Arg1.flags
			local DeepClone = V5.deepClone
			Arg2.old_CameraShake = nil
			function Arg2.CameraShake(...)
				local V5 = {...}
				if Type(V5[2]) ~= "number" then
					if Flags.noMeleeShake_toggle.value then
						return
					else
						return Arg2.old_CameraShake(...)
					end
				else
					local V6 = Flags.gunMods_recoilPercentage.value / 100
					V5[2] = V5[2] * V6
					if Type(V5[1]) == "table" then
						V5[1] = DeepClone(V5[1], V6)
						local V7 = RawGet(V5[1], "Strength")
						if V7 and TypeOf(V7) == "Vector3" then
							RawSet(V5[1], "Strength", V7 * V6)
						end
					end
					return Arg2.old_CameraShake(V4(V5, 1, Select("#", ...)))
				end
			end
		end
	end)()
	local V5 = (function()
		local V = V6
		local V3 = V11
		local RawGet = RawGet
		local RawSet = RawSet
		local Find = Find
		local V8 = V2
		local New = CFrame2.new
		local V9 = V20[2]
		local CreateProjectileLevel = V20[4].viewmodelController.CREATE_PROJECTILE_LEVEL
		return function(Arg1, Arg2)
			local Target = Arg1.target
			local VfxModule = Arg1.gameModules.vfxModule
			local DebugIsvalidlevel = Arg1.debug_isvalidlevel
			local Kick = V9.kick
			local V2 = V8(VfxModule)
			local CheckCameraDistance = V2.CheckCameraDistance
			function V2.CheckCameraDistance(...)
				local CreateProjectileLevel = CreateProjectileLevel
				if V(CreateProjectileLevel, "s") == "[C]" or not DebugIsvalidlevel(CreateProjectileLevel) then
					Kick("Potato.hook error (4)")
					return CheckCameraDistance(...)
				end
				if not Find(V(CreateProjectileLevel + 1, "s"), "ViewmodelController") or V(CreateProjectileLevel, "n") ~= "CreateProjectile" then
					return CheckCameraDistance(...)
				end
				local V6 = false
				for _, Value in V3(CreateProjectileLevel) do
					if Type(Value) == "table" and RawGet(Value, "Position") then
						V6 = Value
						break
					end
				end
				if not V6 then
					Kick("Potato.hook error (5)")
					return CheckCameraDistance(...)
				else
					if not Target.silent.origin then
						return CheckCameraDistance(...)
					end
					local Origin = Target.silent.origin
					local LookVector = New(Origin, Target.silent.lastShot or Target.silent.hitPosition or Target.silent.vector3).LookVector
					RawSet(V6, "PositionFirst", Origin)
					RawSet(V6, "Position", Origin)
					RawSet(V6, "Direction", LookVector)
					RawSet(V6, "DirectionFirst", LookVector)
					return CheckCameraDistance(...)
				end
			end
			Arg2.vfxModule = V2
		end
	end)()
	local V9 = (function()
		local V = V6
		local V3 = V11
		local V4 = V12
		local V5 = V7
		local GetNamecallMethod = GetNamecallMethod
		local NewCClosure = NewCClosure
		local RawGet = RawGet
		local Rawlen = Rawlen
		local Select = Select
		local V15 = V2
		local V17 = V16
		local V18 = V19
		local New = Vector3_2.new
		local New2 = CFrame2.new
		local FromOrientation = CFrame2.fromOrientation
		local Angles = CFrame2.Angles
		local Random = Random
		local Sin = Sin
		local Cos = Cos
		local Setfflag = Setfflag
		local V25 = V20[8]
		local V26 = V20[2]
		local V27 = V20[3]
		local V28 = V20[4]
		local MouseRaycastCallerLevel = V28.viewmodelController.MOUSE_RAYCAST_CALLER_LEVEL
		local TorsoOffsetY = V28.viewmodelController.TORSO_OFFSET_Y
		local MouseRaycastIgnoreArg = V28.raycastUtil.MOUSE_RAYCAST_IGNORE_ARG
		local ShootIgnoreListLength = V28.raycastUtil.SHOOT_IGNORE_LIST_LENGTH
		local RaycastFilterFnArg = V28.raycastUtil.RAYCAST_FILTER_FN_ARG
		return function(Arg1, Arg2)
			local Flags = Arg1.flags
			local Client = Arg1.client
			local Target = Arg1.target
			local Camera = Arg1.services.camera
			local LocalPlayer = Arg1.localplayer
			local RaycastUtil = Arg1.gameModules.raycastUtil
			local Replacemetamethod = Arg1.replacemetamethod
			local Predict = Arg1.predict
			local DebugIsvalidlevel = Arg1.debug_isvalidlevel
			local Find = V25.find
			local Kick = V26.kick
			local V2 = V15(RaycastUtil)
			local function Fn(Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7)
				local UnitRay = LocalPlayer:GetMouse().UnitRay
				local V2, V3, V4, V5 = Arg1:Raycast(UnitRay.Origin, UnitRay.Direction * (Arg4 or 1024), Arg5 or "Blacklist", Arg3, Arg6, Arg2, Arg7)
				return V3, V2, V4, V5, nil, "sigma"
			end
			local Raycast = V2.Raycast
			function V2.MouseRaycast(...)
				local V2 = Select(MouseRaycastIgnoreArg, ...)
				if Type(V2) ~= "table" then
					Kick("Potato.hook error (6)")
					return Fn(...)
				end
				if Rawlen(V2) ~= ShootIgnoreListLength then
					return Fn(...)
				end
				local MouseRaycastCallerLevel = MouseRaycastCallerLevel
				if V(MouseRaycastCallerLevel, "s") == "[C]" or not DebugIsvalidlevel(MouseRaycastCallerLevel) then
					Kick("Potato.hook error (7)")
					return Fn(...)
				end
				local V6 = Target.silent.hitPosition or Target.silent.vector3
				if V6 and Random(0, 99) < Flags.silentAim_hitchance.value then
					local V7 = Target.silent.origin or Camera.CFrame.Position
					if Flags.silentAim_prediction.value then
						V6 = Predict(V7, V6, Target.silent.rootPart)
					end
					local V11 = nil
					for _, Value in V3(MouseRaycastCallerLevel) do
						if Type(Value) == "table" and Type(RawGet(Value, 1)) == "table" and Type(RawGet(RawGet(Value, 1), "Radius")) == "number" then
							V11 = Value
							break
						end
					end
					local V12 = V11 and Rawlen(V11) or 0
					if 0 < V12 then
						local V15 = New()
						for Index = 1, V12 do
							local V16 = RawGet(V11, Index)
							local V18 = RawGet(V16, "Radius")
							local V19 = RawGet(V16, "Degree")
							V15 = V15 + Angles(Sin(V19) * V18, Cos(V19) * V18, 0).LookVector
						end
						V6 = V7 + (New2(V7, V6) * New2(New(), V15):Inverse()).LookVector * (V6 - V7).Magnitude
					end
					Target.silent.lastShot = V6
				end
				local V20 = V6 or Fn(...)
				local V25 = V3(MouseRaycastCallerLevel)
				local V26 = {cameraCFrame = {}, torsoCFrame = {}}
				local CFrame2 = Camera.CFrame
				local V28 = Arg1.localrootpart.CFrame * New2(0, TorsoOffsetY, 0)
				for Key, Value2 in V25 do
					if Value2 ~= CFrame2 then
						if Value2 == V28 then
							V17(V26.torsoCFrame, Key)
						end
					else
						V17(V26.cameraCFrame, Key)
					end
				end
				if #V26.torsoCFrame <= 0 or #V26.cameraCFrame <= 0 then
					Kick("Potato.hook error (8)")
					return Fn(...)
				end
				V27.print((("TorsoCFrame: %*; CameraCFrame: %*"):format(#V26.torsoCFrame, #V26.cameraCFrame)))
				if Flags.bulletTp_toggle.value and Arg1.localrootpart and not Flags.freecam_toggle.value then
					Pcall(Setfflag, "S2PhysicsSenderRate", "240")
					Arg1.localrootpart.CFrame = New2(V20)
				end
				local Position = V28.Position
				local Position2 = CFrame2.Position
				if Target.silent.origin then
					local V29 = Position - Position2
					Position2 = Target.silent.origin
					Position = Position2 + V29
				end
				local V30, V31, V32 = V28:ToOrientation()
				local V33, V34 = New2(Position, V20):ToOrientation()
				local V35 = New2(Position) * FromOrientation(V30, V34, V32)
				local V36 = New2(Position2, V20)
				local PointToObjectSpace = V36.PointToObjectSpace
				local V37 = nil
				V37 = Replacemetamethod(V35, "__namecall", NewCClosure(function(_, Arg2, ...)
					if GetNamecallMethod() ~= "PointToObjectSpace" then
						return V37(...)
					else
						local V = V28:PointToObjectSpace(Arg2)
						return (PointToObjectSpace(V35, Position2 + V36.LookVector * V.Magnitude))
					end
				end))
				for _2, Value3 in V26.cameraCFrame do
					if TypeOf(V3(MouseRaycastCallerLevel, Value3)) == "CFrame" then
						V4(MouseRaycastCallerLevel, Value3, V36)
					end
				end
				for _3, Value4 in V26.torsoCFrame do
					if TypeOf(V3(MouseRaycastCallerLevel, Value4)) == "CFrame" then
						V4(MouseRaycastCallerLevel, Value4, V35)
					end
				end
				return V20
			end
			function V2.Raycast(...)
				local V2 = Select(RaycastFilterFnArg, ...)
				if not Client.hitMeleeFilter then
					if Type(V2) ~= "function" or V(V2, "s") == "[C]" or not Find(V5(V2), "HitMelee") then
						return Raycast(...)
					end
					Client.hitMeleeFilter = V2
				elseif not Rawequal(Client.hitMeleeFilter, V2) then
					return Raycast(...)
				end
				local V3 = {Raycast(...)}
				local V4 = TypeOf(V3[1]) == "Instance" and V3[1]
				if Flags.alwaysCriticals_toggle.value and V4 then
					local Parent = V4.Parent
					local V6 = Parent and (Parent:FindFirstChild("TreeX") or Parent:FindFirstChild("NodeSpark"))
					local Main = V6 and V6:FindFirstChild("Main")
					V3[1] = Main or V3[1]
				end
				return V18(V3)
			end
			Arg2.raycastUtil = V2
		end
	end)()
	local V10 = (function()
		local V = V6
		local V2 = V11
		local V3 = V12
		local V4 = V7
		local RawGet = RawGet
		local Find = Find
		local V9 = V19
		local V10 = V20[8]
		local V13 = V20[3]
		local ViewmodelController = V20[4].viewmodelController
		local SpreadCallerLevelMin = ViewmodelController.SPREAD_CALLER_LEVEL_MIN
		local SpreadCallerLevelMax = ViewmodelController.SPREAD_CALLER_LEVEL_MAX
		local RegisterSlack = ViewmodelController.REGISTER_SLACK
		local ShootAimingRegister = ViewmodelController.SHOOT_AIMING_REGISTER
		local ShootRecoilMultRegister = ViewmodelController.SHOOT_RECOIL_MULT_REGISTER
		local ShootSpreadKeyRegister = ViewmodelController.SHOOT_SPREAD_KEY_REGISTER
		local HeartbeatAttachmentMultRegister = ViewmodelController.HEARTBEAT_ATTACHMENT_MULT_REGISTER
		local HeartbeatAmmoStatsRegister = ViewmodelController.HEARTBEAT_AMMO_STATS_REGISTER
		local HeartbeatAmmoMultRegister = ViewmodelController.HEARTBEAT_AMMO_MULT_REGISTER
		local HeartbeatSpreadKeyRegister = ViewmodelController.HEARTBEAT_SPREAD_KEY_REGISTER
		local HeartbeatStateKeyRegister = ViewmodelController.HEARTBEAT_STATE_KEY_REGISTER
		return function(Arg1, Arg2)
			local Flags = Arg1.flags
			local Target = Arg1.target
			local ToolInfo = Arg1.gameModules.toolinfo
			local CheckType = Arg1.checkType
			local DeepClone = V10.deepClone
			local function Fn()
				return Flags.gunMods_spreadPercentage.value <= 50 or Target.silent.vector3 ~= nil and (Flags.silentAim_instantHit.value or Flags.silentAim_hitscan.value)
			end
			local T = {}
			local function Fn2(Arg1)
				if not T[Arg1] then
					T[Arg1] = true
					V13.print((("fake ads: active for %*"):format(Arg1)))
				end
			end
			local function Fn3(Arg1)
				local V6
				for Index = SpreadCallerLevelMin, SpreadCallerLevelMax do
					local V7 = V(Index, "s")
					if (V7 and Find(V7, "ViewmodelController")) then
						V6 = Index
						break
					end
				end
				local V9 = V6 and V2(V6)
				if (not V9) then
					return false
				end
				for Index2 = 0, RegisterSlack do
					if (Arg1 == "ShootingExtra") then
						if (not V9[ShootAimingRegister + Index2] and V9[ShootRecoilMultRegister + Index2] == 1 and V9[ShootSpreadKeyRegister + Index2] == "Hip") then
							V3(V6, ShootAimingRegister + Index2, true)
							Fn2(Arg1)
							return true
						end
					elseif (V9[HeartbeatSpreadKeyRegister + Index2] == "Hip" and V9[HeartbeatStateKeyRegister + Index2] == Arg1 and Type(V9[HeartbeatAttachmentMultRegister + Index2]) == "number" and Type(V9[HeartbeatAmmoStatsRegister + Index2]) == "table" and Type(V9[HeartbeatAmmoMultRegister + Index2]) == "number") then
						local V10 = 0
						for Key, Value in V4(V(V6, "f")) do
							if (Type(Value) == "table" and (Type(RawGet(Value, "HipSpreadMult")) == "number" or Type(RawGet(Value, "AimSpreadMult")) == "number")) then
								V10 = RawGet(Value, "AimSpreadMult") or 0
								break
							end
						end
						V3(V6, HeartbeatAttachmentMultRegister + Index2, 1 + V10)
						V3(V6, HeartbeatAmmoMultRegister + Index2, RawGet(V9[HeartbeatAmmoStatsRegister + Index2], "AimSpreadMult") or 1)
						Fn2(Arg1)
						return true
					end
				end
				return false
			end
			local function Fn4(Arg1)
				local Spread = Arg1.Spread
				if Type(Spread) ~= "table" or Type(Spread.Aiming) ~= "table" or Type(Spread.Hip) ~= "table" then
					return
				else
					local HipSpread = Spread.Hip
					local AimSpread = Spread.Aiming
					local function ScaleSpread(Source)
						return function(_, Key)
							local Value = Source[Key]
							if (Type(Value) == "number") then
								return Value * (Flags.gunMods_spreadPercentage.value / 100)
							end
							return Value
						end
					end
					Spread.Hip = SetMetatable({}, {__metatable = "", __index = ScaleSpread(HipSpread)})
					Spread.Aiming = SetMetatable({}, {__metatable = "", __index = ScaleSpread(AimSpread)})
					return
				end
			end
			local function Fn5(Arg1)
				local Recoil = Arg1.Recoil
				if Type(Recoil) ~= "table" or Type(Recoil.Camera) ~= "table" then
					return
				end
				local RecoilStart = Recoil.Camera.RecoilStart
				local RecoilFinish = Recoil.Camera.RecoilFinish
				local Y = Recoil.Camera.Shake.Y
				local X = Recoil.Camera.Shake.X
				if not CheckType(RecoilStart, "function") or not CheckType(RecoilFinish, "function") or not CheckType(Y, "table") or not CheckType(X, "table") then
					return
				end
				local function Fn(...)
					local V2 = RecoilStart(...)
					if (Type(V2) == "number") then
						return V2 * (Flags.gunMods_recoilPercentage.value / 100)
					end
					return V2
				end
				local function Fn2(...)
					local V2 = RecoilFinish(...)
					if (Type(V2) == "number") then
						return V2 * (Flags.gunMods_recoilPercentage.value / 100)
					end
					return V2
				end
				local function Fn3(Arg1, Arg2)
					local V2 = Y[Arg2]
					if (Type(V2) == "number") then
						return V2 * (Flags.gunMods_recoilPercentage.value / 100)
					end
					return V2
				end
				local function Fn4(Arg1, Arg2)
					local V2 = X[Arg2]
					if (Type(V2) == "number") then
						return V2 * (Flags.gunMods_recoilPercentage.value / 100)
					end
					return V2
				end
				Recoil.Camera.RecoilStart = Fn
				Recoil.Camera.RecoilFinish = Fn2
				Recoil.Camera.Shake.X = SetMetatable({}, {__metatable = "", __index = Fn4})
				Recoil.Camera.Shake.Y = SetMetatable({}, {__metatable = "", __index = Fn3})
			end
			local function Fn6(Arg1)
				local Weapon = Arg1.Weapon
				if Type(Weapon) ~= "table" then
					return
				else
					Arg1.Weapon = SetMetatable({}, {
						__metatable = "",
						__index = function(Arg1_2, Arg2)
							local V2 = Weapon[Arg2]
							if (Arg2 == "Auto" and Flags.fullyAutomatic_toggle.value) then
								return true
							elseif (Arg2 == "RPM" or Arg2 == "BurstRPM") and Type(V2) == "number" then
								return V2 * Flags.gunMods_firerateMultiplier.value
							elseif (Arg2 == "Cooldown" and Arg1.Melee and Flags.increaseMeleeSpeed_toggle.value and Type(V2) == "number") then
								return V2 / Flags.increaseMeleeSpeed_amount.value
							end
							return V2
						end,
					})
					return
				end
			end
			local function Fn7(Arg1)
				local V = Type(Arg1.Melee) == "table" and Arg1.Melee.MeleeChecks
				if Type(V) ~= "table" then
					return
				end
				for _, Value in V do
					if Type(Value) == "table" and Type(Value[2]) == "table" then
						local V2 = Value[2]
						for Key, Value2 in V2 do
							if Type(Value2) == "table" then
								V2[Key] = SetMetatable({}, {
									__metatable = "",
									__index = function(Arg1, Arg2)
										local V2 = Value2[Arg2]
										if (Arg2 == "Range" and Flags.increaseMeleeRange_toggle.value and Type(V2) == "number") then
											return V2 * Flags.increaseMeleeRange_amount.value
										end
										return V2
									end,
								})
							end
						end
					end
				end
			end
			local V6 = DeepClone(ToolInfo)
			for _, Value in V6 do
				if Type(Value) == "table" then
					Fn4(Value)
					Fn5(Value)
					Fn6(Value)
					Fn7(Value)
				end
			end
			Arg2.toolInfo = V6
		end
	end)()
	local V13 = (function()
		local V = V7
		local CheckCaller = CheckCaller
		local NewCClosure = NewCClosure
		local RawGet = RawGet
		local Select = Select
		local V8 = V2
		local Random = Random
		local V10 = V20[3]
		local RaycastFiltersArg = V20[4].raycastUtil.RAYCAST_FILTERS_ARG
		return function(Arg1)
			local Flags = Arg1.flags
			local Client = Arg1.client
			local Target = Arg1.target
			local Camera = Arg1.services.camera
			local RaycastUtil = Arg1.gameModules.raycastUtil
			local VfxModule = Arg1.gameModules.vfxModule
			local Replacemetamethod = Arg1.replacemetamethod
			local DebugSetUpvalue = Arg1.debug_setupvalue
			local V2 = V8(RaycastUtil)
			local Raycast = V2.Raycast
			function V2.Raycast(...)
				local V = Select(RaycastFiltersArg, ...)
				if Type(V) ~= "table" or RawGet(V, 1) ~= Arg1.localcharacter then
					return Raycast(...)
				end
				local Instance2 = Target.silent.instance
				local Vector3_2 = Target.silent.vector3
				if not Instance2 or not Vector3_2 or Target.silent.notVisible then
					return Raycast(...)
				end
				if Client.itemInfo and Client.itemInfo.Name == "Salvaged RPG" then
					return Raycast(...)
				end
				local Position = Camera.CFrame.Position
				if not Target.silent.hitPosition then
					if Flags.silentAim_instantHit.value then
						local V2 = Random(0, 99)
						if not (Flags.silentAim_hitchance.value <= V2) then
							local V7 = RaycastParams2.new()
							V7.FilterType = Enum2.RaycastFilterType.Include
							V7.FilterDescendantsInstances = {Instance2}
							local V8 = Workspace:Raycast(Position, Vector3_2 - Position, V7)
							if not V8 then
								return Raycast(...)
							else
								return Instance2, V8.Position, V8.Normal, Instance2.Material
							end
						end
					end
					return Raycast(...)
				else
					V10.print("overwriting hitpos")
					local V11 = RaycastParams2.new()
					V11.FilterType = Enum2.RaycastFilterType.Include
					V11.FilterDescendantsInstances = {Instance2}
					local V12 = Workspace:Raycast(Position, Vector3_2 - Position, V11)
					local V13 = Target.silent.hitPosition - Target.silent.vector3
					if not V12 then
						return Raycast(...)
					else
						local V14 = nil
						V14 = Replacemetamethod(Instance2, "__index", NewCClosure(function(_, Arg2, ...)
							if not CheckCaller() and Arg2 == "CFrame" then
								Replacemetamethod(Instance2, "__index", V14)
								return V14(...) + V13
							else
								return V14(...)
							end
						end))
						return Instance2, V12.Position + V13, V12.Normal, Instance2.Material
					end
				end
			end
			return function()
				for Key, Value in V(VfxModule.CreateProjectile) do
					if Value == RaycastUtil then
						DebugSetUpvalue(VfxModule.CreateProjectile, Key, V2)
					end
				end
			end
		end
	end)()
	local V14 = (function()
		local V = V6
		local V3 = V7
		local GetConnections = GetConnections
		local V5 = V2
		local V8 = V20[2]
		local FootstepHandlerUpvalue = V20[4].stateAssetController.FOOTSTEP_HANDLER_UPVALUE
		return function(Arg1)
			local Flags = Arg1.flags
			local SoundModule = Arg1.gameModules.soundModule
			local DebugSetUpvalue = Arg1.debug_setupvalue
			local Kick = V8.kick
			local V2 = V5(SoundModule)
			local ToggleFootstep = V2.ToggleFootstep
			function V2.ToggleFootstep(...)
				if (Flags.silentWalk_toggle.value) then
					return
				end
				return ToggleFootstep(...)
			end
			return function()
				local V5 = GetConnections(Arg1.localhumanoid:GetPropertyChangedSignal("FloorMaterial"))[1]
				if not V5 or Type(V5.Function) ~= "function" or not V(V5.Function, "s"):find("StateAssetController") then
					return
				end
				local V6 = V3(V5.Function)[FootstepHandlerUpvalue]
				if Type(V6) ~= "function" or not V(V6, "s"):find("StateAssetController") then
					return Kick("Potato.hook error (14)")
				else
					for Key, Value in V3(V6) do
						if Value == SoundModule then
							DebugSetUpvalue(V6, Key, V2)
							break
						end
					end
					return
				end
			end
		end
	end)()
	local V15 = (function()
		local V = V6
		local V3 = V7
		local V4 = V8
		local GetGc = GetGc
		local GetSenv = GetSenv
		local GetConnections = GetConnections
		local RawGet = RawGet
		local RawSet = RawSet
		local Rawlen = Rawlen
		local Find2 = Find
		local V15 = V2
		local Wait = Task.wait
		local Huge = math.huge
		local V17 = V20[8]
		local V18 = V20[2]
		local V19 = V20[4]
		local EokaDurationRollLength = V19.viewmodelController.EOKA_DURATION_ROLL_LENGTH
		local EokaSecondRollLength = V19.viewmodelController.EOKA_SECOND_ROLL_LENGTH
		return function(Arg1, Arg2)
			local Flags = Arg1.flags
			local Client = Arg1.client
			local RunService = Arg1.services.runService
			local ToolInfo = Arg1.gameModules.toolinfo
			local RaycastUtil = Arg1.gameModules.raycastUtil
			local VfxModule = Arg1.gameModules.vfxModule
			local DebugSetUpvalue = Arg1.debug_setupvalue
			local Find = V17.find
			local Kick = V18.kick
			local function Fn(Arg1)
				local V2 = nil
				local function Fn(Arg1_2)
					for _, Value in Arg1_2 do
						if Type(Value) == "function" and Find2(V(Value, "s"), "ViewmodelController") and Find(V4(Value), "cancel") and Type(GetFenv(Value)) == "table" and RawGet(GetFenv(Value), "script") == Arg1 then
							if not V2 then
								V2 = Value
								Client.mouseButton1DownFunc = Value
							else
								return Kick("Potato.hook error (11)")
							end
						end
					end
				end
				local function Fn2(Arg1)
					for _, Value in Arg1 do
						if Type(Value) == "function" and Find2(V(Value, "s"), "AssetContainer") then
							Client.fireRemote = Value
							break
						end
					end
				end
				;(function()
					local V2 = GetGc()
					for Index = 1, #V2 do
						local V6 = V2[Index]
						if (Type(V6) ~= "function" or not Find2(V(V6, "s"), "ViewmodelController")) then
							continue
						end
						local V7 = V3(V6)
						local V8 = V4(V6)
						if (Find(V8, "DebugEnableVMMovement")) then
							Fn(V7)
							continue
						end
						if (not Client.fireRemote) then
							Fn2(V7)
						end
					end
				end)()
				return V2
			end
			local function Fn2(Arg1, Arg2_2)
				local V2
				repeat
					Wait()
					V2 = GetSenv(Arg1)
				until RawGet(V2, "ChooseRandom")
				if Type(V2) ~= "table" then
					Kick("Potato.hook error (9)")
					return false
				end
				local V5 = RawGet(V2, "ChooseRandom")
				if Type(V5) ~= "function" or Type(Arg2_2) ~= "function" then
					Kick("Potato.hook error (10)")
					return false
				end
				RawSet(V2, "ChooseRandom", function(...)
					local V = (select(1, ...))
					if Type(V) ~= "table" or not Flags.instantEoka_toggle.value then
						return V5(...)
					else
						local V2 = Rawlen(V)
						return V2 == EokaDurationRollLength and 0.25 or V2 == EokaSecondRollLength and 0 or V5(...)
					end
				end)
				local V6 = 0
				for Key, Value in V3(Arg2_2) do
					if Type(Value) == "function" and V(Value, "s") ~= "[C]" then
						local V7 = V4(Value)
						if Find(V7, "Damper") then
							Arg2.old_CameraShake = Value
							V6 = V6 + 1
							DebugSetUpvalue(Arg2_2, Key, Arg2.CameraShake)
						end
					end
					if Value == VfxModule then
						V6 = V6 + 1
						DebugSetUpvalue(Arg2_2, Key, Arg2.vfxModule)
					elseif Value == RaycastUtil then
						V6 = V6 + 1
						DebugSetUpvalue(Arg2_2, Key, Arg2.raycastUtil)
					elseif Value == ToolInfo then
						V6 = V6 + 1
						DebugSetUpvalue(Arg2_2, Key, Arg2.toolInfo)
					end
				end
				;(function()
					local V = nil
					for _, Value in GetConnections(RunService.Heartbeat) do
						local Function = Value.Function
						if Function and RawGet(GetFenv(Function), "script") == Arg1 then
							V = Function
							break
						end
					end
					if not V then
						return Kick("Internal Error - Failed to intercept character")
					else
						for Key, Value2 in V3(V) do
							if Value2 == ToolInfo then
								DebugSetUpvalue(V, Key, Arg2.toolInfo)
								break
							end
						end
						return
					end
				end)()
				return true
			end
			local function Fn3(Arg1, Arg2)
				local V2 = ToolInfo[Arg2]
				local V3 = Type(V2) == "table" and RawGet(V2, "Weapon")
				if (Type(V3) ~= "table") then
					return V2
				end
				local V4 = V15(V3)
				local V5 = V15(V2)
				V5.Weapon = V4
				if (Flags.instantEquip_toggle.value) then
					V4.EquipAnimSpeed = Huge
				end
				return V5
			end
			local function Fn4(Arg1)
				for _, Value in GetConnections(Arg1.Event) do
					local Function = Value.Function
					if Function and V(Function, "s") ~= "[C]" then
						for _2, Value2 in V3(Function) do
							if Type(Value2) == "function" and V(Value2, "s") ~= "[C]" and Find(V4(Value2), "EquipAnimSpeed") then
								return Value2
							end
						end
					end
				end
				return nil
			end
			local function Fn5(Arg1)
				local V = Fn4(Arg1)
				if V then
					for Key, Value in V3(V) do
						if Value == ToolInfo then
							DebugSetUpvalue(V, Key, SetMetatable({}, {__index = Fn3}))
							break
						end
					end
					return true
				else
					Kick("Potato.hook error (12)")
					return false
				end
			end
			return function(Arg1, Arg2)
				local V = Fn(Arg1)
				if Fn2(Arg1, V) then
					return Fn5(Arg2)
				else
					return false
				end
			end
		end
	end)()
	local V17 = (function()
		local V = V6
		local V2 = V7
		local GetConnections = GetConnections
		local CompareInstances = CompareInstances
		local V5 = V20[2]
		local EquipArmorHandlerUpvalue = V20[4].inventoryController.EQUIP_ARMOR_HANDLER_UPVALUE
		return function(Arg1)
			local Flags = Arg1.flags
			local RunService = Arg1.services.runService
			local MathHuge = Arg1.const.MATH_HUGE
			local Replacemetamethod = Arg1.replacemetamethod
			local DebugSetUpvalue = Arg1.debug_setupvalue
			local Kick = V5.kick
			return function(Arg1)
				local V5 = GetConnections(Arg1:WaitForChild("EquipArmor", MathHuge).Event)[1]
				if not V5 or Type(V5.Function) ~= "function" or not V(V5.Function, "s"):find("InventoryController") then
					Kick("Potato.hook error (15)")
					return false
				end
				local V6 = V2(V5.Function)[EquipArmorHandlerUpvalue]
				if Type(V6) ~= "function" or not V(V6, "s"):find("InventoryController") then
					Kick("Potato.hook error (16)")
					return false
				else
					local function Fn(Arg1, Arg2)
						if (Arg2 ~= "Heartbeat") then
							return Kick("Potato.hook error (17)")
						end
						return {Wait = function()
							if (Flags.instantLoot_toggle.value) then
								return 10
							end
							return RunService.Heartbeat:Wait()
						end}
					end
					local V7 = Instance2.new("Part")
					Replacemetamethod(V7, "__index", Fn)
					for Key, Value in V2(V6) do
						if TypeOf(Value) == "Instance" and CompareInstances(Value, RunService) then
							DebugSetUpvalue(V6, Key, V7)
							break
						end
					end
					return true
				end
			end
		end
	end)()
	local V18 = (function()
		local V = V6
		local V2 = V7
		local V3 = V8
		local GetConnections = GetConnections
		local CheckCaller = CheckCaller
		local Getcallingscript = Getcallingscript
		local NewCClosure = NewCClosure
		local RawGet = RawGet
		local Find2 = Find
		local V13 = V20[8]
		local SeatpartCallerLevel = V20[4].viewmodelController.SEATPART_CALLER_LEVEL
		return function(Arg1)
			local Flags = Arg1.flags
			local Client = Arg1.client
			local Replacemetamethod = Arg1.replacemetamethod
			local Find = V13.find
			return {
				hookSeatPart = function()
					if Flags.shootWhilePiloted_toggle then
						local V2 = nil
						V2 = Replacemetamethod(Arg1.localhumanoid, "__index", NewCClosure(function(...)
							if (select(2, ...)) ~= "SeatPart" or not Flags.shootWhilePiloted_toggle.value or not Find2(V(SeatpartCallerLevel, "s"), "ViewmodelController") then
								return V2(...)
							else
								return nil
							end
						end))
						return
					else
						return
					end
				end,
				fetchAnimationTable = function()
					for _, Value in GetConnections(Arg1.localhumanoid:GetAttributeChangedSignal("Downed")) do
						local Function = Value.Function
						if Function and Find2(V(Function, "s"), "StateAssetController") and Find(V3(Function), "DownFall") then
							for _2, Value2 in V2(Function) do
								if Type(Value2) == "table" and RawGet(Value2, "DownFall") then
									Client.animationTable = Value2
									break
								end
							end
							break
						end
					end
				end,
				replayAntiaim = function()
					if not Flags.antiaim_toggle.value or not Client.animationTable then
						return
					else
						local V = RawGet(Client.animationTable, "DownFall")
						local V2 = RawGet(Client.animationTable, "Down")
						if (TypeOf(V) ~= "Instance" or TypeOf(V2) ~= "Instance" or not V.IsPlaying) and not V2.IsPlaying then
							V:Play()
							V2:Play()
						end
						return
					end
				end,
				spoofRootCFrame = function()
					Client.rootCFrame = nil
					local V = nil
					V = Replacemetamethod(Arg1.localcharacter:FindFirstChild("HumanoidRootPart"), "__index", NewCClosure(function(_, Arg2, ...)
						if CheckCaller() or Arg2 ~= "CFrame" or not Client.rootCFrame then
							return V(...)
						else
							local V2 = Getcallingscript()
							if V2 and V2.Name == "CameraModule" then
								return Client.rootCFrame
							else
								return V(...)
							end
						end
					end))
				end,
				removing = function()
					Arg1.localcharacter = nil
					Arg1.localrootpart = nil
					Arg1.localhumanoid = nil
					Client.fireRemote = nil
					Client.mouseButton1DownFunc = nil
					Client.hitMeleeFilter = nil
					Client.animationTable = nil
					Flags.freecam_toggle.self.setValue(false)
					Client.originalCFrame = nil
				end,
			}
		end
	end)()
	return function(Arg1)
		local Client = Arg1.client
		local MathHuge = Arg1.const.MATH_HUGE
		if not V3(Arg1) then
			return
		end
		local T = {}
		V4(Arg1, T)
		V5(Arg1, T)
		V9(Arg1, T)
		V10(Arg1, T)
		local V2 = V13(Arg1)
		local V6 = V14(Arg1)
		local V7 = V15(Arg1, T)
		local V8 = V17(Arg1)
		local V11 = V18(Arg1)
		function Client.characterAdded(Arg1_2)
			Arg1.localcharacter = Arg1_2
			local HumanoidRootPart = Arg1_2:WaitForChild("HumanoidRootPart", MathHuge)
			Arg1.localrootpart = HumanoidRootPart
			local Humanoid = Arg1_2:WaitForChild("Humanoid", MathHuge)
			Arg1.localhumanoid = Humanoid
			V11.hookSeatPart()
			V.print("parts loaded")
			local ViewmodelController = Arg1_2:WaitForChild("ViewmodelController", MathHuge)
			local InventoryController = Arg1_2:WaitForChild("InventoryController", MathHuge)
			local EquipVM = ViewmodelController:WaitForChild("EquipVM", MathHuge)
			V.print("vm loaded")
			if not V7(ViewmodelController, EquipVM) then
				return
			end
			V6()
			V11.fetchAnimationTable()
			if not V8(InventoryController) then
				return
			else
				V11.replayAntiaim()
				V11.spoofRootCFrame()
				return
			end
		end
		Client.characterRemoving = V11.removing
		V2()
		if Arg1.localcharacter then
			Client.characterAdded(Arg1.localcharacter)
		end
		return true
	end
end)()
local V76 = (function()
	local CompareInstances = CompareInstances
	local NewCClosure = NewCClosure
	local Wait = Task.wait
	local CheckCaller = CheckCaller
	return function(Arg1)
		local Lighting = Arg1.services.lighting
		local Camera = Arg1.services.camera
		local Flags = Arg1.flags
		local LightingSpoof = Arg1.lightingSpoof
		local LightingIgnore = Arg1.lightingIgnore
		local CameraSpoof = Arg1.cameraSpoof
		local Replacemetamethod = Arg1.replacemetamethod
		local V4 = nil
		V4 = Replacemetamethod(Game:GetService("Lighting"), "__index", NewCClosure(function(...)
			local V2, V5 = ...
			if (CheckCaller() or not CompareInstances(V2, Lighting)) then
				return V4(...)
			end
			local V6 = LightingSpoof[V5]
			if (V6 ~= nil) then
				return V6
			end
			return V4(...)
		end))
		Lighting.Changed:Connect(function(Arg1)
			if (LightingSpoof[Arg1] == nil) then
				return
			end
			local V2 = V4(Lighting, Arg1)
			if (LightingIgnore[Arg1] ~= nil and LightingIgnore[Arg1] == V2) then
				LightingIgnore[Arg1] = nil
				return
			end
			LightingSpoof[Arg1] = V2
			if (Arg1 == "Ambient" and Flags.ambient_toggle.value) then
				local Value = Flags.ambient_colour.value
				LightingIgnore[Arg1] = Value
				Wait()
				Lighting.Ambient = Value
			end
		end)
		local V5 = nil
		V5 = Replacemetamethod(Workspace.CurrentCamera, "__index", NewCClosure(function(...)
			local V2, V4 = ...
			if (not CompareInstances(V2, Camera) or CheckCaller()) then
				return V5(...)
			end
			local V6 = CameraSpoof[V4]
			if (V6 ~= nil) then
				return V6
			end
			return V5(...)
		end))
		local V6 = nil
		V6 = Replacemetamethod(Workspace.CurrentCamera, "__newindex", NewCClosure(function(...)
			local V2, V4, V5 = ...
			if (not CompareInstances(V2, Camera) or CheckCaller()) then
				return V6(...)
			end
			local V7 = CameraSpoof[V4]
			if (V7 ~= nil and V5 ~= nil) then
				CameraSpoof[V4] = V5
				if (Flags.fovChanger_toggle.value or Flags.zoom_toggle.value and Flags.zoom_keybind.value) then
					return
				end
			end
			return V6(...)
		end))
	end
end)()
local V77 = (function()
	local V = (function()
		local New = Vector2_2.new
		local New2 = Vector3_2.new
		return function(Arg1)
			local Flags = Arg1.flags
			local Target = Arg1.target
			local Drawings = Arg1.drawings
			local Cached = Arg1.CACHED
			local Camera = Arg1.services.camera
			Flags.silentAim_hitscanDistance:OnChanged(function(Arg1)
				local T = {New2(1, 0, 0).Unit, New2(-1, 0, 0).Unit, New2(0, 0, 1).Unit, New2(0, 0, -1).Unit, New2(1, 0, 1).Unit, New2(-1, 0, 1).Unit, New2(1, 0, -1).Unit, New2(-1, 0, -1).Unit, New2(0, 1, 0).Unit}
				for Index = 1, #T do
					T[Index] *= Arg1
				end
				Cached.hitscanAngles = T
			end)
			Flags.silentAim_manipulationDistance:OnChanged(function(Arg1)
				local T = {New2(1, 0, 0).Unit, New2(-1, 0, 0).Unit, New2(0, 1, 0).Unit, New2(0, -1, 0).Unit, New2(1, 1, 0).Unit, New2(-1, 1, 0).Unit}
				for Index = 1, #T do
					T[Index] *= Arg1
				end
				Cached.manipulationAngles = T
			end)
			local V = nil
			Flags.silentAim_drawFov:OnChanged(function(Arg1)
				Drawings.silent.fov.Visible = Arg1
			end)
			Flags.silentAim_fovSize:OnChanged(function(Arg1)
				if (Flags.silentAim_dynamicFov.value) then
					Drawings.silent.fov.Radius = Arg1 / (Camera.FieldOfView / 70)
					return
				end
				Drawings.silent.fov.Radius = Arg1
			end)
			Flags.silentAim_dynamicFov:OnChanged(function(Arg1)
				if (not Arg1 and V) then
					Drawings.silent.fov.Radius = Flags.silentAim_fovSize.value
					V:Disconnect()
					V = nil
					return
				elseif V then
					V:Disconnect()
				end
				V = Camera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
					Drawings.silent.fov.Radius = Flags.silentAim_fovSize.value / (Camera.FieldOfView / 70)
				end)
			end)
			Flags.silentAim_fovColour:OnChanged(function(Arg1)
				Drawings.silent.fov.Color = Arg1
			end)
			Flags.silentAim_snaplineColour:OnChanged(function(Arg1)
				Drawings.silent.snapline.Color = Arg1
			end)
			Flags.silentAim_manipulationIndicator:OnChanged(function(Arg1)
				if (Arg1 and Target.silent.manipulated) then
					Drawings.silent.manipulation_indicator.Visible = true
				else
					Drawings.silent.manipulation_indicator.Visible = false
				end
			end)
			Flags.silentAim_manipulationIndicatorColour:OnChanged(function(Arg1)
				Drawings.silent.manipulation_indicator.Color = Arg1
			end)
			Flags.silentAim_hitscanIndicator:OnChanged(function(Arg1)
				if (Arg1 and Target.silent.hitscanned) then
					Drawings.silent.hitscan_indicator.Visible = true
				else
					Drawings.silent.hitscan_indicator.Visible = false
				end
			end)
			Flags.silentAim_hitscanIndicatorColour:OnChanged(function(Arg1)
				Drawings.silent.hitscan_indicator.Color = Arg1
			end)
			Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				local V = Camera.ViewportSize / 2
				Drawings.silent.manipulation_indicator.Position = V + New(0, 30)
				Drawings.silent.hitscan_indicator.Position = V + New(0, 43)
			end)
		end
	end)()
	local V4 = (function()
		return function(Arg1)
			local Flags = Arg1.flags
			local RunService = Arg1.services.runService
			local PlayerESP = Arg1.playerESP
			local V = {teamCheck = nil, connection = nil}
			local function Fn()
				for Key, Value in PlayerESP.playerCache do
					if (not (Value.current and Value.current.active)) then
						Value:hideDrawings()
						continue
					elseif (not V.teamCheck) then
						Value:loop(V)
						continue
					end
					local NameTag = Value.current.character:FindFirstChild("NameTag")
					if (not NameTag or not NameTag.AlwaysOnTop) then
						Value:loop(V)
						continue
					end
					Value:hideDrawings()
				end
			end
			Flags.playerEsp_name:OnChanged(function(Arg1)
				V.name = Arg1
			end)
			Flags.playerEsp_box:OnChanged(function(Arg1)
				V.box = Arg1
			end)
			Flags.playerEsp_healthbar:OnChanged(function(Arg1)
				V.healthbar = Arg1
			end)
			Flags.playerEsp_distance:OnChanged(function(Arg1)
				V.distance = Arg1
			end)
			Flags.playerEsp_weapon:OnChanged(function(Arg1)
				V.weapon = Arg1
			end)
			Flags.playerEsp_teamCheck:OnChanged(function(Arg1)
				V.teamCheck = Arg1
			end)
			Flags.playerEsp_toggle:OnChanged(function(Arg1)
				if (Arg1) then
					if (V.connection) then
						V.connection:Disconnect()
					end
					V.connection = RunService.PreRender:Connect(Fn)
					return
				elseif (not V.connection) then
					return
				end
				V.connection:Disconnect()
				V.connection = nil
				for Key, Value in PlayerESP.playerCache do
					Value:hideDrawings()
				end
			end)
			Flags.playerEsp_nameColour:OnChanged(function(Arg1)
				for Key, Value in PlayerESP.playerCache do
					Value.drawings.name.Color = Arg1
				end
			end)
			Flags.playerEsp_boxColour:OnChanged(function(Arg1)
				for Key, Value in PlayerESP.playerCache do
					Value.drawings.box.Color = Arg1
				end
			end)
			Flags.playerEsp_distanceColour:OnChanged(function(Arg1)
				for Key, Value in PlayerESP.playerCache do
					Value.drawings.distance.Color = Arg1
				end
			end)
			Flags.playerEsp_weaponColour:OnChanged(function(Arg1)
				for Key, Value in PlayerESP.playerCache do
					Value.drawings.weapon.Color = Arg1
				end
			end)
		end
	end)()
	local V5 = (function()
		return function(Arg1)
			local Flags = Arg1.flags
			local Camera = Arg1.services.camera
			local RunService = Arg1.services.runService
			local NpcESP = Arg1.npcESP
			local V = {maxDistance = nil, connection = nil}
			local T = {}
			local function Fn()
				for Key, Value in NpcESP.npcCache do
					if (not T[Value.settingName] or Flags.combatMode_toggle.value) then
						Value:hideDrawings()
						continue
					end
					local Magnitude = (Camera.CFrame.Position - Value.entity:GetPivot().Position).Magnitude
					if (Magnitude > V.maxDistance) then
						Value:hideDrawings()
						continue
					end
					Value:loop(V, Magnitude)
					continue
				end
			end
			Flags.npcEsp_toggle:OnChanged(function(Arg1)
				if (Arg1) then
					if (V.connection) then
						V.connection:Disconnect()
					end
					V.connection = RunService.PreRender:Connect(Fn)
					return
				elseif (not V.connection) then
					return
				end
				V.connection:Disconnect()
				V.connection = nil
				for Key, Value in NpcESP.npcCache do
					Value:hideDrawings()
				end
			end)
			Flags.npcEsp_maxDistance:OnChanged(function(Arg1)
				V.maxDistance = Arg1
			end)
			Flags.npcEsp_box:OnChanged(function(Arg1)
				V.box = Arg1
			end)
			Flags.npcEsp_name:OnChanged(function(Arg1)
				V.name = Arg1
			end)
			Flags.npcEsp_distance:OnChanged(function(Arg1)
				V.distance = Arg1
			end)
			Flags.npcEsp_healthbar:OnChanged(function(Arg1)
				V.healthbar = Arg1
			end)
			Flags.npcEsp_wolf:OnChanged(function(Arg1)
				T.PREFAB_ANIMAL_WOLF = Arg1
			end)
			Flags.npcEsp_deer:OnChanged(function(Arg1)
				T.PREFAB_ANIMAL_DEER = Arg1
			end)
			Flags.npcEsp_boar:OnChanged(function(Arg1)
				T.PREFAB_ANIMAL_WILDBOAR = Arg1
			end)
			Flags.npcEsp_scav:OnChanged(function(Arg1)
				T.Soldier = Arg1
			end)
			Flags.npcEsp_bruno:OnChanged(function(Arg1)
				T.Bruno = Arg1
			end)
			Flags.npcEsp_boris:OnChanged(function(Arg1)
				T.Boris = Arg1
			end)
			Flags.npcEsp_brutus:OnChanged(function(Arg1)
				T.Brutus = Arg1
			end)
			Flags.npcEsp_bradley:OnChanged(function(Arg1)
				T.BTR = Arg1
			end)
			local function Fn2(Arg1, Arg2)
				for Key, Value in NpcESP.npcCache do
					if (Value.name ~= Arg1) then
						continue
					end
					local Drawings = Value.drawings
					Drawings.box.Color = Arg2
					Drawings.name.Color = Arg2
					Drawings.distance.Color = Arg2
				end
			end
			Flags.npcEsp_scavColour:OnChanged(function(Arg1)
				Fn2("scav", Arg1)
			end)
			Flags.npcEsp_brunoColour:OnChanged(function(Arg1)
				Fn2("bruno", Arg1)
			end)
			Flags.npcEsp_borisColour:OnChanged(function(Arg1)
				Fn2("boris", Arg1)
			end)
			Flags.npcEsp_brutusColour:OnChanged(function(Arg1)
				Fn2("brutus", Arg1)
			end)
			Flags.npcEsp_bradleyColour:OnChanged(function(Arg1)
				Fn2("bradley", Arg1)
			end)
			Flags.npcEsp_wolfColour:OnChanged(function(Arg1)
				Fn2("wolf", Arg1)
			end)
			Flags.npcEsp_deerColour:OnChanged(function(Arg1)
				Fn2("deer", Arg1)
			end)
			Flags.npcEsp_boarColour:OnChanged(function(Arg1)
				Fn2("boar", Arg1)
			end)
		end
	end)()
	local V6 = (function()
		return function(Arg1)
			local Flags = Arg1.flags
			local Camera = Arg1.services.camera
			local RunService = Arg1.services.runService
			local EntityESP = Arg1.entityESP
			local ChristmasUpdate = Arg1.const.CHRISTMAS_UPDATE
			local V = {maxDistance = nil, connection = nil}
			local T = {}
			local function Fn()
				for Key, Value in EntityESP.entityCache do
					if (not T[Value.settingName] or Flags.combatMode_toggle.value) then
						Value:hideDrawings()
						continue
					end
					local Magnitude = (Camera.CFrame.Position - Value.entity:GetPivot().Position).Magnitude
					if (Magnitude > V.maxDistance) then
						Value:hideDrawings()
						continue
					end
					Value:loop(V, Magnitude)
					continue
				end
			end
			Flags.entityEsp_toggle:OnChanged(function(Arg1)
				if (Arg1) then
					if (V.connection) then
						V.connection:Disconnect()
					end
					V.connection = RunService.PreRender:Connect(Fn)
					return
				elseif (not V.connection) then
					return
				end
				V.connection:Disconnect()
				V.connection = nil
				for Key, Value in EntityESP.entityCache do
					Value:hideDrawings()
				end
			end)
			Flags.entityEsp_box:OnChanged(function(Arg1)
				V.box = Arg1
			end)
			Flags.entityEsp_name:OnChanged(function(Arg1)
				V.name = Arg1
			end)
			Flags.entityEsp_distance:OnChanged(function(Arg1)
				V.distance = Arg1
			end)
			Flags.entityEsp_maxDistance:OnChanged(function(Arg1)
				V.maxDistance = Arg1
			end)
			Flags.entityEsp_bodyBag:OnChanged(function(Arg1)
				T["Body Bag"] = Arg1
			end)
			Flags.entityEsp_airdrop:OnChanged(function(Arg1)
				T["Care Package"] = Arg1
			end)
			Flags.entityEsp_timedCrate:OnChanged(function(Arg1)
				T["Timed Crate"] = Arg1
			end)
			Flags.entityEsp_hemp:OnChanged(function(Arg1)
				T["Wool Plant"] = Arg1
			end)
			Flags.entityEsp_stone:OnChanged(function(Arg1)
				T.Stone_Node = Arg1
			end)
			Flags.entityEsp_phosphate:OnChanged(function(Arg1)
				T.Phosphate_Node = Arg1
			end)
			Flags.entityEsp_metal:OnChanged(function(Arg1)
				T.Metal_Node = Arg1
			end)
			Flags.entityEsp_minicopter:OnChanged(function(Arg1)
				T["Salvaged Flycopter"] = Arg1
			end)
			if ChristmasUpdate then
				Flags.entityEsp_smallGift:OnChanged(function(Arg1)
					T["Small Gift"] = Arg1
				end)
				Flags.entityEsp_mediumGift:OnChanged(function(Arg1)
					T["Medium Gift"] = Arg1
				end)
				Flags.entityEsp_largeGift:OnChanged(function(Arg1)
					T["Large Gift"] = Arg1
				end)
			end
			local function Fn2(Arg1, Arg2)
				for Key, Value in EntityESP.entityCache do
					if (Value.name ~= Arg1) then
						continue
					end
					local Drawings = Value.drawings
					Drawings.box.Color = Arg2
					Drawings.name.Color = Arg2
					Drawings.distance.Color = Arg2
				end
			end
			Flags.entityEsp_hempColour:OnChanged(function(Arg1)
				Fn2("hemp", Arg1)
			end)
			Flags.entityEsp_stoneColour:OnChanged(function(Arg1)
				Fn2("stone", Arg1)
			end)
			Flags.entityEsp_phosphateColour:OnChanged(function(Arg1)
				Fn2("phosphate", Arg1)
			end)
			Flags.entityEsp_metalColour:OnChanged(function(Arg1)
				Fn2("metal", Arg1)
			end)
			Flags.entityEsp_bodyBagColour:OnChanged(function(Arg1)
				Fn2("body bag", Arg1)
			end)
			Flags.entityEsp_airdropColour:OnChanged(function(Arg1)
				Fn2("airdrop", Arg1)
			end)
			Flags.entityEsp_timedCrateColour:OnChanged(function(Arg1)
				Fn2("timed crate", Arg1)
			end)
			Flags.entityEsp_minicopterColour:OnChanged(function(Arg1)
				Fn2("minicopter", Arg1)
			end)
			if ChristmasUpdate then
				Flags.entityEsp_smallGiftColour:OnChanged(function(Arg1)
					Fn2("small present", Arg1)
				end)
				Flags.entityEsp_mediumGiftColour:OnChanged(function(Arg1)
					Fn2("medium present", Arg1)
				end)
				Flags.entityEsp_largeGiftColour:OnChanged(function(Arg1)
					Fn2("large present", Arg1)
				end)
			end
		end
	end)()
	local V7 = (function()
		local V = V3
		local V2 = V16
		local V4 = V20[8]
		return function(Arg1)
			local Flags = Arg1.flags
			local Bases = Arg1.world.bases
			local Remove = V4.remove
			local T = {}
			local T2 = {}
			local function Fn(Arg1)
				local Fn = function(Arg1)
					local TouchCollision = Arg1:FindFirstChild("TouchCollision")
					local V3 = Arg1:FindFirstChild("Collision Parts")
					if (V3 and V3.ClassName == "Folder") then
						for Key, Value in V3:GetChildren() do
							if (Value.ClassName ~= "Part") then
								continue
							elseif (Flags.disableTraps_toggle.value) then
								Value.CanTouch = false
							end
							Value.AncestryChanged:Connect(function(Arg1, Arg2)
								if (not (Arg1 == Value and Arg2 == nil)) then
									return
								end
								Remove(T, Value)
							end)
							V2(T, Value)
						end
						return
					end
					if (not TouchCollision or TouchCollision.ClassName ~= "MeshPart") then
						return
					elseif (Flags.disableTraps_toggle.value) then
						TouchCollision.CanTouch = false
					end
					TouchCollision.AncestryChanged:Connect(function(Arg1_2, Arg2)
						if (not (Arg1_2 == TouchCollision and Arg2 == nil)) then
							return
						end
						Remove(T, TouchCollision)
					end)
					V2(T, TouchCollision)
				end
				for Key, Value in Arg1:GetChildren() do
					Fn(Value)
				end
				Arg1.ChildAdded:Connect(Fn)
			end
			local function Fn2(Arg1)
				local Fn = function(Arg1)
					local DamageParts = Arg1:FindFirstChild("DamageParts")
					if (not DamageParts) then
						return
					end
					for Key, Value in DamageParts:GetChildren() do
						if (Value.ClassName ~= "Part") then
							continue
						elseif (Flags.disableSpikes_toggle.value) then
							Value.CanTouch = false
						end
						Value.AncestryChanged:Connect(function(Arg1, Arg2)
							if (not (Arg1 == Value and Arg2 == nil)) then
								return
							end
							Remove(T2, Value, true)
						end)
						V2(T2, Value)
					end
				end
				for Key, Value in Arg1:GetChildren() do
					Fn(Value)
				end
				Arg1.ChildAdded:Connect(Fn)
			end
			local function Fn3(Arg1)
				local T = {"External Stone Gate", "External Stone Wall", "External Wooden Gate", "External Wooden Wall", "Metal Spikes", "Wooden Spikes"}
				local T2 = {"Bear Trap", "Shotgun Turret", "Auto Turret"}
				for Key, Value in T do
					local V2 = Arg1:FindFirstChild(Value)
					if (not V2) then
						continue
					end
					Fn2(V2)
				end
				for Key2, Value2 in T2 do
					local V3 = Arg1:FindFirstChild(Value2)
					if (not V3) then
						continue
					end
					Fn(V3)
				end
				Arg1.ChildAdded:Connect(function(Arg1_2)
					local Name = Arg1_2.Name
					local V2 = V(T, Name)
					local V3 = V(T2, Name)
					if (V2) then
						Fn2(Arg1_2)
					elseif (V3) then
						Fn(Arg1_2)
					end
				end)
			end
			Flags.disableTraps_toggle:OnChanged(function(Arg1)
				for Index = 1, #T do
					T[Index].CanTouch = not Arg1
				end
			end)
			Flags.disableSpikes_toggle:OnChanged(function(Arg1)
				for Index = 1, #T2 do
					T2[Index].CanTouch = not Arg1
				end
			end)
			for _, Value in Bases:GetChildren() do
				Fn3(Value)
			end
			Bases.ChildAdded:Connect(Fn3)
		end
	end)()
	local V8 = (function()
		local CheckCaller = CheckCaller
		local NewCClosure = NewCClosure
		local V4 = V3
		local V5 = V16
		local V6 = V20[8]
		local V7 = V20[3]
		return function(Arg1)
			local Flags = Arg1.flags
			local Bases = Arg1.world.bases
			local Replacemetamethod = Arg1.replacemetamethod
			local Remove = V6.remove
			local T = {}
			local T2 = {}
			Flags.xray_toggle:OnChanged(function(Arg1)
				if (Arg1) then
					local V2 = Flags.xray_transparency.value / 100
					for Index = 1, #T do
						T[Index].Transparency = V2
					end
					return
				end
				for Index2 = 1, #T do
					local V3 = T[Index2]
					V3.Transparency = T2[V3]
				end
			end)
			Flags.xray_transparency:OnChanged(function(Arg1)
				if (not Flags.xray_toggle.value) then
					return
				end
				local V = Arg1 / 100
				for Index = 1, #T do
					T[Index].Transparency = V
				end
			end)
			local function Fn(Arg1)
				local function V3(Value)
					local function Register(Part)
						if (not Part:IsA("BasePart") or T2[Part] ~= nil) then
							return
						end
						T2[Part] = Part.Transparency
						T[#T + 1] = Part
						if (Flags.xray_toggle.value) then
							Part.Transparency = Flags.xray_transparency.value / 100
						end
					end
					Register(Value)
					for _, Descendant in Value:GetDescendants() do
						Register(Descendant)
					end
					Value.DescendantAdded:Connect(Register)
				end
				for _, Value in Arg1:GetChildren() do
					V3(Value)
				end
				Arg1.ChildAdded:Connect(V3)
			end
			for _, Value in Bases:GetChildren() do
				Fn(Value)
			end
			Bases.ChildAdded:Connect(Fn)
		end
	end)()
	local V9 = (function()
		local GetRawMetatable = GetRawMetatable
		local NewCClosure = NewCClosure
		local GetNamecallMethod = GetNamecallMethod
		local Spawn = Task.spawn
		return function(Arg1)
			local Flags = Arg1.flags
			local Loners = Arg1.world.loners
			local Replacemetamethod = Arg1.replacemetamethod
			local function Fn(Arg1)
				local Events = Arg1:FindFirstChild("Events")
				if not Events then
					return
				end
				local ReplicateHealth = Events:FindFirstChild("ReplicateHealth")
				local ReplicateEffect = Events:FindFirstChild("ReplicateEffect")
				local __namecall = GetRawMetatable(Game).__namecall
				;(function()
					if not ReplicateHealth or __namecall ~= GetRawMetatable(ReplicateHealth).__namecall then
						return
					else
						local V4 = nil
						local V5 = NewCClosure(function(...)
							local V2 = GetNamecallMethod()
							if (V2 ~= "FireServer" or not Flags.disableMinicopterDamage_toggle.value) then
								return V4(...)
							end
							return
						end)
						V4 = Replacemetamethod(ReplicateHealth, "__namecall", V5)
						return
					end
				end)()
				;(function()
					if not ReplicateEffect or __namecall ~= GetRawMetatable(ReplicateEffect).__namecall then
						return
					else
						local V4 = nil
						local V5 = NewCClosure(function(...)
							local V2 = GetNamecallMethod()
							if (V2 ~= "FireServer" or not Flags.silentMinicopter_toggle.value) then
								return V4(...)
							end
							return
						end)
						V4 = Replacemetamethod(ReplicateEffect, "__namecall", V5)
						return
					end
				end)()
				Task.wait(9000000000)
				if ReplicateEffect and ReplicateHealth then
					Task.wait(9000000000)
				end
			end
			;(function(Arg1)
				if Arg1 then
					for _, Value in Arg1:GetChildren() do
						Spawn(Fn, Value)
					end
					Arg1.ChildAdded:Connect(Fn)
					return
				else
					return
				end
			end)(Loners:FindFirstChild("Salvaged Flycopter"))
		end
	end)()
	local V10 = (function()
		local New = Color3_2.new
		return function(Arg1)
			local Flags = Arg1.flags
			local KeybindList = Arg1.keybindList
			local function Fn(Arg1, Arg2, Arg3)
				local V = {[false] = New(0.5, 0.5, 0.5), [true] = New(1, 0, 0)}
				local V2 = V[Flags[Arg1].value]
				KeybindList.storage[Arg1] = KeybindList:addText("left", Arg3, V2, false)
				KeybindList.storage[Arg2] = KeybindList:addText("right", ("[%*]"):format(Flags[Arg2].key), V2, false)
				Flags[Arg2]:OnChanged(function(Arg1_2)
					Flags[Arg1].self.setValue(Arg1_2)
				end)
				Flags[Arg2]:OnKeyChanged(function(Arg1_2)
					local V2 = Arg1_2 ~= "None"
					KeybindList.storage[Arg1].shown = V2
					KeybindList.storage[Arg2].shown = V2
					KeybindList.storage[Arg2].text = ("[" .. tostring(Arg1_2) .. "]")
					KeybindList:update()
				end)
				Flags[Arg1]:OnChanged(function(Arg1_2)
					Flags[Arg2].value = Arg1_2
					local V2 = V[Arg1_2]
					KeybindList.storage[Arg1].colour = V2
					KeybindList.storage[Arg2].colour = V2
					KeybindList:update()
				end)
				KeybindList:update()
			end
			Fn("silentAim_toggle", "silentAim_keybind", "silent aim")
			Fn("silentAim_manipulation", "silentAim_manipulationKeybind", "manipulation")
			Fn("silentAim_hitscan", "silentAim_hitscanKeybind", "hitscan")
			Fn("silentAim_instantHit", "silentAim_instantHitKeybind", "force hit")
			Fn("fly_toggle", "fly_keybind", "flight")
			Fn("speedHack_toggle", "speedHack_keybind", "speedhack")
			Fn("bulletTp_toggle", "bulletTp_keybind", "tp to bullet")
			Fn("combatMode_toggle", "combatMode_keybind", "combat mode")
			Fn("xray_toggle", "xray_keybind", "xray")
			Fn("freecam_toggle", "freecam_keybind", "freecam")
			Fn("suicide_toggle", "suicide_keybind", "suicide")
			Fn("noFallDamage_toggle", "noFallDamage_keybind", "no fall damage")
			Fn("antiaim_toggle", "antiaim_keybind", "antiaim")
			Fn("playerEsp_toggle", "playerEsp_keybind", "player esp")
		end
	end)()
	local V11 = (function()
		local SethiddenProperty = SethiddenProperty
		local Spawn = Task.spawn
		;(function()
			local RawGet = RawGet
			local New = Vector3_2.new
			local New2 = CFrame2.new
			local Wait = Task.wait
			local Spawn = Task.spawn
			local Delay = Task.delay
			local V2 = V20[4]
			return function(Arg1)
				local Flags = Arg1.flags
				local Client = Arg1.client
				local GlobalHitIgnore = Arg1.GLOBAL_HIT_IGNORE
				local Camera = Arg1.services.camera
				local RunService = Arg1.services.runService
				local Vfx = Arg1.world.vfx
				local Plants = Arg1.world.plants
				local Drops = Arg1.world.drops
				local PlayerGui = Arg1.world.playerGui
				local Window = Arg1.window
				local IsVisible = Arg1.isVisible
				local ProtectedCall = Arg1.protectedCall
				local V3 = nil
				local function Fn(Arg1_2, Arg2, Arg3)
					if V3 then
						return
					end
					if not Arg1.localrootpart or not Client.fireRemote or not Client.toolInfo or RawGet(Client.itemInfo, "Type") ~= "Gun" or Type(RawGet(Client.itemInfo, "Name")) ~= "string" then
						return
					end
					local ServerTimeNow = Workspace:GetServerTimeNow()
					local V4 = RawGet(Client.itemInfo, "Name")
					local Position = (Camera.CFrame * New2(0, 0, -2)).Position
					local V5 = Arg1.localrootpart.CFrame * New2(0, V2.viewmodelController.TORSO_OFFSET_Y, 0)
					local V6 = 0
					local V7 = 0
					V3 = RunService.PreRender:Connect(function(Arg1_3)
						V6 = V6 + Arg1_3
						if not ((Arg3 or 20) <= V7) and Arg1.localrootpart and Client.fireRemote then
							if 0.05 <= V6 then
								V7 = V7 + 1
								V6 = 0
								ProtectedCall(Client.fireRemote, "Fire", V2.assetContainer.TP_SHOOT_KEY_1, V2.assetContainer.TP_SHOOT_KEY_2, ServerTimeNow, V4, Camera.CFrame, V5:PointToObjectSpace(Position), V5, 0, 0, (Camera.CFrame * New2(0, 0, -50)).Position)
								Arg1.localrootpart.CFrame = New2(Arg1_2)
							end
							return
						else
							V3:Disconnect()
							V3 = nil
							return
						end
					end)
					if Arg2 then
						repeat
							Wait()
						until not V3
					end
				end
				Flags.tpToWaypoint_toggle:OnChanged(function(Arg1_2)
					if (not Arg1_2) then
						if V3 then
							V3:Disconnect()
							V3 = nil
						end
						return
					elseif (not Arg1.localrootpart or not Arg1.localcharacter) then
						Delay(0, Flags.tpToWaypoint_toggle.self.setValue, false)
						Window:notify("You must be alive to use this!", 1.5)
						return
					elseif (not Client.toolInfo or RawGet(Client.itemInfo, "Type") ~= "Gun") then
						Delay(0, Flags.tpToWaypoint_toggle.self.setValue, false)
						Window:notify("You must have a ranged weapon equipped to use this!", 1.5)
						return
					end
					local Attribute = PlayerGui:GetAttribute("PlayerMapPin")
					if (not Attribute) then
						Delay(0, Flags.tpToWaypoint_toggle.self.setValue, false)
						Window:notify("You must have a waypoint marked!", 1.5)
						return
					end
					local Position = Arg1.localrootpart.Position
					local V2 = New(Position.X, 300, Position.Z)
					local V4 = New(Attribute.X, 300, Attribute.Y)
					if (not IsVisible(Position, V2, Arg1.localcharacter)) then
						Delay(0, Flags.tpToWaypoint_toggle.self.setValue, false)
						Window:notify("No LOS to sky found", 1.5)
						return
					end
					Spawn(function()
						Fn(V2, true)
						Fn(V4, true, 30)
						local V5 = RaycastParams2.new()
						V5.RespectCanCollide = true
						V5.FilterDescendantsInstances = {Camera, Vfx, Plants, Drops, Arg1.localcharacter, Unpack(GlobalHitIgnore)}
						local V6 = V4
						local V7 = New(Attribute.X, 0, Attribute.Y)
						local V8 = Workspace:Raycast(V6, V7 - V6, V5)
						if (not V8) then
							repeat
								Wait()
								if (not Arg1.localrootpart) then
									break
								end
								V6 = Arg1.localrootpart.Position
								V8 = Workspace:Raycast(V6, V7 - V6, V5)
							until V8 and V8.Distance < 15
							Wait(1)
							Delay(0, Flags.tpToWaypoint_toggle.self.setValue, false)
							return
						end
						Fn(V8.Position + New(0, 10, 0), true)
						Wait(3)
						Delay(0, Flags.tpToWaypoint_toggle.self.setValue, false)
					end)
				end)
			end
		end)()
		local V3 = (function()
			local CheckCaller = CheckCaller
			local NewCClosure = NewCClosure
			local V4 = V2
			local V5 = V16
			local V6 = V20[8]
			local V7 = V20[3]
			return function(Arg1)
				local Flags = Arg1.flags
				local Vms = Arg1.world.vms
				local Replacemetamethod = Arg1.replacemetamethod
				local Remove = V6.remove
				local V2 = {
					forcefield = Enum2.Material.ForceField,
					neon = Enum2.Material.Neon,
					smoothplastic = Enum2.Material.SmoothPlastic,
				}
				local V8 = SetMetatable({}, {__mode = "k"})
				local V9 = SetMetatable({}, {__mode = "v"})
				Flags.localChams_toggle:OnChanged(function(Arg1)
					if (not Arg1) then
						for Index = 1, #V9 do
							local V3 = V9[Index]
							if (not V3.Parent) then
								V7.warn("PART has not been gced")
							end
							local V4 = V8[V3]
							if (not V4) then
								V7.warn("originalValue key was gced, but not main instance")
							end
							V3.Color = V4.Color
							V3.Transparency = V4.Transparency
							V3.Material = V4.Material
							if (V4.TextureID) then
								V3.TextureID = V4.TextureID
							end
						end
						return
					end
					for Index2 = 1, #V9 do
						local V5 = V9[Index2]
						V5.Color = Flags.localChams_colour.value
						V5.Transparency = Flags.localChams_transparency.value / 100
						V5.Material = V2[Flags.localChams_material.value]
						if (V5.ClassName == "MeshPart") then
							V5.TextureID = ""
						end
					end
				end)
				Flags.localChams_colour:OnChanged(function(Arg1)
					if (not Flags.localChams_toggle.value) then
						return
					end
					for Index = 1, #V9 do
						V9[Index].Color = Arg1
					end
				end)
				Flags.localChams_transparency:OnChanged(function(Arg1)
					if (not Flags.localChams_toggle.value) then
						return
					end
					for Index = 1, #V9 do
						V9[Index].Transparency = Arg1 / 100
					end
				end)
				Flags.localChams_material:OnChanged(function(Arg1)
					if (not Flags.localChams_toggle.value) then
						return
					end
					for Index = 1, #V9 do
						V9[Index].Material = V2[Arg1]
					end
				end)
				local function Fn(Arg1)
					local ClassName = Arg1.ClassName
					if ClassName ~= "Part" and ClassName ~= "MeshPart" or Arg1.Transparency == 1 or V8[Arg1] then
						return
					end
					local V6 = {Color = Arg1.Color, Material = Arg1.Material, Transparency = Arg1.Transparency}
					local TextureID = ClassName == "MeshPart" and Arg1.TextureID
					V6.TextureID = TextureID
					local V7 = V4(V6)
					V8[Arg1] = V7
					Arg1.AncestryChanged:Connect(function(Arg1_2, Arg2)
						if Arg1_2 ~= Arg1 or Arg2 ~= nil then
							return
						else
							V8[Arg1] = nil
							Remove(V9, Arg1)
							return
						end
					end)
					if Flags.localChams_toggle.value then
						Arg1.Color = Flags.localChams_colour.value
						Arg1.Transparency = Flags.localChams_transparency.value / 100
						Arg1.Material = V2[Flags.localChams_material.value]
						if ClassName == "MeshPart" then
							Arg1.TextureID = ""
						end
					end
					V5(V9, Arg1)
				end
				local function Fn2(Arg1)
					for Key, Value in Arg1:GetDescendants() do
						Fn(Value)
					end
				end
				Fn2(Vms)
				Vms.ChildAdded:Connect(Fn2)
			end
		end)()
		return function(Arg1)
			local Flags = Arg1.flags
			local Client = Arg1.client
			local Camera = Arg1.services.camera
			local RunService = Arg1.services.runService
			local SoundModule = Arg1.gameModules.soundModule
			local Window = Arg1.window
			Flags.silentWalk_toggle:OnChanged(function(Arg1_2)
				if (Arg1_2 and Arg1.localcharacter) then
					Spawn(SoundModule.ToggleFootstep, SoundModule, Arg1.localcharacter)
				end
			end)
			Flags.fly_toggle:OnChanged(function(Arg1_2)
				if (not Arg1_2 and Arg1.localrootpart and Arg1.localrootpart.Anchored and not Flags.freecam_toggle.value) then
					RunService.Heartbeat:Wait()
					Arg1.localrootpart.Anchored = false
				end
			end)
			Flags.freecam_toggle:OnChanged(function(Arg1_2)
				if (not Arg1.localrootpart) then
					if (not Arg1_2) then
						return
					end
					Flags.freecam_toggle.self.setValue(false)
					Window:notify("You must be alive to use freecam", 1)
					return
				elseif (Arg1_2) then
					Client.originalCFrame = Arg1.localrootpart.CFrame
					Client.scanOrigin = Camera.CFrame
					Arg1.localrootpart.Anchored = true
					return
				else
					Client.scanOrigin = nil
					if (not Client.originalCFrame) then
						return
					end
				end
				RunService.PreRender:Wait()
				if (Arg1.localrootpart) then
					SethiddenProperty(Arg1.localrootpart, "NetworkIsSleeping", false)
					Arg1.localrootpart.CFrame = Client.originalCFrame
					Arg1.localrootpart.Anchored = false
				end
			end)
			V3(Arg1)
		end
	end)()
	local V12 = (function()
		local Setfflag = Setfflag
		local Wait = Task.wait
		return function(Arg1)
			local Flags = Arg1.flags
			local LightingSpoof = Arg1.lightingSpoof
			local LightingIgnore = Arg1.lightingIgnore
			local CameraSpoof = Arg1.cameraSpoof
			local Camera = Arg1.services.camera
			local Lighting = Arg1.services.lighting
			Flags.ambient_toggle:OnChanged(function(Arg1)
				if (LightingIgnore.Ambient ~= nil) then
					return
				end
				local V2 = Arg1 and Flags.ambient_colour.value or LightingSpoof.Ambient
				if (V2 == Lighting.Ambient) then
					return
				end
				LightingIgnore.Ambient = V2
				Wait()
				Lighting.Ambient = V2
			end)
			Flags.ambient_colour:OnChanged(function(Arg1)
				if (LightingIgnore.Ambient ~= nil or not Flags.ambient_toggle.value) then
					return
				elseif (Arg1 == Lighting.Ambient) then
					return
				end
				LightingIgnore.Ambient = Arg1
				Wait()
				Lighting.Ambient = Arg1
			end)
			Flags.removeGrass_toggle:OnChanged(function(Arg1)
				local V2 = Arg1 and "-1" or "100"
				local V3 = Arg1 and "-1" or "290"
				Pcall(Setfflag, "FRMMinGrassDistance", V2)
				Pcall(Setfflag, "FRMMaxGrassDistance", V3)
			end)
			Flags.fovChanger_toggle:OnChanged(function(Arg1)
				local V2 = Arg1 and Flags.fovChanger_amount.value or CameraSpoof.FieldOfView
				Camera.FieldOfView = V2
			end)
			Flags.fovChanger_amount:OnChanged(function(Arg1)
				if (not Flags.fovChanger_toggle.value) then
					return
				end
				Camera.FieldOfView = Arg1
			end)
			Flags.zoom_keybind:OnChanged(function(Arg1)
				if (not Flags.zoom_toggle.value) then
					return
				elseif (Arg1) then
					Camera.FieldOfView = Flags.zoom_amount.value
					return
				end
				Camera.FieldOfView = Flags.fovChanger_toggle.value and Flags.fovChanger_amount.value or CameraSpoof.FieldOfView
			end)
		end
	end)()
	local V13 = (function()
		local Spawn = Task.spawn
		local Delay = Task.delay
		local V = V20[4]
		return function(Arg1)
			local Flags = Arg1.flags
			local Client = Arg1.client
			local Players = Arg1.services.players
			local PlayerESP = Arg1.playerESP
			local StaffDetectorHandler = Arg1.staffDetectorHandler
			Flags.staffDetector_toggle:OnChanged(function(Arg1)
				if (not Arg1) then
					return
				end
				local Players2 = Players:GetPlayers()
				for Index = 2, #Players2 do
					Spawn(StaffDetectorHandler, Players2[Index], "Staff Detector: %* is in your game!")
				end
			end)
			Flags.suicide_toggle:OnChanged(function(Arg1_2)
				if (not Arg1_2) then
					return
				elseif (not Arg1.localhumanoid or Arg1.localhumanoid.Health <= 0) then
					Delay(0, Flags.suicide_toggle.self.setValue, false)
					return
				end
				Arg1.localhumanoid.Health = 0
				Delay(0, Flags.suicide_toggle.self.setValue, false)
				return
			end)
			Flags.antiaim_toggle:OnChanged(function(Arg1_2)
				if (Arg1_2) then
					if (not Client.animationTable) then
						return
					end
					local DownFall = Client.animationTable.DownFall
					local Down = Client.animationTable.Down
					local V2 = DownFall.IsPlaying or Down.IsPlaying
					if (not V2) then
						DownFall:Play()
						Down:Play()
					end
				elseif (Client.animationTable and Arg1.localhumanoid) then
					if (Arg1.localhumanoid:GetAttribute("Downed")) then
						return
					end
					local DownFall2 = Client.animationTable.DownFall
					local Down2 = Client.animationTable.Down
					DownFall2:Stop()
					Down2:Stop()
				end
			end)
			Flags.resolveAntiAim_toggle:OnChanged(function(Arg1)
				if (not Arg1) then
					return
				end
				local Fn = function(Arg1, Arg2)
					if (Arg2.Animation.AnimationId == V.animations.DOWNED_ANIMATION_ID and not Arg1:GetAttribute("Downed")) then
						Task.wait()
						Arg2:Stop()
					end
				end
				for Key, Value in PlayerESP.playerCache do
					local V2 = Value.current and Value.current.humanoid
					if (not V2) then
						continue
					end
					for Key2, Value2 in V2:GetPlayingAnimationTracks() do
						Fn(V2, Value2)
					end
				end
			end)
		end
	end)()
	local V14 = (function()
		return function(Arg1)
			local Flags = Arg1.flags
			local Target = Arg1.target
			local Window = Arg1.window
			local KeybindList = Arg1.keybindList
			local TargetHUD = Arg1.targetHUD
			Flags.keybindList_toggle:OnChanged(function(Arg1)
				KeybindList:toggle(Arg1)
			end)
			Flags.targetHud_toggle:OnChanged(function(Arg1)
				TargetHUD:toggle(Arg1 and (Target.silent.player or Window.active) ~= nil)
			end)
		end
	end)()
	return function(Arg1)
		V(Arg1)
		V4(Arg1)
		V5(Arg1)
		V6(Arg1)
		V7(Arg1)
		V8(Arg1)
		V9(Arg1)
		V10(Arg1)
		V11(Arg1)
		V12(Arg1)
		V13(Arg1)
		V14(Arg1)
	end
end)()
local V78 = (function()
	local V = V20[4]
	return function(Arg1)
		local PlayerESP = Arg1.playerESP
		local ToolInfo = Arg1.gameModules.toolinfo
		local Flags = Arg1.flags
		PlayerESP.onChildAdded(function(Arg1, Arg2)
			if (ToolInfo[Arg2.Name]) then
				Arg1.current.weapon = Arg2
			elseif (Arg2.ClassName == "Humanoid") then
				local V2 = Arg2
				local Fn = function(Arg1)
					if (Flags.resolveAntiAim_toggle.value and Arg1.Animation.AnimationId == V.animations.DOWNED_ANIMATION_ID and not V2:GetAttribute("Downed")) then
						Task.wait()
						Arg1:Stop()
					end
				end
				V2.AnimationPlayed:Connect(Fn)
				if (not Flags.resolveAntiAim_toggle.value) then
					return
				end
				for Key, Value in V2:GetPlayingAnimationTracks() do
					Fn(Value)
				end
			end
		end)
		PlayerESP.onChildRemoved(function(Arg1, Arg2)
			if (Arg2 == Arg1.current.weapon) then
				Arg1.current.weapon = nil
			end
		end)
	end
end)()
local V79 = (function()
	return function(Arg1)
		local RunService = Arg1.services.runService
		local UserInputService = Arg1.services.userInputService
		local Players = Arg1.services.players
		local LocalPlayer = Arg1.localplayer
		local Client = Arg1.client
		local KeyHandlers = Arg1.keyHandlers
		local RendersteppedLoop = Arg1.rendersteppedLoop
		local HeartbeatLoop = Arg1.heartbeatLoop
		local PlayerAdded = Arg1.playerAdded
		local PlayerRemoved = Arg1.playerRemoved
		RunService.PreRender:Connect(RendersteppedLoop)
		RunService.Heartbeat:Connect(HeartbeatLoop)
		UserInputService.InputBegan:Connect(function(Arg1)
			local Name = Arg1.KeyCode.Name
			if (Name ~= "Unknown") then
				KeyHandlers[Name] = true
			elseif (Arg1.UserInputType.Value <= 4) then
				KeyHandlers[Arg1.UserInputType.Name] = true
			end
		end)
		UserInputService.InputEnded:Connect(function(Arg1)
			local Name = Arg1.KeyCode.Name
			if (Name ~= "Unknown") then
				KeyHandlers[Name] = false
			elseif (Arg1.UserInputType.Value <= 4) then
				KeyHandlers[Arg1.UserInputType.Name] = false
			end
		end)
		LocalPlayer.CharacterAdded:Connect(Client.characterAdded)
		LocalPlayer.CharacterRemoving:Connect(Client.characterRemoving)
		Players.PlayerAdded:Connect(PlayerAdded)
		Players.PlayerRemoving:Connect(PlayerRemoved)
	end
end)()
local V80 = (function()
	local V = V16
	local V2 = V20[8]
	return function(Arg1)
		local GlobalHitIgnore = Arg1.GLOBAL_HIT_IGNORE
		local Vegetation = Arg1.world.vegetation
		local Trees = Arg1.world.trees
		local Remove = V2.remove
		local function Fn(Arg1)
			V(GlobalHitIgnore, Arg1)
			local V2
			V2 = Arg1.AncestryChanged:Connect(function(Arg1_2, Arg2)
				if (Arg2 ~= nil) then
					return
				end
				Remove(GlobalHitIgnore, Arg1)
				V2:Disconnect()
			end)
		end
		local function Fn2(Arg1, Arg2)
			if (not Arg1) then
				return
			end
			local Children = Arg1:GetChildren()
			for Index = 1, #Children do
				local V2 = Children[Index]
				local V3 = Arg2(V2)
				if (V3) then
					Fn(V3 or V2)
				end
			end
			Arg1.ChildAdded:Connect(function(Arg1_2)
				local V2 = Arg2(Arg1_2)
				if (V2) then
					Fn(V2 or Arg1_2)
				end
			end)
		end
		Fn2(Vegetation, function(Arg1)
			return Arg1:FindFirstChild("CactusPart") or Arg1:FindFirstChild("LeafPart")
		end)
		Fn2(Trees, function(Arg1)
			return Arg1:FindFirstChild("LeafPart")
		end)
	end
end)()
local V81 = (function()
	local V = V20[8]
	local V2 = V20[3]
	return function(Arg1)
		local Flags = Arg1.flags
		local Players = Arg1.services.players
		local Plants = Arg1.world.plants
		local Nodes = Arg1.world.nodes
		local Loners = Arg1.world.loners
		local Events = Arg1.world.events
		local Military = Arg1.world.military
		local PlayerESP = Arg1.playerESP
		local NpcESP = Arg1.npcESP
		local EntityESP = Arg1.entityESP
		local EntityESPSettings = Arg1.entityESP_settings
		local NpcESPSettings = Arg1.npcESP_settings
		local ChristmasUpdate = Arg1.const.CHRISTMAS_UPDATE
		local Find = V.find
		PlayerESP.onDrawingAdded(function(Arg1)
			local Drawings = Arg1.drawings
			Drawings.box.Color = Flags.playerEsp_boxColour.value
			Drawings.name.Color = Flags.playerEsp_nameColour.value
			Drawings.distance.Color = Flags.playerEsp_distanceColour.value
			Drawings.weapon.Color = Flags.playerEsp_weaponColour.value
		end)
		local Players2 = Players:GetPlayers()
		for Index = 1, #Players2 do
			PlayerESP.new(Players2[Index])
		end
		EntityESP.onDrawingAdded(function(Arg1)
			local Drawings = Arg1.drawings
			local Name = Arg1.name
			local T = {hemp = "entityEsp_hempColour", stone = "entityEsp_stoneColour", phosphate = "entityEsp_phosphateColour", metal = "entityEsp_metalColour", ["body bag"] = "entityEsp_bodyBagColour", airdrop = "entityEsp_airdropColour", ["timed crate"] = "entityEsp_timedCrateColour", minicopter = "entityEsp_minicopterColour"}
			if ChristmasUpdate then
				T["small present"] = "entityEsp_smallGiftColour"
				T["medium present"] = "entityEsp_mediumGiftColour"
				T["large present"] = "entityEsp_largeGiftColour"
			end
			if (not T[Name]) then
				V2.warn("NO FLAG CONV FOUND", Name)
				return
			end
			local Value = Flags[T[Name]].value
			Drawings.box.Color = Value
			Drawings.name.Color = Value
			Drawings.distance.Color = Value
		end)
		local function Fn(Arg1)
			local Name = Arg1.Name
			local V2 = EntityESPSettings[Name]
			if (V2) then
				return EntityESP.new(Arg1, Name, V2[1], V2[2])
			end
			return
		end
		local function Fn2(Arg1)
			if (not Arg1) then
				return
			end
			local Children = Arg1:GetChildren()
			for Index = 1, #Children do
				Fn(Children[Index])
			end
			Arg1.ChildAdded:Connect(Fn)
		end
		Fn2(Nodes)
		Fn2(Plants)
		Fn2(Loners:FindFirstChild("Body Bag"))
		Fn2(Loners:FindFirstChild("Care Package"))
		Fn2(Loners:FindFirstChild("Timed Crate"))
		Fn2(Loners:FindFirstChild("Salvaged Flycopter"))
		if ChristmasUpdate then
			Fn2(Loners:FindFirstChild("Small Gift"))
			Fn2(Loners:FindFirstChild("Medium Gift"))
			Fn2(Loners:FindFirstChild("Large Gift"))
		end
		NpcESP.onDrawingAdded(function(Arg1)
			local Drawings = Arg1.drawings
			local Name = Arg1.name
			local T = {scav = "npcEsp_scavColour", bruno = "npcEsp_brunoColour", boris = "npcEsp_borisColour", brutus = "npcEsp_brutusColour", bradley = "npcEsp_bradleyColour", wolf = "npcEsp_wolfColour", deer = "npcEsp_deerColour", boar = "npcEsp_boarColour"}
			if (not T[Name]) then
				V2.warn("NO FLAG CONV FOUND")
				return
			end
			local Value = Flags[T[Name]].value
			Drawings.box.Color = Value
			Drawings.name.Color = Value
			Drawings.distance.Color = Value
		end)
		local function Fn3(Arg1)
			local Name = Arg1.Name
			local V2 = NpcESPSettings[Name]
			if (V2) then
				local T = {"wolf", "deer", "boar", "bradley"}
				return NpcESP.new(Arg1, Name, V2[1], V2[2], Find(T, V2[1]))
			end
			return
		end
		local function Fn4(Arg1)
			if (not Arg1) then
				return
			end
			local Children = Arg1:GetChildren()
			for Index = 1, #Children do
				Fn3(Children[Index])
			end
			Arg1.ChildAdded:Connect(Fn3)
		end
		Fn4(Events)
		Fn4(Workspace:FindFirstChild("Animals"))
		for _, Value in Military:GetChildren() do
			Fn4(Value)
		end
	end
end)()
V63.tabs = V64(V59, false)
V65(V63)
V66(V63)
V67(V63)
V68(V63)
V69(V63)
V63.getEquipped = V70(V63)
V63.predict = V71(V63)
V72(V63)
V73(V63)
V74(V63)
if not V75(V63) then
	return
end
V76(V63)
V77(V63)
V78(V63)
V79(V63)
V80(V63)
V81(V63)
V63.client.FULLY_LOADED = true
PH_UI.finish()
if (#PH_MISSING > 0) then
	PH_UI.notify("Executor is missing: " .. Table.concat(PH_MISSING, ", "), 8, Color3.fromRGB(255, 165, 0))
end
