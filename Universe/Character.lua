_G.ScriptName = "Character"
loadstring(game:HttpGet('https://raw.githubusercontent.com/PHOOMPHAT-Git/Lua-Zone/refs/heads/main/dwcqweyhfbwregbfyiokgfnbac.lua'))()

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local Plr = Players.LocalPlayer
local invis_on = false
local Clipon = false

local function getKeyCode(keyName)
    return Enum.KeyCode[keyName]
end

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local userInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
local mouse = game.Players.LocalPlayer:GetMouse()
repeat wait() until mouse

local plr = game.Players.LocalPlayer
local torso = plr.Character.Torso
local flying = false
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local speed = 0

function Fly()
    local bg = Instance.new("BodyGyro", torso)
    bg.P = 9e4
    bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.cframe = torso.CFrame

    local bv = Instance.new("BodyVelocity", torso)
    bv.velocity = Vector3.new(0, 0.1, 0)
    bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

    repeat wait()
        plr.Character.Humanoid.PlatformStand = true

        if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
            speed = speed + 0.5 + (speed / _G.Fly_Settings.Fly_Maxspeed)
            if speed > _G.Fly_Settings.Fly_Maxspeed then
                speed = _G.Fly_Settings.Fly_Maxspeed
            end
        elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
            speed = speed - 1
            if speed < 0 then
                speed = 0
            end
        end

        if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
            bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) + 
                           ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * 0.2, 0).p) - 
                            game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
            lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
        elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
            bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) + 
                           ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * 0.2, 0).p) - 
                            game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
        else
            bv.velocity = Vector3.new(0, 0.1, 0)
        end

        bg.cframe = CFrame.new(torso.Position, torso.Position + game.Workspace.CurrentCamera.CoordinateFrame.lookVector)  
    until not flying

    ctrl = {f = 0, b = 0, l = 0, r = 0}
    lastctrl = {f = 0, b = 0, l = 0, r = 0}
    speed = 0
    bg:Destroy()
    bv:Destroy()
    plr.Character.Humanoid.PlatformStand = false
end

function onKeyPress(inputObject, chat)
    if chat then return end
    
    if inputObject.KeyCode == getKeyCode(_G.Invisible) then
        invis_on = not invis_on
        if invis_on then
            local savedpos = Plr.Character.HumanoidRootPart.CFrame
            wait()
            Plr.Character:MoveTo(Vector3.new(-25.95, 84, 3537.55))
            wait(.15)
            local Seat = Instance.new('Seat', Workspace)
            Seat.Anchored = false
            Seat.CanCollide = false
            Seat.Name = 'invischair'
            Seat.Transparency = 1
            Seat.Position = Vector3.new(-25.95, 84, 3537.55)
            local Weld = Instance.new("Weld", Seat)
            Weld.Part0 = Seat
            Weld.Part1 = Plr.Character:FindFirstChild("Torso") or Plr.Character.UpperTorso
            wait()
            Seat.CFrame = savedpos
            game.StarterGui:SetCore("SendNotification", {
                Title = "On : Invisible";
                Duration = 1;
                Text = "By Phoomphat";
            })
        else
            Workspace:FindFirstChild('invischair'):Remove()
            game.StarterGui:SetCore("SendNotification", {
                Title = "Off : Invisible";
                Duration = 1;
                Text = "By Phoomphat";
            })
        end
    end

    if inputObject.KeyCode == getKeyCode(_G.Noclip) then
        if not Clipon then
            Clipon = true
            game.StarterGui:SetCore("SendNotification", {
                Title = "On : Noclip";
                Duration = 1;
                Text = "By Phoomphat";
            })
            Stepped = game:GetService("RunService").Stepped:Connect(function()
                if Clipon then
                    for a, b in pairs(Workspace:GetChildren()) do
                        if b.Name == Plr.Name then
                            for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
                end
            end)
        else
            Clipon = false
            game.StarterGui:SetCore("SendNotification", {
                Title = "Off : Noclip";
                Duration = 1;
                Text = "By Phoomphat";
            })
            if Stepped then
                for _, b in pairs(Workspace:GetChildren()) do
                    if b.Name == Plr.Name then
                        for _, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                            if v:IsA("BasePart") and v.Name == "HumanoidRootPart" then
                                v.CanCollide = true
                            end
                        end
                    end
                end
                Stepped:Disconnect()
            end
        end
    end
end

userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode[_G.Fly_Settings.Fly_Keycode] then
            if flying then
                flying = false
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Off : Fly";
                    Duration = 1;
                    Text = "By Phoomphat";
                })
            else
                flying = true
                game.StarterGui:SetCore("SendNotification", {
                    Title = "On : Fly";
                    Duration = 1;
                    Text = "By Phoomphat";
                })
                Fly()
            end
        end

        if input.KeyCode == Enum.KeyCode.W then
            ctrl.f = 1
        elseif input.KeyCode == Enum.KeyCode.S then
            ctrl.b = -1
        elseif input.KeyCode == Enum.KeyCode.A then
            ctrl.l = -1
        elseif input.KeyCode == Enum.KeyCode.D then
            ctrl.r = 1
        end
    end
end)

userInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.W then
            ctrl.f = 0
        elseif input.KeyCode == Enum.KeyCode.S then
            ctrl.b = 0
        elseif input.KeyCode == Enum.KeyCode.A then
            ctrl.l = 0
        elseif input.KeyCode == Enum.KeyCode.D then
            ctrl.r = 0
        end
    end
end)

game:GetService("UserInputService").InputBegan:Connect(onKeyPress)
