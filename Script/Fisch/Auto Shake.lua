local Players = game:GetService('Players')
local CoreGui = game:GetService('StarterGui')
local VirtualInputManager = game:GetService('VirtualInputManager')

local LocalPlayer = Players.LocalPlayer

function ShowNotification(String)
    CoreGui:SetCore('SendNotification', {
        Title = 'PHE',
        Text = String,
        Duration = 1
    })
end

LocalPlayer.PlayerGui.DescendantAdded:Connect(function(Descendant)
    if Descendant.Name == 'button' and Descendant.Parent.Name == 'safezone' then
        task.wait(0.1)

        local ButtonPosition, ButtonSize = Descendant.AbsolutePosition, Descendant.AbsoluteSize
        
        VirtualInputManager:SendMouseButtonEvent(ButtonPosition.X + (ButtonSize.X / 2), ButtonPosition.Y + (ButtonSize.Y / 2), Enum.UserInputType.MouseButton1.Value, true, LocalPlayer.PlayerGui, 1)
        VirtualInputManager:SendMouseButtonEvent(ButtonPosition.X + (ButtonSize.X / 2), ButtonPosition.Y + (ButtonSize.Y / 2), Enum.UserInputType.MouseButton1.Value, false, LocalPlayer.PlayerGui, 1)
    end
end)

ShowNotification("Auto Shake")
