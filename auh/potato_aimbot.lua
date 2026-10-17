;(function()
	local ok, err = pcall(function()
		local Library = PH_UI.Library
		local Window = PH_UI.window
		local EntityClass = PH_UI.EntityClass
		local combat = Window and Window.tabs and Window.tabs.combat
		if not (Library and EntityClass and combat and combat.potatoTab) then
			return
		end
		local Camera = workspace.CurrentCamera
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local LocalPlayer = Players.LocalPlayer
		local Flags = Library.Flags

		local Category = combat.potatoTab:Category({Name = "Aimbot"})
		local Main = Category:Section({Name = "Camera aimbot", Side = "Left"})
		Main:Toggle({Name = "Enabled", Flag = "CamAimbot", Tooltip = "Camera aimbot (no game hooks)"})
		Main:Dropdown({Name = "Mode", Flag = "CamAimbotMode", Options = {"Smooth", "Snap"}})
		Main:Slider({Name = "Smoothness", Flag = "CamAimSmooth", Min = 1, Max = 20, Default = 6, Tooltip = "Lower = faster (1 = instant)"})
		Main:Keybind({Name = "Aim key", Flag = "CamAimKey", Mode = "Hold"})
		Main:Toggle({Name = "Always target", Flag = "CamAlwaysTarget", Default = true, Tooltip = "Aimbot active without a key"})
		Main:Toggle({Name = "Visibility check", Flag = "CamVisibleCheck", Default = true, Tooltip = "Only targets you can see"})
		Main:Dropdown({Name = "Hit part", Flag = "CamAimbotPart", Options = {"Head", "UpperTorso", "LowerTorso"}})
		Main:Seperator()
		Main:Toggle({Name = "Target players", Flag = "CamTargetPlayer", Default = true})
		Main:Toggle({Name = "Target AI", Flag = "CamTargetAI", Default = true})
		Main:Toggle({Name = "Target bosses", Flag = "CamTargetBoss", Default = true})

		local Accent = (Library.Theme and Library.Theme.Accent) or Color3.fromRGB(63, 201, 176)
		local Fov = Category:Section({Name = "FOV Settings", Side = "Right"})
		Fov:Toggle({Name = "Visualize FOV", Flag = "CamShowFov"})
		Fov:Toggle({Name = "Dynamic Radius", Flag = "CamDynamicFov", Tooltip = "Scales radius based on Camera FOV"})
		Fov:Slider({Name = "Radius", Flag = "CamFovRadius", Min = 30, Max = 1500, Default = 350, Suffix = "px"})
		Fov:Colorpicker({Name = "Color", Flag = "CamFovColor", Default = {Accent, 0.8}})

		local function make(class, props)
			local inst = Instance.new(class)
			for k, v in props do
				if k ~= "Parent" then
					inst[k] = v
				end
			end
			inst.Parent = props.Parent
			return inst
		end
		local guiParent = game:GetService("CoreGui")
		pcall(function()
			if gethui then
				guiParent = gethui()
			end
		end)
		local FOVSpace = make("ScreenGui", {Name = "FOVSpace", IgnoreGuiInset = true, ResetOnSpawn = false, Parent = guiParent})
		local function makeRing()
			local Outline = make("Frame", {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0), BackgroundTransparency = 1, ZIndex = 9999, Size = UDim2.new(0, 350, 0, 350), Visible = false, Parent = FOVSpace})
			local Circle = make("Frame", {BackgroundTransparency = 1, ZIndex = 9999, Position = UDim2.new(0, -1, 0, -1), Size = UDim2.new(1, 2, 1, 2), BackgroundColor3 = Accent, Parent = Outline})
			local Inline = make("Frame", {Size = UDim2.new(1, -2, 1, -2), Position = UDim2.new(0, 1, 0, 1), BackgroundTransparency = 0.8, BackgroundColor3 = Accent, ZIndex = 9998, Parent = Circle})
			make("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Circle})
			make("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Inline})
			make("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Outline})
			local Stroke = make("UIStroke", {Thickness = 3, Color = Accent, Parent = Circle})
			make("UIStroke", {Thickness = 5, Color = Color3.new(), Parent = Outline})
			return {Outline = Outline, Circle = Circle, Inline = Inline, Stroke = Stroke}
		end
		local Ring = makeRing()
		local FOVOutline, FOVCircle, FOVInline, FOVCircleStroke = Ring.Outline, Ring.Circle, Ring.Inline, Ring.Stroke
		local TweenService = game:GetService("TweenService")
		local lastSize = nil

		-- silent aim fov ring (replaces the plain drawing circle, follows the mouse like the original)
		local SilentRing = makeRing()
		local UIS = game:GetService("UserInputService")
		local AFlags = PH_UI.flags or {}
		local function aflag(name)
			local f = AFlags[name]
			return f and f.value
		end
		RunService.RenderStepped:Connect(function()
			local show = aflag("silentAim_drawFov") == true and aflag("silentAim_toggle") == true
			SilentRing.Outline.Visible = show
			if not show then
				return
			end
			local r = tonumber(aflag("silentAim_fovSize")) or 100
			if aflag("silentAim_dynamicFov") == true then
				r = r / (math.max(Camera.FieldOfView, 1) / 70)
			end
			local d = math.floor(r * 2)
			SilentRing.Outline.Size = UDim2.new(0, d, 0, d)
			local m = UIS:GetMouseLocation()
			SilentRing.Outline.Position = UDim2.new(0, m.X, 0, m.Y)
			local c = aflag("silentAim_fovColour")
			if typeof(c) == "Color3" then
				SilentRing.Stroke.Color = c
				SilentRing.Inline.BackgroundColor3 = c
			end
		end)

		local function flag(name)
			local f = Flags[name]
			return f and f.Value
		end
		local function keyActive()
			local f = Flags.CamAimKey
			return f and f.Active == true
		end

		RunService.RenderStepped:Connect(function()
			local enabled = flag("CamAimbot") == true
			local size = tonumber(flag("CamFovRadius")) or 350
			local vs = Camera.ViewportSize
			local center = Vector2.new(vs.X / 2, vs.Y / 2)
			if flag("CamDynamicFov") == true then
				local diff = 70 / math.max(Camera.FieldOfView, 1)
				local target = math.floor(diff * size)
				if target ~= lastSize then
					lastSize = target
					TweenService:Create(FOVOutline, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {Size = UDim2.new(0, target, 0, target)}):Play()
				end
			else
				lastSize = nil
				FOVOutline.Size = UDim2.new(0, size, 0, size)
			end
			local col = flag("CamFovColor")
			if type(col) == "table" and typeof(col[1]) == "Color3" then
				FOVCircleStroke.Color = col[1]
				FOVInline.BackgroundColor3 = col[1]
				FOVInline.BackgroundTransparency = tonumber(col[2]) or 0.8
			elseif typeof(col) == "Color3" then
				FOVCircleStroke.Color = col
				FOVInline.BackgroundColor3 = col
			end
			FOVOutline.Visible = enabled and flag("CamShowFov") == true
			local radius = FOVCircle.AbsoluteSize.X / 2
			if radius < 1 then
				radius = size / 2
			end
			if not enabled then
				EntityClass.TargetData = nil
				return
			end
			if not (flag("CamAlwaysTarget") == true or keyActive()) then
				EntityClass.TargetData = nil
				return
			end
			local myChar = LocalPlayer.Character
			local partName = flag("CamAimbotPart")
			if type(partName) ~= "string" or partName == "" then
				partName = "Head"
			end
			local vis = flag("CamVisibleCheck") == true
			local now = tick()
			local best, bestObj, bestDist = nil, nil, radius
			for entity, obj in EntityClass.Main.Cache do
				if entity == LocalPlayer then
					continue
				end
				local char = obj.Character
				if not char or char == myChar or char.Parent == nil then
					continue
				end
				if now - (obj.LastUpdate or 0) > 0.0145 then
					obj.LastUpdate = now
					pcall(obj.Update, obj)
				end
				local core = obj.CoreInformation
				if not (core and core.Root and core.OnScreen) then
					continue
				end
				local ct = obj.ClassType or "Player"
				if ct == "Player" and (obj.Friendly == true or (PH_UI.isTeam and PH_UI.isTeam(entity))) then
					continue
				end
				if flag("CamTarget" .. ct) ~= true then
					continue
				end
				if obj.IsDead == true then
					continue
				end
				local target
				if vis then
					if not core.Visible then
						continue
					end
					target = char:FindFirstChild(partName) or core.VisiblePart
				else
					target = char:FindFirstChild(partName) or core.Root
				end
				if not target then
					continue
				end
				local sp, on = Camera:WorldToViewportPoint(target.Position)
				if not on then
					continue
				end
				local d = (Vector2.new(sp.X, sp.Y) - center).Magnitude
				if d < bestDist then
					bestDist = d
					best = target
					bestObj = obj
				end
			end
			EntityClass.TargetData = bestObj
			if not best then
				return
			end
			local goal = CFrame.new(Camera.CFrame.Position, best.Position)
			if flag("CamAimbotMode") == "Snap" then
				Camera.CFrame = goal
			else
				local s = tonumber(flag("CamAimSmooth")) or 6
				Camera.CFrame = Camera.CFrame:Lerp(goal, math.clamp(1 / math.max(s, 1), 0.02, 1))
			end
		end)
	end)
	if not ok then
		warn("[aquabeary] aimbot: " .. tostring(err))
	end
end)()
