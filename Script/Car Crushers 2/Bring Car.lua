local player = game.Players.LocalPlayer
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
