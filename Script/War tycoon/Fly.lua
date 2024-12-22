local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:FindFirstChild("HumanoidRootPart")
local flying = false
local speed = 500
local flightHeight = 0
local currentHeight = 0

local bodyVelocity = Instance.new("BodyVelocity")
local bodyGyro = Instance.new("BodyGyro")

_G.ScriptName = "Fly"
loadstring(game:HttpGet('https://raw.githubusercontent.com/PHOOMPHAT-Git/Lua-Zone/refs/heads/main/dwcqweyhfbwregbfyiokgfnbac.lua'))()

local function startFlying()
    flying = true
    currentHeight = flightHeight
    bodyVelocity.MaxForce = Vector3.new(500000, 500000, 500000)
    bodyGyro.MaxTorque = Vector3.new(500000, 500000, 500000)
    bodyVelocity.Velocity = Vector3.new(0, currentHeight, 0)
    bodyGyro.CFrame = rootPart.CFrame
    bodyVelocity.Parent = rootPart
    bodyGyro.Parent = rootPart
end

local function stopFlying()
    flying = false
    bodyVelocity.Parent = nil
    bodyGyro.Parent = nil
end

local function controlFlying()
    if flying then
        local moveDirection = Vector3.new(0, 0, 0)

        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + rootPart.CFrame.LookVector
        end

        bodyVelocity.Velocity = moveDirection * speed
    end
end

local function rotateToMouse()
    if flying then
        local mousePos = player:GetMouse().Hit.p
        local direction = (mousePos - rootPart.Position).unit
        bodyGyro.CFrame = CFrame.new(rootPart.Position, rootPart.Position + direction)
    end
end

local isZDown = false
local isXDown = false

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.G then
            if flying then
                stopFlying()
            else
                if rootPart then
                    rootPart.CFrame = rootPart.CFrame * CFrame.new(0, flightHeight, 0)
                end
                startFlying()
            end
        end
        if input.KeyCode == Enum.KeyCode.Q then
            isZDown = true
        end
        if input.KeyCode == Enum.KeyCode.E then
            isXDown = true
        end
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.Q then
            isZDown = false
        end
        if input.KeyCode == Enum.KeyCode.E then
            isXDown = false
        end
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if flying then
        controlFlying()
        rotateToMouse()

        if isZDown then
            if rootPart then
                rootPart.CFrame = rootPart.CFrame * CFrame.new(0, 1, 0)
            end
        end
        if isXDown then
            if rootPart then
                rootPart.CFrame = rootPart.CFrame * CFrame.new(0, -1, 0)
            end
        end
    end
end)

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    rootPart = character:WaitForChild("HumanoidRootPart")

    if flying then
        bodyVelocity.Parent = rootPart
        bodyGyro.Parent = rootPart
    end
end)
