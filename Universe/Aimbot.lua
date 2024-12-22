for _, obj in pairs(game.Players.LocalPlayer.PlayerScripts:GetChildren()) do
    print("Checking : " .. obj.Name)
    if obj:IsA("LocalScript") and obj.Name == script.Name then
        print("Destroying script : " .. obj.Name)
        obj:Destroy()
    end
end

_G.ScriptName = "Aimbot"
loadstring(game:HttpGet('https://raw.githubusercontent.com/PHOOMPHAT-Git/Lua-Zone/refs/heads/main/dwcqweyhfbwregbfyiokgfnbac.lua'))()

local Toggle = false
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")

StarterGui:SetCore("SendNotification", {
    Title = "PHE Aimbot";
    Text = "Made by Phoomphat";
    Duration = 5;
})

local FOVring = Drawing.new("Circle")
FOVring.Visible = _G.fovVisible
FOVring.Thickness = 1
FOVring.Radius = _G.fov
FOVring.Transparency = 0.8
FOVring.Color = Color3.fromRGB(255, 128, 128)
FOVring.Position = workspace.CurrentCamera.ViewportSize / 2

local currentTarget = nil
local aimbotEnabled = true
local toggleState = false
local debounce = false

local function getClosest(cframe)
    local ray = Ray.new(cframe.Position, cframe.LookVector).Unit
    local target = nil
    local mag = math.huge
    local screenCenter = workspace.CurrentCamera.ViewportSize / 2

    for i, v in pairs(Players:GetPlayers()) do
        if v.Character and v.Character:FindFirstChild(_G.lockPart) and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v ~= Players.LocalPlayer and (v.Team ~= Players.LocalPlayer.Team or (not _G.teamCheck)) then
            local screenPoint, onScreen = workspace.CurrentCamera:WorldToViewportPoint(v.Character[_G.lockPart].Position)
            local distanceFromCenter = (Vector2.new(screenPoint.X, screenPoint.Y) - screenCenter).Magnitude

            if onScreen and distanceFromCenter <= _G.fov then
                local magBuf = (v.Character[_G.lockPart].Position - ray:ClosestPoint(v.Character[_G.lockPart].Position)).Magnitude

                if magBuf < mag then
                    mag = magBuf
                    target = v
                end
            end
        end
    end

    return target
end

local function updateFOVRing()
    FOVring.Position = workspace.CurrentCamera.ViewportSize / 2
    FOVring.Visible = _G.fovVisible
end

local function highlightTarget(target)
    if _G.highlightEnabled and target and target.Character then
        local highlight = Instance.new("Highlight")
        highlight.Adornee = target.Character
        highlight.FillColor = Color3.new(1, 0.5, 0.5)
        highlight.OutlineColor = Color3.new(1, 0, 0)
        highlight.Parent = target.Character
    end
end

local function removeHighlight(target)
    if _G.highlightEnabled and target and target.Character and target.Character:FindFirstChildOfClass("Highlight") then
        target.Character:FindFirstChildOfClass("Highlight"):Destroy()
    end
end

local function predictPosition(target)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local velocity = target.Character.HumanoidRootPart.Velocity
        local position = target.Character[_G.lockPart].Position
        local predictedPosition = position + (velocity * _G.predictionFactor)
        return predictedPosition
    end
    return nil
end

local function handleToggle()
    if debounce then return end
    debounce = true
    toggleState = not toggleState
    wait(0.3)
    debounce = false
end

loop = RunService.RenderStepped:Connect(function()
    if aimbotEnabled then
        updateFOVRing()

        local localPlayer = Players.LocalPlayer.Character
        local cam = workspace.CurrentCamera
        local screenCenter = workspace.CurrentCamera.ViewportSize / 2

        if Toggle then
            if UserInputService:IsKeyDown(_G.ToggleKey) then
                handleToggle()
            end
        else
            toggleState = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
        end

        if toggleState then
            if not currentTarget then
                currentTarget = getClosest(cam.CFrame)
                highlightTarget(currentTarget)
            end

            if currentTarget and currentTarget.Character and currentTarget.Character:FindFirstChild(_G.lockPart) then
                local predictedPosition = predictPosition(currentTarget)
                if predictedPosition then
                    workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(cam.CFrame.Position, predictedPosition), _G.smoothing)
                end
                FOVring.Color = Color3.new(0, 1, 0)
            else
                FOVring.Color = Color3.new(1, 0.5, 0.5)
            end
        else
            if currentTarget and _G.highlightEnabled then
                removeHighlight(currentTarget)
            end
            currentTarget = nil
            FOVring.Color = Color3.new(1, 0.5, 0.5)
        end
    end
end)
