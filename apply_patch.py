import re, sys

src = open('/home/user/uploads/message-6.txt', encoding='utf-8', errors='replace').read().replace('\r\n', '\n')
applied = []

def build(old):
    lines = [l.strip() for l in old.strip('\n').split('\n')]
    return r'\n[ \t]*' + r'[ \t]*\n[ \t]*'.join(re.escape(l) for l in lines)

def rrep(tag, old, new, count=1):
    global src
    src, n = re.subn(build(old), lambda m: '\n' + new, src, count=count)
    if n != count:
        i = src.find(old.strip().split('\n')[0][:40])
        print(f"!!! ANCHOR FAIL [{tag}] {n}x want {count}")
        print("--- context around first line of anchor ---")
        j = src.find(old.strip().split('\n')[0])
        print(repr(src[max(0,j-200):j+600]))
        sys.exit(1)
    applied.append(tag)

# ==== E1: логи ====
rrep("E1a-verbose-gate", '''if m == "FireServer" or m == "InvokeServer" then
    if typeof(self) == "Instance" then
        log(m == "FireServer" and "FIRE" or "INVOKE", self.Name, fmt_args(...))
    end
elseif m == "Kick" then''',
'''if m == "FireServer" or m == "InvokeServer" then
                if VERBOSE and typeof(self) == "Instance" then
                    log(m == "FireServer" and "FIRE" or "INVOKE", self.Name, fmt_args(...))
                end
            elseif m == "Kick" then''')

rrep("E1b-verbose-def", '''local function log(cat, msg, extra)''',
'''local VERBOSE = getgenv().FallosVerbose == true

  local function log(cat, msg, extra)''')

rrep("E1c-file-gate", '''print("[FALLOS] " .. line)
    if hp_appendfile then
        pcall(hp_appendfile, log_file, line .. "\\n")
    end
end''',
'''print("[FALLOS] " .. line)
      local important = (cat == "KICK" or cat == "ERROR" or cat == "HOOK" or cat == "START")
      if hp_appendfile and (important or VERBOSE) then
          pcall(hp_appendfile, log_file, line .. "\\n")
      end
  end''')

# ==== E2: Instant Loot helpers ====
E2_NEW = '''Cheat.Globals.DesyncedPositions = {}

  --// Instant Loot (fix): ищем функции задержки лута по константам 0.9/0.3/0.1
  local function scan_quickstack_functions()
      local found = {}
      if not (debug and debug.getconstants and debug.getupvalues and getconnections) then
          return found
      end
      local LP = game:GetService("Players").LocalPlayer
      local character = Cheat.Globals.ClientCharacter or LP.Character
      if not character then return found end
      local ok, err = pcall(function()
          local ic = character:FindFirstChild("InventoryController")
          if not ic then
              ic = character:WaitForChild("InventoryController", 10)
          end
          local ev = ic and ic:FindFirstChild("EquipArmor")
          if not (ev and ev.Event) then return end
          for _, conn in getconnections(ev.Event) do
              local f = conn.Function
              if type(f) ~= "function" then continue end
              pcall(function()
                  for _, v in debug.getupvalues(f) do
                      if type(v) ~= "function" then continue end
                      local okc, Constants = pcall(debug.getconstants, v)
                      if not (okc and type(Constants) == "table") then continue end
                      local i9, i3, i1
                      for i, c in Constants do
                          if type(c) == "number" then
                              if not i9 and math.abs(c - 0.9) < 0.001 then i9 = i
                              elseif not i3 and math.abs(c - 0.3) < 0.001 then i3 = i
                              elseif not i1 and math.abs(c - 0.1) < 0.001 then i1 = i end
                          end
                      end
                      if i9 and i3 and i1 then
                          found[#found + 1] = { fn = v, i9 = i9, i3 = i3, i1 = i1 }
                      end
                  end
              end)
          end
      end)
      if not ok then log("ERROR", "scan_quickstack", tostring(err)) end
      return found
  end

  Cheat.Globals.ApplyInstantLoot = function(value)
      local list = Cheat.Globals.QuickStackFunctions
      if not list or #list == 0 then
          list = scan_quickstack_functions()
          Cheat.Globals.QuickStackFunctions = list
      end
      local n = 0
      for _, entry in list do
          pcall(function()
              if value then
                  debug.setconstant(entry.fn, entry.i9, 0)
                  debug.setconstant(entry.fn, entry.i3, 0)
                  debug.setconstant(entry.fn, entry.i1, 0)
              else
                  debug.setconstant(entry.fn, entry.i9, 0.9)
                  debug.setconstant(entry.fn, entry.i3, 0.3)
                  debug.setconstant(entry.fn, entry.i1, 0.1)
              end
              n += 1
          end)
      end
      log("LOOT", "instant loot = " .. tostring(value), "patched=" .. n)
      return n
  end'''
rrep("E2-loot-helpers", '''Cheat.Globals.DesyncedPositions = {}''', E2_NEW)

# ==== E3: колбэк Instant Loot ====
rrep("E3-loot-callback", '''Callback = function(value)
    local QuickStackFunctions = Cheat.Globals.QuickStackFunctions or {}

    if #QuickStackFunctions > 0 then
        for _, FUNCTION in QuickStackFunctions do
            debug.setconstant(FUNCTION, 19, value and 0 or 0.9) -- 0.9
            debug.setconstant(FUNCTION, 20, value and 0 or 0.3) -- 0.3
            debug.setconstant(FUNCTION, 21, value and 0 or 0.1) -- 0.1
        end
    end
end;''',
'''Callback = function(value)
                      if Cheat.Globals.ApplyInstantLoot then
                          Cheat.Globals.ApplyInstantLoot(value == true)
                      end
                  end;''')

# ==== E5: Reach ====
rrep("E5-reach-toggle", '''GunModsSection:Toggle({
    Name = "No Sway",
    Flag = "NoSway",
})''',
'''GunModsSection:Toggle({
                Name = "No Sway",
                Flag = "NoSway",
            })

            GunModsSection:Toggle({
                Name = "Reach",
                Flag = "Reach",
            })''')

# ==== E6: FovFilled ====
rrep("E6-fov-filled", '''AimbotSection:Toggle({Name = "Draw Fov", Flag = "FovEnabled"}):Colorpicker({
    Name = "Fov Color",
    Flag = "FovColor",
    Alpha = 0.3,
    Default = Color3.fromRGB(255, 20, 147),
})''',
'''AimbotSection:Toggle({Name = "Draw Fov", Flag = "FovEnabled"}):Colorpicker({
                Name = "Fov Color",
                Flag = "FovColor",
                Alpha = 0.3,
                Default = Color3.fromRGB(255, 20, 147),
            })

            AimbotSection:Toggle({Name = "Filled", Flag = "FovFilled"})''')

# ==== E4: Zoom ====
rrep("E4a-zoom-default", '''MovementSection:Toggle({
    Name = "Zoom",
    Flag = "ZoomEnabled",
})''',
'''MovementSection:Toggle({
                Name = "Zoom",
                Flag = "ZoomEnabled",
                Default = true,
            })''')

rrep("E4b-zoom-cond", '''if v34 == "General" and v35 == "Field Of View" and flags.ZoomKeybind.Toggled then''',
'''if v34 == "General" and v35 == "Field Of View" and flags.ZoomEnabled ~= false and flags.ZoomKeybind and flags.ZoomKeybind.Toggled then''')

# ==== E8: Movement ====
m = re.search(r'\n[ \t]*do[ \t]*--//[ \t]*Movement\n', src)
assert m, "Movement start"
start = m.start()
end_m = re.search(r'\n[ \t]*--[ \t]*//[ \t]*Main Hooks', src)
assert end_m, "Main Hooks anchor"
new_movement = open('/home/user/movement_new.lua', encoding='utf-8').read()
src = src[:start] + new_movement + src[end_m.start():]
applied.append("E8-movement-block")

# ==== E9: Ambience ====
rrep("E9a-folder", '''local folder = Instance.new('Folder')
    folder.Parent = workspace''',
'''local folder = Instance.new('Folder')
          folder.Name = 'FallosAmbience'
          folder.Parent = workspace
          Cheat.Globals.AmbienceFolder = folder''')

rrep("E9b-part-props", '''local p = Instance.new('Part')
    p.Size = Vector3.new(0.1, 0.1, 0.1)
    p.Anchored = true
    p.CanCollide = false
    p.Transparency = 1''',
'''local p = Instance.new('Part')
              p.Size = Vector3.new(0.1, 0.1, 0.1)
              p.Anchored = true
              p.CanCollide = false
              p.CanQuery = false
              p.CanTouch = false
              p.Massless = true
              p.Transparency = 1''')

# ==== E10 ====
rrep("E10-raycast-filter", '''Cheat.Globals.RaycastParams.FilterDescendantsInstances = {
    Camera, Cheat.Globals.ClientCharacter,
    workspace:FindFirstChild("VFX"),
    workspace:FindFirstChild("RocketFactoryPinkCardInvisWalls")
}''',
'''Cheat.Globals.RaycastParams.FilterDescendantsInstances = {
              Camera, Cheat.Globals.ClientCharacter,
              workspace:FindFirstChild("VFX"),
              workspace:FindFirstChild("RocketFactoryPinkCardInvisWalls"),
              Cheat.Globals.AmbienceFolder
          }''')

# ==== E11 ====
rrep("E11-nopen", '''local no_pen = {
    Military = true,''',
'''local no_pen = {
          FallosAmbience = true,
          Military = true,''')

# ==== E12 ====
rrep("E12-traceback", '''if not tb:find("ReplicatedStorage.Modules.VFXModule:153 function HitVFX") then''',
'''local from_hitvfx = tb and tb:find("VFXModule", 1, true) ~= nil and tb:find("HitVFX", 1, true) ~= nil
          if not from_hitvfx then''', count=2)

# ==== E13 ====
rrep("E13a-vfx-timeout", '''local wsVFXFolder = Workspace:WaitForChild("VFX")''',
     '''local wsVFXFolder = Workspace:WaitForChild("VFX", 15)''')
rrep("E13b-itemclass-timeout", '''local ItemClass = Modules and require(Modules:WaitForChild("ItemClass"))''',
     '''local ItemClass = Modules and require(Modules:WaitForChild("ItemClass", 15))''')
rrep("E13c-vms-armor", '''for _, gunModel in ReplicatedStorage:WaitForChild("VMs"):GetChildren() do''',
'''local rsVMs = ReplicatedStorage:FindFirstChild("VMs") or ReplicatedStorage:WaitForChild("VMs", 10)
          for _, gunModel in (rsVMs and rsVMs:GetChildren() or {}) do''')

# ==== E14: UpdateChar ====
rrep("E14-updatechar", '''local UpdateChar = LPH_NO_VIRTUALIZE(function()
    local character = Client.Character or Client.CharacterAdded:Wait()
    Cheat.Globals.ClientCharacter = character

    local hum = character:FindFirstChildOfClass('Humanoid') or character:WaitForChild('Humanoid')
    local InventoryController = character:WaitForChild('InventoryController')
    local EquipArmor = InventoryController:WaitForChild('EquipArmor')

    for _, conn in getconnections(EquipArmor.Event) do
        local f = conn.Function
        if not f then continue end
        for _, v in debug.getupvalues(f) do
            if type(v) ~= 'function' then continue end
            local Constants = debug.getconstants(v)
            if Constants[1] == ArmorEquip and Constants[5] == GetAttribute then
                if flags.InstantLoot then
                    debug.setconstant(v, 19, 0)
                    debug.setconstant(v, 20, 0)
                    debug.setconstant(v, 21, 0)
                end
                table.insert(Cheat.Globals.QuickStackFunctions, v)
            end
        end
    end
    task.defer(function()
        task.wait(1)
        grab_springs()
    end)
end)''',
'''local UpdateChar = LPH_NO_VIRTUALIZE(function()
          local character = Client.Character or Client.CharacterAdded:Wait()
          -- фиксируем персонажа сразу: от него зависит видимость/таргетинг
          Cheat.Globals.ClientCharacter = character
          Cheat.Globals.QuickStackFunctions = {}

          pcall(function()
              local InventoryController = character:FindFirstChild('InventoryController') or character:WaitForChild('InventoryController', 10)
              if not InventoryController then return end

              local found = scan_quickstack_functions()
              Cheat.Globals.QuickStackFunctions = found
              log("LOOT", "quickstack functions found=" .. tostring(#found))

              if flags.InstantLoot and #found > 0 then
                  Cheat.Globals.ApplyInstantLoot(true)
              end
          end)

          task.defer(function()
              task.wait(1)
              grab_springs()
          end)
      end)''')

# ==== E15 ====
rrep("E15-vm-guard", '''bullettracersbind.Event:Connect(function(position)
    if (not flags.BulletTracers) then
        return;
    end;''',
'''bullettracersbind.Event:Connect(function(position)
          if (not flags.BulletTracers) or (not VMs) then
              return;
          end;''')

# ==== E16 ====
rrep("E16-cham-destroy", '''Players.PlayerRemoving:Connect(function(p)
    if p.Character and ESP[p.Character] then 
        local e = ESP[p.Character]
        e.Holder:Destroy()
        ESP[p.Character]=nil 
        if e.Cham then
            e.Cham.Enabled = false
        end
    end
end)''',
'''Players.PlayerRemoving:Connect(function(p)
              if p.Character and ESP[p.Character] then 
                  local e = ESP[p.Character]
                  e.Holder:Destroy()
                  ESP[p.Character]=nil 
                  if e.Cham then
                      e.Cham:Destroy()
                  end
              end
          end)''')

# ==== E18 ====
rrep("E18-vectorutil-log", '''local n = 0
    if type(args) == "table" then
        for _ in pairs(args) do
            n = n + 1
        end
    end
    log("FIRE_R", nm, "args=" .. n)''',
'''if VERBOSE then
                  local n = 0
                  if type(args) == "table" then
                      for _ in pairs(args) do
                          n = n + 1
                      end
                  end
                  log("FIRE_R", nm, "args=" .. n)
              end''')

open('/home/user/aquabearyy_fixed.lua', 'w', encoding='utf-8').write(src)
print("OK — применено правок:", len(applied))
for a in applied:
    print("  ✓", a)
