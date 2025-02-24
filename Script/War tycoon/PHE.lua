local scriptName = "PHERasha_" .. math.random(1, 1000)

for _, obj in pairs(game.Players.LocalPlayer.PlayerScripts:GetChildren()) do
    if obj:IsA("LocalScript") and obj.Name == scriptName then
        obj:Destroy()
    end
end

local player = game:GetService("Players").LocalPlayer
local mainHUD = player:WaitForChild("PlayerGui"):WaitForChild("MainHUD")
local hud = mainHUD:WaitForChild("HUD")
local left = hud:WaitForChild("Left")
local tycoonCompletion = left:WaitForChild("TycoonCompletion")
local bar = tycoonCompletion:WaitForChild("Bar")
local barProgressAmount = bar:WaitForChild("BarProgressAmount")
local teamValue = game:GetService("Players").LocalPlayer.Team.Name
local tycoonButtons = workspace.Tycoon.Tycoons[teamValue].UnpurchasedButtons
local VirtualUser = game:GetService("VirtualUser")

VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
print("Anti-AFK activated!")

local isCashHologramGreen = false

while true do
    if barProgressAmount.Text == "0%" and _G.AutoRebirth then
        print("Starting AutoRebirth...")

        local CB1 = workspace.Tycoon.Tycoons[teamValue].PurchasedObjects["Oil 1"].CB1
        player.Character:SetPrimaryPartCFrame(CB1.CFrame * CFrame.new(0, 0, 0))
        wait(0.1)
        for i = 1, 2 do
            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
            wait(3)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
            wait(2)
        end
        local cashCollector = workspace.Tycoon.Tycoons[teamValue].Essentials.CashCollector
        player.Character:SetPrimaryPartCFrame(cashCollector.CFrame * CFrame.new(0, 0, 0))
        wait(0.5)
        local Oil2 = workspace.Tycoon.Tycoons[teamValue].UnpurchasedButtons["Oil 2"].Gradient
        player.Character:SetPrimaryPartCFrame(Oil2.CFrame * CFrame.new(0, 10, 0))
        wait(0.1)
    elseif barProgressAmount.Text == "100%" and _G.AutoRebirth then
        game:GetService("ReplicatedStorage"):WaitForChild("RebirthEVT"):FireServer()
        print("AutoRebirth completed.")
    end

    if barProgressAmount.Text == "0%" then
        wait(0.5)
    elseif _G.AutoFarm then
        local targetColors = {Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 0), Color3.fromRGB(4, 175, 235)}
        local foundNeon = false
        local foundHologram = false

        for _, descendant in pairs(workspace:GetDescendants()) do
            if descendant:IsA("Model") and descendant.Name == "CashHologram" then
                local mesh = descendant:FindFirstChild("Mesh")
                if mesh and mesh:IsA("BasePart") and mesh.Color == Color3.fromRGB(0, 255, 0) then
                    isCashHologramGreen = true
                    player.Character:SetPrimaryPartCFrame(mesh.CFrame)
                    wait(1)
                    foundHologram = true
                    break
                end
            end
        end

        if not foundHologram then
            isCashHologramGreen = false
        end

        if not isCashHologramGreen then
            for i = 1, 6 do
                local largeOil = workspace.Tycoon.Tycoons[teamValue].PurchasedObjects:FindFirstChild("Large Oil " .. i)
                if largeOil then
                    local broken = largeOil:FindFirstChild("Broken")
                    if broken and broken.Value == true then
                        local electricalBox = largeOil:FindFirstChild("ElectricalBox")
                        if electricalBox and electricalBox:FindFirstChild("Effect") then
                            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(electricalBox.Effect.CFrame)
                            wait(0.1)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
                            wait(3)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
                            if broken.Value == false then
                                break
                            end
                        end
                    end
                end
            end

            for i = 1, 3 do
                local OilDrill = workspace.Tycoon.Tycoons[teamValue].PurchasedObjects:FindFirstChild("Oil Drill " .. i)
                if OilDrill then
                    local broken = OilDrill:FindFirstChild("Broken")
                    if broken and broken.Value == true then
                        local electricalBox = OilDrill:FindFirstChild("ElectricalBox")
                        if electricalBox and electricalBox:FindFirstChild("Effect") then
                            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(electricalBox.Effect.CFrame)
                            wait(0.1)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
                            wait(3)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
                            if broken.Value == false then
                                break
                            end
                        end
                    end
                end
            end

            if not foundNeon then
                for _, button in pairs(tycoonButtons:GetChildren()) do
                    local neon = button:FindFirstChild("Neon")
                    if neon then
                        for _, color in pairs(targetColors) do
                            if neon.Color == color then
                                player.Character:SetPrimaryPartCFrame(neon.CFrame * CFrame.new(0, 10, 0))
                                foundNeon = true
                                break
                            end
                        end
                    end
                    if foundNeon then
                        break
                    end
                end
            end
        end

        if not foundNeon then
            local cashCollector = workspace.Tycoon.Tycoons[teamValue].Essentials.CashCollector
            player.Character:SetPrimaryPartCFrame(cashCollector.CFrame * CFrame.new(0, 0, 0))
        end
    end

    wait(0.5)
end
