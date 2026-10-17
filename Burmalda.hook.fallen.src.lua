if getgenv().PHOOKGATE ~= 1347571535 then return end
getgenv().BURMALDA_ERROR = nil

local Enum2 = Enum
local Workspace = workspace
local Select = select
local GetConnections = getconnections
local Type = type
local SetFFlag = setfflag
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
local NewProxy = newproxy
local CloneRef = cloneref
local Error = error
local NewCClosure = newcclosure
local Assert = assert
local IdentifyExecutor = identifyexecutor
local RawEqual = rawequal
local Unpack = unpack
local Table = table
local TypeOf = typeof
local MakeFolder = makefolder
local Debug = debug
local GetSenv = getsenv
local Os = os
local GetRawMetatable = getrawmetatable
local GetGc = getgc
local SetHiddenProperty = sethiddenproperty
local Vector3_2 = Vector3
local LoadFile = loadfile
local HookFunction = hookfunction
local DelFile = delfile
local WriteFile = writefile
local SetFenv = setfenv
local Print = print
local Base64Decode = base64_decode
local Color3_2 = Color3
local GetCallingScript = getcallingscript
local SetMetatable = setmetatable
local Vector2_2 = Vector2
local RawLen = rawlen
local ToString = tostring
local SetFpsCap = setfpscap
local ListFiles = listfiles
local Split = String and String.split
local Freeze = Table and Table.freeze
local Clone = Table and Table.clone
local Find = Table and Table.find
local Remove = Table and Table.remove
local Round = Math and Math.round
local Clock = Os and Os.clock
local Info = Debug and Debug.info
local Getupvalues = Debug and Debug.getupvalues
local Getconstants = Debug and Debug.getconstants
local Find2 = String and String.find
local Lower = String and String.lower
local Clear = Table and Table.clear
local Isfrozen = Table and Table.isfrozen
local Getstack = Debug and Debug.getstack
local Setstack = Debug and Debug.setstack
local Setupvalue = Debug and Debug.setupvalue
local Setconstant = Debug and Debug.setconstant
local Isvalidlevel = Debug and Debug.isvalidlevel
local Clamp = Math and Math.clamp
local Abs = Math and Math.abs
local Insert = Table and Table.insert
local Sub = String and String.sub
local Max = Math and Math.max
local Ceil = Math and Math.ceil
local Sort = Table and Table.sort
local Move = Table and Table.move
local Min = Math and Math.min
local Format = String and String.format
local Random = Math and Math.random
local Unpack2 = Table and Table.unpack
local Sin = Math and Math.sin
local Cos = Math and Math.cos
local BH_MISSING = {}
local function BH_FAIL(Arg1)
	local V = "Burmalda.hook could not start: " .. ToString(Arg1)
	Pcall(function()
		if not isfolder("Burmalda") then makefolder("Burmalda") end
		writefile("Burmalda\\error.txt", V)
	end)
	Pcall(setclipboard, V)
	getgenv().BURMALDA_ERROR = V
end
if not Game:IsLoaded() then
	Game.Loaded:Wait()
end
local T = {
	[2] = (function()
		local V = false
		return {
			kick = function(Arg1)
				if V then
					return
				end
				local Players = Game:GetService("Players")
				if (not (Players and Players.LocalPlayer)) then
					Game:Shutdown()
				end
				Players.LocalPlayer:Kick(Arg1)
				V = true
				local Fn = function()
					local ErrorPrompt = Game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt
					ErrorPrompt.MessageArea.ErrorFrame.ErrorMessage.Text = Arg1
					ErrorPrompt.TitleFrame.ErrorTitle.Text = "Burmalda.hook / Error"
				end
				while true do
					Pcall(Fn)
					Task.wait(0.5)
				end
				Task.wait(9000000000)
			end,
			wasKicked = function()
				return V
			end,
		}
	end)(),
}
T[1] = (function()
	GetFenv()
	local Kick = T[2].kick
	return function(Arg1, Arg2, Arg3)
		local LocalPlayer = Game:GetService("Players").LocalPlayer
		if (not LocalPlayer) then
			return Game:Shutdown()
		elseif (not Arg1 or Arg3 and TypeOf(Arg1) ~= Arg3) then
			BH_MISSING[#BH_MISSING + 1] = ToString(Arg2)
		end
	end
end)()
T[3] = (function()
	return {
		print = function()
		end,
		warn = function()
		end,
	}
end)()
T[4] = (function()
	return Freeze({
		viewmodelController = Freeze({
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
		raycastUtil = Freeze({
			MOUSE_RAYCAST_IGNORE_ARG = 3,
			SHOOT_IGNORE_LIST_LENGTH = 2,
			RAYCAST_FILTERS_ARG = 5,
			RAYCAST_FILTER_FN_ARG = 7,
		}),
		inventoryController = Freeze({EQUIP_ARMOR_HANDLER_UPVALUE = 2}),
		stateAssetController = Freeze({FOOTSTEP_HANDLER_UPVALUE = 1}),
		assetContainer = Freeze({
			BAN_TABLE_UPVALUE = 2,
			FIRE_KEY = "k@\218v4\1\236\153i\187\169v\148\191\230\193\216\130\176g",
			RELOAD_KEY = "\1887\1g\18\228\158\151\249B`\176\1ti\186\206\201S\r",
			TP_SHOOT_KEY_1 = "d\147e\1R\169#o\249,9\133\153`B4q^W\6",
			TP_SHOOT_KEY_2 = "#\250)\215\28\1U\143\237}\154\218\231Cl-\15H\1\147",
		}),
		animations = Freeze({DOWNED_ANIMATION_ID = "rbxassetid://13435049596"}),
		staff = Freeze({GROUP_ID = 1154360, MIN_RANK = 15}),
	})
end)()
T[5] = (function()
	local T = {
		Wave = {FONT = 1, SIZE = 13},
		Volt = {FONT = 2, SIZE = 15},
		AWP = {FONT = 0, SIZE = 16},
		Zenith = {FONT = 3, SIZE = 15},
	}
	local T2 = {FONT = 1, SIZE = 13}
	local V, V2 = Pcall(IdentifyExecutor)
	return V and T[V2] or T2
end)()
T[6] = (function()
	local T = {
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
		FLAGS = T,
		translate = function(Tbl)
			local T2 = {}
			for Key, Value in Tbl do
				local V = T[Key]
				if V then
					if Tbl[V] == nil then
						T2[V] = Value
					end
				else
					T2[Key] = Value
				end
			end
			return T2
		end,
	}
end)()
T[7] = (function()
	return function(Arg1, Arg2, Arg3)
		local V = Clone(GetRawMetatable(Arg1))
		local V2 = RawGet(V, Arg2)
		SetReadonly(V, false)
		RawSet(V, Arg2, Arg3)
		Freeze(V)
		SetRawMetatable(Arg1, V)
		return V2
	end
end)()
T[8] = (function()
	return {
		find = function(Arg1, Arg2)
			for Key, Value in Next, Arg1 do
				if (RawEqual(Value, Arg2)) then
					return Key
				end
			end
		end,
		remove = function(Arg1, Arg2, _)
			local V = Find(Arg1, Arg2)
			if (V) then
				Remove(Arg1, V)
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
			local V
			V = function(Arg1, Arg2)
				local T = {}
				for Key, Value in Next, Arg1 do
					local V2 = Type(Value)
					if (V2 == "number" and Arg2) then
						Value *= Arg2
					elseif (V2 == "table") then
						Value = V(Value, Arg2)
					end
					T[Key] = Value
				end
				return T
			end
			return V(Arg1, Arg2)
		end,
	}
end)()
local V = T[1]
local V2 = T[2]
local V3 = T[3]
local V4 = (function()
	local V = T[2]
	local V2 = T[4]
	return function()
		if not Game:IsLoaded() then
			Game.Loaded:Wait()
		end
		local V3, V4 = Pcall(IsFile, "Burmalda\\log.txt")
		if not (not V3 or V4) then
			Pcall(WriteFile, "Burmalda\\log.txt", "")
		end
		local LocalPlayer = Game:GetService("Players").LocalPlayer
		local V5 = Tick()
		local function Fn(Arg1, Arg2)
			local V = ("%*[%*] %*\n"):format(Arg2 or "", Round((Tick() - V5) * 10000) / 10000, Arg1)
			Pcall(AppendFile, "Burmalda\\log.txt", V)
		end
		local function Fn2(Arg1, Arg2)
			local V2 = ("Fatal Error %*"):format(Arg1)
			Fn(V2)
			BH_FAIL(V2)
			return false
		end
		Fn(("Init [ Clock:%*, ID:\"main\" ]"):format(Clock()), "\n\n")
		local T = {}
		local V6 = nil
		V6 = function(Arg1, Arg2, Arg3, Arg4)
			Arg3 = Arg3 or ""
			Arg4 = Arg4 or {}
			for Key, Value in Next, Arg1 do
				local V = Type(Value)
				if (not ((V == "table" or V == "function" and Info(Value, "s") ~= "[C]") and not Arg4[Value])) then
					Arg2(Key, Value, (tostring(Arg3) .. "." .. tostring(Key)), Arg1)
					continue
				end
				Arg4[Value] = true
				if (V == "function") then
					V6(Getupvalues(Value), Arg2, ("UPVALUES(" .. tostring(Arg3) .. "." .. tostring(Key) .. ")"), Arg4)
					continue
				end
				V6(Value, Arg2, (tostring(Arg3) .. "." .. tostring(Key)), Arg4)
			end
		end
		local function Fn3(Arg1, Arg2)
			for _, Value in Next, Arg1 do
				if (Value == Arg2) then
					return true
				end
			end
			return false
		end
		local T2 = {self = nil, index = nil}
		local V7 = "ReplicatedStorage.Modules.AssetContainer"
		local Gc = GetGc()
		local function DeepCopy(Arg1)
			if Type(Arg1) ~= "table" then
				return false
			end
			T2.found = true
			for Key, Value in Next, Arg1 do
				if Type(Key) ~= "number" then
					continue
				end
				if not RawEqual(Value, Arg1) then
					if Type(Value) ~= "number" then
						continue
					end
					if T2.index then
						return Fn2("Duplicate Index")
					end
					T2.index = Key
					T2.value = Value
				else
					if T2.self then
						return Fn2("Duplicate Self")
					end
					T2.self = Key
				end
			end
			return true
		end
		;(function()
			for _, Value in Gc do
				if (Type(Value) ~= "function" or Info(Value, "s") ~= V7 or not Fn3(Getconstants(Value), "WalkSpeed") or not DeepCopy(Getupvalues(Value)[V2.assetContainer.BAN_TABLE_UPVALUE])) then
					continue
				end
				break
			end
		end)()
		if not T2.found then
			return Fn2("No corresponding values found")
		end
		if not T2.index then
			return Fn2("Failed to fetch Index")
		end
		if not T2.self or not T2.value then
			return Fn2("Failed to fetch Self")
		end
		local function Fn4(Arg1)
			if Type(Arg1) ~= "table" then
				return true
			end
			local V = RawGet(Arg1, 1)
			local V2 = RawGet(Arg1, 2)
			local V3 = RawGet(Arg1, 3)
			local V4 = RawLen(Arg1)
			if (V4 ~= 0 or V ~= nil) and not (TypeOf(V) == "Instance" or not (V4 ~= 4 or V ~= 2 or V2 ~= "BillboardGui" or V3 ~= "BillboardGui" or RawGet(Arg1, 4) ~= false)) and (V4 ~= 4 or (Type(V) ~= "table" or RawGet(V, 1) ~= 73 or (V2 ~= false or Type(V3) ~= "number" or Type(RawGet(Arg1, 4)) ~= "number"))) and (V4 ~= 1 or V ~= 2) and (V4 ~= 2 or V ~= "2" or Type(V2) ~= "string") and (V4 ~= 2 or (Type(V) ~= "number" or not (0 <= V) or not (V <= 10) or Type(V2) ~= "number" or V2 % 1 == 0)) and ((V4 ~= 2 or Type(V) ~= "string" or (not ToNumber(V) or (Type(V2) ~= "number" or V2 % 1 ~= 0))) and ((V4 ~= 2 or (Type(V) ~= "table" or RawGet(V, 1) ~= 7 or RawGet(V, "n") ~= 1 or Type(V2) ~= "number" or V2 % 1 == 0)) and ((V4 ~= 1 or TypeOf(V) ~= "userdata") and ((V4 ~= 1 or Type(V) ~= "table" or RawLen(V) ~= 1 or RawGet(V, 1) ~= 3) and ((V4 ~= 2 or Type(V) ~= "table" or V2 ~= false or Type(RawGet(V, 1)) ~= "string" or not ToNumber(RawGet(V, 1))) and (V4 ~= 2 or Type(V) ~= "table" or RawGet(V, 1) ~= 55 or V2 ~= "167"))) and (V4 ~= 2 or (Type(V) ~= "table" or (RawGet(V, 1) ~= 37 or V2 ~= "216")))))) and (V4 ~= 2 or (Type(V) ~= "table" or Type(RawGet(V, 1)) ~= "number") or (RawLen(V) ~= 1 or Type(V2) ~= "string" or not ToNumber(V2))) and ((V4 ~= 2 or Type(V) ~= "table" or (Type(RawGet(V, 1)) ~= "number" or RawLen(V) ~= 1 or Type(V2) ~= "number")) and ((V4 ~= 3 or V3 ~= true or Type(V2) ~= "number" or Type(V) ~= "string" or not ToNumber(V)) and (V4 ~= 3 or Type(V) ~= "number" or V % 1 ~= 0 or Type(V2) ~= "number" or (V2 % 1 == 0 or Type(V3) ~= "number" or V3 % 1 ~= 0)))) then
				return false
			end
			return true
		end
		local function Fn5(Arg1)
			local V = Clone(Arg1)
			SetMetatable(Arg1, {
				__newindex = function(_, Arg2, Arg3)
					if Fn4(Arg3) then
						return RawSet(V, Arg2, Arg3)
					end
					if Type(Arg3) == "table" then
						local V2 = RawGet(Arg3, 5)
						local V3 = RawGet(Arg3, 4)
						local function Fn(Arg1)
							return Type(Arg1) == "string" and Find2(Lower(Arg1), "emote exists with name nil")
						end
						if Fn(V2) or Fn(V3) then
							return
						end
					end
				end,
				__index = function(_, Arg2)
					return RawGet(V, Arg2)
				end,
			})
			Clear(V)
		end
		local function Fn6(_, Arg2)
			if Type(Arg2) ~= "table" or (Isfrozen(Arg2) or not RawEqual(GetMetatable(Arg2), nil) or (not RawEqual(RawGet(Arg2, T2.self), Arg2) or not RawEqual(RawGet(Arg2, T2.index), T2.value))) then
				return
			end
			Fn5(Arg2)
		end
		;(function()
			for Index = 1, #Gc do
				local V = Gc[Index]
				if (Type(V) ~= "function" or Info(V, "s") ~= V7) then
					continue
				end
				V6(Getupvalues(V), Fn6, "", T)
			end
		end)()
		return true
	end
end)()
;(function()
	V(_G2, "_G", "table")
	V(Debug, "debug", "table")
	V(Info, "debug.info", "function")
	V(Getstack, "debug.getstack", "function")
	V(Setstack, "debug.setstack", "function")
	V(Getupvalues, "debug.getupvalues", "function")
	V(Setupvalue, "debug.setupvalue", "function")
	V(Getconstants, "debug.getconstants", "function")
	V(Setconstant, "debug.setconstant", "function")
	V(CloneRef, "cloneref", "function")
	V(CompareInstances, "compareinstances", "function")
	V(Drawing2, "Drawing", "table")
	V(Drawing2 and Drawing2.new, "Drawing.new", "function")
	V(GetRawMetatable, "getrawmetatable", "function")
	V(SetRawMetatable, "setrawmetatable", "function")
	V(CheckCaller, "checkcaller", "function")
	V(GetCallingScript, "getcallingscript", "function")
	V(GetSenv, "getsenv", "function")
	V(GetGc, "getgc", "function")
	V(SetFpsCap, "setfpscap", "function")
	V(NewCClosure, "newcclosure", "function")
	V(GetNamecallMethod, "getnamecallmethod", "function")
	V(CloneFunction, "clonefunction", "function")
	V(HookFunction, "hookfunction", "function")
	V(Request, "request", "function")
	V(SetFFlag, "setfflag", "function")
	V(Base64Decode, "base64_decode", "function")
	V(SetReadonly, "setreadonly", "function")
	V(GetConnections, "getconnections", "function")
	V(SetHiddenProperty, "sethiddenproperty", "function")
	V(IdentifyExecutor, "identifyexecutor", "function")
	V(IsFolder, "isfolder", "function")
	V(IsFile, "isfile", "function")
	V(MakeFolder, "makefolder", "function")
	V(ReadFile, "readfile", "function")
	V(LoadFile, "loadfile", "function")
	V(WriteFile, "writefile", "function")
	V(AppendFile, "appendfile", "function")
	V(DelFile, "delfile", "function")
	V(ListFiles, "listfiles", "function")
end)()
if #BH_MISSING > 0 then
	BH_FAIL("executor is missing " .. Table.concat(BH_MISSING, ", "))
	return
end
if Game.PlaceId ~= 112819027197869 then
	BH_FAIL("wrong game")
	return
end
if not V4() then
	return
end
local V5 = Setupvalue or function(Arg1, Arg2, Arg3)
	if Type(Arg1) == "number" then
		return Error("debug_setupvalue uses level")
	end
	if TypeOf(Getupvalues(Arg1)[Arg2]) == TypeOf(Arg3) then
		return Setupvalue(Arg1, Arg2, Arg3)
	end
	return Error("setupvalue type mismatch (Wave Compatibility)")
end
local V6 = Isvalidlevel or function(Arg1)
	local V = Pcall(function()
		Getstack(Arg1 + 3)
	end)
	return V
end
local V7 = (function()
	local Spawn = Task.spawn
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
local V8 = CloneRef(Game:GetService("ReplicatedStorage"))
local V9 = CloneRef(Game:GetService("UserInputService"))
local V10 = CloneRef(Game:GetService("HttpService"))
local V11 = CloneRef(Game:GetService("GuiService"))
local V12 = CloneRef(Game:GetService("RunService"))
local V13 = CloneRef(Game:GetService("Lighting"))
local V14 = CloneRef(Game:GetService("Players"))
local V15 = Fn(Workspace.CurrentCamera)
local V16 = CloneRef(V14.LocalPlayer)
local V17 = Fn(V16:WaitForChild("PlayerGui", math.huge))
local V18 = Fn(Workspace:FindFirstChildOfClass("Terrain"))
if not V18 then
	BH_FAIL("no terrain")
	return
end
local VFX = Workspace:WaitForChild("VFX", math.huge)
local Plants = Workspace:WaitForChild("Plants", math.huge)
local Drops = Workspace:WaitForChild("Drops", math.huge)
local V19 = CloneRef(VFX:WaitForChild("VMs", math.huge))
local V20 = CloneRef(Workspace:WaitForChild("Trees", math.huge))
local V21 = CloneRef(Workspace:WaitForChild("Vegetation", math.huge))
local V22 = CloneRef(Workspace:WaitForChild("Nodes", math.huge))
local V23 = CloneRef(Workspace:WaitForChild("Bases", math.huge))
local V24 = CloneRef(Workspace:WaitForChild("Events", math.huge))
local V25 = CloneRef(Workspace:WaitForChild("Military", math.huge))
local V26 = CloneRef(V23:WaitForChild("Loners", math.huge))
local V27 = CloneRef(V8:WaitForChild("Modules", math.huge))
local V28 = Require(V27:WaitForChild("Items", math.huge))
local V29 = Require(V27:WaitForChild("ToolInfo", math.huge))
local V30 = Require(V27:WaitForChild("BenchInfo", math.huge))
local V31 = Require(V27:WaitForChild("RaycastUtil", math.huge))
local V32 = Require(V27:WaitForChild("SoundModule", math.huge))
local V33 = Require(V27:WaitForChild("VFXModule", math.huge))
local V34 = (function()
	return (function(...)
		local T2 = {["hue.png"] = true, ["overlay.png"] = true, ["blank.png"] = true}
		local T3 = {One = "1", Two = "2", Three = "3", Four = "4", Five = "5", Six = "6", Seven = "7", Eight = "8", Nine = "9", Zero = "0", Return = "Enter", LeftBracket = "LBracket", RightBracket = "RBracket", Equals = "=", Minus = "-", Escape = "Esc", LeftShift = "LShift", RightShift = "RShift", RightControl = "RCtrl", LeftControl = "LCtrl", Quote = "'", Semicolon = ";", Delete = "Del", Up = "UpArrow", Down = "DownArrow", Right = "RightArrow", Left = "LeftArrow", RightAlt = "RAlt", LeftAlt = "LAlt", MouseButton2 = "MB2"}
		local V = T[5]
		local FONT = V.FONT
		local SIZE = V.SIZE
		local V2 = CloneRef or function(...)
			return ...
		end
		local New = Drawing2 and Drawing2.new
		local New2 = Vector2_2.new
		local FromRGB = Color3_2.fromRGB
		local FromHSV = Color3_2.fromHSV
		local V3 = Clamp
		local V4 = Round
		local V5 = Abs
		local Spawn = Task.spawn
		local Delay = Task.delay
		local V6 = Insert
		local V7 = Find
		local V8 = Remove
		local V9 = Find2
		local V10 = Sub
		local V11 = ToString
		local V12 = V2(Game:GetService("UserInputService"))
		local V13 = V2(Game:GetService("RunService"))
		local V14 = V2(Workspace.CurrentCamera)
		local Fn = function()
			local T2 = {"Burmalda", "Burmalda\\assets"}
			for Index = 1, #T2 do
				local V = T2[Index]
				if (not IsFolder(V)) then
					MakeFolder(V)
				end
			end
		end
		local Fn2 = function()
			Fn()
			for Key, Value in T2 do
				local V = ("Burmalda\\assets\\" .. tostring(Key))
				if (not IsFile(V)) then
					local V2, V3 = Pcall(Game.HttpGet, Game, "https://raw.githubusercontent.com/pqnkdwqn9j-a11y/potatoh/refs/heads/main/" .. Key)
					if (V2 and Type(V3) == "string" and #V3 > 100) then
						Pcall(WriteFile, V, V3)
					end
				end
			end
		end
		local Fn3 = function(Arg1)
			local V = ("Burmalda\\assets\\" .. tostring(Arg1) .. ".png")
			if (not T2[(tostring(Arg1) .. ".png")]) then
				return
			end
			Fn2()
			if (not IsFile(V)) then
				return
			end
			return ReadFile(V)
		end
		local Fn4 = function()
			local T2 = {Visible = true, Rounding = 0, Size = New2(0, 0), Color = Color3_2.new(0, 0, 0), Position = New2(0, 0), ZIndex = 0}
			local T3 = {}
			local V = New("Square")
			local T4 = {New("Square"), New("Square"), New("Square"), New("Square")}
			local T5 = {New("Circle"), New("Circle"), New("Circle"), New("Circle")}
			V6(T3, V)
			for Index = 1, #T5 do
				T5[Index].Radius = T2.Rounding + 0.0001
				T5[Index].Thickness = 1
				V6(T3, T5[Index])
			end
			for Index2 = 1, #T4 do
				V6(T3, T4[Index2])
			end
			for Index3 = 1, #T3 do
				local V2 = T3[Index3]
				V2.Visible = T2.Visible
				V2.Color = T2.Color
				V2.ZIndex = T2.ZIndex
				V2.Filled = true
			end
			local Fn = function()
				local V2 = New2(T2.Size.X - T2.Rounding * 2, T2.Rounding)
				T4[1].Size = V2
				T4[2].Size = V2
				T4[1].Position = New2(T2.Position.X + T2.Rounding, T2.Position.Y)
				T4[2].Position = New2(T2.Position.X + T2.Rounding, T2.Position.Y + T2.Size.Y - T2.Rounding)
				local V3 = New2(T2.Rounding, T2.Size.Y - T2.Rounding * 2)
				T4[3].Size = V3
				T4[4].Size = V3
				T4[3].Position = New2(T2.Position.X, T2.Position.Y + T2.Rounding)
				T4[4].Position = New2(T2.Position.X + T2.Size.X - T2.Rounding, T2.Position.Y + T2.Rounding)
				T5[1].Position = New2(T2.Position.X + T2.Rounding, T2.Position.Y + T2.Rounding)
				T5[2].Position = New2(T2.Position.X + T2.Size.X - T2.Rounding, T2.Position.Y + T2.Rounding)
				T5[3].Position = New2(T2.Position.X + T2.Size.X - T2.Rounding, T2.Position.Y + T2.Size.Y - T2.Rounding)
				T5[4].Position = New2(T2.Position.X + T2.Rounding, T2.Position.Y + T2.Size.Y - T2.Rounding)
				V.Position = T5[1].Position
				V.Size = T2.Size - New2(T2.Rounding * 2, T2.Rounding * 2)
				for Index = 1, #T5 do
					T5[Index].Radius = T2.Rounding + 0.0001
				end
			end
			Fn()
			local V3 = NewProxy(true)
			local Metatable = GetMetatable(V3)
			Metatable.__index = function(_, Arg2)
				return T2[Arg2]
			end
			Metatable.__newindex = function(_, Arg2, Arg3)
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
					Fn()
				end
			end
			return V3
		end
		local Fn5 = function(Arg1, Arg2, ...)
			local V = Arg1 == "RoundedSquare" and Fn4() or New(Arg1)
			for Key, Value in Arg2 do
				V[Key] = Value
			end
			for _, Value2 in {...} do
				V6(Value2, V)
			end
			return V
		end
		local Fn6 = function(Arg1)
			local V = Arg1 or {}
			V.__index = V
			return V
		end
		local V15 = Fn6()
		local V16 = Fn6()
		local V17 = Fn6()
		local V18 = Fn6({index = 0, notifications = {}})
		local V19 = Fn6()
		local V20 = Fn6()
		local V21 = Fn6()
		local V22 = Fn6()
		local V23 = Fn6()
		local V24 = Fn6()
		local V25 = Fn6()
		V15.new = function(Arg1, Arg2, Arg3)
			local V = SetMetatable({window = Arg1, text = Arg2, time = Arg3, active = true, drawings = {}}, V15)
			local V2 = 65
			local Notifications = Arg1.notifications
			for Index = 1, #Notifications do
				V2 += Notifications[Index].offset + 10
			end
			do
				local Drawings = V.drawings
				Drawings.text = Fn5("Text", {Visible = true, Center = false, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = Arg2, Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), ZIndex = 9})
				Drawings.text.Position = New2(-Drawings.text.TextBounds.X - 5, V2 + 5)
				Drawings.background = Fn5("Square", {Visible = true, Filled = true, Transparency = 1, Thickness = 1, Color = FromRGB(39, 39, 39), Position = Drawings.text.Position - New2(5, 5), Size = Drawings.text.TextBounds + New2(10, 10), ZIndex = 8})
				Drawings.background_outline = Fn5("Square", {Visible = true, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(0, 0, 0), Position = Drawings.background.Position, Size = Drawings.background.Size, ZIndex = 9})
				Drawings.accent = Fn5("Square", {Visible = true, Filled = true, Transparency = 1, Thickness = 1, Color = FromRGB(255, 0, 0), Position = Drawings.background.Position - New2(2, 0), Size = Drawings.background.Size + New2(2, 2), ZIndex = 7})
			end
			V.offset = V.drawings.accent.Size.Y
			V.goalPos = New2(10, V2)
			V:moveTo(V.goalPos, 0.2)
			V6(Notifications, V)
			local V3 = 0
			V.connection = V13.RenderStepped:Connect(function(Arg1)
				V3 += Arg1
				if (V3 >= Arg3 - 0.05) then
					V.connection:Disconnect()
					V:remove()
					return
				end
			end)
			return V
		end
		V16.new = function(Arg1)
			local V = 0
			local V2 = SetMetatable({active = Arg1.active, title = Arg1.title, size = Arg1.size, position = Arg1.position or New2(V14.ViewportSize.X - Arg1.size.X - 10, V14.ViewportSize.Y / 2 - Arg1.size.Y / 2), mouseHeld = false, storage = {}, storedText = {}, clickDetectors = {}, drawings = {}, cachedDrawings = {}, allDrawings = {}}, V16)
			do
				local Drawings = V2.drawings
				Drawings.base = Fn5("Square", {Visible = V2.active, Filled = true, Transparency = 1, Thickness = 1, Color = FromRGB(39, 39, 39), Position = V2.position, Size = V2.size, ZIndex = 8}, V2.allDrawings)
				Drawings.onDrag = Fn5("Square", {Visible = V2.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(86, 140, 255), Position = Drawings.base.Position, Size = New2(V2.size.X, 22), ZIndex = 0}, V2.allDrawings)
				Drawings.baseOutline = Fn5("Square", {Visible = V2.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = Drawings.base.Position - New2(1, 1), Size = Drawings.base.Size + New2(2, 2), ZIndex = 9}, V2.allDrawings)
				Drawings.title = Fn5("Text", {Visible = V2.active, Center = true, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V2.title, Color = FromRGB(255, 255, 255), OutlineColor = FromRGB(0, 0, 0), Position = Drawings.base.Position + New2(Drawings.base.Size.X / 2, 2), ZIndex = 9}, V2.allDrawings)
			end
			do
				local ClickDetectors = V2.clickDetectors
				V12.InputBegan:Connect(function(Arg1, _)
					if (Arg1.UserInputType ~= Enum2.UserInputType.MouseButton1) then
						return
					end
					V2.mouseHeld = true
					local MouseLocation = V12:GetMouseLocation()
					for Index = 1, #ClickDetectors do
						ClickDetectors[Index](MouseLocation)
					end
				end)
				V12.InputEnded:Connect(function(Arg1, _)
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
					local V
					V = V13.RenderStepped:Connect(function()
						if (not V2.mouseHeld) then
							return V:Disconnect()
						end
						local V3 = V12:GetMouseLocation() - Arg1
						for Index = 1, #T2 do
							V2.allDrawings[Index].Position = T2[Index] + V3
						end
					end)
				end
				V2:onClick(V2.drawings.onDrag, Fn)
			end
			return V2
		end
		V17.new = function(Arg1)
			local V = 15
			local V2 = SetMetatable({active = Arg1.active or false, position = Arg1.position or V14.ViewportSize / 2 - New2(150, 100), mouseHeld = false, values = {}, clickDetectors = {}, drawings = {}, cachedDrawings = {}, allDrawings = {}}, V17)
			do
				local Drawings = V2.drawings
				Drawings.baseOutline = Fn5("RoundedSquare", {Visible = V2.active, Rounding = 6, Color = FromRGB(0, 0, 0), Position = V2.position, Size = New2(300, 100), ZIndex = 15}, V2.allDrawings)
				Drawings.base = Fn5("RoundedSquare", {Visible = V2.active, Rounding = 6, Color = FromRGB(33, 33, 33), Position = Drawings.baseOutline.Position + New2(1, 1), Size = Drawings.baseOutline.Size - New2(2, 2), ZIndex = 16}, V2.allDrawings)
				Drawings.name = Fn5("Text", {Visible = V2.active, Outline = true, OutlineColor = FromRGB(0, 0, 0), Color = FromRGB(255, 255, 255), Transparency = 1, Size = SIZE, Text = "TARGET_NAME", Font = FONT, Position = Drawings.base.Position + New2(10, 10), ZIndex = 17}, V2.allDrawings)
				Drawings.weapon = Fn5("Text", {Visible = V2.active, Outline = true, OutlineColor = FromRGB(0, 0, 0), Color = FromRGB(175, 175, 175), Transparency = 1, Size = SIZE, Text = "weapon: salvaged ak47", Font = FONT, Position = Drawings.name.Position + New2(0, 20), ZIndex = 17}, V2.allDrawings)
				Drawings.distance = Fn5("Text", {Visible = V2.active, Outline = true, OutlineColor = FromRGB(0, 0, 0), Color = FromRGB(175, 175, 175), Transparency = 1, Size = SIZE, Text = "distance: 200 studs", Font = FONT, Position = Drawings.weapon.Position + New2(0, 20), ZIndex = 17}, V2.allDrawings)
				Drawings.healthbar_outline = Fn5("RoundedSquare", {Visible = V2.active, Rounding = 4, Color = FromRGB(10, 10, 10), Position = Drawings.base.Position + New2(10, 80), Size = New2(Drawings.base.Size.X - 20, 8), ZIndex = 17}, V2.allDrawings)
				Drawings.healthbar = Fn5("RoundedSquare", {Visible = V2.active, Rounding = 2, Color = FromRGB(0, 255, 21), Position = Drawings.healthbar_outline.Position + New2(1, 1), Size = Drawings.healthbar_outline.Size - New2(2, 2), ZIndex = 18}, V2.allDrawings)
			end
			do
				local ClickDetectors = V2.clickDetectors
				V12.InputBegan:Connect(function(Arg1, _)
					if (Arg1.UserInputType ~= Enum2.UserInputType.MouseButton1) then
						return
					end
					V2.mouseHeld = true
					local MouseLocation = V12:GetMouseLocation()
					for Index = 1, #ClickDetectors do
						ClickDetectors[Index](MouseLocation)
					end
				end)
				V12.InputEnded:Connect(function(Arg1, _)
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
					local V
					V = V13.RenderStepped:Connect(function()
						if (not V2.mouseHeld) then
							return V:Disconnect()
						end
						local V3 = V12:GetMouseLocation() - Arg1
						for Index = 1, #T2 do
							V2.allDrawings[Index].Position = T2[Index] + V3
						end
					end)
				end
				V2:onClick(V2.drawings.base, Fn)
			end
			return V2
		end
		V18.new = function(Arg1)
			Assert(Type(Arg1) == "table", ("invalid argument #1 to 'windowClass.new' (table expected, got " .. tostring(Type(Arg1)) .. ")"))
			V18.index += 1
			local V = SetMetatable({baseZindex = 10, id = V18.index, active = true, title = Arg1.title or "Burmalda.hook", size = Arg1.size or New2(600, 500), position = V14.ViewportSize / 2, tabSettings = {index = 0, tabs = {}}, cachedImages = {}, clickDetectors = {}, keyDetectors = {}, keyEnd = {}, flags = {}, connectedToggles = {}, drawings = {}, allDrawings = {}, overlapDrawings = {}}, V18)
			do
				local Drawings = V.drawings
				Drawings.base = Fn5("Square", {Visible = V.active, Filled = true, Transparency = 1, Thickness = 1, Color = FromRGB(39, 39, 39), Position = V.position - V.size / 2, Size = V.size, ZIndex = V.baseZindex + 1}, V.allDrawings)
				Drawings.onDrag = Fn5("Square", {Visible = V.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(86, 140, 255), Position = Drawings.base.Position, Size = New2(V.size.X, 20), ZIndex = 0}, V.allDrawings)
				Drawings.baseOutline = Fn5("Square", {Visible = V.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = Drawings.base.Position - New2(1, 1), Size = Drawings.base.Size + New2(2, 2), ZIndex = V.baseZindex + 2}, V.allDrawings)
				Drawings.innerOutline = Fn5("Square", {Visible = V.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = Drawings.baseOutline.Position + New2(0, 20), Size = Drawings.base.Size + New2(2, 2) - New2(0, 20), ZIndex = V.baseZindex + 2}, V.allDrawings)
				Drawings.innerOutline2 = Fn5("Square", {Visible = V.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = Drawings.innerOutline.Position + New2(0, 40), Size = Drawings.innerOutline.Size - New2(0, 40), ZIndex = V.baseZindex + 2}, V.allDrawings)
				Drawings.sectionOutline1 = Fn5("Square", {Visible = V.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = Drawings.innerOutline2.Position + New2(16, 16), Size = Drawings.innerOutline2.Size - New2(Drawings.innerOutline2.Size.X / 2 + 24, 32), ZIndex = V.baseZindex + 2}, V.allDrawings)
				Drawings.sectionOutline2 = Fn5("Square", {Visible = V.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = Drawings.innerOutline2.Position + New2(Drawings.innerOutline2.Size.X / 2 + 8, 16), Size = Drawings.sectionOutline1.Size, ZIndex = V.baseZindex + 2}, V.allDrawings)
				Drawings.title = Fn5("Text", {Visible = V.active, Center = false, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V.title, Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = Drawings.base.Position + New2(2, 2), ZIndex = V.baseZindex + 2}, V.allDrawings)
			end
			do
				local ClickDetectors = V.clickDetectors
				local KeyDetectors = V.keyDetectors
				local KeyEnd = V.keyEnd
				V12.InputBegan:Connect(function(Arg1, Arg2)
					for Index = 1, #KeyDetectors do
						KeyDetectors[Index](Arg1, Arg2)
					end
					if (Arg1.KeyCode == Enum2.KeyCode.RightShift) then
						return V:toggle()
					elseif (Arg1.UserInputType ~= Enum2.UserInputType.MouseButton1) then
						return
					end
					V.mouseHeld = true
					local MouseLocation = V12:GetMouseLocation()
					for Index2 = 1, #ClickDetectors do
						ClickDetectors[Index2](MouseLocation)
					end
				end)
				V12.InputEnded:Connect(function(Arg1, Arg2)
					for Index = 1, #KeyEnd do
						KeyEnd[Index](Arg1, Arg2)
					end
					if (Arg1.UserInputType ~= Enum2.UserInputType.MouseButton1) then
						return
					end
					V.mouseHeld = false
				end)
				local Fn = function(Arg1)
					local T2 = {}
					for Index = 1, #V.allDrawings do
						T2[Index] = V.allDrawings[Index].Position
					end
					local V2
					V2 = V13.RenderStepped:Connect(function()
						if (not V.mouseHeld) then
							return V2:Disconnect()
						end
						local V3 = V12:GetMouseLocation() - Arg1
						for Index = 1, #T2 do
							V.allDrawings[Index].Position = T2[Index] + V3
						end
					end)
				end
				V:onClick(V.drawings.onDrag, Fn)
			end
			return V, V.flags
		end
		V19.new = function(Arg1, Arg2)
			Assert(Type(Arg1) == "table", ("invalid argument #1 to 'tabClass.new' (table expected, got " .. tostring(Type(Arg1)) .. ")"))
			Arg1.tabSettings.index += 1
			local V = SetMetatable({id = Arg1.tabSettings.index, active = Arg1.tabSettings.index == 1 and true or false, window = Arg1, name = Arg2 or ("tab" .. tostring(Arg1.tabSettings.index)), offsets = {10, 10}, drawings = {}, allDrawings = {}, toggleDrawings = {}}, V19)
			do
				local Drawings = V.drawings
				Drawings.outline = Fn5("Square", {Visible = Arg1.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), ZIndex = Arg1.baseZindex + 2}, Arg1.allDrawings)
				Drawings.text = Fn5("Text", {Visible = Arg1.active, Center = true, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V.name, Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), ZIndex = Arg1.baseZindex + 2}, Arg1.allDrawings)
			end
			V.onClicked = function()
				if (V.active) then
					return
				end
				local Tabs = V.window.tabSettings.tabs
				for Index = 1, #Tabs do
					local V2 = Tabs[Index]
					if (V2 ~= V) then
						V2:toggle(false)
					end
				end
				V:toggle(true)
			end
			V.window:onClick(V.drawings.outline, V.onClicked)
			V6(Arg1.tabSettings.tabs, V)
			V:toggle(V.active)
			Arg1:reloadTabs()
			return V
		end
		V20.new = function(Arg1, Arg2, Arg3)
			Assert(Type(Arg1) == "table", ("invalid argument #1 to 'toggleClass.new' (table expected, got " .. tostring(Type(Arg1)) .. ")"))
			Assert(Type(Arg2) == "table", ("invalid argument #2 to 'toggleClass.new' (table expected, got " .. tostring(Type(Arg2)) .. ")"))
			Assert(Type(Arg3) == "number", ("invalid argument #3 to 'toggleClass.new' (number expected, got " .. tostring(Type(Arg3)) .. ")"))
			Arg3 = Round(Clamp(Arg3, 1, 2))
			local V = SetMetatable({tab = Arg1, window = Arg1.window, text = Arg2.text or "Toggle", enabled = Arg2.default or false, risky = Arg2.risky or false, drawings = {}}, V20)
			do
				V.flag = {type = "toggle", value = V.enabled, funcs = {}, self = V}
				V.flag.Changed = function(...)
					local Funcs = V.flag.funcs
					for Index = 1, #Funcs do
						Funcs[Index](...)
					end
				end
				if (Arg2.flag) then
					V.flag.OnChanged = function(_, Arg2)
						V6(V.flag.funcs, Arg2)
						Arg2(V.flag.value)
					end
					V.window.flags[Arg2.flag] = V.flag
				end
			end
			do
				local Drawings = V.drawings
				Drawings.outline = Fn5("Square", {Visible = Arg1.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = V.window.drawings[("sectionOutline" .. tostring(Arg3))].Position + New2(15, Arg1.offsets[Arg3]), Size = New2(15, 15), ZIndex = V.window.baseZindex + 2}, V.window.allDrawings, Arg1.allDrawings)
				Drawings.accent = Fn5("Square", {Visible = Arg1.active, Filled = true, Transparency = V.enabled and 1 or 0, Thickness = 1, Color = FromRGB(255, 0, 0), Position = Drawings.outline.Position + New2(1, 1), Size = New2(13.5, 13), ZIndex = V.window.baseZindex + 2}, V.window.allDrawings, Arg1.allDrawings)
				Drawings.text = Fn5("Text", {Visible = Arg1.active, Center = false, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V.text, Color = V.risky and FromRGB(255, 199, 43) or FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = Drawings.outline.Position + New2(20, 1), ZIndex = V.window.baseZindex + 2}, V.window.allDrawings, Arg1.allDrawings)
				Drawings.clickDetector = Fn5("Square", {Visible = Arg1.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(86, 140, 255), Position = Drawings.outline.Position, Size = New2(22 + Drawings.text.TextBounds.X, 15), ZIndex = 0}, V.window.allDrawings, Arg1.allDrawings)
			end
			V.onClicked = function()
				local V2 = not V.enabled
				V.enabled = V2
				V.flag.value = V2
				V.flag.Changed(V2)
				V.drawings.accent.Transparency = V2 and 1 or 0
			end
			V.setValue = function(Arg1)
				V.enabled = Arg1
				V.flag.value = Arg1
				V.flag.Changed(Arg1)
				V.drawings.accent.Transparency = Arg1 and 1 or 0
			end
			V.window:onClick(V.drawings.clickDetector, function()
				V:onClicked()
			end)
			Arg1.offsets[Arg3] += 20
			return V
		end
		V21.new = function(Arg1, Arg2, Arg3)
			Assert(Type(Arg1) == "table", ("invalid argument #1 to 'sliderClass.new' (table expected, got " .. tostring(Type(Arg1)) .. ")"))
			Assert(Type(Arg2) == "table", ("invalid argument #2 to 'sliderClass.new' (table expected, got " .. tostring(Type(Arg2)) .. ")"))
			Assert(Type(Arg3) == "number", ("invalid argument #3 to 'sliderClass.new' (number expected, got " .. tostring(Type(Arg3)) .. ")"))
			local V = SetMetatable({tab = Arg1, window = Arg1.window, text = Arg2.text, value = Arg2.default or Arg2.min, max = Arg2.max, min = Arg2.min, increment = Arg2.increment or 1, suffix = Arg2.suffix or "", drawings = {}}, V21)
			V.range = V.max - V.min
			local V2 = V11(V.increment)
			local V5 = V9(V2, ".", 1, true)
			if (V5) then
				V.maxIndex = #V2 - V5
			end
			do
				V.flag = {type = "slider", value = V.value, self = V}
				V.flag.Changed = function(...)
				end
				if (Arg2.flag) then
					V.flag.OnChanged = function(_, Arg2)
						V.flag.Changed = Arg2
						Arg2(V.flag.value)
					end
					V.window.flags[Arg2.flag] = V.flag
				end
			end
			do
				local Drawings = V.drawings
				Drawings.outline = Fn5("Square", {Visible = Arg1.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = V.window.drawings[("sectionOutline" .. tostring(Arg3))].Position + New2(15, Arg1.offsets[Arg3] + 15), Size = New2(V.window.drawings.sectionOutline1.Size.X - 30, 15), ZIndex = V.window.baseZindex + 2}, V.window.allDrawings, Arg1.allDrawings)
				Drawings.accent = Fn5("Square", {Visible = Arg1.active, Filled = true, Transparency = 1, Thickness = 1, Color = FromRGB(255, 0, 0), Position = Drawings.outline.Position + New2(1, 1), Size = New2((Drawings.outline.Size.X - 2) * (V.value - V.min) / V.range, Drawings.outline.Size.Y - 2), ZIndex = V.window.baseZindex + 2}, V.window.allDrawings, Arg1.allDrawings)
				Drawings.text = Fn5("Text", {Visible = Arg1.active, Center = false, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V.text, Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = Drawings.outline.Position + New2(1, -15), ZIndex = V.window.baseZindex + 2}, V.window.allDrawings, Arg1.allDrawings)
				Drawings.value = Fn5("Text", {Visible = Arg1.active, Center = true, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V.value .. V.suffix, Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = Drawings.outline.Position + New2(Drawings.outline.Size.X / 2, 1), ZIndex = V.window.baseZindex + 3}, V.window.allDrawings, Arg1.allDrawings)
			end
			V.onClicked = function()
				local X = V.drawings.outline.Position.X
				local X2 = V.drawings.outline.Size.X
				local V2
				V2 = V13.RenderStepped:Connect(function()
					if (not V.window.mouseHeld) then
						return V2:Disconnect()
					end
					local V5 = V12:GetMouseLocation().X - X
					local V6 = V3(V5 / X2, 0, 1)
					V.value = V4(V.range * V6 / V.increment) * V.increment + V.min
					V.flag.value = V.value
					V.flag.Changed(V.value)
					V.drawings.accent.Size = New2((V.drawings.outline.Size.X - 2) * (V.value - V.min) / V.range, V.drawings.accent.Size.Y)
					local Value = V.value
					if (V.maxIndex) then
						Value = V11(Value)
						local V7 = V9(V11(Value), ".", 1, true)
						if (V7) then
							Value = V10(V11(Value), 1, V.maxIndex + V7)
						end
					end
					V.drawings.value.Text = Value .. V.suffix
				end)
			end
			V.setValue = function(Arg1)
				V.value = Arg1
				V.flag.value = V.value
				V.flag.Changed(V.value)
				V.drawings.accent.Size = New2((V.drawings.outline.Size.X - 2) * (V.value - V.min) / V.range, V.drawings.accent.Size.Y)
				V.drawings.value.Text = V.value .. V.suffix
			end
			V.window:onClick(V.drawings.outline, V.onClicked)
			Arg1.offsets[Arg3] += 35
			return V
		end
		V22.new = function(Arg1, Arg2, Arg3)
			Assert(Type(Arg1) == "table", ("invalid argument #1 to 'dropdownClass.new' (table expected, got " .. tostring(Type(Arg1)) .. ")"))
			Assert(Type(Arg2) == "table", ("invalid argument #2 to 'dropdownClass.new' (table expected, got " .. tostring(Type(Arg2)) .. ")"))
			Assert(Type(Arg3) == "number", ("invalid argument #3 to 'dropdownClass.new' (number expected, got " .. tostring(Type(Arg3)) .. ")"))
			local V = SetMetatable({tab = Arg1, window = Arg1.window, text = Arg2.text, options = Arg2.options, value = Arg2.default or Arg2.options[1] or "None", drawings = {}}, V22)
			do
				V.flag = {type = "dropdown", value = V.value, self = V}
				V.flag.Changed = function(...)
				end
				if (Arg2.flag) then
					V.flag.OnChanged = function(_, Arg2)
						V.flag.Changed = Arg2
						Arg2(V.flag.value)
					end
					V.window.flags[Arg2.flag] = V.flag
				end
			end
			do
				local Drawings = V.drawings
				Drawings.outline = Fn5("Square", {Visible = Arg1.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = V.window.drawings[("sectionOutline" .. tostring(Arg3))].Position + New2(15, Arg1.offsets[Arg3] + 15), Size = New2(V.window.drawings.sectionOutline1.Size.X - 30, 15), ZIndex = V.window.baseZindex + 2}, V.window.allDrawings, Arg1.allDrawings)
				Drawings.text = Fn5("Text", {Visible = Arg1.active, Center = false, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V.text, Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = Drawings.outline.Position + New2(1, -15), ZIndex = V.window.baseZindex + 2}, V.window.allDrawings, Arg1.allDrawings)
				Drawings.value = Fn5("Text", {Visible = Arg1.active, Center = true, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V.value, Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = Drawings.outline.Position + New2(Drawings.outline.Size.X / 2, 1), ZIndex = V.window.baseZindex + 2}, V.window.allDrawings, Arg1.allDrawings)
				Drawings.rightText = Fn5("Text", {Visible = Arg1.active, Center = true, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = ">", Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = New2(Drawings.outline.Position.X + Drawings.outline.Size.X - 10, Drawings.value.Position.Y), ZIndex = V.window.baseZindex + 2}, V.window.allDrawings, Arg1.allDrawings)
				Drawings.leftText = Fn5("Text", {Visible = Arg1.active, Center = true, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = "<", Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = New2(Drawings.outline.Position.X + 10, Drawings.value.Position.Y), ZIndex = V.window.baseZindex + 2}, V.window.allDrawings, Arg1.allDrawings)
				Drawings.rightClick = Fn5("Square", {Visible = Arg1.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(86, 140, 255), Position = Drawings.rightText.Position - New2(Drawings.rightText.TextBounds.X / 2 + 2, 0), Size = New2(13, 13), ZIndex = 0}, V.window.allDrawings, Arg1.allDrawings)
				Drawings.leftClick = Fn5("Square", {Visible = Arg1.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(86, 140, 255), Position = Drawings.leftText.Position - New2(Drawings.leftText.TextBounds.X / 2 + 2, 0), Size = New2(13, 13), ZIndex = 0}, V.window.allDrawings, Arg1.allDrawings)
			end
			local Fn = function()
				local V2 = V7(V.options, V.value) or 0
				local V3 = V.options[V2 + 1]
				if (V3 == nil) then
					V3 = V.options[1] or "None"
				end
				V.value = V3
				V.drawings.value.Text = V3
				V.flag.value = V.value
				V.flag.Changed(V.value)
			end
			local Fn2 = function()
				local V2 = V7(V.options, V.value) or 2
				local V3 = V.options[V2 - 1]
				if (V3 == nil) then
					V3 = V.options[#V.options] or "None"
				end
				V.value = V3
				V.drawings.value.Text = V3
				V.flag.value = V.value
				V.flag.Changed(V.value)
			end
			V.setValue = function(Arg1)
				V.value = Arg1
				V.drawings.value.Text = Arg1
				V.flag.value = V.value
				V.flag.Changed(V.value)
			end
			V.window:onClick(V.drawings.rightClick, Fn)
			V.window:onClick(V.drawings.leftClick, Fn2)
			Arg1.offsets[Arg3] += 35
			return V
		end
		V23.new = function(Arg1, Arg2, Arg3, Arg4)
			Assert(Type(Arg1) == "table", ("invalid argument #1 to 'buttonClass.new' (table expected, got " .. tostring(Type(Arg1)) .. ")"))
			Assert(Type(Arg3) == "function", ("invalid argument #2 to 'buttonClass.new' (function expected, got " .. tostring(Type(Arg3)) .. ")"))
			Assert(Type(Arg4) == "number", ("invalid argument #3 to 'buttonClass.new' (number expected, got " .. tostring(Type(Arg4)) .. ")"))
			local V = SetMetatable({tab = Arg1, window = Arg1.window, text = Arg2, drawings = {}}, V23)
			do
				local Drawings = V.drawings
				Drawings.outline = Fn5("Square", {Visible = Arg1.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(7, 7, 7), Position = V.window.drawings[("sectionOutline" .. tostring(Arg4))].Position + New2(15, Arg1.offsets[Arg4]), Size = New2(V.window.drawings.sectionOutline1.Size.X - 30, 15), ZIndex = V.window.baseZindex + 2}, V.window.allDrawings, Arg1.allDrawings)
				Drawings.text = Fn5("Text", {Visible = Arg1.active, Center = true, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = V.text, Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), Position = Drawings.outline.Position + New2(Drawings.outline.Size.X / 2, 1), ZIndex = V.window.baseZindex + 3}, V.window.allDrawings, Arg1.allDrawings)
			end
			local Fn = function()
				V.drawings.text.Color = FromRGB(255, 255, 255)
				Delay(0.3, function()
					V.drawings.text.Color = FromRGB(195, 195, 195)
				end)
				Arg3()
			end
			V.window:onClick(V.drawings.outline, Fn)
			Arg1.offsets[Arg4] += 20
			return V
		end
		V24.new = function(Arg1, Arg2)
			Assert(Type(Arg1) == "table", ("invalid argument #1 to 'keypickerClass.new' (table expected, got " .. tostring(Type(Arg1)) .. ")"))
			Assert(Type(Arg2) == "table", ("invalid argument #2 to 'keypickerClass.new' (table expected, got " .. tostring(Type(Arg2)) .. ")"))
			Fn2()
			local V = SetMetatable({tab = Arg1.tab, toggle = Arg1, window = Arg1.window, active = false, value = T3[Arg2.default] or Arg2.default or "None", blacklisted = Arg2.blacklisted or {}, mode = Arg2.mode or "toggle", drawings = {}}, V24)
			do
				V.flag = {type = "keypicker", key = V.value, value = false, self = V}
				V.flag.KeyChanged = function(...)
				end
				V.flag.Changed = function(...)
				end
				if (Arg2.flag) then
					V.flag.OnChanged = function(_, Arg2)
						V.flag.Changed = Arg2
						Arg2(V.flag.value)
					end
					V.flag.OnKeyChanged = function(_, Arg2)
						V.flag.KeyChanged = Arg2
						Arg2(V.flag.key)
					end
					V.window.flags[Arg2.flag] = V.flag
				end
			end
			do
				local Drawings = V.drawings
				Drawings.text = Fn5("Text", {Visible = V.tab.active, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = "[ loading ]", Color = FromRGB(195, 195, 195), OutlineColor = FromRGB(0, 0, 0), ZIndex = V.window.baseZindex + 3}, V.window.allDrawings, V.tab.allDrawings)
				Drawings.clickDetector = Fn5("Square", {Visible = V.tab.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(86, 140, 255), Position = nil, Size = nil, ZIndex = 0}, V.window.allDrawings, V.tab.allDrawings)
			end
			local Fn = function(Arg1)
				if (V12:GetFocusedTextBox()) then
					return
				elseif (V.active) then
					local Name = Arg1.KeyCode.Name
					if (Name == "Unknown") then
						Name = Arg1.UserInputType.Name
						if (Name ~= "MouseButton2") then
							return
						end
					end
					for _, Value in V.blacklisted do
						if (Value == Name) then
							return
						end
					end
					V.active = false
					V.value = T3[Name] or Name
					V.flag.key = V.value
					V.flag.KeyChanged(V.value)
					V:update()
					return
				elseif (V.value == "None") then
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
				if (V.value == Name2) then
					local V2 = V.mode ~= "toggle" and true or not V.flag.value
					V.flag.value = V2
					V.flag.Changed(V2)
				end
			end
			local Fn3 = function(Arg1)
				if (V.active or V.value == "None" or V.mode == "toggle") then
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
				if (V.value == Name) then
					V.flag.value = false
					V.flag.Changed(false)
				end
			end
			local Fn4 = function()
				V.flag.value = false
				V.flag.Changed(false)
				if (V.active) then
					V.active = false
					V.value = "None"
					V.flag.key = "None"
					V.flag.KeyChanged(V.value)
					V:update()
					return
				end
				V.active = true
				V.value = "..."
				V:update()
			end
			V.window:onClick(V.drawings.clickDetector, Fn4)
			V.window:addKeyDetector(Fn)
			V.window:addKeyEnd(Fn3)
			V:update()
			V.setValue = function(Arg1, Arg2)
				V.value = Arg2
				V.flag.value = Arg1
				V.flag.key = Arg2
				V.flag.Changed(Arg1)
				V.flag.KeyChanged(Arg2)
				V:update()
			end
			return V
		end
		V25.new = function(Arg1, Arg2)
			Assert(Type(Arg1) == "table", ("invalid argument #1 to 'keypickerClass.new' (table expected, got " .. tostring(Type(Arg1)) .. ")"))
			Assert(Type(Arg2) == "table", ("invalid argument #2 to 'keypickerClass.new' (table expected, got " .. tostring(Type(Arg2)) .. ")"))
			local V = SetMetatable({tab = Arg1.tab, toggle = Arg1, window = Arg1.window, value = Arg2.default or FromRGB(255, 255, 255), drawings = {}, onToggle = {}}, V25)
			V.h, V.s, V.v = V.value:ToHSV()
			do
				V.flag = {type = "colourpicker", value = V.value, self = V}
				V.flag.Changed = function(...)
				end
				if (Arg2.flag) then
					V.flag.OnChanged = function(_, Arg2)
						V.flag.Changed = Arg2
						Arg2(V.flag.value)
					end
					V.window.flags[Arg2.flag] = V.flag
				end
			end
			do
				local Drawings = V.drawings
				Drawings.colour_fill = Fn5("Square", {Visible = V.tab.active, Filled = true, Transparency = 1, Thickness = 1, Color = V.value, Position = V.toggle.drawings.outline.Position + New2(V.window.drawings.sectionOutline1.Size.X - 60, 0), Size = New2(30, 15), ZIndex = V.window.baseZindex + 2}, Arg1.window.allDrawings, V.tab.allDrawings)
				Drawings.colour_outline = Fn5("Square", {Visible = V.tab.active, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(0, 0, 0), Position = Drawings.colour_fill.Position, Size = Drawings.colour_fill.Size, ZIndex = V.window.baseZindex + 3}, Arg1.window.allDrawings, V.tab.allDrawings)
				Drawings.background_fill = Fn5("Square", {Visible = false, Filled = true, Transparency = 1, Thickness = 1, Color = FromRGB(39, 39, 39), Position = Drawings.colour_outline.Position + New2(0, 20), Size = New2(150, 150), ZIndex = V.window.baseZindex + 4}, Arg1.window.allDrawings, V.onToggle, V.tab.toggleDrawings)
				Drawings.background_outline = Fn5("Square", {Visible = false, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(0, 0, 0), Position = Drawings.background_fill.Position, Size = Drawings.background_fill.Size, ZIndex = V.window.baseZindex + 5}, Arg1.window.allDrawings, V.window.overlapDrawings, V.onToggle, V.tab.toggleDrawings)
				Drawings.colourpicker_fill = Fn5("Square", {Visible = false, Filled = true, Transparency = 1, Thickness = 1, Color = FromHSV(V.h, 1, 1), Position = Drawings.background_fill.Position + New2(5, 5), Size = New2(125, 125), ZIndex = V.window.baseZindex + 5}, Arg1.window.allDrawings, V.onToggle, V.tab.toggleDrawings)
				if (not V.window.cachedImages.cp_overlay) then
					local V2 = Fn5("Image", {Visible = false, Transparency = 1, Data = Fn3("overlay"), Position = Drawings.background_fill.Position + New2(5, 5), Size = New2(125, 125), ZIndex = V.window.baseZindex + 6}, Arg1.window.allDrawings)
					V.window.cachedImages.cp_overlay = {toggle = true, drawing = V2}
				end
				Drawings.colourpicker_outline = Fn5("Square", {Visible = false, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(1, 1, 1), Position = Drawings.colourpicker_fill.Position, Size = Drawings.colourpicker_fill.Size, ZIndex = V.window.baseZindex + 7}, Arg1.window.allDrawings, V.onToggle, V.tab.toggleDrawings)
				if (not V.window.cachedImages.cp_overlay) then
					local V6 = Fn5("Image", {Visible = false, Transparency = 1, Data = Fn3("overlay"), Position = Drawings.background_fill.Position + New2(5, 5), Size = New2(125, 125), ZIndex = V.window.baseZindex + 6}, Arg1.window.allDrawings)
					V.window.cachedImages.cp_overlay = {toggle = true, drawing = V6}
				end
				if (not V.window.cachedImages.cp_huefill) then
					local V7 = Fn5("Image", {Visible = false, Transparency = 1, Data = Fn3("hue"), Position = Drawings.colourpicker_fill.Position + New2(Drawings.colourpicker_fill.Size.X + 5, 0), Size = New2(10, Drawings.colourpicker_fill.Size.Y), ZIndex = V.window.baseZindex + 5}, Arg1.window.allDrawings)
					V.window.cachedImages.cp_huefill = {toggle = true, drawing = V7}
				end
				Drawings.hue_outline = Fn5("Square", {Visible = false, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(0, 0, 0), Position = Drawings.colourpicker_fill.Position + New2(Drawings.colourpicker_fill.Size.X + 5, 0), Size = New2(10, Drawings.colourpicker_fill.Size.Y), ZIndex = V.window.baseZindex + 6}, Arg1.window.allDrawings, V.onToggle, V.tab.toggleDrawings)
				Drawings.huepicker = Fn5("Square", {Visible = false, Filled = true, Transparency = 1, Thickness = 1, Color = FromRGB(255, 255, 255), Size = New2(14, 6), ZIndex = V.window.baseZindex + 7}, Arg1.window.allDrawings, V.onToggle, V.tab.toggleDrawings)
				Drawings.huepicker_outline = Fn5("Square", {Visible = false, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(0, 0, 0), Size = Drawings.huepicker.Size, ZIndex = V.window.baseZindex + 8}, Arg1.window.allDrawings, V.onToggle, V.tab.toggleDrawings)
				Drawings.colourpick = Fn5("Square", {Visible = false, Filled = true, Transparency = 1, Thickness = 1, Color = FromRGB(255, 255, 255), Size = New2(6, 6), ZIndex = V.window.baseZindex + 7}, Arg1.window.allDrawings, V.onToggle, V.tab.toggleDrawings)
				Drawings.colourpick_outline = Fn5("Square", {Visible = false, Filled = false, Transparency = 1, Thickness = 1, Color = FromRGB(0, 0, 0), Size = Drawings.colourpick.Size, ZIndex = V.window.baseZindex + 8}, Arg1.window.allDrawings, V.onToggle, V.tab.toggleDrawings)
			end
			V.setValue = function(Arg1)
				V.value = Arg1
				V.flag.value = Arg1
				V.flag.Changed(Arg1)
				V:update()
			end
			local Fn = function()
				local V2 = not V.drawings.background_fill.Visible
				local ToggleDrawings = V.tab.toggleDrawings
				local OnToggle = V.onToggle
				for _, Value in V.window.cachedImages do
					if (Value.toggle) then
						Value.drawing.Visible = false
					end
				end
				for Index = 1, #ToggleDrawings do
					ToggleDrawings[Index].Visible = false
				end
				for Index2 = 1, #OnToggle do
					OnToggle[Index2].Visible = V2
				end
				if (V2) then
					local Drawing3 = V.window.cachedImages.cp_huefill.drawing
					local Drawing4 = V.window.cachedImages.cp_overlay.drawing
					Drawing3.Position = V.drawings.colourpicker_fill.Position + New2(V.drawings.colourpicker_fill.Size.X + 5, 0)
					Drawing4.Position = V.drawings.background_fill.Position + New2(5, 5)
					Drawing3.Visible = true
					Drawing4.Visible = true
				end
			end
			local Fn2 = function()
				local Hue_outline = V.drawings.hue_outline
				local Y = Hue_outline.Position.Y
				local Y2 = Hue_outline.Size.Y
				local V2
				V2 = V13.RenderStepped:Connect(function()
					if (not V.window.mouseHeld) then
						return V2:Disconnect()
					end
					local V5 = V3((V12:GetMouseLocation().Y - Y) / Y2, 0, 1)
					V.h = V5
					local Drawings = V.drawings
					local Hue_outline = Drawings.hue_outline
					Drawings.huepicker.Position = Hue_outline.Position + New2(-2, V4((Y2 - 6) * V5))
					Drawings.huepicker_outline.Position = Drawings.huepicker.Position
					V:updateHue()
				end)
			end
			local Fn4 = function()
				local Drawings = V.drawings
				local Colourpicker_outline = Drawings.colourpicker_outline
				local Size = Colourpicker_outline.Size
				local Position = Colourpicker_outline.Position
				local V2 = Colourpicker_outline.Size - New2(6, 6)
				local V6
				V6 = V13.RenderStepped:Connect(function()
					if (not V.window.mouseHeld) then
						return V6:Disconnect()
					end
					local V7 = (V12:GetMouseLocation() - Position) / Size
					V.s, V.v = V3(V7.X, 0, 1), V5(V3(V7.Y, 0, 1) - 1)
					local V8 = Colourpicker_outline.Position + New2(V2.X * V.s, V2.Y * V5(V.v - 1))
					V8 = New2(V4(V8.X), V4(V8.Y))
					Drawings.colourpick.Position = V8
					Drawings.colourpick_outline.Position = V8
					V:update_SaturationValue()
				end)
			end
			V.window:onClick(V.drawings.colour_outline, Fn)
			V.window:onClick(V.drawings.hue_outline, Fn2, nil, true)
			V.window:onClick(V.drawings.colourpicker_outline, Fn4, nil, true)
			V:update()
			return V
		end
		do
			V15.moveTo = function(Arg1, Arg2, Arg3)
				if (Arg1.move_connection) then
					Arg1.move_connection:Disconnect()
					Arg1.move_connection = nil
				end
				local Drawings = Arg1.drawings
				local Position = Drawings.background.Position
				local V = Arg2 - Position
				local T2 = {}
				for Key, Drawing3 in Drawings do
					T2[Key] = Drawing3.Position
				end
				local V2 = 0
				Arg1.move_connection = V13.RenderStepped:Connect(function(Arg1_2)
					V2 += Arg1_2
					if (V2 >= Arg3) then
						for Key, Value in T2 do
							Drawings[Key].Position = Value + V
						end
						Arg1.move_connection:Disconnect()
						Arg1.move_connection = nil
						return
					end
					local V3 = V2 / Arg3
					for Key2, Value2 in T2 do
						Drawings[Key2].Position = Value2 + V * V3
					end
				end)
			end
			V15.remove = function(Arg1)
				local Notifications = Arg1.window.notifications
				local Drawings = Arg1.drawings
				local V = Arg1.offset + 10
				local V2 = V7(Notifications, Arg1)
				V8(Notifications, V2)
				Arg1:moveTo(New2(10, -V), 0.05)
				local V3 = 0
				Arg1.connection = V13.RenderStepped:Connect(function(Arg1_2)
					V3 += Arg1_2
					if (V3 >= 0.05) then
						for _, Drawing3 in Drawings do
							Drawing3:Remove()
						end
						Arg1.connection:Disconnect()
						return
					end
				end)
				for Index = 1, #Notifications do
					if (Index < V2) then
						continue
					end
					local V4 = Notifications[Index]
					V4.goalPos -= New2(0, V)
					V4:moveTo(V4.goalPos, 0.05)
				end
			end
		end
		do
			V16.toggle = function(Arg1, Arg2)
				if (Arg2 == nil) then
					Arg2 = not Arg1.active
				end
				Arg1.active = Arg2
				Arg1.mouseHeld = false
				for Index = 1, #Arg1.allDrawings do
					Arg1.allDrawings[Index].Visible = Arg2
				end
				if (Arg2) then
					for _, Value in Arg1.storedText do
						Value.drawing.Visible = Value.shown
					end
				end
			end
			V16.isWithin = function(_, Arg2, Arg3)
				local Size = Arg2.Size
				local V = Arg3 - Arg2.Position
				return (V.X > 0 and V.Y > 0 and V.X < Size.X and V.Y < Size.Y)
			end
			V16.onClick = function(Arg1, Arg2, Arg3)
				local Fn = function(Arg1_2)
					if (Arg2.Visible and Arg1:isWithin(Arg2, Arg1_2)) then
						return Arg3(Arg1_2)
					end
				end
				V6(Arg1.clickDetectors, Fn)
			end
			V16.getScale = function(Arg1)
				return Arg1.drawings.base.Position / V14.ViewportSize
			end
			V16.setScale = function(Arg1, Arg2)
				local V = Arg2 * V14.ViewportSize
				local V2 = V - Arg1.drawings.base.Position
				Arg1.mouseHeld = false
				for Index = 1, #Arg1.allDrawings do
					Arg1.allDrawings[Index].Position += V2
				end
			end
			V16.addText = function(Arg1, Arg2, Arg3, Arg4, Arg5)
				local T2 = {side = Arg2, text = Arg3, shown = Arg5 == nil and true or Arg5, colour = Arg4, drawing = Arg1.cachedDrawings[1]}
				if (not T2.drawing) then
					T2.drawing = Fn5("Text", {Visible = (Arg1.active and T2.shown) or false, Center = false, Outline = true, Transparency = 1, Size = SIZE, Font = FONT, Text = T2.text, Color = T2.colour, OutlineColor = FromRGB(0, 0, 0), ZIndex = 9}, Arg1.allDrawings)
				else
					V8(Arg1.cachedDrawings, 1)
					T2.drawing.Visible = (Arg1.active and T2.shown) or false
					T2.drawing.Color = T2.colour
					T2.drawing.Text = T2.text
				end
				local V = 0
				for Index = 1, #Arg1.storedText do
					if (Arg1.storedText[Index].side == T2.side and T2.shown) then
						V += 1
					end
				end
				T2.drawing.Position = Arg1.drawings.base.Position + New2(Arg2 == "left" and 2 or Arg1.drawings.base.Size.X - T2.drawing.TextBounds.X - 2, V * 20 + 27)
				V6(Arg1.storedText, T2)
				return T2
			end
			V16.removeText = function(Arg1, Arg2, Arg3)
				local V = false
				local V2 = 0
				for Key, Value in Arg1.storedText do
					if (Value.side ~= Arg2) then
						continue
					elseif (V) then
						Arg1.mouseHeld = false
						Value.drawing.Position = Arg1.drawings.base.Position + New2(Arg2 == "left" and 2 or Arg1.drawings.base.Size.X - Value.drawing.TextBounds.X - 2, (V2 - 1) * 20 + 27)
					elseif (Value.text == Arg3) then
						V = true
						Value.drawing.Visible = false
						V6(Arg1.cachedDrawings, Value.drawing)
						V8(Arg1.storedText, Key)
					end
					V2 += 1
				end
			end
			V16.update = function(Arg1)
				local V = 0
				local V2 = 0
				for _, Value in Arg1.storedText do
					local Drawing3 = Value.drawing
					local Side = Value.side
					Drawing3.Visible = Arg1.active and Value.shown
					if not (Value.text == Drawing3.Text and Value.colour == Drawing3.Color) then
						Drawing3.Text = Value.text
						Drawing3.Color = Value.colour
					end
					if (Value.shown) then
						Value.drawing.Position = Arg1.drawings.base.Position + New2(Side == "left" and 2 or Arg1.drawings.base.Size.X - Value.drawing.TextBounds.X - 2, (Side == "left" and V or V2) * 20 + 27)
						if (Value.side == "left") then
							V += 1
						else
							V2 += 1
						end
					end
				end
				local V3 = 27 + Max(V, V2) * 20
				local X = Arg1.drawings.base.Size.X
				Arg1.drawings.base.Size = New2(X, V3)
				Arg1.drawings.baseOutline.Size = New2(X + 2, V3 + 2)
			end
			V16.findText = function(Arg1, Arg2, Arg3)
				for _, Value in Arg1.storedText do
					if (Value.text == Arg3 and Value.side == Arg2) then
						return Value
					end
				end
			end
		end
		do
			V17.toggle = function(Arg1, Arg2)
				if (Arg1.active == Arg2 or Type(Arg2) ~= "boolean") then
					return
				end
				Arg1.active = Arg2
				Arg1.mouseHeld = false
				for Index = 1, #Arg1.allDrawings do
					Arg1.allDrawings[Index].Visible = Arg2
				end
			end
			V17.isWithin = function(_, Arg2, Arg3)
				local Size = Arg2.Size
				local V = Arg3 - Arg2.Position
				return (V.X > 0 and V.Y > 0 and V.X < Size.X and V.Y < Size.Y)
			end
			V17.onClick = function(Arg1, Arg2, Arg3)
				local Fn = function(Arg1_2)
					if (Arg2.Visible and Arg1:isWithin(Arg2, Arg1_2)) then
						return Arg3(Arg1_2)
					end
				end
				V6(Arg1.clickDetectors, Fn)
			end
			V17.getScale = function(Arg1)
				return Arg1.drawings.base.Position / V14.ViewportSize
			end
			V17.setScale = function(Arg1, Arg2)
				local V = Arg2 * V14.ViewportSize
				local V2 = V - Arg1.drawings.base.Position
				Arg1.mouseHeld = false
				for Index = 1, #Arg1.allDrawings do
					Arg1.allDrawings[Index].Position += V2
				end
			end
			V17.setName = function(Arg1, Arg2)
				if (Arg2 and Arg1.values.name ~= Arg2) then
					Arg1.drawings.name.Text = Arg2
				end
			end
			V17.setDistance = function(Arg1, Arg2)
				if (Arg2 and Arg1.values.distance ~= Arg2) then
					Arg1.drawings.distance.Text = ("distance: " .. tostring(Arg2) .. " studs")
				end
			end
			V17.setWeapon = function(Arg1, Arg2)
				if (Arg2 and Arg1.values.weapon ~= Arg2) then
					Arg1.drawings.weapon.Text = ("weapon: " .. tostring(Arg2))
				end
			end
			V17.setHealth = function(Arg1, Arg2, Arg3)
				if (not Arg2 or not Arg3 or Arg1.values.health == Arg2 or Arg1.values.maxHealth == Arg3) then
					return
				end
				local V = 278
				local V2 = Arg2 / Arg3
				local V3 = FromRGB(255, 0, 0):Lerp(FromRGB(0, 255, 0), V2)
				Arg1.drawings.healthbar.Size = New2(Max(278 * V2, 0), 6)
				Arg1.drawings.healthbar.Color = V3
			end
		end
		do
			V18.addTab = function(Arg1, Arg2)
				return V19.new(Arg1, Arg2)
			end
			V18.reloadTabs = function(Arg1)
				local Tabs = Arg1.tabSettings.tabs
				for Index = 1, #Tabs do
					Tabs[Index]:reload()
				end
			end
			V18.isWithin = function(_, Arg2, Arg3)
				local Size = Arg2.Size
				local V = Arg3 - Arg2.Position
				return (V.X > 0 and V.Y > 0 and V.X < Size.X and V.Y < Size.Y)
			end
			V18.onClick = function(Arg1, Arg2, Arg3, Arg4, Arg5)
				Arg4 = Arg4 or function(...)
				end
				local Fn = function(Arg1_2)
					if not (Arg2.Visible and Arg1:isWithin(Arg2, Arg1_2)) then
						return Arg4(Arg1_2)
					elseif (Arg5) then
						return Arg3(Arg1_2)
					end
					for Index = 1, #Arg1.overlapDrawings do
						local V = Arg1.overlapDrawings[Index]
						if (V.Visible and Arg1:isWithin(V, Arg1_2)) then
							return Arg4(Arg1_2)
						end
					end
					return Arg3(Arg1_2)
				end
				V6(Arg1.clickDetectors, Fn)
			end
			V18.toggle = function(Arg1)
				local V = not Arg1.active
				Arg1.active = V
				for Index = 1, #Arg1.connectedToggles do
					Spawn(Arg1.connectedToggles[Index], V)
				end
				local V2 = V and New2(99999, 99999) or New2(-99999, -99999)
				for Index2 = 1, #Arg1.allDrawings do
					Arg1.allDrawings[Index2].Position += V2
				end
			end
			V18.onToggle = function(Arg1, Arg2)
				V6(Arg1.connectedToggles, Arg2)
			end
			V18.addKeyDetector = function(Arg1, Arg2)
				V6(Arg1.keyDetectors, Arg2)
			end
			V18.addKeyEnd = function(Arg1, Arg2)
				V6(Arg1.keyEnd, Arg2)
			end
			V18.notify = function(Arg1, Arg2, Arg3)
				return V15.new(Arg1, Arg2, Arg3)
			end
		end
		do
			V19.reload = function(Arg1)
				local Window = Arg1.window
				local Index = Window.tabSettings.index
				local X = Window.drawings.innerOutline.Size.X
				local V = Ceil(X / Index)
				local V2 = V * (Arg1.id - 1)
				Arg1.drawings.outline.Position = Window.drawings.innerOutline.Position + New2(V2, 0)
				if (Arg1.id == Index) then
					Arg1.drawings.outline.Size = New2((X - V * (Index - 1)), 41)
				else
					Arg1.drawings.outline.Size = New2(V + 1, 41)
				end
				Arg1.drawings.text.Position = Arg1.drawings.outline.Position + New2(Arg1.drawings.outline.Size.X / 2, 14)
			end
			V19.toggle = function(Arg1, Arg2)
				if (Arg2 == nil) then
					Arg2 = not Arg1.active
				end
				for _, Value in Arg1.window.cachedImages do
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
			V19.addToggle = function(Arg1, Arg2, Arg3)
				return V20.new(Arg1, Arg2, Arg3)
			end
			V19.addSlider = function(Arg1, Arg2, Arg3)
				return V21.new(Arg1, Arg2, Arg3)
			end
			V19.addDropdown = function(Arg1, Arg2, Arg3)
				return V22.new(Arg1, Arg2, Arg3)
			end
			V19.addButton = function(Arg1, Arg2, Arg3, Arg4)
				return V23.new(Arg1, Arg2, Arg3, Arg4)
			end
		end
		do
			V24.update = function(Arg1)
				local Drawings = Arg1.drawings
				local Text = Drawings.text
				local ClickDetector = Drawings.clickDetector
				Text.Text = ("[" .. tostring(Arg1.value) .. "]")
				local TextBounds = Text.TextBounds
				local V = Arg1.toggle.drawings.outline.Position + New2(Arg1.window.drawings.sectionOutline1.Size.X - 30 - TextBounds.X, 0)
				Text.Position = V
				ClickDetector.Size = TextBounds
				ClickDetector.Position = V
			end
		end
		do
			V25.update = function(Arg1)
				local Drawings = Arg1.drawings
				Arg1.h, Arg1.s, Arg1.v = Arg1.value:ToHSV()
				Drawings.colourpicker_fill.Color = FromHSV(Arg1.h, 1, 1)
				Drawings.colour_fill.Color = Arg1.value
				local Hue_outline = Drawings.hue_outline
				local Colourpicker_outline = Drawings.colourpicker_outline
				local V = Colourpicker_outline.Size - New2(6, 6)
				local V2 = Hue_outline.Size.Y - 6
				Drawings.huepicker.Position = Hue_outline.Position + New2(-2, V2 * Arg1.h)
				Drawings.huepicker_outline.Position = Drawings.huepicker.Position
				Drawings.colourpick.Position = Colourpicker_outline.Position + New2(V.X * Arg1.s, V.Y * V5(Arg1.v - 1))
				Drawings.colourpick_outline.Position = Drawings.colourpick.Position
			end
			V25.updateHue = function(Arg1)
				local Drawings = Arg1.drawings
				local V = FromHSV(Arg1.h, Arg1.s, Arg1.v)
				Drawings.colourpicker_fill.Color = FromHSV(Arg1.h, 1, 1)
				Drawings.colour_fill.Color = V
				Arg1.value = V
				Arg1.flag.value = V
				Arg1.flag.Changed(V)
			end
			V25.update_SaturationValue = function(Arg1)
				local V = FromHSV(Arg1.h, Arg1.s, Arg1.v)
				Arg1.drawings.colour_fill.Color = V
				Arg1.value = V
				Arg1.flag.value = V
				Arg1.flag.Changed(V)
			end
		end
		do
			V20.onClicked = function(Arg1)
				local V = not Arg1.enabled
				Arg1.enabled = V
				Arg1.flag.value = V
				Arg1.flag.Changed(V)
				Arg1.drawings.accent.Transparency = V and 1 or 0
			end
			V20.addKeypicker = function(Arg1, Arg2)
				return V24.new(Arg1, Arg2)
			end
			V20.addColourpicker = function(Arg1, Arg2)
				return V25.new(Arg1, Arg2)
			end
		end
		return {windowClass = V18, boardClass = V16, targethudClass = V17}
	end)()
end)()
local V35 = (function(...)
	local V = CloneRef or function(...)
		return ...
	end
	local V2 = CompareInstances or RawEqual
	local V3 = V(Game:GetService("RunService"))
	local V4 = V(Workspace.CurrentCamera)
	local V5 = (function(...)
		local New = Drawing2.new
		local V = Insert
		local Fn = (function(Arg1, Arg2, ...)
			local V2 = New(Arg1)
			for Key, Value in Arg2 do
				V2[Key] = Value
			end
			for _, Value2 in {...} do
				V(Value2, V2)
			end
			return V2
		end)
		return Fn
	end)()
	local Fn = function(Arg1, Arg2)
		if (Arg2) then
			return Arg1:ComputeR15BodyBoundingBox()
		end
		return Arg1:GetBoundingBox()
	end
	local Fn2 = function(Arg1)
		local V, V2 = V4:WorldToViewportPoint(Arg1)
		return Vector2_2.new(V.X, V.Y), V2, V.Z
	end
	local V6 = T[5]
	local FONT = V6.FONT
	local SIZE = V6.SIZE
	local V7 = 1
	local T2 = {}
	do
		local T3 = {playerCache = {}, drawingCache = {}, allDrawingCache = {}, childAddedConnections = {}, childRemovedConnections = {}, drawingAddedConnections = {}}
		T3.__index = T3
		T3.onChildAdded = function(Arg1)
			Insert(T3.childAddedConnections, Arg1)
		end
		T3.onChildRemoved = function(Arg1)
			Insert(T3.childRemovedConnections, Arg1)
		end
		T3.onDrawingAdded = function(Arg1)
			Insert(T3.drawingAddedConnections, Arg1)
		end
		T3.new = function(Arg1)
			local V = SetMetatable({player = Arg1, connections = {}, hidden = false, allDrawings = nil, drawings = nil, current = nil}, T3)
			local V2 = T3.drawingCache[1]
			if (V2) then
				Remove(T3.drawingCache, 1)
				V2.name.Text = Arg1.DisplayName
				V.allDrawings = V2.all
				V.drawings = V2
			else
				V:createDrawingCache()
			end
			for Index = 1, #T3.drawingAddedConnections do
				T3.drawingAddedConnections[Index](V)
			end
			Insert(V.connections, Arg1.CharacterAdded:Connect(function(...)
				return V:characterAdded(...)
			end))
			Insert(V.connections, Arg1.CharacterRemoving:Connect(function(...)
				return V:characterRemoved(...)
			end))
			if (Arg1.Character) then
				V:characterAdded(Arg1.Character, true)
			end
			T3.playerCache[Arg1] = V
			return V
		end
		T3.remove = function(Arg1)
			local V = T3.playerCache[Arg1]
			if (Type(V) ~= "table" or Type(V.drawings) ~= "table" or Type(V.connections) ~= "table") then
				return
			end
			T3.playerCache[Arg1] = nil
			for Index = 1, #V.connections do
				V.connections[Index]:Disconnect()
			end
			Insert(T3.drawingCache, V.drawings)
		end
		T3.createDrawingCache = function(Arg1)
			local T2 = {}
			local T3 = {box = V5("Square", {Visible = false, Thickness = 1, Color = Color3_2.new(1, 1, 1), Filled = false, ZIndex = 2}, T2), boxOutline = V5("Square", {Visible = false, Thickness = 2, Color = Color3_2.new(0, 0, 0), Filled = false, ZIndex = 1}, T2), healthBar = V5("Square", {Visible = false, Thickness = 1, Filled = true, ZIndex = 2}, T2), healthBackground = V5("Square", {Visible = false, Color = Color3_2.new(0.239215, 0.239215, 0.239215), Transparency = 0.7, Thickness = 1, Filled = true, ZIndex = 1}, T2), name = V5("Text", {Visible = false, Center = true, Outline = true, OutlineColor = Color3_2.new(0, 0, 0), Color = Color3_2.new(1, 1, 1), Transparency = 1, Size = SIZE, Text = Arg1.player.DisplayName, Font = FONT, ZIndex = 2}, T2), distance = V5("Text", {Visible = false, Center = true, Outline = true, OutlineColor = Color3_2.new(0, 0, 0), Color = Color3_2.new(1, 1, 1), Transparency = 1, Size = SIZE, Font = FONT, ZIndex = 2}, T2), weapon = V5("Text", {Visible = false, Center = true, Outline = true, OutlineColor = Color3_2.new(0, 0, 0), Color = Color3_2.new(1, 1, 1), Transparency = 1, Size = SIZE, Font = FONT, ZIndex = 2}, T2)}
			T3.all = T2
			Arg1.drawings = T3
			Arg1.allDrawings = T2
			Insert(Arg1.drawings, Arg1.allDrawingCache)
		end
		T3.hideDrawings = function(Arg1)
			if (Arg1.hidden) then
				return
			end
			Arg1.hidden = true
			for Index = 1, #Arg1.allDrawings do
				Arg1.allDrawings[Index].Visible = false
			end
		end
		T3.setNonActive = function(Arg1)
			if (Arg1.current.active == false) then
				return
			end
			Arg1.current.active = false
			for Index = 1, #Arg1.allDrawings do
				Arg1.allDrawings[Index].Visible = false
			end
		end
		T3.humanoidHealthChanged = function(Arg1)
			local Humanoid = Arg1.current.humanoid
			if (not Humanoid) then
				return
			end
			local Health = Humanoid.Health
			local MaxHealth = Humanoid.MaxHealth
			local V = Health / MaxHealth
			if (Arg1.current.rootPart and Health > 0) then
				Arg1.current.active = true
			else
				Arg1:setNonActive()
			end
			Arg1.current.health = Health
			Arg1.current.maxHealth = MaxHealth
			Arg1.current.healthPercentage = V
			Arg1.drawings.healthBar.Color = Color3_2.new(1, 0, 0):Lerp(Color3_2.new(0, 1, 0), V)
		end
		T3.setupHumanoid = function(Arg1, Arg2, Arg3)
			Arg1:humanoidHealthChanged()
			Insert(Arg1.connections, Arg2:GetPropertyChangedSignal("Health"):Connect(function()
				Arg1:humanoidHealthChanged()
			end))
			if (Arg3) then
				local ChildAddedConnections = Arg1.childAddedConnections
				local Children = Arg1.current.character:GetChildren()
				for Index = 1, #Children do
					local V = Children[Index]
					for Index2 = 1, #ChildAddedConnections do
						ChildAddedConnections[Index2](Arg1, V)
					end
				end
			end
		end
		T3.loop = function(Arg1, Arg2, Arg3)
			local Current = Arg1.current
			local V, V2 = Fn(Current.humanoid, true)
			local Position = Current.rootPart.Position
			local V3, V5 = Fn2(Position)
			if (not V5) then
				return Arg1:hideDrawings()
			end
			Arg1.hidden = false
			local V6 = CFrame2.new(Position, V4.CFrame.Position)
			local V7, V8 = -V2.X / 2, V2.Y / 2
			local V9 = Fn2((V6 * CFrame2.new(V7, V8, 0)).Position)
			local V10 = Fn2((V6 * CFrame2.new(V7, -V8, 0)).Position)
			local V11 = Vector2_2.new(Max(V9.X - V3.X, V10.X - V3.X, 0), Max((V3.Y - V9.Y), (V10.Y - V3.Y), 0))
			Arg1:renderBox(V3, V11, Arg2.box)
			Arg1:renderName(V3, V11, Arg2.name)
			Arg1:renderDistance(V3, V11, Arg2.distance, Arg3)
			Arg1:renderHealthbar(V3, V11, Arg2.healthbar)
			Arg1:renderWeapon(V3, V11, Arg2.weapon)
		end
		T3.primaryPartAdded = function(Arg1)
			local PrimaryPart = Arg1.current.character.PrimaryPart
			if (PrimaryPart) then
				Arg1.current.rootPart = PrimaryPart
				if (Arg1.current.humanoid and Arg1.current.health > 0) then
					Arg1.current.active = true
				end
			end
		end
		T3.childAdded = function(Arg1, Arg2)
			if (Arg2.ClassName == "Humanoid" and Arg1.current) then
				Arg1.current.humanoid = Arg2
				Arg1:setupHumanoid(Arg2)
			end
			for Index = 1, #Arg1.childAddedConnections do
				Arg1.childAddedConnections[Index](Arg1, Arg2)
			end
		end
		T3.childRemoved = function(Arg1, Arg2)
			if (not Arg1.current) then
			elseif (Arg2 == Arg1.current.humanoid) then
				Arg1.current.humanoid = nil
				Arg1:setNonActive()
			elseif (Arg2 == Arg1.current.rootPart) then
				Arg1.current.rootPart = nil
				Arg1:setNonActive()
			end
			for Index = 1, #Arg1.childRemovedConnections do
				Arg1.childRemovedConnections[Index](Arg1, Arg2)
			end
		end
		T3.characterAdded = function(Arg1, Arg2, Arg3)
			Arg1.current = {character = Arg2, active = false, humanoid = Arg2:FindFirstChild("Humanoid"), rootPart = Arg2:FindFirstChild("HumanoidRootPart"), health = nil, weapon = nil, connection = nil}
			Insert(Arg1.connections, Arg2:GetPropertyChangedSignal("PrimaryPart"):Connect(function()
				Arg1:primaryPartAdded()
			end))
			Insert(Arg1.connections, Arg2.ChildAdded:Connect(function(...)
				return Arg1:childAdded(...)
			end))
			Insert(Arg1.connections, Arg2.ChildRemoved:Connect(function(...)
				return Arg1:childRemoved(...)
			end))
			if (Arg1.current.humanoid) then
				Arg1:setupHumanoid(Arg1.current.humanoid, Arg3)
			end
		end
		T3.characterRemoved = function(Arg1, _)
			Arg1.current = nil
			for Index = 1, #Arg1.allDrawings do
				Arg1.allDrawings[Index].Visible = false
			end
		end
		T3.renderBox = function(Arg1, Arg2, Arg3, Arg4)
			local Drawings = Arg1.drawings
			if (not Arg4) then
				Drawings.box.Visible = false
				Drawings.boxOutline.Visible = false
				return
			end
			local Box = Drawings.box
			local BoxOutline = Drawings.boxOutline
			local V = Arg2 - Arg3
			local V2 = Arg3 * 2
			Box.Visible = true
			Box.Position = V
			Box.Size = V2
			BoxOutline.Visible = true
			BoxOutline.Position = V
			BoxOutline.Size = V2
		end
		T3.renderName = function(Arg1, Arg2, Arg3, Arg4)
			local Name = Arg1.drawings.name
			if (not Arg4) then
				Name.Visible = false
				return
			end
			Name.Visible = true
			Name.Position = Arg2 - Vector2_2.new(0, Arg3.Y + Name.Size)
		end
		T3.renderDistance = function(Arg1, Arg2, Arg3, Arg4, Arg5)
			local Distance = Arg1.drawings.distance
			if (not Arg4) then
				Distance.Visible = false
				return
			end
			local V = Arg1.drawings.weapon.Visible and 13 or 0
			local V2 = Round(Arg5 or (V4.CFrame.Position - Arg1.current.rootPart.Position).Magnitude)
			Distance.Visible = true
			Distance.Position = Arg2 + Vector2_2.new(0, Arg3.Y + V)
			Distance.Text = ("[" .. tostring(V2) .. "]")
		end
		T3.renderWeapon = function(Arg1, Arg2, Arg3, Arg4)
			local Weapon = Arg1.drawings.weapon
			if (not Arg4) then
				Weapon.Visible = false
				return
			end
			Weapon.Visible = true
			Weapon.Position = Arg2 + Vector2_2.new(0, Arg3.Y)
			Weapon.Text = Arg1.current.weapon and Lower(Arg1.current.weapon.Name) or "none"
		end
		T3.renderHealthbar = function(Arg1, Arg2, Arg3, Arg4)
			if (not Arg4) then
				Arg1.drawings.healthBar.Visible = false
				Arg1.drawings.healthBackground.Visible = false
				return
			end
			local HealthBar = Arg1.drawings.healthBar
			local HealthBackground = Arg1.drawings.healthBackground
			HealthBar.Visible = true
			HealthBackground.Visible = true
			local V = Arg2 - Arg3 - Vector2_2.new(5, 0)
			local V2 = Vector2_2.new(3, Arg3.Y * 2)
			local V3 = Max((V2.Y - 2) * Arg1.current.healthPercentage, 0)
			local V4 = V + Vector2_2.new(1, 1 + (V2.Y - 2 - V3))
			local V5 = Vector2_2.new(1, V3)
			HealthBackground.Position = V
			HealthBackground.Size = V2
			HealthBar.Position = V4
			HealthBar.Size = V5
		end
		T2.playerESP = T3
	end
	do
		local T4 = {entityCache = {}, drawingCache = {}, allDrawingCache = {}, childAddedConnections = {}, childRemovedConnections = {}, drawingAddedConnections = {}}
		T4.__index = T4
		T4.onDrawingAdded = function(Arg1)
			Insert(T4.drawingAddedConnections, Arg1)
		end
		T4.new = function(Arg1, Arg2, Arg3, Arg4)
			local V = SetMetatable({entity = Arg1, settingName = Arg2, name = Arg3 or Arg1.Name, colour = Arg4 or Color3_2.new(1, 1, 1), hidden = false, connections = {}}, T4)
			local V2 = T4.drawingCache[1]
			if (V2) then
				Remove(T4.drawingCache, 1)
				V2.name.Text = V.name
				V2.name.Color = V.colour
				V2.box.Color = V.colour
				V2.distance.Color = V.colour
				V.allDrawings = V2.all
				V.drawings = V2
			else
				V:createDrawingCache()
			end
			for Index = 1, #T4.drawingAddedConnections do
				T4.drawingAddedConnections[Index](V)
			end
			Insert(V.connections, Arg1.AncestryChanged:Connect(function(Arg1_2, Arg2)
				if (Arg1_2 == Arg1 and Arg2 == nil) then
					return V:remove()
				end
			end))
			T4.entityCache[Arg1] = V
		end
		T4.remove = function(Arg1)
			T4.entityCache[Arg1.entity] = nil
			Arg1:hideDrawings()
			Insert(T4.drawingCache, Arg1.drawings)
			for Index = 1, #Arg1.connections do
				Arg1.connections[Index]:Disconnect()
			end
		end
		T4.createDrawingCache = function(Arg1)
			local T2 = {}
			local T3 = {box = V5("Square", {Visible = false, Filled = false, Thickness = 1, Color = Arg1.colour, ZIndex = 2}, T2), boxOutline = V5("Square", {Visible = false, Filled = false, Thickness = 1, Color = Color3_2.new(0, 0, 0), ZIndex = 1}, T2), name = V5("Text", {Visible = false, Center = true, Outline = true, OutlineColor = Color3_2.new(0, 0, 0), Color = Arg1.colour, Transparency = 1, Size = SIZE, Text = Arg1.name, Font = FONT, ZIndex = 1}, T2), distance = V5("Text", {Visible = false, Center = true, Outline = true, OutlineColor = Color3_2.new(0, 0, 0), Color = Arg1.colour, Transparency = 1, Size = SIZE, Font = FONT, ZIndex = 1}, T2)}
			T3.all = T2
			Arg1.drawings = T3
			Arg1.allDrawings = T2
			Insert(Arg1.drawings, Arg1.allDrawingCache)
		end
		T4.hideDrawings = function(Arg1)
			if (Arg1.hidden) then
				return
			end
			Arg1.hidden = true
			for Index = 1, #Arg1.allDrawings do
				Arg1.allDrawings[Index].Visible = false
			end
		end
		T4.loop = function(Arg1, Arg2, Arg3)
			local V, V2 = Fn(Arg1.entity)
			local V3, V5 = Fn2(V.Position)
			if (not V5) then
				return Arg1:hideDrawings()
			end
			Arg1.hidden = false
			local V6 = CFrame2.new(V.Position, V4.CFrame.Position)
			local V7, V8 = -V2.X / 2, V2.Y / 2
			local V9 = Fn2((V6 * CFrame2.new(V7, V8, 0)).Position)
			local V10 = Fn2((V6 * CFrame2.new(V7, -V8, 0)).Position)
			local V11 = Vector2_2.new(Max(V9.X - V3.X, V10.X - V3.X), Max((V3.Y - V9.Y), (V10.Y - V3.Y)))
			Arg1:renderBox(V3, V11, Arg2.box)
			Arg1:renderName(V3, V11, Arg2.name)
			Arg1:renderDistance(V3, V11, Arg2.distance, Arg3)
		end
		T4.renderBox = function(Arg1, Arg2, Arg3, Arg4)
			local Drawings = Arg1.drawings
			if (not Arg4) then
				Drawings.box.Visible = false
				Drawings.boxOutline.Visible = false
				return
			end
			local Box = Drawings.box
			local BoxOutline = Drawings.boxOutline
			local V = Arg2 - Arg3
			local V2 = Arg3 * 2
			Box.Visible = true
			Box.Position = V
			Box.Size = V2
			BoxOutline.Visible = true
			BoxOutline.Position = V
			BoxOutline.Size = V2
		end
		T4.renderName = function(Arg1, Arg2, Arg3, Arg4)
			local Name = Arg1.drawings.name
			if (not Arg4) then
				Name.Visible = false
				return
			end
			Name.Visible = true
			Name.Position = Arg2 - Vector2_2.new(0, Arg3.Y + Name.Size)
		end
		T4.renderDistance = function(Arg1, Arg2, Arg3, Arg4, Arg5)
			local Distance = Arg1.drawings.distance
			if (not Arg4) then
				Distance.Visible = false
				return
			end
			local V = Round(Arg5 or (V4.CFrame.Position - Arg1.entity:GetPivot().Position).Magnitude)
			Distance.Visible = true
			Distance.Position = Arg2 + Vector2_2.new(0, Arg3.Y)
			Distance.Text = ("[" .. tostring(V) .. "]")
		end
		T2.entityESP = T4
	end
	do
		local T5 = {npcCache = {}, drawingCache = {}, allDrawingCache = {}, drawingAddedConnections = {}}
		T5.__index = T5
		T5.onDrawingAdded = function(Arg1)
			Insert(T5.drawingAddedConnections, Arg1)
		end
		T5.new = function(Arg1, Arg2, Arg3, Arg4, Arg5)
			local V = SetMetatable({entity = Arg1, settingName = Arg2, name = Arg3 or Arg1.Name, colour = Arg4 or Color3_2.new(1, 1, 1), hidden = false, ignoreR15 = Arg5 or false, connections = {}}, T5)
			local V2 = T5.drawingCache[1]
			if (V2) then
				Remove(T5.drawingCache, 1)
				V2.name.Text = V.name
				V2.name.Color = V.colour
				V2.box.Color = V.colour
				V2.distance.Color = V.colour
				V.allDrawings = V2.all
				V.drawings = V2
			else
				V:createDrawingCache()
			end
			for Index = 1, #T5.drawingAddedConnections do
				T5.drawingAddedConnections[Index](V)
			end
			local Humanoid = Arg1:FindFirstChildOfClass("Humanoid")
			if (Humanoid and Humanoid.Health > 0) then
				V.humanoid = Humanoid
				Insert(V.connections, Arg1.AncestryChanged:Connect(function(Arg1_2, Arg2)
					if (Arg1_2 == Arg1 and Arg2 == nil) then
						return V:remove()
					end
				end))
				Insert(V.connections, Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
					if (Humanoid.Health <= 0) then
						return V:remove()
					end
				end))
				T5.npcCache[Arg1] = V
				V:setupHumanoid(Humanoid)
				return
			end
			local V3
			V3 = Arg1.ChildAdded:Connect(function(Arg1_2)
				if (Arg1_2.ClassName ~= "Humanoid") then
					return
				end
				V.humanoid = Arg1_2
				Insert(V.connections, Arg1.AncestryChanged:Connect(function(Arg1_2, Arg2)
					if (Arg1_2 == Arg1 and Arg2 == nil) then
						return V:remove()
					end
				end))
				T5.npcCache[Arg1] = V
				V:setupHumanoid(Arg1_2)
				V3:Disconnect()
			end)
		end
		T5.remove = function(Arg1)
			T5.npcCache[Arg1.entity] = nil
			Arg1:hideDrawings()
			Insert(T5.drawingCache, Arg1.drawings)
			for Index = 1, #Arg1.connections do
				Arg1.connections[Index]:Disconnect()
			end
		end
		T5.createDrawingCache = function(Arg1)
			local T2 = {}
			local T3 = {box = V5("Square", {Visible = false, Filled = false, Thickness = 1, Color = Arg1.colour, ZIndex = 2}, T2), boxOutline = V5("Square", {Visible = false, Filled = false, Thickness = 1, Color = Color3_2.new(0, 0, 0), ZIndex = 1}, T2), name = V5("Text", {Visible = false, Center = true, Outline = true, OutlineColor = Color3_2.new(0, 0, 0), Color = Arg1.colour, Transparency = 1, Size = SIZE, Text = Arg1.name, Font = FONT, ZIndex = 1}, T2), distance = V5("Text", {Visible = false, Center = true, Outline = true, OutlineColor = Color3_2.new(0, 0, 0), Color = Arg1.colour, Transparency = 1, Size = SIZE, Font = FONT, ZIndex = 1}, T2), healthBar = V5("Square", {Visible = false, Thickness = 1, Filled = true, ZIndex = 2}, T2), healthBackground = V5("Square", {Visible = false, Color = Color3_2.new(0.239215, 0.239215, 0.239215), Transparency = 0.7, Thickness = 1, Filled = true, ZIndex = 1}, T2)}
			T3.all = T2
			Arg1.drawings = T3
			Arg1.allDrawings = T2
			Insert(Arg1.drawings, Arg1.allDrawingCache)
		end
		T5.hideDrawings = function(Arg1)
			if (Arg1.hidden) then
				return
			end
			Arg1.hidden = true
			for Index = 1, #Arg1.allDrawings do
				Arg1.allDrawings[Index].Visible = false
			end
		end
		T5.loop = function(Arg1, Arg2, Arg3)
			local V = Arg1.humanoid ~= nil and not Arg1.ignoreR15
			local V2, V3 = Fn(V and Arg1.humanoid or Arg1.entity, V)
			local V5, V6 = Fn2(V2.Position)
			if (not V6) then
				return Arg1:hideDrawings()
			end
			Arg1.hidden = false
			local V7 = CFrame2.new(V2.Position, V4.CFrame.Position)
			local V8, V9 = -V3.X / 2, V3.Y / 2
			local V10 = Fn2((V7 * CFrame2.new(V8, V9, 0)).Position)
			local V11 = Fn2((V7 * CFrame2.new(V8, -V9, 0)).Position)
			local V12 = Vector2_2.new(Max(V10.X - V5.X, V11.X - V5.X, 0), Max((V5.Y - V10.Y), (V11.Y - V5.Y), 0))
			Arg1:renderBox(V5, V12, Arg2.box)
			Arg1:renderName(V5, V12, Arg2.name)
			Arg1:renderDistance(V5, V12, Arg2.distance, Arg3)
			Arg1:renderHealthbar(V5, V12, Arg2.healthbar)
		end
		T5.humanoidHealthChanged = function(Arg1)
			local Humanoid = Arg1.humanoid
			local Health = Humanoid.Health
			local MaxHealth = Humanoid.MaxHealth
			local V = Health / MaxHealth
			Arg1.health = Health
			Arg1.maxHealth = MaxHealth
			Arg1.healthPercentage = V
			Arg1.drawings.healthBar.Color = Color3_2.new(1, 0, 0):Lerp(Color3_2.new(0, 1, 0), V)
		end
		T5.setupHumanoid = function(Arg1, Arg2)
			Arg1:humanoidHealthChanged()
			Insert(Arg1.connections, Arg2:GetPropertyChangedSignal("Health"):Connect(function()
				Arg1:humanoidHealthChanged()
			end))
		end
		T5.renderBox = function(Arg1, Arg2, Arg3, Arg4)
			local Drawings = Arg1.drawings
			if (not Arg4) then
				Drawings.box.Visible = false
				Drawings.boxOutline.Visible = false
				return
			end
			local Box = Drawings.box
			local BoxOutline = Drawings.boxOutline
			local V = Arg2 - Arg3
			local V2 = Arg3 * 2
			Box.Visible = true
			Box.Position = V
			Box.Size = V2
			BoxOutline.Visible = true
			BoxOutline.Position = V
			BoxOutline.Size = V2
		end
		T5.renderName = function(Arg1, Arg2, Arg3, Arg4)
			local Name = Arg1.drawings.name
			if (not Arg4) then
				Name.Visible = false
				return
			end
			Name.Visible = true
			Name.Position = Arg2 - Vector2_2.new(0, Arg3.Y + Name.Size)
		end
		T5.renderDistance = function(Arg1, Arg2, Arg3, Arg4, Arg5)
			local Distance = Arg1.drawings.distance
			if (not Arg4) then
				Distance.Visible = false
				return
			end
			local V = Round(Arg5 or (V4.CFrame.Position - Arg1.entity:GetPivot().Position).Magnitude)
			Distance.Visible = true
			Distance.Position = Arg2 + Vector2_2.new(0, Arg3.Y)
			Distance.Text = ("[" .. tostring(V) .. "]")
		end
		T5.renderHealthbar = function(Arg1, Arg2, Arg3, Arg4)
			if (not Arg4) then
				Arg1.drawings.healthBar.Visible = false
				Arg1.drawings.healthBackground.Visible = false
				return
			end
			local HealthBar = Arg1.drawings.healthBar
			local HealthBackground = Arg1.drawings.healthBackground
			HealthBar.Visible = true
			HealthBackground.Visible = true
			local V = Arg2 - Arg3 - Vector2_2.new(5, 0)
			local V2 = Vector2_2.new(3, Arg3.Y * 2)
			local V3 = Max((V2.Y - 2) * Arg1.healthPercentage, 0)
			local V4 = V + Vector2_2.new(1, 1 + (V2.Y - 2 - V3))
			local V5 = Vector2_2.new(1, V3)
			HealthBackground.Position = V
			HealthBackground.Size = V2
			HealthBar.Position = V4
			HealthBar.Size = V5
		end
		T2.npcESP = T5
	end
	return T2
end)()
local PlayerESP = V35.playerESP
local NpcESP = V35.npcESP
local EntityESP = V35.entityESP
local V36, V37 = V34.windowClass.new({title = "Burmalda.hook", size = Vector2_2.new(600, 570)})
local V38 = V34.boardClass.new({active = false, title = "keybind list", size = Vector2_2.new(200, 100)})
local V39 = V34.targethudClass.new({active = false})
local T2 = {
	client = {},
	services = {
		replicatedStorage = V8,
		userInputService = V9,
		httpService = V10,
		guiService = V11,
		runService = V12,
		lighting = V13,
		players = V14,
		camera = V15,
		terrain = V18,
	},
	world = {
		vfx = VFX,
		plants = Plants,
		drops = Drops,
		vms = V19,
		trees = V20,
		vegetation = V21,
		nodes = V22,
		bases = V23,
		events = V24,
		military = V25,
		loners = V26,
		modules = V27,
		playerGui = V17,
	},
	gameModules = {
		items = V28,
		toolinfo = V29,
		benchInfo = V30,
		raycastUtil = V31,
		soundModule = V32,
		vfxModule = V33,
	},
	localplayer = V16,
	localcharacter = V16.Character,
	localrootpart = V16.Character and V16.Character:WaitForChild("HumanoidRootPart", math.huge),
	localhumanoid = V16.Character and V16.Character:WaitForChild("Humanoid", math.huge),
	uiLibrary = V34,
	espLibrary = V35,
	window = V36,
	flags = V37,
	keybindList = V38,
	targetHUD = V39,
	playerESP = PlayerESP,
	npcESP = NpcESP,
	entityESP = EntityESP,
	protectedCall = V7,
	_cloneref = Fn,
	checkType = Fn2,
	debug_setupvalue = V5,
	debug_isvalidlevel = V6,
	const = {CHRISTMAS_UPDATE = false, MATH_HUGE = math.huge},
}
local V40 = (function()
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
		local T = {
			combat = Arg1:addTab("combat"),
			visuals = Arg1:addTab("visuals"),
			entity = Arg1:addTab("entity"),
			_local = Arg1:addTab("local"),
			ui = Arg1:addTab("ui"),
		}
		V(T.combat)
		V2(T.visuals)
		V3(T.entity, Arg2)
		V4(T._local)
		return T
	end
end)()
local V41 = (function()
	local New = Vector2_2.new
	local New2 = Color3_2.new
	local V = T[6]
	return function(Arg1)
		local Flags = Arg1.flags
		local Tabs = Arg1.tabs
		local Window = Arg1.window
		local TargetHUD = Arg1.targetHUD
		local KeybindList = Arg1.keybindList
		local HttpService = Arg1.services.httpService
		local JSONEncode = HttpService.JSONEncode
		local JSONDecode = HttpService.JSONDecode
		local function Fn()
			local T = {"Burmalda", "Burmalda", "Burmalda\\configs"}
			for Index = 1, #T do
				local V = T[Index]
				if (not IsFolder(V)) then
					MakeFolder(V)
				end
			end
		end
		local V2 = "Burmalda\\configs"
		Fn()
		local function Fn2()
			local V = ListFiles(V2)
			local V3 = Find(V, (tostring(V2) .. "\\" .. tostring(Flags.config_name.value))) or Find(V, (tostring("Burmalda/configs") .. "/" .. tostring(Flags.config_name.value)))
			if (V3) then
				return V[V3]
			end
		end
		local function Fn3()
			local T = {}
			local V = ListFiles(V2)
			for Index = 1, #V do
				local V3 = V[Index]
				Insert(T, Sub(V3, #V2 + 2, #V3))
			end
			local Self = Flags.config_name.self
			Self.options = T
			Self.setValue(T[1] or "None")
		end
		local function Fn4()
			Fn()
			local V = Fn2()
			if (not V) then
				Window:notify("Failed to find Config Directory", 3)
				return Fn3()
			end
			DelFile(V)
			Fn3()
		end
		local function Fn5()
			Fn()
			local V = 1
			while true do
				if (not IsFile((tostring(V2) .. "\\config" .. tostring(V)))) then
					break
				end
				V += 1
			end
			local T = {}
			for Key, Flag in Flags do
				if (Key ~= "config_name") then
					local Value = Flag.value
					if (Flag.type == "colourpicker") then
						Value = {Value.R, Value.G, Value.B}
					end
					T[Key] = {value = Value, key = Flag.key, type = Flag.type}
				end
			end
			local V3 = TargetHUD:getScale()
			local V4 = KeybindList:getScale()
			T.keybindlist_scale = {value = {V4.X, V4.Y}, type = "scale"}
			T.targethud_scale = {value = {V3.X, V3.Y}, type = "scale"}
			local V5, V6 = Pcall(JSONEncode, HttpService, T)
			if (V5) then
				WriteFile((tostring(V2) .. "\\config" .. tostring(V)), V6)
			end
			Fn3()
		end
		local function Fn6()
			Fn()
			local V2 = Fn2()
			if (not V2) then
				Window:notify("Failed to find Config Directory", 3)
				return Fn3()
			end
			local V3 = ReadFile(V2)
			local V4, V5 = Pcall(JSONDecode, HttpService, V3)
			if (not V4 or Type(V5) ~= "table") then
				return Fn3()
			end
			for Key, Value in V.translate(V5) do
				if (Type(Value) ~= "table") then
					continue
				end
				local Value2 = Value.value
				if (Type(Value2) == "table" and Value.type == "scale" and Type(Value2[1]) == "number" and Type(Value2[2]) == "number") then
					if (Key == "keybindlist_scale") then
						KeybindList:setScale(New(Value2[1], Value2[2]))
					elseif (Key == "targethud_scale") then
						TargetHUD:setScale(New(Value2[1], Value2[2]))
					end
					continue
				elseif (not (Flags[Key] and Value.type == Flags[Key].type)) then
					continue
				elseif (Value.type ~= "keypicker" and Value2 == Flags[Key].value) then
					continue
				end
				if (Flags[Key].type == "colourpicker" and Type(Value2) == "table") then
					Value2 = New2(Value2[1], Value2[2], Value2[3])
				end
				Pcall(Flags[Key].self.setValue, Value2, Value.key)
			end
			Fn3()
		end
		Tabs.ui:addDropdown({flag = "config_name", text = "config", options = {}}, 1)
		Tabs.ui:addButton("delete config", Fn4, 1)
		Tabs.ui:addButton("save config", Fn5, 1)
		Tabs.ui:addButton("load config", Fn6, 1)
		Tabs.ui:addToggle({flag = "targetHud_toggle", text = "target hud", default = false}, 2)
		Tabs.ui:addToggle({flag = "keybindList_toggle", text = "keybind list", default = false}, 2)
		Fn3()
	end
end)()
local V42 = (function()
	local FromRGB = Color3_2.fromRGB
	local New = Vector2_2.new
	local V = (function()
		local New = Drawing2.new
		return function(Arg1, Arg2, ...)
			local V = New(Arg1)
			for Key, Value in Arg2 do
				V[Key] = Value
			end
			for _, Value2 in {...} do
				Insert(Value2, V)
			end
			return V
		end
	end)()
	return function(Arg1)
		local V2 = V("Square", {
			Visible = false,
			Filled = true,
			Transparency = 0.3,
			Thickness = 1,
			Color = FromRGB(7, 7, 7),
			Position = New(0, 0),
			Size = New(9999, 9999),
			ZIndex = 9,
		})
		local function Fn(Arg1_2)
			if (not Arg1_2) then
				V2.Visible = false
				Arg1.targetHUD:toggle(false)
				return
			end
			V2.Visible = true
			Arg1.targetHUD:toggle(Arg1.flags.targetHud_toggle.value)
		end
		Arg1.window:onToggle(Fn)
		Fn(Arg1.window.active)
	end
end)()
local V43 = (function()
	local FromRGB = Color3_2.fromRGB
	local V = (function()
		local New = Drawing2.new
		return function(Arg1, Arg2, ...)
			local V = New(Arg1)
			for Key, Value in Arg2 do
				V[Key] = Value
			end
			for _, Value2 in {...} do
				Insert(Value2, V)
			end
			return V
		end
	end)()
	local V2 = T[5]
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
local V44 = (function()
	local New = Vector2_2.new
	local New2 = Vector3_2.new
	local V = T[7]
	return function(Arg1)
		local Camera = Arg1.services.camera
		local Vfx = Arg1.world.vfx
		local Plants = Arg1.world.plants
		local Drops = Arg1.world.drops
		local Client = Arg1.client
		Arg1.replacemetamethod = V
		Arg1.isVisible = function(Arg1_2, Arg2, Arg3)
			local V = RaycastParams2.new()
			V.RespectCanCollide = true
			V.FilterDescendantsInstances = {Arg3, Camera, Vfx, Plants, Drops, Arg1.localcharacter, Unpack(Arg1.GLOBAL_HIT_IGNORE)}
			local V2 = Workspace:Raycast(Arg1_2, Arg2 - Arg1_2, V)
			return not V2, V2
		end
		Arg1.world2viewport = function(Arg1)
			local V, V2 = Camera:WorldToViewportPoint(Arg1)
			return New(V.X, V.Y), V2, V.Z
		end
		Arg1.isTeammate = function(Arg1)
			local NameTag = Arg1:FindFirstChild("NameTag")
			return NameTag and NameTag.AlwaysOnTop
		end
		Arg1.isDowned = function(Arg1)
			return Arg1:GetAttribute("Downed") or Arg1.Health <= 0
		end
		Arg1.generateTarget = function(Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8)
			return {distance = Arg1, player = Arg2, character = Arg3, vector3 = Arg4, vector2 = Arg5, humanoid = Arg6, instance = Arg7, rootPart = Arg8, origin = Client.scanOrigin and Client.scanOrigin.Position}
		end
		Arg1.tempInstance = nil
	end
end)()
local V45 = (function()
	local V = (function()
		local New = CFrame2.new
		return function(Arg1)
			local CACHED = Arg1.CACHED
			local HiddenSettings = Arg1.HIDDEN_SETTINGS
			local GlobalHitIgnore = Arg1.GLOBAL_HIT_IGNORE
			local Client = Arg1.client
			local Camera = Arg1.services.camera
			local Vfx = Arg1.world.vfx
			local Plants = Arg1.world.plants
			local Drops = Arg1.world.drops
			local V = RaycastParams2.new()
			V.RespectCanCollide = true
			local T = {}
			local V2 = true
			local V3 = nil
			local V4 = 0
			local V5 = SetMetatable({}, {__mode = "k"})
			local V6 = SetMetatable({}, {__mode = "k"})
			local function Fn()
				Clear(T)
				T[1] = Camera
				T[2] = Camera
				T[3] = Vfx
				T[4] = Plants
				T[5] = Drops
				local V = 5
				local Localcharacter = Arg1.localcharacter
				if (Localcharacter) then
					V += 1
					T[V] = Localcharacter
				end
				Move(GlobalHitIgnore, 1, #GlobalHitIgnore, V + 1, T)
				V2 = false
				V3 = nil
			end
			local function Fn2(Arg1, Arg2, Arg3)
				if (V4 <= 0) then
					return false, nil
				end
				V4 -= 1
				if V2 then
					Fn()
				end
				local V5 = Arg3 or Camera
				if (V5 ~= V3) then
					T[1] = V5
					V.FilterDescendantsInstances = T
					V3 = V5
				end
				local V6 = Workspace:Raycast(Arg1, Arg2 - Arg1, V)
				return not V6, V6
			end
			local function Fn3(Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8)
				local V = Arg2[Arg3]
				if (V and Arg1[V]) then
					local V2, V3 = Arg4(Arg1[V], Arg5, Arg6, Arg7, Arg8)
					if (V2) then
						return V2, V3
					end
				end
				for Index = 1, #Arg1 do
					if (Index == V) then
						continue
					end
					local V4, V5 = Arg4(Arg1[Index], Arg5, Arg6, Arg7, Arg8)
					if (V4) then
						Arg2[Arg3] = Index
						return V4, V5
					end
				end
				return nil, nil
			end
			local function Fn4(Arg1, Arg2, Arg3, Arg4)
				local V = Arg3 + Arg1
				local V2, V3 = Fn2(Arg3, V, Arg4)
				if (not V2) then
					if (not V3) then
						return nil
					end
					V = Arg3 + ((V - Arg3).Unit * (V3.Distance - 0.2))
				end
				if (Fn2(Arg2, V, Arg4)) then
					return V
				end
				return nil
			end
			local function Fn5(Arg1, Arg2, Arg3)
				return Fn3(CACHED.hitscanAngles, V5, Arg3, Fn4, Arg1, Arg2, Arg3)
			end
			local function Fn6(Arg1, Arg2, Arg3, Arg4, Arg5)
				local Position = Arg2.Position
				local Position2 = (Arg2 * New(Arg1)).Position
				local V, V2 = Fn2(Position, Position2)
				if (not V) then
					if (not V2) then
						return nil, nil
					end
					Position2 = Position + ((Position2 - Position).Unit * (V2.Distance - 0.2))
				end
				if (Fn2(Position2, Arg3, Arg4)) then
					return Position2, nil
				elseif (Arg5) then
					local V3 = Fn5(Position2, Arg3, Arg4)
					if (V3) then
						return Position2, V3
					end
				end
				return nil, nil
			end
			return {
				beginTick = function()
					V4 = HiddenSettings.maxRayAmount
					V2 = true
				end,
				cast = Fn2,
				canHitscan = Fn5,
				canManipulate = function(Arg1, Arg2, Arg3)
					local ScanOrigin = Client.scanOrigin or Camera.CFrame
					return Fn3(CACHED.manipulationAngles, V6, Arg2, Fn6, ScanOrigin, Arg1, Arg2, Arg3)
				end,
			}
		end
	end)()
	local T = {Soldier = true, Bruno = true, Boris = true, Brutus = true}
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
		local V2 = V(Arg1)
		local BeginTick = V2.beginTick
		local Cast = V2.cast
		local CanHitscan = V2.canHitscan
		local CanManipulate = V2.canManipulate
		local function Fn2(Arg1, Arg2, Arg3, Arg4, Arg5, Arg6)
			local V = Flags.silentAim_hitpart.value == "torso" and Arg4:FindFirstChild("UpperTorso") or Arg4:FindFirstChild("Head")
			if (not V) then
				return
			end
			local Position = V.Position
			local V2, V3 = World2viewport(Position)
			if (not V3) then
				return
			end
			local Magnitude = (V2 - Client.mousepos).Magnitude
			if (Magnitude > Arg2) then
				return
			end
			Insert(Arg1, GenerateTarget(Magnitude, Arg3, Arg4, Position, V2, Arg5, V, Arg6))
		end
		local function Fn3(Arg1, Arg2)
			local Character = Arg2.character
			local Name = Arg2.instance.Name
			for Index = 1, #BodyParts do
				local V = BodyParts[Index]
				if (V == Name) then
					continue
				end
				local V2 = Character:FindFirstChild(V)
				if (not V2) then
					continue
				end
				local Position = V2.Position
				local V3, V4 = World2viewport(Position)
				if (not V4) then
					continue
				end
				local Magnitude = (V3 - Client.mousepos).Magnitude
				Insert(Arg1, GenerateTarget(Magnitude, Arg2.player, Character, Position, V3, Arg2.humanoid, V2, Arg2.rootPart))
			end
		end
		local function Fn4(Arg1, Arg2)
			local Value = Flags.silentAim_teamCheck.value
			local ScanOrigin = Client.scanOrigin
			local Players2 = Players:GetPlayers()
			for Index = 2, #Players2 do
				local V = Players2[Index]
				local Character = V.Character
				local V2 = Character and Character:FindFirstChild("Humanoid")
				local PrimaryPart = Character and Character.PrimaryPart
				if (not V2 or not PrimaryPart or IsDowned(V2) or ScanOrigin and (PrimaryPart.Position - ScanOrigin.Position).Magnitude > 1300 or Value and IsTeammate(Character)) then
					continue
				end
				Fn2(Arg1, Arg2, V, Character, V2, PrimaryPart)
			end
		end
		local function Fn5(Arg1, Arg2)
			local Children = Military:GetChildren()
			for Index = 1, #Children do
				local Children2 = Children[Index]:GetChildren()
				for Index2 = 1, #Children2 do
					local V = Children2[Index2]
					if (not T[V.Name]) then
						continue
					end
					local Humanoid = V:FindFirstChildOfClass("Humanoid")
					if (not Humanoid or Humanoid.Health <= 0) then
						continue
					end
					Fn2(Arg1, Arg2, V, V, Humanoid, nil)
				end
			end
		end
		local function Fn6(Arg1)
			local V = Flags.silentAim_hitpart.value == "closest"
			local Value = Flags.silentAim_visibleCheck.value
			local Value2 = Flags.silentAim_manipulation.value
			local Value3 = Flags.silentAim_hitscan.value
			if (not Value and not Value2 and not Value3) then
				local V2 = nil
				for Index = 1, #Arg1 do
					local V3 = Arg1[Index]
					if (not V2 or V3.distance <= V2.distance) then
						V2 = V3
					end
				end
				if (V2 and V) then
					local T = {}
					Fn3(T, V2)
					for Index2 = 1, #T do
						if (T[Index2].distance < V2.distance) then
							V2 = T[Index2]
						end
					end
				end
				return V2
			end
			if (V) then
				for Index3 = 1, #Arg1 do
					Fn3(Arg1, Arg1[Index3])
				end
			end
			Sort(Arg1, Fn)
			local Position = Client.scanOrigin and Client.scanOrigin.Position or Camera.CFrame.Position
			for Index4 = 1, #Arg1 do
				local V4 = Arg1[Index4]
				if (Cast(Position, V4.vector3, V4.character)) then
					return V4
				end
				if (Value3) then
					local V5 = CanHitscan(Position, V4.vector3, V4.character)
					if (V5) then
						V4.hitscanned = true
						V4.hitPosition = V5
						return V4
					end
				end
				if (Value2) then
					local V6, V7 = CanManipulate(V4.vector3, V4.character, Value3)
					if (V6) then
						V4.manipulated = true
						V4.origin = V6
						V4.hitscanned = V7 ~= nil
						V4.hitPosition = V7
						return V4
					end
				end
			end
			local V8 = Arg1[1]
			if (not Value and V8) then
				V8.notVisible = true
				return V8
			end
			return nil
		end
		Arg1.getClosestPlayer = function()
			if (not Flags.silentAim_toggle.value) then
				Target.silent = {}
				return
			end
			BeginTick()
			local Radius = Drawings.silent.fov.Radius
			local T = {}
			Fn4(T, Radius)
			local V = Fn6(T)
			if (not V and Flags.silentAim_targetNpcs.value) then
				T = {}
				Fn5(T, Radius)
				V = Fn6(T)
			end
			if (not V) then
				Target.silent = {}
				return
			end
			if (not V.vector2) then
				V.vector2 = World2viewport(V.vector3)
			end
			Target.silent = V
		end
	end
end)()
local V46 = (function()
	return function(Arg1)
		local Items = Arg1.gameModules.items
		local Toolinfo = Arg1.gameModules.toolinfo
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
			local V, V2 = Pcall(Fetch.Invoke, Fetch)
			if (not V or Type(V2) ~= "table") then
				return
			end
			local Toolbar = V2.Toolbar
			local Attribute = ViewmodelController:GetAttribute("Equipped")
			if (Type(Toolbar) ~= "table" or not Attribute) then
				return
			end
			local V3 = Toolbar[Attribute]
			local V4 = Type(V3) == "table" and Items[V3.ID]
			if (Type(V4) ~= "table") then
				return
			end
			local Name = V4.Name
			local V5 = Name and Toolinfo[Name]
			if (Type(V5) ~= "table") then
				return
			end
			return V5, V4
		end
	end
end)()
local V47 = (function()
	return function(Arg1)
		local Client = Arg1.client
		local New = Vector3_2.new
		local V = 0.016666666666666666
		local function Fn(Arg1, Arg2, Arg3, Arg4, Arg5, Arg6)
			local V2 = Arg2 * Arg3
			local V3 = Arg1
			local V4 = 0
			local T = {{pos = Arg1, vel = V2, traveled = 0}}
			for Index = 1, Arg6 do
				local V5 = Min(V4 + Arg3 * V, Arg5) - V4
				local V6 = V3 + V2.Unit * V5
				V4 = V4 + V5
				V2 = V2 - New(0, 196.2 * Arg4, 0) * V
				V3 = V6
				T[Index + 1] = {pos = V3, vel = V2, traveled = V4}
				if (Abs(Arg5 - V4) <= 1) then
					break
				end
			end
			return T
		end
		local function Fn2(Arg1, Arg2, Arg3, Arg4, Arg5)
			for Index = 2, #Arg2 do
				local V2 = Arg2[Index]
				local V3 = Arg2[Index - 1]
				local Magnitude = New(V2.pos.X - Arg1.X, 0, V2.pos.Z - Arg1.Z).Magnitude
				if (Magnitude >= Arg3) then
					local Magnitude2 = New(V3.pos.X - Arg1.X, 0, V3.pos.Z - Arg1.Z).Magnitude
					local V4 = (Arg3 - Magnitude2) / Max(Magnitude - Magnitude2, 0.0001)
					local V5 = V4 * V
					local Vel = V3.vel
					local V6 = Min(V3.traveled + Arg4 * V5, Arg5) - V3.traveled
					local V7 = V3.pos + Vel.Unit * V6
					local V8 = (Index - 2 + V4) * V
					return V7.Y, V8
				end
			end
			return nil, nil
		end
		return function(Arg1, Arg2, _)
			if not Client.toolInfo then
				return Arg2
			end
			local V = RawGet(Client.toolInfo, "Bullet")
			if Type(V) ~= "table" then
				return Arg2
			end
			local V2 = RawGet(V, "Gravity") or 0
			local V3 = RawGet(V, "Speed") or math.huge
			if Type(V2) ~= "number" or Type(V3) ~= "number" then
				return Arg2
			end
			local V4 = Arg2 - Arg1
			local V5 = New(V4.X, 0, V4.Z)
			local Magnitude = V5.Magnitude
			local Unit = V5.Unit
			if not (Magnitude < 0.001) then
				local V6 = Min(Ceil(Magnitude / V3 * 4 / 0.016666666666666666), 10000)
				local V7 = -V3
				local V8 = V3
				local V9 = Unit
				;(function()
					for Index = 1, 64 do
						local V = (V7 + V8) / 2
						local Unit2 = New(Unit.X, V / V3, Unit.Z).Unit
						local V4 = Fn(Arg1, Unit2, V3, V2, 9000000000, V6)
						local V5, V10 = Fn2(Arg1, V4, Magnitude, V3, 9000000000)
						if (V5 == nil) then
							V9 = (Arg2 - Arg1).Unit
							break
						end
						local V11 = V5 - Arg2.Y
						if (Abs(V11) < 0.001) then
							V9 = Unit2
							break
						end
						if (V11 > 0) then
							V8 = V
						else
							V7 = V
						end
						V9 = Unit2
					end
				end)()
				local V10, V11 = Fn2(Arg1, Fn(Arg1, V9, V3, V2, 9000000000, V6), Magnitude, V3, 9000000000)
				return Arg1 + V9 * 9999, V11 or Magnitude / V3
			end
			return Arg2, Abs(V4.Y) / V3
		end
	end
end)()
local V48 = (function()
	local Spawn = Task.spawn
	local Wait = Task.wait
	local V = T[4]
	return function(Arg1)
		local Flags = Arg1.flags
		local Moderators = Arg1.moderators
		local Window = Arg1.window
		local PlayerESP = Arg1.playerESP
		local Localplayer = Arg1.localplayer
		local StaffDetectorHandler = nil
		StaffDetectorHandler = function(Arg1, Arg2)
			if (not (Flags.staffDetector_toggle.value and Arg1 and Arg1.Parent)) then
				return
			end
			local V2, V3 = Pcall(Arg1.GetRankInGroupAsync, Arg1, V.staff.GROUP_ID)
			if (not V2) then
				Spawn(function()
					Wait(0.5)
					StaffDetectorHandler(Arg1, Arg2)
				end)
				return
			elseif (V3 >= V.staff.MIN_RANK) then
				if (not Find(Moderators, Arg1)) then
					Insert(Moderators, Arg1)
				end
				Window:notify(Format(Arg2 or "Staff Detector: %* has joined your game!", Arg1.DisplayName), 5)
			end
		end
		Arg1.staffDetectorHandler = StaffDetectorHandler
		Arg1.playerAdded = function(Arg1)
			StaffDetectorHandler(Arg1)
			PlayerESP.new(Arg1)
		end
		Arg1.playerRemoved = function(Arg1)
			if (CompareInstances(Arg1, Localplayer)) then
				Pcall(SetFFlag, "FRMMinGrassDistance", "100")
				Pcall(SetFFlag, "FRMMaxGrassDistance", "290")
				return
			end
			local V = Find(Moderators, Arg1)
			if (V) then
				Remove(Moderators, V)
				Window:notify(Format("Staff Detector: %* has left your game!", Arg1.DisplayName), 5)
			end
			PlayerESP.remove(Arg1)
		end
	end
end)()
local V49 = (function()
	local New = Vector3_2.new
	local YAxis = Vector3_2.yAxis
	local New2 = CFrame2.new
	local FromOrientation = CFrame2.fromOrientation
	local V = T[4]
	return function(Arg1)
		local Flags = Arg1.flags
		local Client = Arg1.client
		local Target = Arg1.target
		local KeyHandlers = Arg1.keyHandlers
		local RunService = Arg1.services.runService
		local Camera = Arg1.services.camera
		local ProtectedCall = Arg1.protectedCall
		Arg1.flyHandler = function(_)
			if (not Flags.fly_toggle.value) then
				return
			elseif (Flags.freecam_toggle.value) then
				if (not Arg1.localrootpart.Anchored) then
					Arg1.localrootpart.Anchored = true
				end
				return
			end
			local V = New(0, 0, 0)
			local CFrame2 = Arg1.localrootpart.CFrame
			local V2, V3, V4 = CFrame2:ToOrientation()
			CFrame2 = New2(CFrame2.Position) * FromOrientation(0, V3, V4)
			local V5 = "W"
			local V6 = "S"
			local V7 = "D"
			local V8 = "A"
			local V9 = "C"
			local V10 = "Space"
			do
				if (KeyHandlers.W) then
					V += CFrame2.LookVector
				end
				if (KeyHandlers.S) then
					V -= CFrame2.LookVector
				end
				if (KeyHandlers.D) then
					V += CFrame2.RightVector
				end
				if (KeyHandlers.A) then
					V -= CFrame2.RightVector
				end
				if (KeyHandlers.Space) then
					V += YAxis
				end
				if (KeyHandlers.C) then
					V -= YAxis
				end
			end
			if (V.Magnitude == 0) then
				Arg1.localrootpart.Anchored = true
				return
			elseif (Arg1.localrootpart.Anchored) then
				Arg1.localrootpart.Anchored = false
			end
			V = V.Unit * New(Flags.fly_speed.value, 16, Flags.fly_speed.value)
			if (V ~= V) then
				V = New()
			end
			Arg1.localrootpart.Velocity = V
		end
		Arg1.speedHandler = function(_)
			if (not Flags.speedHack_toggle.value) then
				return
			end
			local MoveDirection = Arg1.localhumanoid.MoveDirection
			local Velocity = Arg1.localrootpart.Velocity
			local Value = Flags.speedHack_amount.value
			Arg1.localrootpart.Velocity = New(MoveDirection.X * Value, Velocity.Y, MoveDirection.Z * Value)
		end
		Arg1.autoReloadHandler = function(Arg1)
			Client.reloadTime = Client.reloadTime + Arg1
			if not Client.fireRemote or (not Flags.autoReload_toggle.value or not (0.3 <= Client.reloadTime) or not Client.toolInfo) then
				return
			end
			local V2 = RawGet(Client.toolInfo, "Weapon")
			local V3 = RawGet(Client.itemInfo, "BaseMaxAmmo")
			local V4 = Type(V2) == "table" and RawGet(V2, "RPM")
			if Type(V4) ~= "number" or not RawGet(V2, "ReloadDuration") or Type(V3) ~= "number" then
				return
			end
			if V4 / 60 / (Flags.gunMods_firerateMultiplier.value * 1.15) / 10 <= Client.reloadTime then
				Client.reloadTime = 0
				ProtectedCall(Client.fireRemote, "Fire", V.assetContainer.FIRE_KEY, V.assetContainer.RELOAD_KEY, Workspace:GetServerTimeNow(), "None")
			end
		end
		Arg1.flingTargetHandler = false
		Arg1.desyncHandler = function(_)
			local Velocity = Arg1.localrootpart.Velocity
			local CFrame2 = Arg1.localrootpart.CFrame
			local V = Flags.antiaim_toggle.value and CFrame2 + New(0, -Flags.antiaim_depth.value, 0)
			local V2 = (Flags.noFallDamage_toggle.value and Velocity.Magnitude > 1 or Flags.fly_toggle.value) and New(0, 16384, 0)
			if (V2) then
				Arg1.localrootpart.Velocity = V2
			end
			if (V) then
				Client.rootCFrame = CFrame2
				Arg1.localrootpart.CFrame = V
			else
				Client.rootCFrame = nil
			end
			RunService.PreRender:Wait()
			if (V2) then
				if (Velocity.Magnitude > 80 and Flags.noFallDamage_toggle.value) then
					Velocity = New(0, 0, 0)
				end
				Arg1.localrootpart.Velocity = Velocity
			end
			if (V) then
				Arg1.localrootpart.CFrame = CFrame2
			end
		end
		Arg1.freecamHandler = function(Arg1_2)
			if (not Arg1.localrootpart or not Flags.freecam_toggle.value) then
				return
			end
			SetHiddenProperty(Arg1.localrootpart, "NetworkIsSleeping", true)
			local V = New(0, 0, 0)
			local CFrame2 = Camera.CFrame
			local V2 = "W"
			local V3 = "S"
			local V4 = "D"
			local V5 = "A"
			local V6 = "C"
			local V7 = "Space"
			do
				if (KeyHandlers.W) then
					V += CFrame2.LookVector
				end
				if (KeyHandlers.S) then
					V -= CFrame2.LookVector
				end
				if (KeyHandlers.D) then
					V += CFrame2.RightVector
				end
				if (KeyHandlers.A) then
					V -= CFrame2.RightVector
				end
				if (KeyHandlers.Space) then
					V += YAxis
				end
				if (KeyHandlers.C) then
					V -= YAxis
				end
			end
			if (V.Magnitude <= 0) then
				return
			end
			local V8 = Flags.freecam_speed.value * Arg1_2
			if (KeyHandlers.LeftShift) then
				V8 *= 2.5
			end
			Arg1.localrootpart.CFrame = Arg1.localrootpart.CFrame + (V.Unit * V8)
		end
	end
end)()
local V50 = (function()
	local Spawn = Task.spawn
	local LastAiredUpvalue = T[4].viewmodelController.LAST_AIRED_UPVALUE
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
		local Debug_setupvalue = Arg1.debug_setupvalue
		Arg1.rendersteppedLoop = function(Arg1)
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
					local V = false
					if (Player) then
						if (Flags.targetHud_toggle.value) then
							local V2 = PlayerESP.playerCache[Player] or NpcESP.npcCache[Player]
							local Current = V2 and V2.current
							local V3 = V2 and (V2.health or Current and Current.health)
							local V4 = V2 and (V2.maxHealth or Current and Current.maxHealth)
							TargetHUD:setName(Player.Name)
							TargetHUD:setDistance(math.floor((Target.silent.vector3 - Camera.CFrame.Position).Magnitude))
							TargetHUD:setWeapon(Current and Current.weapon or "none")
							TargetHUD:setHealth(V3 or 0, V4 or 100)
							TargetHUD:toggle(true)
						end
						if (Flags.silentAim_snapline.value) then
							V = true
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
					Drawings.silent.snapline.Visible = V
				end
			end
			if (Flags.alwaysShoot_toggle.value) then
				local V5 = Client.mouseButton1DownFunc and Getupvalues(Client.mouseButton1DownFunc)[LastAiredUpvalue]
				if (Type(V5) == "number") then
					Debug_setupvalue(Client.mouseButton1DownFunc, LastAiredUpvalue, -0.1)
				end
			end
			FreecamHandler(Arg1)
		end
		Arg1.heartbeatLoop = function(Arg1_2)
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
	end
end)()
local V51 = (function()
	local V = T[3]
	local V2 = (function()
		local V = T[2]
		local function Fn(Arg1)
			if Type(Arg1) ~= "function" or Info(Arg1, "s") == "[C]" then
				return false
			end
			for _, Value in Getupvalues(Arg1) do
				if Type(Value) ~= "function" or not Find2(Info(Arg1, "s"), "AssetContainer") then
					continue
				end
				return true
			end
			return false
		end
		return function(Arg1)
			local GameModules = Arg1.gameModules
			for Key, Value in {
				[GameModules.raycastUtil] = {"Raycast"},
				[GameModules.vfxModule] = {"CreateProjectile", "CheckCameraDistance"},
				[GameModules.soundModule] = {"ToggleFootstep"},
			} do
				for _, Value2 in Value do
					if not Fn(RawGet(Key, Value2)) then
						continue
					end
					local Kick = V.kick
					local V2 = ("Burmalda.hook error (AC_%*)"):format(Value2)
					Kick(V2)
					return false
				end
			end
			return true
		end
	end)()
	local V3 = (function()
		local V = T[8]
		return function(Arg1, Arg2)
			local Flags = Arg1.flags
			local DeepClone = V.deepClone
			Arg2.old_CameraShake = nil
			Arg2.CameraShake = function(...)
				local T = {...}
				if Type(T[2]) == "number" then
					local V = Flags.gunMods_recoilPercentage.value / 100
					T[2] = T[2] * V
					if Type(T[1]) == "table" then
						T[1] = DeepClone(T[1], V)
						local V2 = RawGet(T[1], "Strength")
						if V2 and TypeOf(V2) == "Vector3" then
							RawSet(T[1], "Strength", V2 * V)
						end
					end
					return Arg2.old_CameraShake(Unpack2(T, 1, Select("#", ...)))
				else
					if not Flags.noMeleeShake_toggle.value then
						return Arg2.old_CameraShake(...)
					end
					return
				end
			end
		end
	end)()
	local V4 = (function()
		local New = CFrame2.new
		local V = T[2]
		local CreateProjectileLevel = T[4].viewmodelController.CREATE_PROJECTILE_LEVEL
		return function(Arg1, Arg2)
			local Target = Arg1.target
			local VfxModule = Arg1.gameModules.vfxModule
			local Debug_isvalidlevel = Arg1.debug_isvalidlevel
			local Kick = V.kick
			local V2 = Clone(VfxModule)
			local CheckCameraDistance = V2.CheckCameraDistance
			V2.CheckCameraDistance = function(...)
				if Info(CreateProjectileLevel, "s") == "[C]" or not Debug_isvalidlevel(CreateProjectileLevel) then
					Kick("Burmalda.hook error (4)")
					return CheckCameraDistance(...)
				end
				if not Find2(Info(CreateProjectileLevel + 1, "s"), "ViewmodelController") or Info(CreateProjectileLevel, "n") ~= "CreateProjectile" then
					return CheckCameraDistance(...)
				end
				local V = false
				for _, Value in Getstack(CreateProjectileLevel) do
					if Type(Value) ~= "table" or not RawGet(Value, "Position") then
						continue
					end
					V = Value
					break
				end
				if not V then
					Kick("Burmalda.hook error (5)")
					return CheckCameraDistance(...)
				end
				if Target.silent.origin then
					local Origin = Target.silent.origin
					local LookVector = New(Origin, Target.silent.lastShot or Target.silent.hitPosition or Target.silent.vector3).LookVector
					RawSet(V, "PositionFirst", Origin)
					RawSet(V, "Position", Origin)
					RawSet(V, "Direction", LookVector)
					RawSet(V, "DirectionFirst", LookVector)
					return CheckCameraDistance(...)
				end
				return CheckCameraDistance(...)
			end
			Arg2.vfxModule = V2
		end
	end)()
	local V5 = (function()
		local New = Vector3_2.new
		local New2 = CFrame2.new
		local FromOrientation = CFrame2.fromOrientation
		local Angles = CFrame2.Angles
		local V = T[8]
		local V2 = T[2]
		local V3 = T[3]
		local V4 = T[4]
		local MouseRaycastCallerLevel = V4.viewmodelController.MOUSE_RAYCAST_CALLER_LEVEL
		local TorsoOffsetY = V4.viewmodelController.TORSO_OFFSET_Y
		local MouseRaycastIgnoreArg = V4.raycastUtil.MOUSE_RAYCAST_IGNORE_ARG
		local ShootIgnoreListLength = V4.raycastUtil.SHOOT_IGNORE_LIST_LENGTH
		local RaycastFilterFnArg = V4.raycastUtil.RAYCAST_FILTER_FN_ARG
		return function(Arg1, Arg2)
			local Flags = Arg1.flags
			local Client = Arg1.client
			local Target = Arg1.target
			local Camera = Arg1.services.camera
			local Localplayer = Arg1.localplayer
			local RaycastUtil = Arg1.gameModules.raycastUtil
			local Replacemetamethod = Arg1.replacemetamethod
			local Predict = Arg1.predict
			local Debug_isvalidlevel = Arg1.debug_isvalidlevel
			local Find = V.find
			local Kick = V2.kick
			local V4 = Clone(RaycastUtil)
			local function Fn(Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7)
				local UnitRay = Localplayer:GetMouse().UnitRay
				local V, V2, V3, V4 = Arg1:Raycast(UnitRay.Origin, UnitRay.Direction * (Arg4 or 1024), Arg5 or "Blacklist", Arg3, Arg6, Arg2, Arg7)
				return V2, V, V3, V4, nil, "sigma"
			end
			local Raycast = V4.Raycast
			V4.MouseRaycast = function(...)
				local V = Select(MouseRaycastIgnoreArg, ...)
				if Type(V) ~= "table" then
					Kick("Burmalda.hook error (6)")
					return Fn(...)
				end
				if RawLen(V) ~= ShootIgnoreListLength then
					return Fn(...)
				end
				if Info(MouseRaycastCallerLevel, "s") == "[C]" or not Debug_isvalidlevel(MouseRaycastCallerLevel) then
					Kick("Burmalda.hook error (7)")
					return Fn(...)
				end
				local HitPosition = Target.silent.hitPosition or Target.silent.vector3
				if HitPosition and Random(0, 99) < Flags.silentAim_hitchance.value then
					local Origin = Target.silent.origin or Camera.CFrame.Position
					if Flags.silentAim_prediction.value then
						HitPosition = Predict(Origin, HitPosition, Target.silent.rootPart)
					end
					local V2 = nil
					for _, Value in Getstack(MouseRaycastCallerLevel) do
						if Type(Value) ~= "table" or Type(RawGet(Value, 1)) ~= "table" or Type(RawGet(RawGet(Value, 1), "Radius")) ~= "number" then
							continue
						end
						V2 = Value
						break
					end
					local V4 = V2 and RawLen(V2) or 0
					if 0 < V4 then
						local V5 = New()
						for Index = 1, V4 do
							local V6 = RawGet(V2, Index)
							local V7 = RawGet(V6, "Radius")
							local V8 = RawGet(V6, "Degree")
							V5 = V5 + Angles(Sin(V8) * V7, Cos(V8) * V7, 0).LookVector
						end
						HitPosition = Origin + (New2(Origin, HitPosition) * New2(New(), V5):Inverse()).LookVector * (HitPosition - Origin).Magnitude
					end
					Target.silent.lastShot = HitPosition
				end
				local V9 = HitPosition or Fn(...)
				local V10 = Getstack(MouseRaycastCallerLevel)
				local T = {cameraCFrame = {}, torsoCFrame = {}}
				local CFrame2 = Camera.CFrame
				local V11 = Arg1.localrootpart.CFrame * New2(0, TorsoOffsetY, 0)
				for Key, Value2 in V10 do
					if Value2 ~= CFrame2 then
						if Value2 == V11 then
							Insert(T.torsoCFrame, Key)
						end
					else
						Insert(T.cameraCFrame, Key)
					end
				end
				if #T.torsoCFrame <= 0 or #T.cameraCFrame <= 0 then
					Kick("Burmalda.hook error (8)")
					return Fn(...)
				end
				local Print = V3.print
				local V12 = ("TorsoCFrame: %*; CameraCFrame: %*"):format(#T.torsoCFrame, #T.cameraCFrame)
				Print(V12)
				if not (not Flags.bulletTp_toggle.value or (not Arg1.localrootpart or Flags.freecam_toggle.value)) then
					Pcall(SetFFlag, "S2PhysicsSenderRate", "240")
					Arg1.localrootpart.CFrame = New2(V9)
				end
				local Position = V11.Position
				local Position2 = CFrame2.Position
				if Target.silent.origin then
					local V13 = Position - Position2
					Position2 = Target.silent.origin
					Position = Position2 + V13
				end
				local V14, V15, V16 = V11:ToOrientation()
				local V17, V18 = New2(Position, V9):ToOrientation()
				local V19 = New2(Position) * FromOrientation(V14, V18, V16)
				local V20 = New2(Position2, V9)
				local PointToObjectSpace = V20.PointToObjectSpace
				local V21 = nil
				V21 = Replacemetamethod(V19, "__namecall", NewCClosure(function(...)
					local V, V2, V3 = ...
					if GetNamecallMethod() == "PointToObjectSpace" then
						local V4 = V11:PointToObjectSpace(V2)
						local V5 = PointToObjectSpace(V19, Position2 + V20.LookVector * V4.Magnitude)
						return V5
					end
					return V21(...)
				end))
				for _, Value3 in T.cameraCFrame do
					if TypeOf(Getstack(MouseRaycastCallerLevel, Value3)) == "CFrame" then
						Setstack(MouseRaycastCallerLevel, Value3, V20)
					end
				end
				for _, Value4 in T.torsoCFrame do
					if TypeOf(Getstack(MouseRaycastCallerLevel, Value4)) == "CFrame" then
						Setstack(MouseRaycastCallerLevel, Value4, V19)
					end
				end
				return V9
			end
			V4.Raycast = function(...)
				local V = Select(RaycastFilterFnArg, ...)
				if Client.hitMeleeFilter then
					if not RawEqual(Client.hitMeleeFilter, V) then
						return Raycast(...)
					end
				else
					if Type(V) ~= "function" or Info(V, "s") == "[C]" or not Find(Getupvalues(V), "HitMelee") then
						return Raycast(...)
					end
					Client.hitMeleeFilter = V
				end
				local T = {Raycast(...)}
				local V2 = TypeOf(T[1]) == "Instance" and T[1]
				if Flags.alwaysCriticals_toggle.value and V2 then
					local Parent = V2.Parent
					local V3 = Parent and (Parent:FindFirstChild("TreeX") or Parent:FindFirstChild("NodeSpark"))
					T[1] = V3 and V3:FindFirstChild("Main") or T[1]
				end
				return Unpack2(T)
			end
			Arg2.raycastUtil = V4
		end
	end)()
	local V6 = (function()
		local V = T[8]
		local V2 = T[3]
		local ViewmodelController = T[4].viewmodelController
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
			local Toolinfo = Arg1.gameModules.toolinfo
			local CheckType = Arg1.checkType
			local function Fn()
				return Flags.gunMods_spreadPercentage.value <= 50 or Target.silent.vector3 ~= nil and (Flags.silentAim_instantHit.value or Flags.silentAim_hitscan.value)
			end
			local T = {}
			local function Fn2(Arg1)
				if not T[Arg1] then
					T[Arg1] = true
					local Print = V2.print
					local V = ("fake ads: active for %*"):format(Arg1)
					Print(V)
				end
			end
			local function DeepCopy(Arg1)
				local V
				for Index = SpreadCallerLevelMin, SpreadCallerLevelMax do
					local V2 = Info(Index, "s")
					if (V2 and Find2(V2, "ViewmodelController")) then
						V = Index
						break
					end
				end
				local V3 = V and Getstack(V)
				if (not V3) then
					return false
				end
				for Index2 = 0, RegisterSlack do
					if (Arg1 == "ShootingExtra") then
						if (not V3[ShootAimingRegister + Index2] and V3[ShootRecoilMultRegister + Index2] == 1 and V3[ShootSpreadKeyRegister + Index2] == "Hip") then
							Setstack(V, ShootAimingRegister + Index2, true)
							Fn2(Arg1)
							return true
						end
					elseif (V3[HeartbeatSpreadKeyRegister + Index2] == "Hip" and V3[HeartbeatStateKeyRegister + Index2] == Arg1 and Type(V3[HeartbeatAttachmentMultRegister + Index2]) == "number" and Type(V3[HeartbeatAmmoStatsRegister + Index2]) == "table" and Type(V3[HeartbeatAmmoMultRegister + Index2]) == "number") then
						local V4 = 0
						for _, Value in Getupvalues(Info(V, "f")) do
							if (Type(Value) == "table" and (Type(RawGet(Value, "HipSpreadMult")) == "number" or Type(RawGet(Value, "AimSpreadMult")) == "number")) then
								V4 = RawGet(Value, "AimSpreadMult") or 0
								break
							end
						end
						Setstack(V, HeartbeatAttachmentMultRegister + Index2, 1 + V4)
						Setstack(V, HeartbeatAmmoMultRegister + Index2, RawGet(V3[HeartbeatAmmoStatsRegister + Index2], "AimSpreadMult") or 1)
						Fn2(Arg1)
						return true
					end
				end
				return false
			end
			local function Fn3(Arg1)
				local Spread = Arg1.Spread
				if Type(Spread) ~= "table" or (Type(Spread.Aiming) ~= "table" or Type(Spread.Hip) ~= "table") then
					return
				end
				local Aiming = Spread.Aiming
				local Hip = Spread.Hip
				local function OnIndex(_, Arg2)
					local V = Aiming[Arg2]
					if (Type(V) ~= "number") then
						return V
					end
					if (Fn() or Target.silent.vector3) then
						return V
					end
					return V * (Flags.gunMods_spreadPercentage.value / 100)
				end
				Spread.Hip = SetMetatable({}, {
					__metatable = "",
					__index = function(_, Arg2)
						local V = Hip[Arg2]
						if (Type(V) ~= "number") then
							return V
						end
						if (Fn()) then
							return DeepCopy(Arg2) and Aiming[Arg2] or V
						elseif (Target.silent.vector3) then
							return V
						end
						return V * (Flags.gunMods_spreadPercentage.value / 100)
					end,
				})
				Spread.Aiming = SetMetatable({}, {__metatable = "", __index = OnIndex})
			end
			local function Fn4(Arg1)
				local Recoil = Arg1.Recoil
				if Type(Recoil) ~= "table" or Type(Recoil.Camera) ~= "table" then
					return
				end
				local RecoilStart = Recoil.Camera.RecoilStart
				local RecoilFinish = Recoil.Camera.RecoilFinish
				local Y = Recoil.Camera.Shake.Y
				local X = Recoil.Camera.Shake.X
				if not CheckType(RecoilStart, "function") or (not CheckType(RecoilFinish, "function") or not CheckType(Y, "table") or not CheckType(X, "table")) then
					return
				end
				local function OnIndex(_, Arg2)
					local V = Y[Arg2]
					if (Type(V) == "number") then
						return V * (Flags.gunMods_recoilPercentage.value / 100)
					end
					return V
				end
				Recoil.Camera.RecoilStart = function(...)
					local T = {RecoilStart(...)}
					for Key, Value in T do
						if (Type(Value) == "number") then
							T[Key] = Value * (Flags.gunMods_recoilPercentage.value / 100)
						end
					end
					return Unpack2(T)
				end
				Recoil.Camera.RecoilFinish = function(...)
					local T = {RecoilFinish(...)}
					for Key, Value in T do
						if (Type(Value) == "number") then
							T[Key] = Value * (Flags.gunMods_recoilPercentage.value / 100)
						end
					end
					return Unpack2(T)
				end
				Recoil.Camera.Shake.X = SetMetatable({}, {
					__metatable = "",
					__index = function(_, Arg2)
						local V = X[Arg2]
						if (Type(V) == "number") then
							return V * (Flags.gunMods_recoilPercentage.value / 100)
						end
						return V
					end,
				})
				Recoil.Camera.Shake.Y = SetMetatable({}, {__metatable = "", __index = OnIndex})
			end
			local function Fn5(Arg1)
				local Weapon = Arg1.Weapon
				if Type(Weapon) == "table" then
					Arg1.Weapon = SetMetatable({}, {
						__metatable = "",
						__index = function(_, Arg2)
							local V = Weapon[Arg2]
							if (Arg2 == "Auto" and Flags.fullyAutomatic_toggle.value) then
								return true
							elseif (Arg2 == "RPM" or Arg2 == "BurstRPM") and Type(V) == "number" then
								return V * Flags.gunMods_firerateMultiplier.value
							elseif (Arg2 == "Cooldown" and Arg1.Melee and Flags.increaseMeleeSpeed_toggle.value and Type(V) == "number") then
								return V / Flags.increaseMeleeSpeed_amount.value
							end
							return V
						end,
					})
					return
				end
			end
			local function Fn6(Arg1)
				local MeleeChecks = Type(Arg1.Melee) == "table" and Arg1.Melee.MeleeChecks
				if Type(MeleeChecks) ~= "table" then
					return
				end
				for _, MeleeCheck in MeleeChecks do
					if Type(MeleeCheck) ~= "table" or Type(MeleeCheck[2]) ~= "table" then
						continue
					end
					local V = MeleeCheck[2]
					for Key, Value in V do
						if Type(Value) == "table" then
							V[Key] = SetMetatable({}, {
								__metatable = "",
								__index = function(_, Arg2)
									local V = Value[Arg2]
									if (Arg2 == "Range" and Flags.increaseMeleeRange_toggle.value and Type(V) == "number") then
										return V * Flags.increaseMeleeRange_amount.value
									end
									return V
								end,
							})
						end
					end
				end
			end
			local V3 = V.deepClone(Toolinfo)
			for _, Value in V3 do
				if Type(Value) == "table" then
					Fn3(Value)
					Fn4(Value)
					Fn5(Value)
					Fn6(Value)
				end
			end
			Arg2.toolInfo = V3
		end
	end)()
	local V7 = (function()
		local V = T[3]
		local RaycastFiltersArg = T[4].raycastUtil.RAYCAST_FILTERS_ARG
		return function(Arg1)
			local Flags = Arg1.flags
			local Client = Arg1.client
			local Target = Arg1.target
			local Camera = Arg1.services.camera
			local RaycastUtil = Arg1.gameModules.raycastUtil
			local VfxModule = Arg1.gameModules.vfxModule
			local Replacemetamethod = Arg1.replacemetamethod
			local Debug_setupvalue = Arg1.debug_setupvalue
			local TempInstance = Arg1.tempInstance
			local V2 = Clone(RaycastUtil)
			local Raycast = V2.Raycast
			V2.Raycast = function(...)
				local V2 = Select(RaycastFiltersArg, ...)
				if Type(V2) ~= "table" or RawGet(V2, 1) ~= Arg1.localcharacter then
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
						local Roll = Random(0, 99)
						if Flags.silentAim_hitchance.value <= Roll then
							return Raycast(...)
						end
						local V3 = RaycastParams2.new()
						V3.FilterType = Enum2.RaycastFilterType.Include
						V3.FilterDescendantsInstances = {Instance2}
						local V4 = Workspace:Raycast(Position, Vector3_2 - Position, V3)
						if V4 then
							return Instance2, V4.Position, V4.Normal, Instance2.Material
						end
						return Raycast(...)
					end
					return Raycast(...)
				else
					V.print("overwriting hitpos")
					local V5 = RaycastParams2.new()
					V5.FilterType = Enum2.RaycastFilterType.Include
					V5.FilterDescendantsInstances = {Instance2}
					local V6 = Workspace:Raycast(Position, Vector3_2 - Position, V5)
					local V7 = Target.silent.hitPosition - Target.silent.vector3
					if V6 then
						local V8 = nil
						V8 = Replacemetamethod(Instance2, "__index", NewCClosure(function(...)
							local V, V2, V3 = ...
							if CheckCaller() or V2 ~= "CFrame" then
								return V8(...)
							end
							Replacemetamethod(Instance2, "__index", V8)
							return V8(...) + V7
						end))
						return Instance2, V6.Position + V7, V6.Normal, Instance2.Material
					end
					return Raycast(...)
				end
			end
			return function()
				for Key, Value in Getupvalues(VfxModule.CreateProjectile) do
					if Value == RaycastUtil then
						Debug_setupvalue(VfxModule.CreateProjectile, Key, V2)
					end
				end
			end
		end
	end)()
	local V8 = (function()
		local V = T[2]
		local FootstepHandlerUpvalue = T[4].stateAssetController.FOOTSTEP_HANDLER_UPVALUE
		return function(Arg1)
			local Flags = Arg1.flags
			local SoundModule = Arg1.gameModules.soundModule
			local Debug_setupvalue = Arg1.debug_setupvalue
			local Kick = V.kick
			local V2 = Clone(SoundModule)
			local ToggleFootstep = V2.ToggleFootstep
			V2.ToggleFootstep = function(...)
				if (Flags.silentWalk_toggle.value) then
					return
				end
				return ToggleFootstep(...)
			end
			return function()
				local V = GetConnections(Arg1.localhumanoid:GetPropertyChangedSignal("FloorMaterial"))[1]
				if not V or (Type(V.Function) ~= "function" or not Info(V.Function, "s"):find("StateAssetController")) then
					return
				end
				local V3 = Getupvalues(V.Function)[FootstepHandlerUpvalue]
				if Type(V3) ~= "function" or not Info(V3, "s"):find("StateAssetController") then
					return Kick("Burmalda.hook error (14)")
				end
				for Key, Value in Getupvalues(V3) do
					if Value ~= SoundModule then
						continue
					end
					Debug_setupvalue(V3, Key, V2)
					break
				end
			end
		end
	end)()
	local V9 = (function()
		local Wait = Task.wait
		local V = T[8]
		local V2 = T[2]
		local V3 = T[4]
		local EokaDurationRollLength = V3.viewmodelController.EOKA_DURATION_ROLL_LENGTH
		local EokaSecondRollLength = V3.viewmodelController.EOKA_SECOND_ROLL_LENGTH
		return function(Arg1, Arg2)
			local Flags = Arg1.flags
			local Client = Arg1.client
			local RunService = Arg1.services.runService
			local Toolinfo = Arg1.gameModules.toolinfo
			local RaycastUtil = Arg1.gameModules.raycastUtil
			local VfxModule = Arg1.gameModules.vfxModule
			local Debug_setupvalue = Arg1.debug_setupvalue
			local Find = V.find
			local Kick = V2.kick
			local function Fn(Arg1)
				local V = nil
				local function Fn(Tbl)
					for _, Value in Tbl do
						if Type(Value) ~= "function" or (not Find2(Info(Value, "s"), "ViewmodelController") or not Find(Getconstants(Value), "cancel") or Type(GetFenv(Value)) ~= "table" or RawGet(GetFenv(Value), "script") ~= Arg1) then
							continue
						end
						if V then
							return Kick("Burmalda.hook error (11)")
						end
						V = Value
						Client.mouseButton1DownFunc = Value
					end
				end
				local function Fn2(Tbl)
					for _, Value in Tbl do
						if Type(Value) ~= "function" or not Find2(Info(Value, "s"), "AssetContainer") then
							continue
						end
						Client.fireRemote = Value
						break
					end
				end
				;(function()
					local Gc = GetGc()
					for Index = 1, #Gc do
						local V = Gc[Index]
						if (Type(V) ~= "function" or not Find2(Info(V, "s"), "ViewmodelController")) then
							continue
						end
						local V2 = Getupvalues(V)
						local V3 = Getconstants(V)
						if (Find(V3, "DebugEnableVMMovement")) then
							Fn(V2)
							continue
						end
						if (not Client.fireRemote) then
							Fn2(V2)
						end
					end
				end)()
				return V
			end
			local function Fn2(Arg1, Arg2_2)
				local V
				repeat
					Wait()
					V = GetSenv(Arg1)
				until RawGet(V, "ChooseRandom")
				if Type(V) ~= "table" then
					Kick("Burmalda.hook error (9)")
					return false
				end
				local V2 = RawGet(V, "ChooseRandom")
				if Type(V2) ~= "function" or Type(Arg2_2) ~= "function" then
					Kick("Burmalda.hook error (10)")
					return false
				end
				RawSet(V, "ChooseRandom", function(...)
					local V = ...
					if Type(V) ~= "table" or not Flags.instantEoka_toggle.value then
						return V2(...)
					end
					local V3 = RawLen(V)
					return V3 == EokaDurationRollLength and 0.25 or V3 == EokaSecondRollLength and 0 or V2(...)
				end)
				local Count = 0
				for Key, Value in Getupvalues(Arg2_2) do
					if not (Type(Value) ~= "function" or Info(Value, "s") == "[C]" or not Find(Getconstants(Value), "Damper")) then
						Arg2.old_CameraShake = Value
						Count = Count + 1
						Debug_setupvalue(Arg2_2, Key, Arg2.CameraShake)
					end
					if Value ~= VfxModule then
						if Value ~= RaycastUtil then
							if Value == Toolinfo then
								Count = Count + 1
								Debug_setupvalue(Arg2_2, Key, Arg2.toolInfo)
							end
						else
							Count = Count + 1
							Debug_setupvalue(Arg2_2, Key, Arg2.raycastUtil)
						end
					else
						Count = Count + 1
						Debug_setupvalue(Arg2_2, Key, Arg2.vfxModule)
					end
				end
				;(function()
					local V = nil
					for _, Value in GetConnections(RunService.Heartbeat) do
						local Function = Value.Function
						if not Function or RawGet(GetFenv(Function), "script") ~= Arg1 then
							continue
						end
						V = Function
						break
					end
					if not V then
						return Kick("Internal Error - Failed to intercept character")
					end
					for Key, Value2 in Getupvalues(V) do
						if Value2 ~= Toolinfo then
							continue
						end
						Debug_setupvalue(V, Key, Arg2.toolInfo)
						break
					end
				end)()
				return true
			end
			local function Fn3(_, Arg2)
				local V = Toolinfo[Arg2]
				local V2 = Type(V) == "table" and RawGet(V, "Weapon")
				if (Type(V2) ~= "table") then
					return V
				end
				local V3 = Clone(V2)
				local V4 = Clone(V)
				V4.Weapon = V3
				if (Flags.instantEquip_toggle.value) then
					V3.EquipAnimSpeed = math.huge
				end
				return V4
			end
			local function Fn4(Arg1)
				for _, Value in GetConnections(Arg1.Event) do
					local Function = Value.Function
					if not Function or Info(Function, "s") == "[C]" then
						continue
					end
					for _, Value2 in Getupvalues(Function) do
						if Type(Value2) ~= "function" or (Info(Value2, "s") == "[C]" or not Find(Getconstants(Value2), "EquipAnimSpeed")) then
							continue
						end
						return Value2
					end
				end
				return nil
			end
			local function Fn5(Arg1)
				local V = Fn4(Arg1)
				if not V then
					Kick("Burmalda.hook error (12)")
					return false
				end
				for Key, Value in Getupvalues(V) do
					if Value ~= Toolinfo then
						continue
					end
					Debug_setupvalue(V, Key, SetMetatable({}, {__index = Fn3}))
					break
				end
				return true
			end
			return function(Arg1, Arg2)
				local V = Fn(Arg1)
				if Fn2(Arg1, V) then
					return Fn5(Arg2)
				end
				return false
			end
		end
	end)()
	local V10 = (function()
		local V = T[2]
		local EquipArmorHandlerUpvalue = T[4].inventoryController.EQUIP_ARMOR_HANDLER_UPVALUE
		return function(Arg1)
			local Flags = Arg1.flags
			local RunService = Arg1.services.runService
			local MathHuge = Arg1.const.MATH_HUGE
			local Replacemetamethod = Arg1.replacemetamethod
			local Debug_setupvalue = Arg1.debug_setupvalue
			local Kick = V.kick
			return function(Instance3)
				local V = GetConnections(Instance3:WaitForChild("EquipArmor", MathHuge).Event)[1]
				if not V or (Type(V.Function) ~= "function" or not Info(V.Function, "s"):find("InventoryController")) then
					Kick("Burmalda.hook error (15)")
					return false
				end
				local V2 = Getupvalues(V.Function)[EquipArmorHandlerUpvalue]
				if Type(V2) ~= "function" or not Info(V2, "s"):find("InventoryController") then
					Kick("Burmalda.hook error (16)")
					return false
				end
				local function Fn(_, Arg2)
					if (Arg2 ~= "Heartbeat") then
						return Kick("Burmalda.hook error (17)")
					end
					return {
						Wait = function()
							if (Flags.instantLoot_toggle.value) then
								return 10
							end
							return RunService.Heartbeat:Wait()
						end,
					}
				end
				local Part = Instance2.new("Part")
				Replacemetamethod(Part, "__index", Fn)
				for Key, Value in Getupvalues(V2) do
					if TypeOf(Value) ~= "Instance" or not CompareInstances(Value, RunService) then
						continue
					end
					Debug_setupvalue(V2, Key, Part)
					break
				end
				return true
			end
		end
	end)()
	local V11 = (function()
		local V = T[8]
		local SeatpartCallerLevel = T[4].viewmodelController.SEATPART_CALLER_LEVEL
		return function(Arg1)
			local Flags = Arg1.flags
			local Client = Arg1.client
			local Replacemetamethod = Arg1.replacemetamethod
			local Find = V.find
			return {
				hookSeatPart = function()
					if Flags.shootWhilePiloted_toggle then
						local V = nil
						V = Replacemetamethod(Arg1.localhumanoid, "__index", NewCClosure(function(...)
							local V2, V3, V4 = ...
							if V3 ~= "SeatPart" or (not Flags.shootWhilePiloted_toggle.value or not Find2(Info(SeatpartCallerLevel, "s"), "ViewmodelController")) then
								return V(...)
							end
							return nil
						end))
						return
					end
				end,
				fetchAnimationTable = function()
					for _, Value in GetConnections(Arg1.localhumanoid:GetAttributeChangedSignal("Downed")) do
						local Function = Value.Function
						if not Function or (not Find2(Info(Function, "s"), "StateAssetController") or not Find(Getconstants(Function), "DownFall")) then
							continue
						end
						for _, Value2 in Getupvalues(Function) do
							if Type(Value2) ~= "table" or not RawGet(Value2, "DownFall") then
								continue
							end
							Client.animationTable = Value2
							break
						end
						break
					end
				end,
				replayAntiaim = function()
					if not Flags.antiaim_toggle.value or not Client.animationTable then
						return
					end
					local V = RawGet(Client.animationTable, "DownFall")
					local V2 = RawGet(Client.animationTable, "Down")
					if not (TypeOf(V) == "Instance" and TypeOf(V2) == "Instance" and V.IsPlaying or V2.IsPlaying) then
						V:Play()
						V2:Play()
					end
				end,
				spoofRootCFrame = function()
					Client.rootCFrame = nil
					local V = nil
					V = Replacemetamethod(Arg1.localcharacter:FindFirstChild("HumanoidRootPart"), "__index", NewCClosure(function(...)
						local V2, V3, V4 = ...
						if CheckCaller() or V3 ~= "CFrame" or not Client.rootCFrame then
							return V(...)
						end
						local CallingScript = GetCallingScript()
						if not CallingScript or CallingScript.Name ~= "CameraModule" then
							return V(...)
						end
						return Client.rootCFrame
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
		if not V2(Arg1) then
			return
		end
		local T = {}
		V3(Arg1, T)
		V4(Arg1, T)
		V5(Arg1, T)
		V6(Arg1, T)
		local V12 = V7(Arg1)
		local V13 = V8(Arg1)
		local V14 = V9(Arg1, T)
		local V15 = V10(Arg1)
		local V16 = V11(Arg1)
		Client.characterAdded = function(Instance2)
			Arg1.localcharacter = Instance2
			Arg1.localrootpart = Instance2:WaitForChild("HumanoidRootPart", MathHuge)
			Arg1.localhumanoid = Instance2:WaitForChild("Humanoid", MathHuge)
			V16.hookSeatPart()
			V.print("parts loaded")
			local ViewmodelController = Instance2:WaitForChild("ViewmodelController", MathHuge)
			local InventoryController = Instance2:WaitForChild("InventoryController", MathHuge)
			local EquipVM = ViewmodelController:WaitForChild("EquipVM", MathHuge)
			V.print("vm loaded")
			if not V14(ViewmodelController, EquipVM) then
				return
			end
			V13()
			V16.fetchAnimationTable()
			if V15(InventoryController) then
				V16.replayAntiaim()
				V16.spoofRootCFrame()
				return
			end
		end
		Client.characterRemoving = V16.removing
		V12()
		if Arg1.localcharacter then
			Client.characterAdded(Arg1.localcharacter)
		end
		return true
	end
end)()
local V52 = (function()
	local Wait = Task.wait
	return function(Arg1)
		local Lighting = Arg1.services.lighting
		local Camera = Arg1.services.camera
		local Flags = Arg1.flags
		local LightingSpoof = Arg1.lightingSpoof
		local LightingIgnore = Arg1.lightingIgnore
		local CameraSpoof = Arg1.cameraSpoof
		local Replacemetamethod = Arg1.replacemetamethod
		local V = nil
		V = Replacemetamethod(Game:GetService("Lighting"), "__index", NewCClosure(function(...)
			local V2, V3 = ...
			if (CheckCaller() or not CompareInstances(V2, Lighting)) then
				return V(...)
			end
			local V4 = LightingSpoof[V3]
			if (V4 ~= nil) then
				return V4
			end
			return V(...)
		end))
		Lighting.Changed:Connect(function(Arg1)
			if (LightingSpoof[Arg1] == nil) then
				return
			end
			local V2 = V(Lighting, Arg1)
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
		V = nil
		V = Replacemetamethod(Workspace.CurrentCamera, "__index", NewCClosure(function(...)
			local V2, V3 = ...
			if (not CompareInstances(V2, Camera) or CheckCaller()) then
				return V(...)
			end
			local V4 = CameraSpoof[V3]
			if (V4 ~= nil) then
				return V4
			end
			return V(...)
		end))
		local V2 = nil
		V2 = Replacemetamethod(Workspace.CurrentCamera, "__newindex", NewCClosure(function(...)
			local V, V3, V4 = ...
			if (not CompareInstances(V, Camera) or CheckCaller()) then
				return V2(...)
			end
			local V5 = CameraSpoof[V3]
			if (V5 ~= nil and V4 ~= nil) then
				CameraSpoof[V3] = V4
				if (Flags.fovChanger_toggle.value or Flags.zoom_toggle.value and Flags.zoom_keybind.value) then
					return
				end
			end
			return V2(...)
		end))
	end
end)()
local V53 = (function()
	local V = (function()
		local New = Vector2_2.new
		local New2 = Vector3_2.new
		return function(Arg1)
			local Flags = Arg1.flags
			local Target = Arg1.target
			local Drawings = Arg1.drawings
			local CACHED = Arg1.CACHED
			local Camera = Arg1.services.camera
			Flags.silentAim_hitscanDistance:OnChanged(function(Arg1)
				local T = {New2(1, 0, 0).Unit, New2(-1, 0, 0).Unit, New2(0, 0, 1).Unit, New2(0, 0, -1).Unit, New2(1, 0, 1).Unit, New2(-1, 0, 1).Unit, New2(1, 0, -1).Unit, New2(-1, 0, -1).Unit, New2(0, 1, 0).Unit}
				for Index = 1, #T do
					T[Index] *= Arg1
				end
				CACHED.hitscanAngles = T
			end)
			Flags.silentAim_manipulationDistance:OnChanged(function(Arg1)
				local T = {New2(1, 0, 0).Unit, New2(-1, 0, 0).Unit, New2(0, 1, 0).Unit, New2(0, -1, 0).Unit, New2(1, 1, 0).Unit, New2(-1, 1, 0).Unit}
				for Index = 1, #T do
					T[Index] *= Arg1
				end
				CACHED.manipulationAngles = T
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
	local V2 = (function()
		return function(Arg1)
			local Flags = Arg1.flags
			local Drawings = Arg1.drawings
			local RunService = Arg1.services.runService
			local PlayerESP = Arg1.playerESP
			local T = {teamCheck = nil, connection = nil}
			local function Fn()
				for _, Value in PlayerESP.playerCache do
					if (not (Value.current and Value.current.active)) then
						Value:hideDrawings()
						continue
					elseif (not T.teamCheck) then
						Value:loop(T)
						continue
					end
					local NameTag = Value.current.character:FindFirstChild("NameTag")
					if (not NameTag or not NameTag.AlwaysOnTop) then
						Value:loop(T)
						continue
					end
					Value:hideDrawings()
				end
			end
			Flags.playerEsp_name:OnChanged(function(Arg1)
				T.name = Arg1
			end)
			Flags.playerEsp_box:OnChanged(function(Arg1)
				T.box = Arg1
			end)
			Flags.playerEsp_healthbar:OnChanged(function(Arg1)
				T.healthbar = Arg1
			end)
			Flags.playerEsp_distance:OnChanged(function(Arg1)
				T.distance = Arg1
			end)
			Flags.playerEsp_weapon:OnChanged(function(Arg1)
				T.weapon = Arg1
			end)
			Flags.playerEsp_teamCheck:OnChanged(function(Arg1)
				T.teamCheck = Arg1
			end)
			Flags.playerEsp_toggle:OnChanged(function(Arg1)
				if (Arg1) then
					if (T.connection) then
						T.connection:Disconnect()
					end
					T.connection = RunService.PreRender:Connect(Fn)
					return
				elseif (not T.connection) then
					return
				end
				T.connection:Disconnect()
				T.connection = nil
				for _, Value in PlayerESP.playerCache do
					Value:hideDrawings()
				end
			end)
			Flags.playerEsp_nameColour:OnChanged(function(Arg1)
				for _, Value in PlayerESP.playerCache do
					Value.drawings.name.Color = Arg1
				end
			end)
			Flags.playerEsp_boxColour:OnChanged(function(Arg1)
				for _, Value in PlayerESP.playerCache do
					Value.drawings.box.Color = Arg1
				end
			end)
			Flags.playerEsp_distanceColour:OnChanged(function(Arg1)
				for _, Value in PlayerESP.playerCache do
					Value.drawings.distance.Color = Arg1
				end
			end)
			Flags.playerEsp_weaponColour:OnChanged(function(Arg1)
				for _, Value in PlayerESP.playerCache do
					Value.drawings.weapon.Color = Arg1
				end
			end)
		end
	end)()
	local V3 = (function()
		return function(Arg1)
			local Flags = Arg1.flags
			local Drawings = Arg1.drawings
			local Camera = Arg1.services.camera
			local RunService = Arg1.services.runService
			local NpcESP = Arg1.npcESP
			local NpcESP_settings = Arg1.npcESP_settings
			local T = {maxDistance = nil, connection = nil}
			local T2 = {}
			local function Fn()
				for _, Value in NpcESP.npcCache do
					if (not T2[Value.settingName] or Flags.combatMode_toggle.value) then
						Value:hideDrawings()
						continue
					end
					local Magnitude = (Camera.CFrame.Position - Value.entity:GetPivot().Position).Magnitude
					if (Magnitude > T.maxDistance) then
						Value:hideDrawings()
						continue
					end
					Value:loop(T, Magnitude)
					continue
				end
			end
			Flags.npcEsp_toggle:OnChanged(function(Arg1)
				if (Arg1) then
					if (T.connection) then
						T.connection:Disconnect()
					end
					T.connection = RunService.PreRender:Connect(Fn)
					return
				elseif (not T.connection) then
					return
				end
				T.connection:Disconnect()
				T.connection = nil
				for _, Value in NpcESP.npcCache do
					Value:hideDrawings()
				end
			end)
			Flags.npcEsp_maxDistance:OnChanged(function(Arg1)
				T.maxDistance = Arg1
			end)
			Flags.npcEsp_box:OnChanged(function(Arg1)
				T.box = Arg1
			end)
			Flags.npcEsp_name:OnChanged(function(Arg1)
				T.name = Arg1
			end)
			Flags.npcEsp_distance:OnChanged(function(Arg1)
				T.distance = Arg1
			end)
			Flags.npcEsp_healthbar:OnChanged(function(Arg1)
				T.healthbar = Arg1
			end)
			Flags.npcEsp_wolf:OnChanged(function(Arg1)
				T2.PREFAB_ANIMAL_WOLF = Arg1
			end)
			Flags.npcEsp_deer:OnChanged(function(Arg1)
				T2.PREFAB_ANIMAL_DEER = Arg1
			end)
			Flags.npcEsp_boar:OnChanged(function(Arg1)
				T2.PREFAB_ANIMAL_WILDBOAR = Arg1
			end)
			Flags.npcEsp_scav:OnChanged(function(Arg1)
				T2.Soldier = Arg1
			end)
			Flags.npcEsp_bruno:OnChanged(function(Arg1)
				T2.Bruno = Arg1
			end)
			Flags.npcEsp_boris:OnChanged(function(Arg1)
				T2.Boris = Arg1
			end)
			Flags.npcEsp_brutus:OnChanged(function(Arg1)
				T2.Brutus = Arg1
			end)
			Flags.npcEsp_bradley:OnChanged(function(Arg1)
				T2.BTR = Arg1
			end)
			local function Fn2(Arg1, Arg2)
				for _, Value in NpcESP.npcCache do
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
	local V4 = (function()
		return function(Arg1)
			local Flags = Arg1.flags
			local Drawings = Arg1.drawings
			local Camera = Arg1.services.camera
			local RunService = Arg1.services.runService
			local EntityESP = Arg1.entityESP
			local EntityESP_settings = Arg1.entityESP_settings
			local ChristmasUpdate = Arg1.const.CHRISTMAS_UPDATE
			local T = {maxDistance = nil, connection = nil}
			local T2 = {}
			local function Fn()
				for _, Value in EntityESP.entityCache do
					if (not T2[Value.settingName] or Flags.combatMode_toggle.value) then
						Value:hideDrawings()
						continue
					end
					local Magnitude = (Camera.CFrame.Position - Value.entity:GetPivot().Position).Magnitude
					if (Magnitude > T.maxDistance) then
						Value:hideDrawings()
						continue
					end
					Value:loop(T, Magnitude)
					continue
				end
			end
			Flags.entityEsp_toggle:OnChanged(function(Arg1)
				if (Arg1) then
					if (T.connection) then
						T.connection:Disconnect()
					end
					T.connection = RunService.PreRender:Connect(Fn)
					return
				elseif (not T.connection) then
					return
				end
				T.connection:Disconnect()
				T.connection = nil
				for _, Value in EntityESP.entityCache do
					Value:hideDrawings()
				end
			end)
			Flags.entityEsp_box:OnChanged(function(Arg1)
				T.box = Arg1
			end)
			Flags.entityEsp_name:OnChanged(function(Arg1)
				T.name = Arg1
			end)
			Flags.entityEsp_distance:OnChanged(function(Arg1)
				T.distance = Arg1
			end)
			Flags.entityEsp_maxDistance:OnChanged(function(Arg1)
				T.maxDistance = Arg1
			end)
			Flags.entityEsp_bodyBag:OnChanged(function(Arg1)
				T2["Body Bag"] = Arg1
			end)
			Flags.entityEsp_airdrop:OnChanged(function(Arg1)
				T2["Care Package"] = Arg1
			end)
			Flags.entityEsp_timedCrate:OnChanged(function(Arg1)
				T2["Timed Crate"] = Arg1
			end)
			Flags.entityEsp_hemp:OnChanged(function(Arg1)
				T2["Wool Plant"] = Arg1
			end)
			Flags.entityEsp_stone:OnChanged(function(Arg1)
				T2.Stone_Node = Arg1
			end)
			Flags.entityEsp_phosphate:OnChanged(function(Arg1)
				T2.Phosphate_Node = Arg1
			end)
			Flags.entityEsp_metal:OnChanged(function(Arg1)
				T2.Metal_Node = Arg1
			end)
			Flags.entityEsp_minicopter:OnChanged(function(Arg1)
				T2["Salvaged Flycopter"] = Arg1
			end)
			if ChristmasUpdate then
				Flags.entityEsp_smallGift:OnChanged(function(Arg1)
					T2["Small Gift"] = Arg1
				end)
				Flags.entityEsp_mediumGift:OnChanged(function(Arg1)
					T2["Medium Gift"] = Arg1
				end)
				Flags.entityEsp_largeGift:OnChanged(function(Arg1)
					T2["Large Gift"] = Arg1
				end)
			end
			local function Fn2(Arg1, Arg2)
				for _, Value in EntityESP.entityCache do
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
	local V5 = (function()
		local V = T[8]
		return function(Arg1)
			local Flags = Arg1.flags
			local Bases = Arg1.world.bases
			local Remove = V.remove
			local T = {}
			local T2 = {}
			local function Fn(Arg1)
				local Fn = function(Arg1)
					local TouchCollision = Arg1:FindFirstChild("TouchCollision")
					local CollisionParts = Arg1:FindFirstChild("Collision Parts")
					if (CollisionParts and CollisionParts.ClassName == "Folder") then
						for _, Child in CollisionParts:GetChildren() do
							if (Child.ClassName ~= "Part") then
								continue
							elseif (Flags.disableTraps_toggle.value) then
								Child.CanTouch = false
							end
							Child.AncestryChanged:Connect(function(Arg1, Arg2)
								if (not (Arg1 == Child and Arg2 == nil)) then
									return
								end
								Remove(T, Child)
							end)
							Insert(T, Child)
						end
						return
					end
					if (not TouchCollision or TouchCollision.ClassName ~= "MeshPart") then
						return
					elseif (Flags.disableTraps_toggle.value) then
						TouchCollision.CanTouch = false
					end
					TouchCollision.AncestryChanged:Connect(function(Arg1, Arg2)
						if (not (Arg1 == TouchCollision and Arg2 == nil)) then
							return
						end
						Remove(T, TouchCollision)
					end)
					Insert(T, TouchCollision)
				end
				for _, Child in Arg1:GetChildren() do
					Fn(Child)
				end
				Arg1.ChildAdded:Connect(Fn)
			end
			local function Fn2(Arg1)
				local Fn = function(Arg1)
					local DamageParts = Arg1:FindFirstChild("DamageParts")
					if (not DamageParts) then
						return
					end
					for _, Child in DamageParts:GetChildren() do
						if (Child.ClassName ~= "Part") then
							continue
						elseif (Flags.disableSpikes_toggle.value) then
							Child.CanTouch = false
						end
						Child.AncestryChanged:Connect(function(Arg1, Arg2)
							if (not (Arg1 == Child and Arg2 == nil)) then
								return
							end
							Remove(T2, Child, true)
						end)
						Insert(T2, Child)
					end
				end
				for _, Child in Arg1:GetChildren() do
					Fn(Child)
				end
				Arg1.ChildAdded:Connect(Fn)
			end
			local function OnChildAdded(Arg1)
				local T = {"External Stone Gate", "External Stone Wall", "External Wooden Gate", "External Wooden Wall", "Metal Spikes", "Wooden Spikes"}
				local T2 = {"Bear Trap", "Shotgun Turret", "Auto Turret"}
				for _, Value in T do
					local V = Arg1:FindFirstChild(Value)
					if (not V) then
						continue
					end
					Fn2(V)
				end
				for _, Value2 in T2 do
					local V2 = Arg1:FindFirstChild(Value2)
					if (not V2) then
						continue
					end
					Fn(V2)
				end
				Arg1.ChildAdded:Connect(function(Arg1)
					local Name = Arg1.Name
					local V = Find(T, Name)
					local V2 = Find(T2, Name)
					if (V) then
						Fn2(Arg1)
					elseif (V2) then
						Fn(Arg1)
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
			for _, Child in Bases:GetChildren() do
				OnChildAdded(Child)
			end
			Bases.ChildAdded:Connect(OnChildAdded)
		end
	end)()
	local V6 = (function()
		local V = T[8]
		local V2 = T[3]
		return function(Arg1)
			local Flags = Arg1.flags
			local Client = Arg1.client
			local Bases = Arg1.world.bases
			local Replacemetamethod = Arg1.replacemetamethod
			local Remove = V.remove
			local T = {}
			local T2 = {}
			Flags.xray_toggle:OnChanged(function(Arg1)
				if (Arg1) then
					local V = Flags.xray_transparency.value / 100
					for Index = 1, #T do
						T[Index].Transparency = V
					end
					return
				end
				for Index2 = 1, #T do
					local V2 = T[Index2]
					V2.Transparency = T2[V2]
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
			local function OnChildAdded(Instance2)
				local T3 = {
					"Doorway",
					"Floor",
					"FloorFrame",
					"Foundation",
					"Foundation Steps",
					"Half Wall",
					"L-Shaped Stairs",
					"Low Wall",
					"Triangle Floor",
					"Triangle Floor Frame",
					"Triangle Foundation",
					"U-Shaped Stairs",
					"Wall",
					"Wall Block",
					"Wall Frame",
					"Window",
				}
				local T4 = {"Part", "MeshPart"}
				local function Fn(Instance2)
					if not Find(T4, Instance2.ClassName) or Instance2.Transparency == 1 or Find(T, Instance2) then
						if Find(T, Instance2) then
							V2.warn("Attempted double spoof")
						end
						return
					else
						T2[Instance2] = Instance2.Transparency
						Insert(T, Instance2)
						local Transparency = Instance2.Transparency
						local V = nil
						V = Replacemetamethod(Instance2, "__index", NewCClosure(function(...)
							local V2, V3, V4 = ...
							if V2 ~= Instance2 or (V3 ~= "Transparency" or CheckCaller()) then
								return V(...)
							end
							return Transparency
						end))
						local V3 = nil
						V3 = Replacemetamethod(Instance2, "__newindex", NewCClosure(function(...)
							local V, V2, V4, V5 = ...
							if V ~= Instance2 or V2 ~= "Transparency" or CheckCaller() then
								return V3(...)
							end
							V3(...)
							Transparency = V4
						end))
						if Flags.xray_toggle.value then
							Instance2.Transparency = Flags.xray_transparency.value / 100
						end
						Instance2.AncestryChanged:Connect(function(Arg1, Arg2)
							if (not (Arg1 == Instance2 and Arg2 == nil)) then
								return
							end
							Remove(T, Instance2, true)
						end)
						return
					end
				end
				local function Fn2(Arg1)
					if (Arg1.ClassName ~= "Model" or not Find(T3, Arg1.Name)) then
						return
					end
					for _, Descendant in Arg1:GetDescendants() do
						Fn(Descendant)
					end
					Arg1.DescendantAdded:Connect(Fn)
				end
				local function OnChildAdded(Arg1)
					if (not Find(T3, Arg1.Name)) then
						return
					end
					for _, Child in Arg1:GetChildren() do
						Fn2(Child)
					end
					Arg1.ChildAdded:Connect(Fn2)
				end
				for _, Child in Instance2:GetChildren() do
					OnChildAdded(Child)
				end
				Instance2.ChildAdded:Connect(OnChildAdded)
			end
			for _, Child in Bases:GetChildren() do
				OnChildAdded(Child)
			end
			Bases.ChildAdded:Connect(OnChildAdded)
		end
	end)()
	local V7 = (function()
		local Spawn = Task.spawn
		return function(Arg1)
			local Flags = Arg1.flags
			local Loners = Arg1.world.loners
			local BenchInfo = Arg1.gameModules.benchInfo
			local Replacemetamethod = Arg1.replacemetamethod
			local function Fn(Instance2)
				local Events = Instance2:FindFirstChild("Events")
				if not Events then
					return
				end
				local ReplicateHealth = Events:FindFirstChild("ReplicateHealth")
				local ReplicateEffect = Events:FindFirstChild("ReplicateEffect")
				local __namecall = GetRawMetatable(Game).__namecall
				;(function()
					if not ReplicateHealth or __namecall ~= GetRawMetatable(ReplicateHealth).__namecall then
						return
					end
					local V = nil
					local V2 = NewCClosure(function(...)
						local NamecallMethod = GetNamecallMethod()
						if (NamecallMethod ~= "FireServer" or not Flags.disableMinicopterDamage_toggle.value) then
							return V(...)
						end
					end)
					V = Replacemetamethod(ReplicateHealth, "__namecall", V2)
				end)()
				;(function()
					if not ReplicateEffect or __namecall ~= GetRawMetatable(ReplicateEffect).__namecall then
						return
					end
					local V = nil
					local V2 = NewCClosure(function(...)
						local NamecallMethod = GetNamecallMethod()
						if (NamecallMethod ~= "FireServer" or not Flags.silentMinicopter_toggle.value) then
							return V(...)
						end
					end)
					V = Replacemetamethod(ReplicateEffect, "__namecall", V2)
				end)()
				Task.wait(9000000000)
				if ReplicateEffect and ReplicateHealth then
					Task.wait(9000000000)
				end
			end
			;(function(Instance2)
				if not Instance2 then
					return
				end
				for _, Child in Instance2:GetChildren() do
					Spawn(Fn, Child)
				end
				Instance2.ChildAdded:Connect(Fn)
			end)(Loners:FindFirstChild("Salvaged Flycopter"))
		end
	end)()
	local V8 = (function()
		local New = Color3_2.new
		return function(Arg1)
			local Flags = Arg1.flags
			local KeybindList = Arg1.keybindList
			local PlayerESP = Arg1.playerESP
			local function Fn(Arg1, Arg2, Arg3)
				local T = {[false] = New(0.5, 0.5, 0.5), [true] = New(1, 0, 0)}
				local V = T[Flags[Arg1].value]
				KeybindList.storage[Arg1] = KeybindList:addText("left", Arg3, V, false)
				KeybindList.storage[Arg2] = KeybindList:addText("right", ("[%*]"):format(Flags[Arg2].key), V, false)
				Flags[Arg2]:OnChanged(function(Arg1_2)
					Flags[Arg1].self.setValue(Arg1_2)
				end)
				Flags[Arg2]:OnKeyChanged(function(Arg1_2)
					local V = Arg1_2 ~= "None"
					KeybindList.storage[Arg1].shown = V
					KeybindList.storage[Arg2].shown = V
					KeybindList.storage[Arg2].text = ("[" .. tostring(Arg1_2) .. "]")
					KeybindList:update()
				end)
				Flags[Arg1]:OnChanged(function(Arg1_2)
					Flags[Arg2].value = Arg1_2
					local V = T[Arg1_2]
					KeybindList.storage[Arg1].colour = V
					KeybindList.storage[Arg2].colour = V
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
	local V9 = (function()
		local Spawn = Task.spawn
		;(function()
			local New = Vector3_2.new
			local New2 = CFrame2.new
			local Wait = Task.wait
			local Spawn = Task.spawn
			local Delay = Task.delay
			local V = T[4]
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
				local V2 = nil
				local function Fn(Arg1_2, Arg2, Arg3)
					if V2 then
						return
					end
					if not Arg1.localrootpart or not Client.fireRemote or not Client.toolInfo or (RawGet(Client.itemInfo, "Type") ~= "Gun" or Type(RawGet(Client.itemInfo, "Name")) ~= "string") then
						return
					end
					local ServerTimeNow = Workspace:GetServerTimeNow()
					local V3 = RawGet(Client.itemInfo, "Name")
					local Position = (Camera.CFrame * New2(0, 0, -2)).Position
					local V4 = Arg1.localrootpart.CFrame * New2(0, V.viewmodelController.TORSO_OFFSET_Y, 0)
					local V5 = 0
					local V6 = 0
					V2 = RunService.PreRender:Connect(function(Arg1_3)
						V5 = V5 + Arg1_3
						if (Arg3 or 20) <= V6 or not Arg1.localrootpart or not Client.fireRemote then
							V2:Disconnect()
							V2 = nil
							return
						end
						if 0.05 <= V5 then
							V6 = V6 + 1
							V5 = 0
							ProtectedCall(Client.fireRemote, "Fire", V.assetContainer.TP_SHOOT_KEY_1, V.assetContainer.TP_SHOOT_KEY_2, ServerTimeNow, V3, Camera.CFrame, V4:PointToObjectSpace(Position), V4, 0, 0, (Camera.CFrame * New2(0, 0, -50)).Position)
							Arg1.localrootpart.CFrame = New2(Arg1_2)
						end
					end)
					if Arg2 then
						repeat
							Wait()
						until not V2
					end
				end
				Flags.tpToWaypoint_toggle:OnChanged(function(Arg1_2)
					if (not Arg1_2) then
						if V2 then
							V2:Disconnect()
							V2 = nil
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
					local V = New(Position.X, 300, Position.Z)
					local V3 = New(Attribute.X, 300, Attribute.Y)
					if (not IsVisible(Position, V, Arg1.localcharacter)) then
						Delay(0, Flags.tpToWaypoint_toggle.self.setValue, false)
						Window:notify("No LOS to sky found", 1.5)
						return
					end
					Spawn(function()
						Fn(V, true)
						Fn(V3, true, 30)
						local V4 = RaycastParams2.new()
						V4.RespectCanCollide = true
						V4.FilterDescendantsInstances = {Camera, Vfx, Plants, Drops, Arg1.localcharacter, Unpack(GlobalHitIgnore)}
						local V5 = V3
						local V6 = New(Attribute.X, 0, Attribute.Y)
						local V7 = Workspace:Raycast(V5, V6 - V5, V4)
						if (not V7) then
							repeat
								Wait()
								if (not Arg1.localrootpart) then
									break
								end
								V5 = Arg1.localrootpart.Position
								V7 = Workspace:Raycast(V5, V6 - V5, V4)
							until V7 and V7.Distance < 15
							Wait(1)
							Delay(0, Flags.tpToWaypoint_toggle.self.setValue, false)
							return
						end
						Fn(V7.Position + New(0, 10, 0), true)
						Wait(3)
						Delay(0, Flags.tpToWaypoint_toggle.self.setValue, false)
					end)
				end)
			end
		end)()
		local V = (function()
			local V = T[8]
			local V2 = T[3]
			return function(Arg1)
				local Flags = Arg1.flags
				local Vms = Arg1.world.vms
				local Replacemetamethod = Arg1.replacemetamethod
				local Remove = V.remove
				local T = {
					forcefield = Enum2.Material.ForceField,
					neon = Enum2.Material.Neon,
					smoothplastic = Enum2.Material.SmoothPlastic,
				}
				local V3 = SetMetatable({}, {__mode = "k"})
				local V4 = SetMetatable({}, {__mode = "v"})
				Flags.localChams_toggle:OnChanged(function(Arg1)
					if (not Arg1) then
						for Index = 1, #V4 do
							local V = V4[Index]
							if (not V.Parent) then
								V2.warn("PART has not been gced")
							end
							local V5 = V3[V]
							if (not V5) then
								V2.warn("originalValue key was gced, but not main instance")
							end
							V.Color = V5.Color
							V.Transparency = V5.Transparency
							V.Material = V5.Material
							if (V5.TextureID) then
								V.TextureID = V5.TextureID
							end
						end
						return
					end
					for Index2 = 1, #V4 do
						local V6 = V4[Index2]
						V6.Color = Flags.localChams_colour.value
						V6.Transparency = Flags.localChams_transparency.value / 100
						V6.Material = T[Flags.localChams_material.value]
						if (V6.ClassName == "MeshPart") then
							V6.TextureID = ""
						end
					end
				end)
				Flags.localChams_colour:OnChanged(function(Arg1)
					if (not Flags.localChams_toggle.value) then
						return
					end
					for Index = 1, #V4 do
						V4[Index].Color = Arg1
					end
				end)
				Flags.localChams_transparency:OnChanged(function(Arg1)
					if (not Flags.localChams_toggle.value) then
						return
					end
					for Index = 1, #V4 do
						V4[Index].Transparency = Arg1 / 100
					end
				end)
				Flags.localChams_material:OnChanged(function(Arg1)
					if (not Flags.localChams_toggle.value) then
						return
					end
					for Index = 1, #V4 do
						V4[Index].Material = T[Arg1]
					end
				end)
				local function Fn(Instance2)
					local ClassName = Instance2.ClassName
					if not ((ClassName == "Part" or ClassName == "MeshPart") and not (Instance2.Transparency == 1 or V3[Instance2])) then
						return
					end
					local T2 = {
						Color = Instance2.Color,
						Material = Instance2.Material,
						Transparency = Instance2.Transparency,
						TextureID = ClassName == "MeshPart" and Instance2.TextureID,
					}
					V3[Instance2] = Clone(T2)
					local V = nil
					V = Replacemetamethod(Instance2, "__index", NewCClosure(function(...)
						local V2, V3 = ...
						if (CheckCaller() or V2 ~= Instance2 or T2[V3] == nil) then
							return V(...)
						end
						return T2[V3]
					end))
					local V2 = nil
					V2 = Replacemetamethod(Instance2, "__newindex", NewCClosure(function(...)
						local V, V3, V4 = ...
						if (CheckCaller() or V ~= Instance2 or T2[V3] == nil) then
							return V2(...)
						end
						V2(...)
						T2[V3] = V4
					end))
					Instance2.AncestryChanged:Connect(function(Arg1, Arg2)
						if Arg1 ~= Instance2 or Arg2 ~= nil then
							return
						end
						V3[Instance2] = nil
						Remove(V4, Instance2)
					end)
					if Flags.localChams_toggle.value then
						Instance2.Color = Flags.localChams_colour.value
						Instance2.Transparency = Flags.localChams_transparency.value / 100
						Instance2.Material = T[Flags.localChams_material.value]
						if ClassName == "MeshPart" then
							Instance2.TextureID = ""
						end
					end
					Insert(V4, Instance2)
				end
				local function OnChildAdded(Arg1)
					for _, Descendant in Arg1:GetDescendants() do
						Fn(Descendant)
					end
				end
				OnChildAdded(Vms)
				Vms.ChildAdded:Connect(OnChildAdded)
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
					SetHiddenProperty(Arg1.localrootpart, "NetworkIsSleeping", false)
					Arg1.localrootpart.CFrame = Client.originalCFrame
					Arg1.localrootpart.Anchored = false
				end
			end)
			V(Arg1)
		end
	end)()
	local V10 = (function()
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
				local Value = Arg1 and Flags.ambient_colour.value or LightingSpoof.Ambient
				if (Value == Lighting.Ambient) then
					return
				end
				LightingIgnore.Ambient = Value
				Wait()
				Lighting.Ambient = Value
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
				local V = Arg1 and "-1" or "100"
				local V2 = Arg1 and "-1" or "290"
				Pcall(SetFFlag, "FRMMinGrassDistance", V)
				Pcall(SetFFlag, "FRMMaxGrassDistance", V2)
			end)
			Flags.fovChanger_toggle:OnChanged(function(Arg1)
				local Value = Arg1 and Flags.fovChanger_amount.value or CameraSpoof.FieldOfView
				Camera.FieldOfView = Value
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
	local V11 = (function()
		local Spawn = Task.spawn
		local Delay = Task.delay
		local V = T[4]
		return function(Arg1)
			local Flags = Arg1.flags
			local Client = Arg1.client
			local Players = Arg1.services.players
			local PlayerESP = Arg1.playerESP
			local IsDowned = Arg1.isDowned
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
			end)
			Flags.antiaim_toggle:OnChanged(function(Arg1_2)
				if (Arg1_2) then
					if (not Client.animationTable) then
						return
					end
					local DownFall = Client.animationTable.DownFall
					local Down = Client.animationTable.Down
					local IsPlaying = DownFall.IsPlaying or Down.IsPlaying
					if (not IsPlaying) then
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
				for _, Value in PlayerESP.playerCache do
					local Humanoid = Value.current and Value.current.humanoid
					if (not Humanoid) then
						continue
					end
					for _, PlayingAnimationTrack in Humanoid:GetPlayingAnimationTracks() do
						Fn(Humanoid, PlayingAnimationTrack)
					end
				end
			end)
		end
	end)()
	local V12 = (function()
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
		V2(Arg1)
		V3(Arg1)
		V4(Arg1)
		V5(Arg1)
		V6(Arg1)
		V7(Arg1)
		V8(Arg1)
		V9(Arg1)
		V10(Arg1)
		V11(Arg1)
		V12(Arg1)
	end
end)()
local V54 = (function()
	local V = T[4]
	return function(Arg1)
		local PlayerESP = Arg1.playerESP
		local Toolinfo = Arg1.gameModules.toolinfo
		local Flags = Arg1.flags
		PlayerESP.onChildAdded(function(Arg1, Arg2)
			if (Toolinfo[Arg2.Name]) then
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
				for _, PlayingAnimationTrack in V2:GetPlayingAnimationTracks() do
					Fn(PlayingAnimationTrack)
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
local V55 = (function()
	return function(Arg1)
		local RunService = Arg1.services.runService
		local UserInputService = Arg1.services.userInputService
		local Players = Arg1.services.players
		local Localplayer = Arg1.localplayer
		local Client = Arg1.client
		local KeyHandlers = Arg1.keyHandlers
		local OnPreRender = Arg1.rendersteppedLoop
		local OnHeartbeat = Arg1.heartbeatLoop
		local OnPlayerAdded = Arg1.playerAdded
		local OnPlayerRemoving = Arg1.playerRemoved
		RunService.PreRender:Connect(OnPreRender)
		RunService.Heartbeat:Connect(OnHeartbeat)
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
		Localplayer.CharacterAdded:Connect(Client.characterAdded)
		Localplayer.CharacterRemoving:Connect(Client.characterRemoving)
		Players.PlayerAdded:Connect(OnPlayerAdded)
		Players.PlayerRemoving:Connect(OnPlayerRemoving)
	end
end)()
local V56 = (function()
	local V = T[8]
	return function(Arg1)
		local GlobalHitIgnore = Arg1.GLOBAL_HIT_IGNORE
		local Vegetation = Arg1.world.vegetation
		local Trees = Arg1.world.trees
		local Remove = V.remove
		local function Fn(Arg1)
			Insert(GlobalHitIgnore, Arg1)
			local V
			V = Arg1.AncestryChanged:Connect(function(_, Arg2)
				if (Arg2 ~= nil) then
					return
				end
				Remove(GlobalHitIgnore, Arg1)
				V:Disconnect()
			end)
		end
		local function Fn2(Arg1, Arg2)
			if (not Arg1) then
				return
			end
			local Children = Arg1:GetChildren()
			for Index = 1, #Children do
				local V = Children[Index]
				local V2 = Arg2(V)
				if (V2) then
					Fn(V2 or V)
				end
			end
			Arg1.ChildAdded:Connect(function(Arg1)
				local V = Arg2(Arg1)
				if (V) then
					Fn(V or Arg1)
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
local V57 = (function()
	local V = T[8]
	local V2 = T[3]
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
		local EntityESP_settings = Arg1.entityESP_settings
		local NpcESP_settings = Arg1.npcESP_settings
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
		for Index = 2, #Players2 do
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
			local V = EntityESP_settings[Name]
			if (V) then
				return EntityESP.new(Arg1, Name, V[1], V[2])
			end
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
			local V = NpcESP_settings[Name]
			if (V) then
				local T = {"wolf", "deer", "boar", "bradley"}
				return NpcESP.new(Arg1, Name, V[1], V[2], Find(T, V[1]))
			end
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
		for _, Child in Military:GetChildren() do
			Fn4(Child)
		end
	end
end)()
T2.tabs = V40(V36, false)
V41(T2)
V42(T2)
V43(T2)
V44(T2)
V45(T2)
T2.getEquipped = V46(T2)
T2.predict = V47(T2)
V48(T2)
V49(T2)
V50(T2)
if V51(T2) then
	V52(T2)
	V53(T2)
	V54(T2)
	V55(T2)
	V56(T2)
	V57(T2)
	T2.client.FULLY_LOADED = true
	return
end
