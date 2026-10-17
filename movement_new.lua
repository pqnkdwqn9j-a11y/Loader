
      do --// Movement
          RunService.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function(dt)
              local Character = Cheat.Globals.ClientCharacter or Client.Character
              local Root = Character and Character:FindFirstChild("HumanoidRootPart")
              local Humanoid = Character and Character:FindFirstChild("Humanoid")
              if not (Humanoid and Root and Humanoid.Health > 0) then
                  Cheat.Globals.IsFlying = false
                  return
              end

              local FlyingThisFrame = (flags["FlightEnabled"] and flags["FlightBind"] and flags["FlightBind"].active) == true
              Cheat.Globals.IsFlying = FlyingThisFrame

              --// No Grounded (fix: раньше не был реализован вовсе)
              if flags.NoGrounded then
                  Cheat.Globals.GroundedDisabled = true
                  pcall(function()
                      Humanoid:SetAttribute("Grounded", false)
                      Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
                  end)
              elseif Cheat.Globals.GroundedDisabled then
                  Cheat.Globals.GroundedDisabled = false
                  pcall(function()
                      Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
                  end)
              end

              --// Speed
              if
                  flags.SpeedEnabled
                  and flags["SpeedBind"].active
                  and not FlyingThisFrame
              then
                  local x, z = 0, 0
                  if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                      x += 1
                  end
                  if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                      x -= 1
                  end
                  if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                      z += 1
                  end
                  if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                      z -= 1
                  end

                  if x ~= 0 or z ~= 0 then
                      local cf = Camera.CFrame
                      local forward = Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z).Unit
                      local right = Vector3.new(cf.RightVector.X, 0, cf.RightVector.Z).Unit

                      local move = (right * x + forward * z).Unit
                      local hv = move * flags.SpeedSpeed
                      pcall(function()
                          Root.AssemblyLinearVelocity = Vector3.new(hv.X, Root.AssemblyLinearVelocity.Y, hv.Z)
                      end)
                  end
              end

              --// Bunnyhop
              if
                  flags.Bunnyhop
                  and Humanoid.FloorMaterial ~= Enum.Material.Air
                  and UserInputService:IsKeyDown(Enum.KeyCode.Space)
              then
                  Humanoid.Jump = true
              end

              --// Flight (fix: velocity-based — сервер видит обычную физику, без CFrame-телепортов и обнуления скорости)
              if FlyingThisFrame then
                  pcall(function()
                      if Humanoid.Health <= 0 then return end
                      local look = Camera.CFrame.LookVector
                      local right = Camera.CFrame.RightVector
                      local MoveVector = Vector3.zero

                      if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                          MoveVector += Vector3.new(look.X, 0, look.Z)
                      end
                      if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                          MoveVector -= Vector3.new(look.X, 0, look.Z)
                      end
                      if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                          MoveVector -= Vector3.new(right.X, 0, right.Z)
                      end
                      if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                          MoveVector += Vector3.new(right.X, 0, right.Z)
                      end
                      if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                          MoveVector += Vector3.new(0, 1, 0)
                      end
                      if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                          MoveVector -= Vector3.new(0, 1, 0)
                      end

                      if MoveVector.Magnitude > 0 then
                          MoveVector = MoveVector.Unit
                      end

                      Humanoid.PlatformStand = false
                      local vel = MoveVector * (flags.FlightSpeed * 6)
                      Root.AssemblyLinearVelocity = vel
                      Root.CFrame = CFrame.new(Root.Position, Root.Position + Vector3.new(look.X, 0, look.Z))
                  end)
              end

              --// Freecam (fix: Enum.KeyCode вместо чисел 119/115 — раньше была ошибка каждый кадр)
              if
                  flags.Freecam
                  and flags["FreecamKeybind"]
                  and flags["FreecamKeybind"].active
                  and not FlyingThisFrame
              then
                  pcall(function()
                      Cheat.Globals.NeedToReturn = true

                      if not Cheat.Globals.SavedPosition then
                          Cheat.Globals.SavedPosition = Root.CFrame
                      end

                      sethiddenproperty(Root, "NetworkIsSleeping", true)

                      local CameraLookVector = Camera.CFrame.LookVector

                      local UpPos = Vector3.new(0, 1, 0)
                      local DownPos = Vector3.new(0, -1, 0)
                      local NonePos = Vector3.zero

                      local BaseCFrame = Cheat.Globals.FreecamBase or Root.CFrame
                      local IsUpPressed = UserInputService:IsKeyDown(Enum.KeyCode.E)
                      local IsDownPressed = UserInputService:IsKeyDown(Enum.KeyCode.Q)
                      local IsForwardPressed = UserInputService:IsKeyDown(Enum.KeyCode.W)
                      local IsBackwardPressed = UserInputService:IsKeyDown(Enum.KeyCode.S)

                      Root.Anchored = true
                      Root.AssemblyLinearVelocity = NonePos

                      local Delta = dt * flags.FreecamSpeed * 3

                      local MovementVector = (
                          Humanoid.MoveDirection
                          + (IsUpPressed and UpPos or NonePos)
                          + (IsDownPressed and DownPos or NonePos)
                          + (IsForwardPressed and Vector3.new(0, CameraLookVector.Y, 0) or NonePos)
                          + (IsBackwardPressed and Vector3.new(0, -CameraLookVector.Y, 0) or NonePos)
                      ) * Delta

                      BaseCFrame += MovementVector
                      Cheat.Globals.FreecamBase = BaseCFrame
                      local Position = BaseCFrame.p
                      Root.CFrame = CFrame.new(Position, Position + Vector3.new(CameraLookVector.X, 0, CameraLookVector.Z))
                      Humanoid.AutoRotate = false
                  end)
              else
                  Cheat.Globals.FreecamBase = nil
                  if Cheat.Globals.NeedToReturn then
                      Humanoid.AutoRotate = true
                      Cheat.Globals.NeedToReturn = false
                      pcall(function() sethiddenproperty(Root, "NetworkIsSleeping", false) end)

                      for _, Value in Character:GetChildren() do
                          if Value:IsA("BasePart") then
                              pcall(function() sethiddenproperty(Value, "NetworkIsSleeping", false) end)
                          end
                      end

                      Root.CFrame = Cheat.Globals.SavedPosition or Root.CFrame
                      Root.Anchored = false
                      Cheat.Globals.SavedPosition = nil
                  end
              end

              --// Infinite Fly (fix: мягкое погашение падения вместо спайка -9999; раньше вообще не срабатывал)
              if flags.InfiniteFly and FlyingThisFrame then
                  pcall(function()
                      local Result = workspace:Raycast(Root.Position, Vector3.new(0, -1000, 0), Cheat.Globals.RaycastParams)
                      if Result and Result.Distance > 4 then
                          local v = Root.AssemblyLinearVelocity
                          if v.Y < -2 then
                              Root.AssemblyLinearVelocity = Vector3.new(v.X, 0, v.Z)
                          end
                      end
                  end)
              end

              --// No Fall Damage (fix: гасим скорость перед ударом о землю вместо спайка +9999)
              if flags.NoFall and not FlyingThisFrame then
                  pcall(function()
                      local Result = workspace:Raycast(Root.Position, Vector3.new(0, -1000, 0), Cheat.Globals.RaycastParams)
                      if Result and Result.Distance < 14 then
                          local v = Root.AssemblyLinearVelocity
                          if v.Y < -25 then
                              Root.AssemblyLinearVelocity = Vector3.new(v.X, 0, v.Z)
                          end
                      end
                  end)
              end
          end))
      end
  end
