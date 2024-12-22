for _, obj in pairs(game.Players.LocalPlayer.PlayerScripts:GetChildren()) do
    if obj:IsA("LocalScript") and obj.Name == script.Name then
        obj:Destroy()
    end
end

local FarmPositions = {
    [1] = CFrame.new(-946.2724, 5.51282597, 7.54263878, 0.00109819393, 0.000229234487, -0.999999344, 3.33046046e-05, 1, 0.000229271202, 0.999999404, -3.35563709e-05, 0.00109818624) * CFrame.Angles(0, math.rad(0), 0),
    [2] = CFrame.new(-4.81228876, 5.46991444, 1261.98413, 0.99996537, -3.03346787e-05, 0.00832322147, 3.67171669e-05, 0.999999702, -0.0007666772, -0.00832319539, 0.000766956247, 0.999965072) * CFrame.Angles(0, math.rad(0), 0),
    [3] = CFrame.new(-1.50149286, 5.52169037, -932.546082, -0.999989927, -0.000212406012, 0.00448677456, -0.00020810058, 0.999999523, 0.000960028498, -0.00448697619, 0.000959085126, -0.99998945) * CFrame.Angles(0, math.rad(0), 0),
    [4] = CFrame.new(987.400513, 5.55040455, 10.7523813, 0.00253078411, 0.000158696421, 0.999996781, -0.000671138871, 0.999999762, -0.000156998387, -0.999996543, -0.000670739391, 0.00253089005) * CFrame.Angles(0, math.rad(0), 0)
}

_G.ScriptName = "Farm Platina"
loadstring(game:HttpGet('https://raw.githubusercontent.com/PHOOMPHAT-Git/Lua-Zone/refs/heads/main/dwcqweyhfbwregbfyiokgfnbac.lua'))()

local player = game.Players.LocalPlayer
if not player then
    return
end

local function setupCharacter(character)
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
    if not humanoidRootPart then
        return
    end

    local humanoid = character:WaitForChild("Humanoid", 5)
    if not humanoid then
        return
    end

    local VirtualUser = game:GetService("VirtualUser")
    local Players = game:GetService("Players")

    Players.LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)

    local DashDuration = 0.1

    local function dashForward()
        if humanoid.Sit then
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = humanoidRootPart.CFrame.LookVector * _G.ForwardSpeed
            bodyVelocity.MaxForce = Vector3.new(5000e5, 5000e5, 5000e5)
            bodyVelocity.Parent = humanoidRootPart

            wait(DashDuration)
            bodyVelocity:Destroy()
        end
    end

    local wasSitting = false

    while humanoid.Health > 0 do
        if _G.Enable then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Z, false, game)
            wait(0.1)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Z, false, game)

            if not humanoid.Sit then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.R, false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.R, false, game)
            end

            if humanoid.Sit then
                local car = game.Workspace.CarCollection:FindFirstChild(player.Name)
                if car.PrimaryPart then
                    local zoneIndex = 1
                    if _G.FarmZone[zoneIndex] then
                        car:SetPrimaryPartCFrame(FarmPositions[_G.FarmZone[zoneIndex]])
                        dashForward()
                        wait(2.5)
                    end
                end
            elseif wasSitting then
                wasSitting = false
            end

            wait(1)
        else
            wait(1)
        end
    end
end

player.CharacterAdded:Connect(function(character)
    setupCharacter(character)
end)

if player.Character then
    setupCharacter(player.Character)
end
