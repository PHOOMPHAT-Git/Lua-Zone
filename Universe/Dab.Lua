local animationId = "rbxassetid://9794385006"
local animation = Instance.new("Animation")
animation.AnimationId = animationId

local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:FindFirstChildOfClass("Humanoid")
if not humanoid then
    warn("Humanoid not found in character.")
    return
end

local animationTrack = humanoid:LoadAnimation(animation)

local UserInputService = game:GetService("UserInputService")
local key = _G.Dab

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == key then
        animationTrack:Play()
        wait(1)
        animationTrack:Stop()
    end
end)
