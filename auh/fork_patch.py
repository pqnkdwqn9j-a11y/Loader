"""Fork compatibility patches for the protected Fallen copy
(no ChooseRandom / EquipArmor, guarded ToolInfo + RaycastUtil, plain MouseButton1DownFunc in senv).

Applied by build.py on the assembled text. Every patch must match exactly once."""


def apply(text):
    def rep(old, new, count=1):
        nonlocal text
        n = text.count(old)
        if n != count:
            raise SystemExit(f'fork patch: expected {count} match(es), got {n} for {old[:70]!r}')
        text = text.replace(old, new)

    # expose isTeam for the camera aimbot
    rep('\tPH_UI.EntityClass = EntityClass\n',
        '\tPH_UI.EntityClass = EntityClass\n\tPH_UI.isTeam = isTeam\n')

    # mouse1 handler: fall back to senv.MouseButton1DownFunc when the constant hunt finds nothing;
    # ChooseRandom wait is bounded and optional
    rep('''\t\t\t\t\tend
\t\t\t\tend)()
\t\t\t\treturn V2
\t\t\tend
\t\t\tlocal function Fn2(Arg1, Arg2_2)
\t\t\t\tlocal V2
\t\t\t\trepeat
\t\t\t\t\tWait()
\t\t\t\t\tV2 = GetSenv(Arg1)
\t\t\t\tuntil RawGet(V2, "ChooseRandom")
\t\t\t\tif Type(V2) ~= "table" then
\t\t\t\t\tKick("Potato.hook error (9)")
\t\t\t\t\treturn false
\t\t\t\tend
\t\t\t\tlocal V5 = RawGet(V2, "ChooseRandom")
\t\t\t\tif Type(V5) ~= "function" or Type(Arg2_2) ~= "function" then
\t\t\t\t\tKick("Potato.hook error (10)")
\t\t\t\t\treturn false
\t\t\t\tend
\t\t\t\tRawSet(V2, "ChooseRandom", function(...)
\t\t\t\t\tlocal V = (select(1, ...))
\t\t\t\t\tif Type(V) ~= "table" or not Flags.instantEoka_toggle.value then
\t\t\t\t\t\treturn V5(...)
\t\t\t\t\telse
\t\t\t\t\t\tlocal V2 = Rawlen(V)
\t\t\t\t\t\treturn V2 == EokaDurationRollLength and 0.25 or V2 == EokaSecondRollLength and 0 or V5(...)
\t\t\t\t\tend
\t\t\t\tend)
\t\t\t\tlocal V6 = 0
\t\t\t\tfor Key, Value in V3(Arg2_2) do
''', '''\t\t\t\t\tend
\t\t\t\tend)()
\t\t\t\tif not V2 then
\t\t\t\t\tlocal Senv = nil
\t\t\t\t\tfor _ = 1, 50 do
\t\t\t\t\t\tlocal Ok, Env = Pcall(GetSenv, Arg1)
\t\t\t\t\t\tif Ok and Type(Env) == "table" and Type(RawGet(Env, "MouseButton1DownFunc")) == "function" then
\t\t\t\t\t\t\tSenv = Env
\t\t\t\t\t\t\tbreak
\t\t\t\t\t\tend
\t\t\t\t\t\tWait(0.1)
\t\t\t\t\tend
\t\t\t\t\tif Senv then
\t\t\t\t\t\tV2 = RawGet(Senv, "MouseButton1DownFunc")
\t\t\t\t\t\tClient.mouseButton1DownFunc = V2
\t\t\t\t\telse
\t\t\t\t\t\tKick("Potato.hook error (11b)")
\t\t\t\t\tend
\t\t\t\tend
\t\t\t\treturn V2
\t\t\tend
\t\t\tlocal function Fn2(Arg1, Arg2_2)
\t\t\t\tlocal V2 = nil
\t\t\t\tfor _ = 1, 50 do
\t\t\t\t\tlocal Ok, Env = Pcall(GetSenv, Arg1)
\t\t\t\t\tif Ok and Type(Env) == "table" then
\t\t\t\t\t\tV2 = Env
\t\t\t\t\t\tif RawGet(Env, "ChooseRandom") then
\t\t\t\t\t\t\tbreak
\t\t\t\t\t\tend
\t\t\t\t\tend
\t\t\t\t\tWait(0.1)
\t\t\t\tend
\t\t\t\tif Type(V2) ~= "table" then
\t\t\t\t\tKick("Potato.hook error (9)")
\t\t\t\t\treturn false
\t\t\t\tend
\t\t\t\tlocal V5 = RawGet(V2, "ChooseRandom")
\t\t\t\tif Type(V5) == "function" then
\t\t\t\t\tRawSet(V2, "ChooseRandom", function(...)
\t\t\t\t\t\tlocal V = (select(1, ...))
\t\t\t\t\t\tif Type(V) ~= "table" or not Flags.instantEoka_toggle.value then
\t\t\t\t\t\t\treturn V5(...)
\t\t\t\t\t\telse
\t\t\t\t\t\t\tlocal V2 = Rawlen(V)
\t\t\t\t\t\t\treturn V2 == EokaDurationRollLength and 0.25 or V2 == EokaSecondRollLength and 0 or V5(...)
\t\t\t\t\t\tend
\t\t\t\t\tend)
\t\t\t\telse
\t\t\t\t\tKick("Potato.hook error (10)")
\t\t\t\tend
\t\t\t\tif Type(Arg2_2) ~= "function" then
\t\t\t\t\treturn false
\t\t\t\tend
\t\t\t\tlocal V6 = 0
\t\t\t\tfor Key, Value in V3(Arg2_2) do
''')

    # viewmodel hook: run every step, never abort the character setup
    rep('''\t\t\treturn function(Arg1, Arg2)
\t\t\t\tlocal V = Fn(Arg1)
\t\t\t\tif Fn2(Arg1, V) then
\t\t\t\t\treturn Fn5(Arg2)
\t\t\t\telse
\t\t\t\t\treturn false
\t\t\t\tend
\t\t\tend
''', '''\t\t\treturn function(Arg1, Arg2)
\t\t\t\tlocal Ok, V = Pcall(Fn, Arg1)
\t\t\t\tif not Ok then
\t\t\t\t\tKick("hook vm/1: " .. tostring(V))
\t\t\t\t\tV = nil
\t\t\t\tend
\t\t\t\tlocal Ok2, Err2 = Pcall(Fn2, Arg1, V)
\t\t\t\tif not Ok2 then
\t\t\t\t\tKick("hook vm/2: " .. tostring(Err2))
\t\t\t\tend
\t\t\t\tif Arg2 then
\t\t\t\t\tlocal Ok3, Err3 = Pcall(Fn5, Arg2)
\t\t\t\t\tif not Ok3 then
\t\t\t\t\t\tKick("hook vm/3: " .. tostring(Err3))
\t\t\t\t\tend
\t\t\t\tend
\t\t\t\treturn true
\t\t\tend
''')

    # inventory hook: EquipArmor may not exist -> bounded wait
    rep('''\t\t\t\tlocal V5 = GetConnections(Arg1:WaitForChild("EquipArmor", MathHuge).Event)[1]
''', '''\t\t\t\tlocal EquipArmor = Arg1:WaitForChild("EquipArmor", 5) or (Arg1.Parent and Arg1.Parent:FindFirstChild("EquipArmor", true))
\t\t\t\tif not EquipArmor then
\t\t\t\t\tKick("Potato.hook error (15a)")
\t\t\t\t\treturn false
\t\t\t\tend
\t\t\t\tlocal V5 = GetConnections(EquipArmor.Event)[1]
''')

    # character setup: every step isolated, nothing blocks the rest of the loader
    rep('''\t\t\tV11.hookSeatPart()
\t\t\tV.print("parts loaded")
\t\t\tlocal ViewmodelController = Arg1_2:WaitForChild("ViewmodelController", MathHuge)
\t\t\tlocal InventoryController = Arg1_2:WaitForChild("InventoryController", MathHuge)
\t\t\tlocal EquipVM = ViewmodelController:WaitForChild("EquipVM", MathHuge)
\t\t\tV.print("vm loaded")
\t\t\tif not V7(ViewmodelController, EquipVM) then
\t\t\t\treturn
\t\t\tend
\t\t\tV6()
\t\t\tV11.fetchAnimationTable()
\t\t\tif not V8(InventoryController) then
\t\t\t\treturn
\t\t\telse
\t\t\t\tV11.replayAntiaim()
\t\t\t\tV11.spoofRootCFrame()
\t\t\t\treturn
\t\t\tend
\t\tend
''', '''\t\t\tlocal function Step(Name, Fn, ...)
\t\t\t\tlocal Ok, Err = Pcall(Fn, ...)
\t\t\t\tif not Ok then
\t\t\t\t\tV20[2].kick(Name .. ": " .. tostring(Err))
\t\t\t\tend
\t\t\t\treturn Ok
\t\t\tend
\t\t\tStep("seat hook", V11.hookSeatPart)
\t\t\tV.print("parts loaded")
\t\t\tlocal ViewmodelController = Arg1_2:WaitForChild("ViewmodelController", MathHuge)
\t\t\tlocal InventoryController = Arg1_2:WaitForChild("InventoryController", MathHuge)
\t\t\tlocal EquipVM = ViewmodelController:WaitForChild("EquipVM", 10)
\t\t\tV.print("vm loaded")
\t\t\tStep("viewmodel hook", V7, ViewmodelController, EquipVM)
\t\t\tStep("character hook", V6)
\t\t\tStep("animation table", V11.fetchAnimationTable)
\t\t\tStep("inventory hook", V8, InventoryController)
\t\t\tStep("antiaim", V11.replayAntiaim)
\t\t\tStep("root spoof", V11.spoofRootCFrame)
\t\tend
''')

    # character setup runs in its own thread so the main loader never stalls on it
    rep('''\t\tClient.characterRemoving = V11.removing
\t\tV2()
\t\tif Arg1.localcharacter then
\t\t\tClient.characterAdded(Arg1.localcharacter)
\t\tend
\t\treturn true
''', '''\t\tClient.characterRemoving = V11.removing
\t\tV2()
\t\tif Arg1.localcharacter then
\t\t\tTask.spawn(Client.characterAdded, Arg1.localcharacter)
\t\tend
\t\treturn true
''')
        # no metatable tampering in this fork (LarpGuard / CameraLockGuard): return the original
    # metamethod so callers keep working, but never swap the Instance metatable
    rep('''	return function(Arg1, Arg2, Arg3)
		local V2 = V3(GetRawMetatable(Arg1))
		local V10 = RawGet(V2, Arg2)
		SetReadonly(V2, false)
		RawSet(V2, Arg2, Arg3)
		V4(V2)
		SetRawMetatable(Arg1, V2)
		return V10
	end
''', '''	return function(Arg1, Arg2, Arg3)
		local Ok, Mt = Pcall(GetRawMetatable, Arg1)
		local Original = Ok and Type(Mt) == "table" and RawGet(Mt, Arg2) or nil
		if Type(Original) ~= "function" then
			Original = function(Self, Key, ...)
				if Arg2 == "__newindex" then
					Self[Key] = ...
					return
				elseif Arg2 == "__namecall" then
					return Self[Key](Self, ...)
				end
				return Self[Key]
			end
		end
		return Original
	end
''')

    # anchored watchdog: tell the user when the game (not fly/freecam) freezes the character
    rep('''			Step("antiaim", V11.replayAntiaim)
			Step("root spoof", V11.spoofRootCFrame)
		end
''', '''			Step("antiaim", V11.replayAntiaim)
			Step("root spoof", V11.spoofRootCFrame)
			Task.spawn(function()
				local Warned = false
				while Arg1.localrootpart == HumanoidRootPart and HumanoidRootPart.Parent do
					if HumanoidRootPart.Anchored and not Arg1.flags.fly_toggle.value and not Arg1.flags.freecam_toggle.value then
						if not Warned then
							Warned = true
							V20[2].kick("character anchored by the game (not by the cheat)")
						end
					else
						Warned = false
					end
					Task.wait(1)
				end
			end)
		end
''')
        # the old drawing fov circle for silent aim stays hidden (replaced by the gui ring)
    rep('''			Flags.silentAim_drawFov:OnChanged(function(Arg1)
				Drawings.silent.fov.Visible = Arg1
''', '''			Flags.silentAim_drawFov:OnChanged(function(Arg1)
				Drawings.silent.fov.Visible = false
''')
        # ---- silent aim re-targeting for the protected copy -----------------------------------
    # 1) real RaycastUtil / ToolInfo live as upvalues of senv.MouseButton1DownFunc (require() gives decoys)
    rep('''\t\tlocal T = {}
\t\tV4(Arg1, T)
\t\tV5(Arg1, T)
\t\tV9(Arg1, T)
\t\tV10(Arg1, T)
''', '''\t\tdo
\t\t\tlocal GM = Arg1.gameModules
\t\t\tlocal DbgUpvalues = (debug and debug.getupvalues) or getupvalues
\t\t\tlocal Deadline = os.clock() + 15
\t\t\tlocal Resolved = false
\t\t\trepeat
\t\t\t\tlocal Char = Arg1.localplayer.Character
\t\t\t\tlocal VMC = Char and Char:FindFirstChild("ViewmodelController")
\t\t\t\tlocal OkE, Env = Pcall(GetSenv, VMC)
\t\t\t\tlocal M1 = OkE and Type(Env) == "table" and RawGet(Env, "MouseButton1DownFunc") or nil
\t\t\t\tif Type(M1) == "function" then
\t\t\t\t\tlocal OkU, Ups = Pcall(DbgUpvalues, M1)
\t\t\t\t\tif OkU and Type(Ups) == "table" then
\t\t\t\t\t\tfor _, U in Next, Ups do
\t\t\t\t\t\t\tif Type(U) == "table" then
\t\t\t\t\t\t\t\tif Type(RawGet(U, "MouseRaycast")) == "function" and Type(RawGet(U, "Raycast")) == "function" then
\t\t\t\t\t\t\t\t\tGM.raycastUtil = U
\t\t\t\t\t\t\t\telseif Type(RawGet(U, "Salvaged AK47")) == "table" and Type(RawGet(U, "Hammer")) == "table" then
\t\t\t\t\t\t\t\t\tGM.toolinfo = U
\t\t\t\t\t\t\t\tend
\t\t\t\t\t\t\tend
\t\t\t\t\t\tend
\t\t\t\t\t\tResolved = true
\t\t\t\t\tend
\t\t\t\tend
\t\t\t\tif not Resolved then
\t\t\t\t\tTask.wait(0.25)
\t\t\t\tend
\t\t\tuntil Resolved or os.clock() > Deadline
\t\t\tif Type(RawGet(GM.raycastUtil, "MouseRaycast")) ~= "function" or Type(RawGet(GM.toolinfo, "Hammer")) ~= "table" then
\t\t\t\tV20[2].kick("game modules not resolved - silent aim / gun mods are off")
\t\t\tend
\t\tend
\t\tlocal T = {}
\t\tV4(Arg1, T)
\t\tV5(Arg1, T)
\t\tV9(Arg1, T)
\t\tV10(Arg1, T)
''')

    # 2) getEquipped must see the resolved ToolInfo (it is built before the hooks)
    rep('''\t\tlocal Items = Arg1.gameModules.items
\t\tlocal ToolInfo = Arg1.gameModules.toolinfo
\t\treturn function()
\t\t\tlocal Localcharacter = Arg1.localcharacter
''', '''\t\tlocal Items = Arg1.gameModules.items
\t\tlocal ToolInfo = SetMetatable({}, {__index = function(_, Key)
\t\t\tlocal Real = Arg1.gameModules.toolinfo
\t\t\treturn Type(Real) == "table" and RawGet(Real, Key) or nil
\t\tend})
\t\treturn function()
\t\t\tlocal Localcharacter = Arg1.localcharacter
''')

    # 3) hooks run inside the game's shoot path: never let an error escape into the game
    rep('''\t\t\tlocal CheckCameraDistance = V2.CheckCameraDistance
\t\t\tfunction V2.CheckCameraDistance(...)
''', '''\t\t\tlocal CheckCameraDistance = V2.CheckCameraDistance
\t\t\tlocal function PH_HookCCD(...)
''')
    rep('''\t\t\tend
\t\t\tArg2.vfxModule = V2
''', '''\t\t\tend
\t\t\tfunction V2.CheckCameraDistance(...)
\t\t\t\tlocal R = Table.pack(Pcall(PH_HookCCD, ...))
\t\t\t\tif R[1] then
\t\t\t\t\treturn Unpack(R, 2, R.n)
\t\t\t\tend
\t\t\t\tWarn("[aquabeary] hook ccd: " .. tostring(R[2]))
\t\t\t\treturn CheckCameraDistance(...)
\t\t\tend
\t\t\tArg2.vfxModule = V2
''')
    rep('''\t\t\tlocal Raycast = V2.Raycast
\t\t\tfunction V2.MouseRaycast(...)
''', '''\t\t\tlocal Raycast = V2.Raycast
\t\t\tlocal MouseRaycastOrig = V2.MouseRaycast
\t\t\tlocal function PH_HookMouseRaycast(...)
''')
    rep('''\t\t\t\treturn V20
\t\t\tend
\t\t\tfunction V2.Raycast(...)
''', '''\t\t\t\treturn V20
\t\t\tend
\t\t\tfunction V2.MouseRaycast(...)
\t\t\t\tlocal R = Table.pack(Pcall(PH_HookMouseRaycast, ...))
\t\t\t\tif R[1] then
\t\t\t\t\treturn Unpack(R, 2, R.n)
\t\t\t\tend
\t\t\t\tWarn("[aquabeary] hook mouseraycast: " .. tostring(R[2]))
\t\t\t\treturn MouseRaycastOrig(...)
\t\t\tend
\t\t\tlocal function PH_HookRaycast(...)
''')
    rep('''\t\t\t\treturn V18(V3)
\t\t\tend
\t\t\tArg2.raycastUtil = V2
''', '''\t\t\t\treturn V18(V3)
\t\t\tend
\t\t\tfunction V2.Raycast(...)
\t\t\t\tlocal R = Table.pack(Pcall(PH_HookRaycast, ...))
\t\t\t\tif R[1] then
\t\t\t\t\treturn Unpack(R, 2, R.n)
\t\t\t\tend
\t\t\t\tWarn("[aquabeary] hook raycast: " .. tostring(R[2]))
\t\t\t\treturn Raycast(...)
\t\t\tend
\t\t\tArg2.raycastUtil = V2
''')
    # the pcall wrapper adds two stack levels (pcall + wrapper) between the hook and the game caller
    rep('\t\t\tMOUSE_RAYCAST_CALLER_LEVEL = 2,\n', '\t\t\tMOUSE_RAYCAST_CALLER_LEVEL = 4,\n')
    rep('\t\t\tCREATE_PROJECTILE_LEVEL = 2,\n', '\t\t\tCREATE_PROJECTILE_LEVEL = 4,\n')
        # ---- shoot-path compatibility round 2 ------------------------------------------------
    # hooked MouseRaycast must return the full original tuple (only the position is replaced)
    rep('''				return V20
			end
			function V2.MouseRaycast(...)
''', '''				local Full = Table.pack(MouseRaycastOrig(...))
				if Full.n < 4 then
					Full.n = 4
				end
				Full[1] = V20
				if Target.silent.instance ~= nil then
					Full[2] = Target.silent.instance
				end
				if Full[3] == nil or Full[4] == nil then
					local Dir = V20 - Position2
					if Dir.Magnitude > 0 then
						local Ok2, HitInst, HitPos, HitNormal, HitMat = Pcall(Raycast, (Select(1, ...)), Position2, Dir.Unit * (Dir.Magnitude + 3), "Blacklist", (Select(3, ...)), nil, (Select(2, ...)))
						if Ok2 and HitNormal ~= nil then
							Full[3] = Full[3] or HitNormal
							Full[4] = Full[4] or HitMat
						end
						if Full[3] == nil then
							Full[3] = -Dir.Unit
						end
					end
					if Full[4] == nil then
						Full[4] = Enum2.Material.Plastic
					end
				end
				return Unpack(Full, 1, Full.n)
			end
			function V2.MouseRaycast(...)
''')
    # CreateProjectile is identified by function identity, not by call-site name (encrypted strings)
    rep('''if not Find(V(CreateProjectileLevel + 1, "s"), "ViewmodelController") or V(CreateProjectileLevel, "n") ~= "CreateProjectile" then''',
        '''if not Find(V(CreateProjectileLevel + 1, "s"), "ViewmodelController") or V(CreateProjectileLevel, "f") ~= VfxModule.CreateProjectile then''')
    # tool info proxies: writes / iteration / length go to the real tables
    rep('''					Spread.Hip = SetMetatable({}, {__metatable = "", __index = ScaleSpread(HipSpread)})
					Spread.Aiming = SetMetatable({}, {__metatable = "", __index = ScaleSpread(AimSpread)})
''', '''					Spread.Hip = SetMetatable({}, {__metatable = "", __index = ScaleSpread(HipSpread), __newindex = function(_, K, Val) HipSpread[K] = Val end, __iter = function() return Next, HipSpread end, __len = function() return #HipSpread end})
					Spread.Aiming = SetMetatable({}, {__metatable = "", __index = ScaleSpread(AimSpread), __newindex = function(_, K, Val) AimSpread[K] = Val end, __iter = function() return Next, AimSpread end, __len = function() return #AimSpread end})
''')
    rep('''				Recoil.Camera.Shake.X = SetMetatable({}, {__metatable = "", __index = Fn4})
				Recoil.Camera.Shake.Y = SetMetatable({}, {__metatable = "", __index = Fn3})
''', '''				Recoil.Camera.Shake.X = SetMetatable({}, {__metatable = "", __index = Fn4, __newindex = function(_, K, Val) X[K] = Val end, __iter = function() return Next, X end, __len = function() return #X end})
				Recoil.Camera.Shake.Y = SetMetatable({}, {__metatable = "", __index = Fn3, __newindex = function(_, K, Val) Y[K] = Val end, __iter = function() return Next, Y end, __len = function() return #Y end})
''')
    rep('''						__metatable = "",
						__index = function(Arg1_2, Arg2)
							local V2 = Weapon[Arg2]
''', '''						__metatable = "",
						__newindex = function(_, K, Val)
							Weapon[K] = Val
						end,
						__iter = function()
							return Next, Weapon
						end,
						__len = function()
							return #Weapon
						end,
						__index = function(Arg1_2, Arg2)
							local V2 = Weapon[Arg2]
''')
    rep('''									__metatable = "",
									__index = function(Arg1, Arg2)
										local V2 = Value2[Arg2]
''', '''									__metatable = "",
									__newindex = function(_, K, Val)
										Value2[K] = Val
									end,
									__iter = function()
										return Next, Value2
									end,
									__len = function()
										return #Value2
									end,
									__index = function(Arg1, Arg2)
										local V2 = Value2[Arg2]
''')
        # no silent target -> leave the game's raycast completely untouched
    rep('''				local V20 = V6 or Fn(...)
''', '''				if V6 == nil then
					return MouseRaycastOrig(...)
				end
				local V20 = V6
''')
        # deepClone keeps metatables (fork tool info may inherit defaults through __index)
    rep('''					T[Key] = Value
				end
				return T
			end
			return V2(Arg1, Arg2)
''', '''					T[Key] = Value
				end
				local Mt = GetRawMetatable and GetRawMetatable(Arg1) or getmetatable(Arg1)
				if Type(Mt) == "table" then
					pcall(setmetatable, T, Mt)
				end
				return T
			end
			return V2(Arg1, Arg2)
''')
    # recoil wrappers pass every return value through
    rep('''				local function Fn(...)
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
''', '''				local function Fn(...)
					local R = table.pack(RecoilStart(...))
					if (Type(R[1]) == "number") then
						R[1] = R[1] * (Flags.gunMods_recoilPercentage.value / 100)
					end
					return table.unpack(R, 1, R.n)
				end
				local function Fn2(...)
					local R = table.pack(RecoilFinish(...))
					if (Type(R[1]) == "number") then
						R[1] = R[1] * (Flags.gunMods_recoilPercentage.value / 100)
					end
					return table.unpack(R, 1, R.n)
				end
''')
    # CreateProjectile level is found by function identity instead of a fixed constant
    rep('''			local function PH_HookCCD(...)
				local CreateProjectileLevel = CreateProjectileLevel
				if V(CreateProjectileLevel, "s") == "[C]" or not DebugIsvalidlevel(CreateProjectileLevel) then
					Kick("Potato.hook error (4)")
					return CheckCameraDistance(...)
				end
				if not Find(V(CreateProjectileLevel + 1, "s"), "ViewmodelController") or V(CreateProjectileLevel, "f") ~= VfxModule.CreateProjectile then
					return CheckCameraDistance(...)
				end
''', '''			local function PH_HookCCD(...)
				local CreateProjectileLevel = nil
				local Real = VfxModule.CreateProjectile
				for Lvl = 3, 9 do
					if not DebugIsvalidlevel(Lvl) then
						break
					end
					if V(Lvl, "f") == Real then
						CreateProjectileLevel = Lvl
						break
					end
				end
				if not CreateProjectileLevel or not DebugIsvalidlevel(CreateProjectileLevel + 1) then
					return CheckCameraDistance(...)
				end
				local FromLocal = Find(V(CreateProjectileLevel + 1, "s"), "ViewmodelController") ~= nil
''')
        # CCD factory needs the camera for the "is this my projectile" check
    rep('''			local VfxModule = Arg1.gameModules.vfxModule
			local DebugIsvalidlevel = Arg1.debug_isvalidlevel
			local Kick = V9.kick
''', '''			local VfxModule = Arg1.gameModules.vfxModule
			local DebugIsvalidlevel = Arg1.debug_isvalidlevel
			local Camera = Arg1.services.camera
			local Kick = V9.kick
''')
    # projectiles spawned through VFXController count as ours when they start at our camera
    rep('''				if not V6 then
					Kick("Potato.hook error (5)")
					return CheckCameraDistance(...)
				else
					if not Target.silent.origin then
						return CheckCameraDistance(...)
					end
''', '''				if not V6 then
					return CheckCameraDistance(...)
				else
					if not FromLocal then
						local P0 = RawGet(V6, "PositionFirst") or RawGet(V6, "Position")
						local CamPos = Camera and Camera.CFrame.Position
						if TypeOf(P0) ~= "Vector3" or not CamPos or (P0 - CamPos).Magnitude > 15 then
							return CheckCameraDistance(...)
						end
					end
					if not Target.silent.origin then
						return CheckCameraDistance(...)
					end
''')
    # VFXController (PlayerScripts) also spawns projectiles with the real vfx table -> give it the hooked one
    rep('''					elseif Value == ToolInfo then
						V6 = V6 + 1
						DebugSetUpvalue(Arg2_2, Key, Arg2.toolInfo)
					end
				end
''', '''					elseif Value == ToolInfo then
						V6 = V6 + 1
						DebugSetUpvalue(Arg2_2, Key, Arg2.toolInfo)
					end
				end
				pcall(function()
					for _, F in GetGc() do
						if Type(F) == "function" then
							local Src = V(F, "s")
							if Type(Src) == "string" and (Find(Src, "VFXController") or Find(Src, "InteractController")) then
								for K2, U in V3(F) do
									if U == VfxModule then
										DebugSetUpvalue(F, K2, Arg2.vfxModule)
									end
								end
							end
						end
					end
				end)
''')
    # recoil: scale every numeric / vector return value, not just the first
    rep('''				local function Fn(...)
					local R = table.pack(RecoilStart(...))
					if (Type(R[1]) == "number") then
						R[1] = R[1] * (Flags.gunMods_recoilPercentage.value / 100)
					end
					return table.unpack(R, 1, R.n)
				end
				local function Fn2(...)
					local R = table.pack(RecoilFinish(...))
					if (Type(R[1]) == "number") then
						R[1] = R[1] * (Flags.gunMods_recoilPercentage.value / 100)
					end
					return table.unpack(R, 1, R.n)
				end
''', '''				local function ScaleRecoil(R)
					local M = Flags.gunMods_recoilPercentage.value / 100
					for I = 1, R.n do
						local X = R[I]
						local TX = TypeOf(X)
						if TX == "number" or TX == "Vector3" or TX == "Vector2" then
							R[I] = X * M
						elseif TX == "CFrame" then
							R[I] = CFrame2.identity:Lerp(X, M)
						end
					end
					return table.unpack(R, 1, R.n)
				end
				local function Fn(...)
					return ScaleRecoil(table.pack(RecoilStart(...)))
				end
				local function Fn2(...)
					return ScaleRecoil(table.pack(RecoilFinish(...)))
				end
''')
    # ---- iteration 6: CameraShake found by upvalue signature (settings table w/ CameraShakeMult + spring) ----
    rep('''\t\t\t\tlocal V6 = 0
\t\t\t\tfor Key, Value in V3(Arg2_2) do
\t\t\t\t\tif Type(Value) == "function" and V(Value, "s") ~= "[C]" then
\t\t\t\t\t\tlocal V7 = V4(Value)
\t\t\t\t\t\tif Find(V7, "Damper") then
''', '''\t\t\t\tlocal V6 = 0
\t\t\t\tlocal function PH_IsShake(F)
\t\t\t\t\tlocal Ok, Ups = Pcall(V3, F)
\t\t\t\t\tif not Ok or Type(Ups) ~= "table" then
\t\t\t\t\t\treturn false
\t\t\t\t\tend
\t\t\t\t\tlocal HasSettings, HasSpring = false, false
\t\t\t\t\tfor _, U in Ups do
\t\t\t\t\t\tif Type(U) == "table" then
\t\t\t\t\t\t\tif RawGet(U, "CameraShakeMult") ~= nil then
\t\t\t\t\t\t\t\tHasSettings = true
\t\t\t\t\t\t\tend
\t\t\t\t\t\t\tif RawGet(U, "_velocity0") ~= nil or RawGet(U, "_position0") ~= nil or RawGet(U, "_damper") ~= nil then
\t\t\t\t\t\t\t\tHasSpring = true
\t\t\t\t\t\t\tend
\t\t\t\t\t\tend
\t\t\t\t\tend
\t\t\t\t\treturn HasSettings and HasSpring
\t\t\t\tend
\t\t\t\tfor Key, Value in V3(Arg2_2) do
\t\t\t\t\tif Type(Value) == "function" and V(Value, "s") ~= "[C]" and not Arg2.old_CameraShake then
\t\t\t\t\t\tlocal V7 = V4(Value)
\t\t\t\t\t\tif Find(V7, "Damper") or PH_IsShake(Value) then
''')
    rep('''\t\t\tfunction Arg2.CameraShake(...)
\t\t\t\tlocal V5 = {...}
\t\t\t\tif Type(V5[2]) ~= "number" then
\t\t\t\t\tif Flags.noMeleeShake_toggle.value then
\t\t\t\t\t\treturn
\t\t\t\t\telse
\t\t\t\t\t\treturn Arg2.old_CameraShake(...)
\t\t\t\t\tend
\t\t\t\telse
\t\t\t\t\tlocal V6 = Flags.gunMods_recoilPercentage.value / 100
\t\t\t\t\tV5[2] = V5[2] * V6
''', '''\t\t\tfunction Arg2.CameraShake(...)
\t\t\t\tlocal V5 = {...}
\t\t\t\tlocal IsGun = Type(V5[2]) == "number" or (Type(V5[1]) == "table" and RawGet(V5[1], "Strength") ~= nil)
\t\t\t\tif not IsGun then
\t\t\t\t\tif Flags.noMeleeShake_toggle.value then
\t\t\t\t\t\treturn
\t\t\t\t\telse
\t\t\t\t\t\treturn Arg2.old_CameraShake(...)
\t\t\t\t\tend
\t\t\t\telse
\t\t\t\t\tlocal V6 = Flags.gunMods_recoilPercentage.value / 100
\t\t\t\t\tif V6 >= 1 then
\t\t\t\t\t\treturn Arg2.old_CameraShake(...)
\t\t\t\t\tend
\t\t\t\t\tif V6 <= 0 then
\t\t\t\t\t\treturn
\t\t\t\t\tend
\t\t\t\t\tif Type(V5[2]) == "number" then
\t\t\t\t\t\tV5[2] = V5[2] * V6
\t\t\t\t\tend
''')
    # ---- iteration 6b: force hit via projectile "Instant" field (fork VFXModule supports it) ----
    rep('''\t\t\tArg2.vfxModule = V2
\t\tend
\tend)()
\tlocal V9 = (function()
''', '''\t\t\tlocal RealCreateProjectile = V2.CreateProjectile
\t\t\tlocal function PH_Defer(Fn)
\t\t\t\tif Type(Fn) ~= "function" then
\t\t\t\t\treturn Fn
\t\t\t\tend
\t\t\t\tlocal Done = false
\t\t\t\treturn function(...)
\t\t\t\t\tif Done then
\t\t\t\t\t\treturn
\t\t\t\t\tend
\t\t\t\t\tDone = true
\t\t\t\t\tlocal P = Table.pack(...)
\t\t\t\t\tTask.defer(function()
\t\t\t\t\t\tFn(Unpack(P, 1, P.n))
\t\t\t\t\tend)
\t\t\t\tend
\t\t\tend
\t\t\tlocal function PH_PrepProjectile(Data)
\t\t\t\tif Type(Data) ~= "table" then
\t\t\t\t\treturn
\t\t\t\tend
\t\t\t\tlocal Flags = Arg1.flags
\t\t\t\tif not Flags.silentAim_instantHit.value then
\t\t\t\t\treturn
\t\t\t\tend
\t\t\t\tlocal Src = V(4, "s")
\t\t\t\tif Type(Src) ~= "string" or not Find(Src, "ViewmodelController") then
\t\t\t\t\treturn
\t\t\t\tend
\t\t\t\tif Target.silent.vector3 and Math.random(0, 99) >= Flags.silentAim_hitchance.value then
\t\t\t\t\treturn
\t\t\t\tend
\t\t\t\tRawSet(Data, "Instant", 1 / 60)
\t\t\t\tRawSet(Data, "HitFunction", PH_Defer(RawGet(Data, "HitFunction")))
\t\t\t\tRawSet(Data, "MissFunction", PH_Defer(RawGet(Data, "MissFunction")))
\t\t\tend
\t\t\tfunction V2.CreateProjectile(Self, Data, ...)
\t\t\t\tlocal Ok, Err = Pcall(PH_PrepProjectile, Data)
\t\t\t\tif not Ok then
\t\t\t\t\tWarn("[aquabeary] hook cp: " .. tostring(Err))
\t\t\t\tend
\t\t\t\treturn RealCreateProjectile(Self, Data, ...)
\t\t\tend
\t\t\tArg2.vfxModule = V2
\t\tend
\tend)()
\tlocal V9 = (function()
''')
    rep('''\t\t\t\tlocal FromLocal = Find(V(CreateProjectileLevel + 1, "s"), "ViewmodelController") ~= nil
''', '''\t\t\t\tlocal FromLocal = Find(V(CreateProjectileLevel + 1, "s"), "ViewmodelController") ~= nil
\t\t\t\tif not FromLocal and DebugIsvalidlevel(CreateProjectileLevel + 2) then
\t\t\t\t\tFromLocal = Find(V(CreateProjectileLevel + 2, "s"), "ViewmodelController") ~= nil
\t\t\t\tend
''')
    # ---- iteration 7: fly rewritten (CFrame step, no anchor, no velocity spikes) ----
    rep('''\t\t\tlocal V2 = New(0, 0, 0)
\t\t\tlocal CFrame2 = Arg1.localrootpart.CFrame
\t\t\tlocal V3, V4, V5 = CFrame2:ToOrientation()
\t\t\tCFrame2 = New2(CFrame2.Position) * FromOrientation(0, V4, V5)
\t\t\tlocal V6 = "W"
\t\t\tlocal V7 = "S"
\t\t\tlocal V8 = "D"
\t\t\tlocal V9 = "A"
\t\t\tlocal V10 = "C"
\t\t\tlocal V11 = "Space"
\t\t\tdo
\t\t\t\tif (KeyHandlers.W) then
\t\t\t\t\tV2 += CFrame2.LookVector
\t\t\t\tend
\t\t\t\tif (KeyHandlers.S) then
\t\t\t\t\tV2 -= CFrame2.LookVector
\t\t\t\tend
\t\t\t\tif (KeyHandlers.D) then
\t\t\t\t\tV2 += CFrame2.RightVector
\t\t\t\tend
\t\t\t\tif (KeyHandlers.A) then
\t\t\t\t\tV2 -= CFrame2.RightVector
\t\t\t\tend
\t\t\t\tif (KeyHandlers.Space) then
\t\t\t\t\tV2 += YAxis
\t\t\t\tend
\t\t\t\tif (KeyHandlers.C) then
\t\t\t\t\tV2 -= YAxis
\t\t\t\tend
\t\t\tend
\t\t\tif (V2.Magnitude == 0) then
\t\t\t\tArg1.localrootpart.Anchored = true
\t\t\t\treturn
\t\t\telseif (Arg1.localrootpart.Anchored) then
\t\t\t\tArg1.localrootpart.Anchored = false
\t\t\tend
\t\t\tV2 = V2.Unit * New(Flags.fly_speed.value, 16, Flags.fly_speed.value)
\t\t\tif (V2 ~= V2) then
\t\t\t\tV2 = New()
\t\t\tend
\t\t\tArg1.localrootpart.Velocity = V2
\t\tend
''', '''\t\t\tlocal Root = Arg1.localrootpart
\t\t\tif Root.Anchored then
\t\t\t\tRoot.Anchored = false
\t\t\tend
\t\t\tlocal CamCF = Camera.CFrame
\t\t\tlocal Look = CamCF.LookVector
\t\t\tlocal Right = CamCF.RightVector
\t\t\tlocal V2 = New(0, 0, 0)
\t\t\tdo
\t\t\t\tif (KeyHandlers.W) then
\t\t\t\t\tV2 += New(Look.X, 0, Look.Z)
\t\t\t\tend
\t\t\t\tif (KeyHandlers.S) then
\t\t\t\t\tV2 -= New(Look.X, 0, Look.Z)
\t\t\t\tend
\t\t\t\tif (KeyHandlers.D) then
\t\t\t\t\tV2 += New(Right.X, 0, Right.Z)
\t\t\t\tend
\t\t\t\tif (KeyHandlers.A) then
\t\t\t\t\tV2 -= New(Right.X, 0, Right.Z)
\t\t\t\tend
\t\t\t\tif (KeyHandlers.Space) then
\t\t\t\t\tV2 += YAxis
\t\t\t\tend
\t\t\t\tif (KeyHandlers.C) then
\t\t\t\t\tV2 -= YAxis
\t\t\t\tend
\t\t\tend
\t\t\tif (V2.Magnitude > 0) then
\t\t\t\tV2 = V2.Unit
\t\t\tend
\t\t\tlocal Dt = Type(Arg1_2) == "number" and Arg1_2 or (1 / 60)
\t\t\tif Dt > 0.1 then
\t\t\t\tDt = 0.1
\t\t\tend
\t\t\tlocal Pos = Root.CFrame.Position + V2 * (Dt * Flags.fly_speed.value)
\t\t\tlocal Flat = New(Look.X, 0, Look.Z)
\t\t\tif (Flat.Magnitude < 0.01) then
\t\t\t\tlocal RL = Root.CFrame.LookVector
\t\t\t\tFlat = New(RL.X, 0, RL.Z)
\t\t\tend
\t\t\tif (Flat.Magnitude < 0.01) then
\t\t\t\tFlat = New(0, 0, -1)
\t\t\tend
\t\t\tif Arg1.localhumanoid then
\t\t\t\tArg1.localhumanoid.PlatformStand = false
\t\t\tend
\t\t\tRoot.Velocity = New(0, 0, 0)
\t\t\tRoot.CFrame = New2(Pos, Pos + Flat)
\t\tend
''')
    rep('''\t\t\tlocal V3 = (Flags.noFallDamage_toggle.value and Velocity.Magnitude > 1 or Flags.fly_toggle.value) and New(0, 16384, 0)
''', '''\t\t\tlocal V3 = (Flags.noFallDamage_toggle.value and not Flags.fly_toggle.value and Velocity.Magnitude > 1) and New(0, 16384, 0)
''')
    # ---- iteration 7: FireRemote interceptor (own packets) + shot log file ----
    rep('''\t\t\t\tpcall(function()
\t\t\t\t\tfor _, F in GetGc() do
\t\t\t\t\t\tif Type(F) == "function" then
\t\t\t\t\t\t\tlocal Src = V(F, "s")
\t\t\t\t\t\t\tif Type(Src) == "string" and (Find(Src, "VFXController") or Find(Src, "InteractController")) then
''', '''\t\t\t\tpcall(function()
\t\t\t\t\tlocal RealRemote = nil
\t\t\t\t\tfor _, Value in V3(Arg2_2) do
\t\t\t\t\t\tif Type(Value) == "table" and Type(RawGet(Value, "FireRemote")) == "function" and Type(RawGet(Value, "SetupRemote")) == "function" then
\t\t\t\t\t\t\tRealRemote = Value
\t\t\t\t\t\t\tbreak
\t\t\t\t\t\tend
\t\t\t\t\tend
\t\t\t\t\tif not RealRemote then
\t\t\t\t\t\treturn
\t\t\t\t\tend
\t\t\t\t\tlocal RealFire = RawGet(RealRemote, "FireRemote")
\t\t\t\t\tlocal FakeRemote = {}
\t\t\t\t\tfor K, Val in RealRemote do
\t\t\t\t\t\tFakeRemote[K] = Val
\t\t\t\t\tend
\t\t\t\t\tlocal LogLines = {}
\t\t\t\t\tlocal LogCount = 0
\t\t\t\t\tlocal function Describe(X)
\t\t\t\t\t\tlocal T = TypeOf(X)
\t\t\t\t\t\tif T == "Instance" then
\t\t\t\t\t\t\treturn "Instance<" .. X.ClassName .. ":" .. X.Name .. ">"
\t\t\t\t\t\telseif T == "CFrame" then
\t\t\t\t\t\t\tlocal P = X.Position
\t\t\t\t\t\t\tlocal L = X.LookVector
\t\t\t\t\t\t\treturn ("CFrame<pos %.2f %.2f %.2f look %.3f %.3f %.3f>"):format(P.X, P.Y, P.Z, L.X, L.Y, L.Z)
\t\t\t\t\t\telseif T == "Vector3" then
\t\t\t\t\t\t\treturn ("Vector3<%.3f %.3f %.3f>"):format(X.X, X.Y, X.Z)
\t\t\t\t\t\telseif T == "table" then
\t\t\t\t\t\t\tlocal Parts = {}
\t\t\t\t\t\t\tfor K, Val in X do
\t\t\t\t\t\t\t\tParts[#Parts + 1] = tostring(K) .. "=" .. TypeOf(Val)
\t\t\t\t\t\t\tend
\t\t\t\t\t\t\treturn "table{" .. Table.concat(Parts, ",") .. "}"
\t\t\t\t\t\tend
\t\t\t\t\t\treturn T .. ":" .. tostring(X)
\t\t\t\t\tend
\t\t\t\t\tlocal function LogPacket(Args)
\t\t\t\t\t\tif LogCount >= 60 then
\t\t\t\t\t\t\treturn
\t\t\t\t\t\tend
\t\t\t\t\t\tLogCount = LogCount + 1
\t\t\t\t\t\tlocal Cam = Workspace.CurrentCamera and Workspace.CurrentCamera.CFrame
\t\t\t\t\t\tlocal Root = V39.Character and V39.Character:FindFirstChild("HumanoidRootPart")
\t\t\t\t\t\tlocal Head = ("[%d] t=%.2f"):format(LogCount, os.clock())
\t\t\t\t\t\tif Cam then
\t\t\t\t\t\t\tHead = Head .. " cam=" .. Describe(Cam)
\t\t\t\t\t\tend
\t\t\t\t\t\tif Root then
\t\t\t\t\t\t\tHead = Head .. " root=" .. Describe(Root.CFrame)
\t\t\t\t\t\tend
\t\t\t\t\t\tLogLines[#LogLines + 1] = Head
\t\t\t\t\t\tfor I = 2, Args.n do
\t\t\t\t\t\t\tlocal A = Args[I]
\t\t\t\t\t\t\tif Type(A) == "table" then
\t\t\t\t\t\t\t\tLogLines[#LogLines + 1] = ("  arg%d = table(%d)"):format(I, #A)
\t\t\t\t\t\t\t\tfor K, Val in A do
\t\t\t\t\t\t\t\t\tLogLines[#LogLines + 1] = "    " .. tostring(K) .. ": " .. Describe(Val)
\t\t\t\t\t\t\t\tend
\t\t\t\t\t\t\telse
\t\t\t\t\t\t\t\tLogLines[#LogLines + 1] = ("  arg%d = "):format(I) .. Describe(A)
\t\t\t\t\t\t\tend
\t\t\t\t\t\tend
\t\t\t\t\t\tpcall(WriteFile, "aquabeary_packets.txt", Table.concat(LogLines, "\\n"))
\t\t\t\t\tend
\t\t\t\t\tFakeRemote.FireRemote = function(...)
\t\t\t\t\t\tlocal Args = Table.pack(...)
\t\t\t\t\t\tif Args[1] == FakeRemote then
\t\t\t\t\t\t\tArgs[1] = RealRemote
\t\t\t\t\t\tend
\t\t\t\t\t\tpcall(LogPacket, Args)
\t\t\t\t\t\tlocal Hook = Client.packetHook
\t\t\t\t\t\tif Type(Hook) == "function" then
\t\t\t\t\t\t\tpcall(Hook, Args)
\t\t\t\t\t\tend
\t\t\t\t\t\treturn RealFire(Unpack(Args, 1, Args.n))
\t\t\t\t\tend
\t\t\t\t\tClient.realRemote = RealRemote
\t\t\t\t\tClient.fakeRemote = FakeRemote
\t\t\t\t\tfor _, F in GetGc() do
\t\t\t\t\t\tif Type(F) == "function" then
\t\t\t\t\t\t\tlocal Src = V(F, "s")
\t\t\t\t\t\t\tif Type(Src) == "string" and Find(Src, "ViewmodelController") then
\t\t\t\t\t\t\t\tfor K2, U in V3(F) do
\t\t\t\t\t\t\t\t\tif U == RealRemote then
\t\t\t\t\t\t\t\t\t\tDebugSetUpvalue(F, K2, FakeRemote)
\t\t\t\t\t\t\t\t\tend
\t\t\t\t\t\t\t\tend
\t\t\t\t\t\t\tend
\t\t\t\t\t\tend
\t\t\t\t\tend
\t\t\t\tend)
\t\t\t\tpcall(function()
\t\t\t\t\tfor _, F in GetGc() do
\t\t\t\t\t\tif Type(F) == "function" then
\t\t\t\t\t\t\tlocal Src = V(F, "s")
\t\t\t\t\t\t\tif Type(Src) == "string" and (Find(Src, "VFXController") or Find(Src, "InteractController")) then
''')
    # ---- iteration 7b: silence expected fork codes; fly velocity consistent with motion ----
    rep('''\t\t\tkick = function(Arg1)
\t\t\t\tWarn("[Potato.hook] internal check failed: " .. tostring(Arg1))
\t\t\t\tif PH_NOTIFY then
''', '''\t\t\tkick = function(Arg1)
\t\t\t\tlocal Msg = tostring(Arg1)
\t\t\t\tWarn("[Potato.hook] internal check failed: " .. Msg)
\t\t\t\tif Msg:find("(10)", 1, true) or Msg:find("(12)", 1, true) or Msg:find("(15a)", 1, true) or Msg:find("anchored by the game", 1, true) then
\t\t\t\t\treturn
\t\t\t\tend
\t\t\t\tif PH_NOTIFY then
''')
    rep('''\t\t\tRoot.Velocity = New(0, 0, 0)
\t\t\tRoot.CFrame = New2(Pos, Pos + Flat)
''', '''\t\t\tRoot.Velocity = V2 * Flags.fly_speed.value
\t\t\tRoot.CFrame = New2(Pos, Pos + Flat)
''')
    return text
