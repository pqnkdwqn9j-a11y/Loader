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

