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
		drawTexts(d, x, y, w, h, settings, self.player.DisplayName or self.player.Name, `[{dist} studs]`, weaponText)
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
			drawTexts(d, x, y, w, h, settings, self.displayName, `[{dist} studs]`, nil)
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
