for _, obj in pairs(game.Players.LocalPlayer.PlayerScripts:GetChildren()) do
    if obj:IsA("LocalScript") and obj.Name == script.Name then
        obj:Destroy()
    end
end

local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui"):WaitForChild("GoalsSide")
local title = gui.Frame.Quests.QuestsGradient.QuestsHolder.Easy.Title

local Diamond_Enchants_Select = {
    ["I"] = "50d9252be1014c62af37d14479cc7431",
    ["II"] = "819df5e8ff1e453ebc253de63dae9c74",
    ["III"] = "8abd63ad9c6d47e6bc7c976d7a0ce7c4",
    ["IV"] = "129608e807eb4206a5a184ec3a136b9a",
    ["V"] = "e6d31da0e3494510b3db1f978d9027e1",
    ["VI"] = "3afae553acf749809153026cce234afa"
}

local Criticals_Enchants_Select = {
    ["I"] = "802dd7f0e4c6455fbd93c01b1269dc68",
    ["II"] = "b96d3d7f8751413ba3fb7f0bab241def",
    ["III"] = "a47aee343f48401fb2eefdfd84a41298",
    ["IV"] = "43167b65e0564594959afde204fb8112",
    ["V"] = "6e4f69970be14dd7910a0a047ddf5595",
    ["VI"] = "3113e2f77b7049a89d89f5c951e8549f"
}

local Criticals_Upgrade_Enchants_Select = {
    ["I"] = "802dd7f0e4c6455fbd93c01b1269dc68",
    ["II"] = "b96d3d7f8751413ba3fb7f0bab241def",
    ["III"] = "a47aee343f48401fb2eefdfd84a41298",
    ["IV"] = "43167b65e0564594959afde204fb8112",
    ["V"] = "6e4f69970be14dd7910a0a047ddf5595",
    ["VI"] = "3113e2f77b7049a89d89f5c951e8549f"
}

local Lucky_Position_Select = {
    ["I"] = "ab126a49ce874532b6d49ec1bb65e92a",
    ["II"] = "25605eed688c41d5b8d1f35bf338c292",
    ["III"] = "424cca285a994fb5903d85a7614a862e",
    ["IV"] = "774235bb15c34abcb2a091ff4d0bf63e",
    ["V"] = "26f0efb5e9664fb0a2d063e4614f6808",
    ["VI"] = "ea6fe891a0484345b1f7c40f1ecb42fa"
}

local potionIndex = 1
local Up_Criticals_enchantsIndex = 1
local Criticals_enchantsIndex = 1
local Diamond_enchantsIndex = 1

local DiamondselectedEnchant = _G.Enchants_And_Potions_Setting.Diamond_Enchants_Equip[Diamond_enchantsIndex]
local CriticalsselectedEnchant = _G.Enchants_And_Potions_Setting.Criticals_Enchants_Equip[Criticals_enchantsIndex]
local Up_CriticalsselectedEnchant = _G.Enchants_And_Potions_Setting.Criticals_Upgrade_Enchant[Up_Criticals_enchantsIndex]
local selectedPotion = _G.Enchants_And_Potions_Setting.Lucky_Upgrade_Potion[potionIndex]

local function parsePosition(positionString)
    local position = {}
    for value in string.gmatch(positionString, "[^,]+") do
        table.insert(position, tonumber(value))
    end
    return CFrame.new(position[1], position[2], position[3])
end

while true do
    wait(0.1)

    if _G.AutoFarm.Farm_Star_Settings.Farm_1_star.Start_Farm then
        if string.match(title.Text, "^Collect%s%d*%s*potions$") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(805.256714, 16.5634251, 262.006165)
            wait(0.5)

            local potions = string.match(title.Text, "%d+")

            local potionValue = Lucky_Position_Select[selectedPotion]

            local args = {
                [1] = potionValue,
                [2] = tonumber(potions)
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("UpgradePotionsMachine_Activate"):InvokeServer(unpack(args))
        elseif string.match(title.Text, "^Collect%s%d*%s*enchants$") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(805.256714, 16.5634251, 262.006165)
            wait(0.5)

            local enchants = string.match(title.Text, "%d+")

            local enchantValue = Criticals_Upgrade_Enchants_Select[Up_CriticalsselectedEnchant]

            local args = {
                [1] = enchantValue,
                [2] = tonumber(enchants)
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("UpgradeEnchantsMachine_Activate"):InvokeServer(unpack(args))
        elseif title.Text:match("Break %d+%.?%d*k? breakables in best area") then
            local args = {
                [1] = _G.Area_Settings.Area
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Teleports_RequestTeleport"):InvokeServer(unpack(args))
            wait(7)

            local area_s = _G.Area_Settings.Area_Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = parsePosition(area_s)
            wait(0.25)
            for i = 1, 6 do
                wait(0.25)
                local args = {i}
                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Enchants_ClearSlot"):FireServer(unpack(args))
            end
            wait(0.25)
            for i = 1, 6 do
                local Criticals_Equip_Value = Criticals_Enchants_Select[CriticalsselectedEnchant]

                local args = {
                    [1] = Criticals_Equip_Value,
                }

                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Enchants_Equip"):FireServer(unpack(args))
            end
            if _G.AutoFarm.Use_TNT then
                for i = 1, 20 do
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("TNT_Crate_Consume"):InvokeServer()
                    wait(5)
                end
                wait(2.5)
            end
        elseif title.Text:match("Break %d+%.?%d*k? diamond breakables") then
            if _G.AutoFarm.VIP then
                local args = {
                    [1] = _G.Area_Settings.Diamond_Area
                }

                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Teleports_RequestTeleport"):InvokeServer(unpack(args))
                wait(7)

                local diamond_area_s = _G.Area_Settings.Diamond_Area_Position
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = parsePosition(diamond_area_s)
                wait(0.25)
                for i = 1, 6 do
                    wait(0.25)
                    local args = {i}
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Enchants_ClearSlot"):FireServer(unpack(args))
                end
                wait(0.25)
                for i = 1, 6 do
                    local Diamond_Equip_Value = Diamond_Enchants_Select[DiamondselectedEnchant]

                    local args = {
                        [1] = Diamond_Equip_Value,
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Enchants_Equip"):FireServer(unpack(args))
                end
            else
                local args = {
                    [1] = _G.Area_Settings.Area
                }

                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Teleports_RequestTeleport"):InvokeServer(unpack(args))
                wait(7)

                local diamond_area_s = _G.Area_Settings.Diamond_Area_Position
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = parsePosition(diamond_area_s)
                wait(0.25)
                for i = 1, 6 do
                    wait(0.25)
                    local args = {i}
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Enchants_ClearSlot"):FireServer(unpack(args))
                end
                wait(0.25)
                for i = 1, 6 do
                    local Diamond_Equip_Value = Diamond_Enchants_Select[DiamondselectedEnchant]

                    local args = {
                        [1] = Diamond_Equip_Value,
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Enchants_Equip"):FireServer(unpack(args))
                end
                if _G.AutoFarm.Use_TNT then
                    for i = 1, 20 do
                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("TNT_Crate_Consume"):InvokeServer()
                        wait(5)
                    end
                    wait(2.5)
                end
            end
        end
    end
end
