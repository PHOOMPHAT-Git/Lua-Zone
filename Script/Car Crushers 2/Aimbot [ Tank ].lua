local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Car Crushers 2",
    SubTitle = "By PHE",
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 380),
    Acrylic = false,
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Aimbot = Window:AddTab({ Title = "Aimbot", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local carCollection = game.Workspace.CarCollection
local playerNames = {}

local Dropdown = Tabs.Aimbot:AddDropdown("Dropdown", {
    Title = "Select User",
    Values = playerNames,
    Multi = false,
    Default = "Gurasha",
})

local selectedPlayer = playerNames[1]
Dropdown:OnChanged(function(Value)
    selectedPlayer = Value
    print("Selected player:", Value)
end)

Tabs.Aimbot:AddButton({
    Title = "Aimbot [ Tank ]",
    Description = "Select User and press this button.",
    Callback = function()
        Window:Dialog({
            Title = "Aimbot [ Tank ]",
            Content = "Select User and press Confirm to use Aimbot.",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        _G.Target_Name = selectedPlayer
                        local localPlayerName = game.Players.LocalPlayer.Name

                        local car = workspace:WaitForChild("CarCollection"):WaitForChild(_G.Target_Name):WaitForChild("Car")
                        local wheels = car:WaitForChild("Wheels")
                        local turret = car:FindFirstChild("Turret")
                        local body = car:WaitForChild("Body")

                        local FR = wheels:FindFirstChild("FR")
                        local Engine = body:FindFirstChild("Engine"):WaitForChild("Engine")
                        local Barrel = turret and turret:FindFirstChild("Barrel") and turret.Barrel:FindFirstChild("MeshPart")

                        local effectsContainer = workspace:WaitForChild("CarCollection"):WaitForChild(localPlayerName):WaitForChild("Car"):WaitForChild("Turret"):WaitForChild("Barrel"):WaitForChild("FirePipe"):WaitForChild("Effects")

                        local function FireAtTarget(hitTarget)
                            local args = {
                                [1] = "Fire",
                                [2] = {
                                    [1] = {
                                        ["Position"] = Vector3.new(1, 0, -1),
                                        ["Hit"] = hitTarget,
                                        ["EffectsContainer"] = effectsContainer
                                    }
                                }
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("rF"):WaitForChild("TankInvoke"):InvokeServer(unpack(args))
                        end

                        if not turret then
                            if FR then
                                FireAtTarget(FR)
                                task.wait(1)
                            end

                            if Engine then
                                FireAtTarget(Engine)
                                task.wait(1)
                            end
                        else
                            FireAtTarget(Barrel)
                            task.wait(1)
                            FireAtTarget(Engine)
                        end
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("")
                    end
                }
            }
        })
    end
})

local function updatePlayerNames()
    playerNames = {}
    for _, model in pairs(carCollection:GetChildren()) do
        if model:IsA("Model") then
            local player = game.Players:FindFirstChild(model.Name)
            if player and player:FindFirstChild("ActivePVP") and player.ActivePVP.Value > 0 then
                table.insert(playerNames, model.Name)
            end
        end
    end
    Dropdown:SetValues(playerNames)
end

updatePlayerNames()

Tabs.Aimbot:AddButton({
    Title = "Refresh Players",
    Description = "Refresh the dropdown.",
    Callback = function()
        Window:Dialog({
            Title = "Refresh Players",
            Content = "Refresh the dropdown.",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        updatePlayerNames()
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("")
                    end
                }
            }
        })
    end
})

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "PHE",
    Content = "The script has been loaded.",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()
