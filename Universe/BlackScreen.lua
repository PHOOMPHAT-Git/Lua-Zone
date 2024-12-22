_G.open = "N"
_G.close = "M"

local UserInputService = game:GetService("UserInputService")
local Black = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")

Black.Name = "Black"
Black.Parent = game:GetService("CoreGui")
Black.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Black.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets

Frame.Parent = Black
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0

Frame.Size = UDim2.new(1, 0, 1, 0)
Frame.Position = UDim2.new(0, 0, 0, 0)
Frame.Visible = false

local function getKeyCode(keyName)
    return Enum.KeyCode[keyName]
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == getKeyCode(_G.open) then
            Frame.Visible = true
        elseif input.KeyCode == getKeyCode(_G.close) then
            Frame.Visible = false
        end
    end
end)
