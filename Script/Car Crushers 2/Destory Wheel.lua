local player = game.Players.LocalPlayer
if not player then
    return
end

local userInputService = game:GetService("UserInputService")

while true do
    local car = game.Workspace.CarCollection:FindFirstChild(player.Name)
    if car then
        local wheels = car:FindFirstChild("Car"):FindFirstChild("Wheels")
        if wheels then
            local function destroyWheel(wheelName)
                local wheel = wheels:FindFirstChild(wheelName)
                if wheel then
                    wheel:Destroy()
                end
            end

            userInputService.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end

                if input.KeyCode == Enum.KeyCode.One then
                    destroyWheel("RL")
                elseif input.KeyCode == Enum.KeyCode.Two then
                    destroyWheel("RR")
                elseif input.KeyCode == Enum.KeyCode.Three then
                    destroyWheel("FL")
                elseif input.KeyCode == Enum.KeyCode.Four then
                    destroyWheel("FR")
                end
            end)
        end
    end
    task.wait(0.1)
end
