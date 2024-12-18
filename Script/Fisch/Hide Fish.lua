local LocalPlayer = game.Players.LocalPlayer
local itemNames = {"Rod Of The Depths", "Equipment Bag", "Bestiary", "Aurora Totem", "Sundial Totem"}

while true do
    for _, itemName in ipairs(itemNames) do
        if LocalPlayer.Backpack:FindFirstChild(itemName) then
            LocalPlayer.Backpack[itemName].Parent = LocalPlayer
        end
    end

    for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do
        game:GetService("Debris"):AddItem(v, 1)
    end

    for _, itemName in ipairs(itemNames) do
        if LocalPlayer:FindFirstChild(itemName) then
            LocalPlayer[itemName].Parent = LocalPlayer.Backpack
        end
    end

    task.wait(1)
end
