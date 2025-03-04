local VirtualUser = game:service("VirtualUser")
game:service("Players").LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui"):WaitForChild("GoalsSide")

local title = gui.Frame.Quests.QuestsGradient.QuestsHolder.Hard.Title
local credit = gui.Frame.Bottom.OpenRewards.TextLabel
local credit_2 = game:GetService("Players").LocalPlayer.PlayerGui.Rank.Frame.Title

local title_Count = gui.Frame.Bottom.OpenRewards.Notification.Count

local credit_text = "discord.gg/primephat"

local Enchants_Data = {
    Diamond = {
        ["I"] = "50d9252be1014c62af37d14479cc7431",
        ["II"] = "819df5e8ff1e453ebc253de63dae9c74",
        ["III"] = "8abd63ad9c6d47e6bc7c976d7a0ce7c4",
        ["IV"] = "129608e807eb4206a5a184ec3a136b9a",
        ["V"] = "e6d31da0e3494510b3db1f978d9027e1",
        ["VI"] = "3afae553acf749809153026cce234afa"
    },
    Criticals = {
        ["I"] = "802dd7f0e4c6455fbd93c01b1269dc68",
        ["II"] = "b96d3d7f8751413ba3fb7f0bab241def",
        ["III"] = "a47aee343f48401fb2eefdfd84a41298",
        ["IV"] = "43167b65e0564594959afde204fb8112",
        ["V"] = "6e4f69970be14dd7910a0a047ddf5595",
        ["VI"] = "3113e2f77b7049a89d89f5c951e8549f"
    }
}

local Potions_Data = {
    Lucky = {
        ["I"] = "ab126a49ce874532b6d49ec1bb65e92a",
        ["II"] = "25605eed688c41d5b8d1f35bf338c292",
        ["III"] = "424cca285a994fb5903d85a7614a862e",
        ["IV"] = "774235bb15c34abcb2a091ff4d0bf63e",
        ["V"] = "26f0efb5e9664fb0a2d063e4614f6808",
        ["VI"] = "ea6fe891a0484345b1f7c40f1ecb42fa"
    }
}

local phe_auto_farm = _G.AutoFarm
local phe_open_egg = phe_auto_farm.Open_egg
local phe_area_settings = phe_auto_farm.Area_Settings
local phe_gold_and_rianbow = phe_auto_farm.Make_Gold_And_Rainbow
local phe_other = phe_auto_farm.Other

local phe_use = phe_other.Use
local phe_upgrade = phe_other.Upgrade

local phe_potion_use = phe_use.Potion
local phe_upgrade_enchant = phe_upgrade.Enchant
local phe_upgrade_potion = phe_upgrade.Potion

local area_position = phe_area_settings.Area_Position
local use_diamond_flag = phe_area_settings.Use_Diamond_Flag
local diamond_area_position = phe_area_settings.Diamond_Area_Position

local phe_egg_name = phe_open_egg.Name
local phe_egg_amount = phe_open_egg.Amount
local phe_egg_position = phe_open_egg.Egg_Position

local function parsePosition(positionString)
    local position = {}
    for value in string.gmatch(positionString, "[^,]+") do
        table.insert(position, tonumber(value))
    end
    return CFrame.new(position[1], position[2], position[3])
end

if _G.runCount == nil then
    _G.runCount = 1
else
    _G.runCount = _G.runCount + 1
end

if _G.currentLoop and coroutine.status(_G.currentLoop) ~= "dead" then
    coroutine.close(_G.currentLoop)
end

_G.currentLoop = coroutine.create(function()
    while true do
        task.wait(0.1)

        if not phe_auto_farm.Start_Farm then
            credit.Text = "Rewards"
            credit_2.Text = "Rank Rewards!"
            return
        end

        print("Start_Farm: " .. tostring(phe_auto_farm.Start_Farm))  -- Debugging output

        credit.Text = credit_text
        credit_2.Text = credit_text

        if phe_auto_farm.Start_Farm then
            if title_Count.Text == tostring(_G.AutoFarm.All_Rewards) then
                local spawn_zone = {
                    [1] = "Spawn"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Teleports_RequestTeleport"):InvokeServer(unpack(spawn_zone))
                task.wait(7)

                for i = 1, 100 do
                    local rank_reward = {i}
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Ranks_ClaimReward"):FireServer(unpack(rank_reward))
                    task.wait(0.5)
                end
            elseif title.Text == "Quest Complete!" then
                print("Quest Complete!")
                if title_Count.Text == tostring(_G.AutoFarm.All_Rewards) then
                    local spawn_zone = {
                        [1] = "Spawn"
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Teleports_RequestTeleport"):InvokeServer(unpack(spawn_zone))
                    task.wait(7)

                    for i = 1, 100 do
                        local rank_reward = {i}
                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Ranks_ClaimReward"):FireServer(unpack(rank_reward))
                        task.wait(0.5)
                    end
                end
            elseif title.Text:match("Break %d+%.?%d*k? diamond breakables") or title.Text:match("Earn %d+%.?%d*k? Diamonds") then
                if phe_auto_farm.VIP then
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Pets_UnequipAll"):FireServer()
                    task.wait(0.5)

                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = parsePosition(diamond_area_position)
                    task.wait(2.5)

                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Pets_Restore"):FireServer()

                    if title.Text:match("Earn %d+%.?%d*k? Diamonds") then
                        if use_diamond_flag then
                            local diamond_flag = {
                                [1] = "Diamonds Flag",
                                [2] = "6713b4655e2a4035a9d651bff11d8477"
                            }

                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("FlexibleFlags_Consume"):InvokeServer(unpack(diamond_flag))
                        end
                    end
                else
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Pets_UnequipAll"):FireServer()
                    task.wait(0.5)

                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = parsePosition(area_position)
                    task.wait(2.5)

                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Pets_Restore"):FireServer()

                    if title.Text:match("Earn %d+%.?%d*k? Diamonds") then
                        if use_diamond_flag then
                            local diamond_flag = {
                                [1] = "Diamonds Flag",
                                [2] = "6713b4655e2a4035a9d651bff11d8477"
                            }

                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("FlexibleFlags_Consume"):InvokeServer(unpack(diamond_flag))
                        end
                    end

                    if phe_auto_farm.Use_TNT then
                        for i = 1, 1 do
                            task.wait(5)
                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("TNT_Crate_Consume"):InvokeServer()
                        end
                    end
                end
            elseif string.match(title.Text, "^Use%s%d*%s*Tier IV Potions$") or string.match(title.Text, "^Upgrade to%s%d*%s*Tier III Potions$") or string.match(title.Text, "^Upgrade to%s%d*%s*Tier III Enchants$") then
                if string.match(title.Text, "^Use%s%d*%s*Tier IV Potions$") then

                    local use_potion = string.match(title.Text, "%d+")

                    local potion_type = phe_potion_use.Name
                    local potion_tier = phe_potion_use.Tier

                    if Potions_Data[potion_type] and Potions_Data[potion_type][potion_tier] then
                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Potions: Consume"):FireServer(Potions_Data[potion_type][potion_tier], tonumber(use_potion))
                    end
                elseif string.match(title.Text, "^Upgrade to%s%d*%s*Tier III Enchants$") or string.match(title.Text, "^Upgrade to%s%d*%s*Tier III Potions$") then
                    if string.match(title.Text, "^Upgrade to%s%d*%s*Tier III Enchants$") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(805.256714, 16.5634251, 262.006165)
                        task.wait(2.5)

                        local upgrade_enchant = string.match(title.Text, "%d+")

                        local enchant_type = phe_upgrade_enchant.Name
                        local enchant_tier = phe_upgrade_enchant.Tier

                        if Enchants_Data[enchant_type] and Enchants_Data[enchant_type][enchant_tier] then
                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("UpgradeEnchantsMachine_Activate"):InvokeServer(Enchants_Data[enchant_type][enchant_tier], tonumber(upgrade_enchant))
                        end
                    elseif string.match(title.Text, "^Upgrade to%s%d*%s*Tier III Potions$") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(805.256714, 16.5634251, 262.006165)
                        task.wait(2.5)

                        local upgrade_potions = string.match(title.Text, "%d+")

                        local potion_type = phe_upgrade_potion.Name
                        local potion_tier = phe_upgrade_potion.Tier

                        if Potions_Data[potion_type] and Potions_Data[potion_type][potion_tier] then
                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("UpgradePotionsMachine_Activate"):InvokeServer(Potions_Data[potion_type][potion_tier], tonumber(upgrade_potions))
                        end
                    end
                end
            elseif string.match(title.Text, "^Break%s%d*%s*coin jars in best area$") or title.Text == "Break a coin jar in best area"
            or string.match(title.Text, "^Break%s%d*%s*comets in best area$") or title.Text == "Break a comet in best area"
            or title.Text:match("Break %d+%.?%d*k? breakables in best area") or title.Text == "Break a superior mini-chest in best area"
            or string.match(title.Text, "^Break%s+%d+%s+mini%-chests in best area$") or title.Text == "Break a mini-chest in best area"
            or string.match(title.Text, "^Break%s%d*%s*pinatas in best area$") or title.Text == "Break a pinata in best area"
            or string.match(title.Text, "^Break%s%d*%s*lucky block event in best area$") or title.Text == "Break a lucky block event in best area" then
                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Pets_UnequipAll"):FireServer()
                task.wait(0.5)

                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = parsePosition(area_position)
                task.wait(2.5)

                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Pets_Restore"):FireServer()

                if string.match(title.Text, "^Break%s%d*%s*coin jars in best area$") or title.Text == "Break a coin jar in best area" then
                    for i = 1, 1 do
                        local coin_jar = {
                            [1] = "a9beacae0b0e47c49c69614f25c8e64c" -- Coin Jar
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("CoinJar_Spawn"):InvokeServer(unpack(coin_jar))
                        task.wait(2.5)

                        if phe_auto_farm.Use_TNT then
                            for i = 1, 1 do
                                task.wait(5)
                                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("TNT_Crate_Consume"):InvokeServer()
                            end
                        end
                    end
                elseif string.match(title.Text, "^Break%s%d*%s*comets in best area$") or title.Text == "Break a comet in best area" then
                    for i = 1, 1 do
                        local comet = {
                            [1] = "a5693cdcef2c4cb9aef7f78bb8a01ea9" -- Comet
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Comet_Spawn"):InvokeServer(unpack(comet))
                        task.wait(7)
                    end
                elseif title.Text:match("Break %d+%.?%d*k? breakables in best area") or title.Text == "Break a superior mini-chest in best area" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = parsePosition(area_position)
                    task.wait(2.5)

                    if phe_auto_farm.Use_TNT then
                        for i = 1, 1 do
                            task.wait(5)
                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("TNT_Crate_Consume"):InvokeServer()
                        end
                    end
                elseif string.match(title.Text, "^Break%s+%d+%s+mini%-chests in best area$") or title.Text == "Break a mini-chest in best area" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = parsePosition(area_position)
                    task.wait(2.5)

                    if phe_auto_farm.Use_TNT then
                        for i = 1, 1 do
                            task.wait(5)
                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("TNT_Crate_Consume"):InvokeServer()
                        end
                    end
                elseif string.match(title.Text, "^Break%s%d*%s*pinatas in best area$") or title.Text == "Break a pinata in best area" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = parsePosition(area_position)
                    task.wait(2.5)

                    local pinatas = {
                        [1] = "78fd12a69ef4411ca76f4f0f8694cebc" -- Pinatas
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("MiniPinata_Consume"):InvokeServer(unpack(pinatas))
                elseif string.match(title.Text, "^Break%s%d*%s*lucky block event in best area$") or title.Text == "Break a lucky block event in best area" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = parsePosition(area_position)
                    task.wait(2.5)

                    local lucky_block = {
                        [1] = "7b2a4aa7e05146ee813047273032fd35" -- Lucky Block
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("MiniLuckyBlock_Consume"):InvokeServer(unpack(lucky_block))
                end
            elseif string.match(title.Text, "^Hatch%s%d*%s*of your best eggs$") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = parsePosition(phe_egg_position)

                for i = 1, 1 do
                    local egg = {
                        [1] = phe_egg_name, -- Best Egg
                        [2] = phe_egg_amount -- amount
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Eggs_RequestPurchase"):InvokeServer(unpack(egg))
                end
            elseif string.match(title.Text, "^Make%s(%d+)%s*rainbow pets from best egg$") or string.match(title.Text, "^Make%s(%d+)%s*golden pets from best egg$") then
                if string.match(title.Text, "^Make%s(%d+)%s*rainbow pets from best egg$") then
                    local rainbow = string.match(title.Text, "%d+")
                    print("Make Rainbow Amount: " .. rainbow)  -- Debugging

                    local rainbow_zone = {
                        [1] = "Desert Pyramids"
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Teleports_RequestTeleport"):InvokeServer(unpack(rainbow_zone))
                    task.wait(2.5)

                    local make_rainbow = {
                        [1] = phe_gold_and_rianbow.Rainbow, -- Pet
                        [2] = tonumber(rainbow)
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("RainbowMachine_Activate"):InvokeServer(unpack(make_rainbow))
                elseif string.match(title.Text, "^Make%s(%d+)%s*golden pets from best egg$") then
                    local golden = string.match(title.Text, "%d+")
                    print("Make Golden Amount: " .. golden)  -- Debugging

                    local golden_zone = {
                        [1] = "Mine"
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Teleports_RequestTeleport"):InvokeServer(unpack(golden_zone))
                    task.wait(2.5)

                    local make_golden = {
                        [1] = phe_gold_and_rianbow.Golden, -- Pet
                        [2] = tonumber(golden)
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("GoldMachine_Activate"):InvokeServer(unpack(make_golden))
                end
            end
        end
    end
end)

coroutine.resume(_G.currentLoop)
