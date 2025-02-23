local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local Plr = Players.LocalPlayer
local invis_on = false
local Clipon = false

local function getKeyCode(keyName)
    return Enum.KeyCode[keyName]
end

_G.ScriptName = "Character Invisible"
loadstring(game:HttpGet('https://raw.githubusercontent.com/PHOOMPHAT-Git/Lua-Zone/refs/heads/main/dwcqweyhfbwregbfyiokgfnbac.lua'))()

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

game:GetService("UserInputService").InputBegan:Connect(onKeyPress)
