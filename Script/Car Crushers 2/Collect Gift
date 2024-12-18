local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function TeleportToGiftModel()
    while true do
        for _, obj in ipairs(workspace.GiftScavenger:GetChildren()) do
            if obj:IsA("Model") and obj.Name:sub(1, 4) == "Gift" then
                local offset = Vector3.new(0, 5, 0)
                local giftPosition = obj.PrimaryPart.CFrame
                character:SetPrimaryPartCFrame(giftPosition * CFrame.new(offset))
                humanoid.Sit = false
                
                wait(0.5)

                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)

                wait(0.5)

                if not player then
                    return
                end

                local car = game.Workspace.CarCollection:FindFirstChild(player.Name)
                if not car then
                    return
                end

                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart then
                    return
                end

                if car.PrimaryPart then
                    car:SetPrimaryPartCFrame(CFrame.new(humanoidRootPart.Position))
                end

                wait(0.5)
            end
        end
        wait(1)
    end
end

TeleportToGiftModel()
