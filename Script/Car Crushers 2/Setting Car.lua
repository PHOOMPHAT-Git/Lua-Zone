_G.ForwardSpeed = 1000
_G.JumpPower = 1000
_G.brakePower = 1000
_G.bounce = 150
_G.fly_maxspeed = 500
_G.Highlight_Car = true

_G.keyBindings = {
    forward = Enum.KeyCode.Q,
    hyperforward = Enum.KeyCode.X,
    bounce = Enum.KeyCode.G,
    jump = Enum.KeyCode.C,
    brake = Enum.KeyCode.E,
    fly = Enum.KeyCode.B,
    CarLanding = Enum.KeyCode.V
}

for _, obj in pairs(game.Players.LocalPlayer.PlayerScripts:GetChildren()) do
    if obj:IsA("LocalScript") and obj.Name == script.Name then
        obj:Destroy()
    end
end

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local userInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local function checkSeatStatus(playerName)
    local car = game.Workspace.CarCollection:FindFirstChild(playerName)
    if car then
        local seat = car:FindFirstChild("Car"):FindFirstChild("Body"):FindFirstChild("VehicleSeat")
        if seat then
            return true
        end
    end
    return false
end

local function removeOldHighlights(car)
    for _, child in ipairs(car:GetDescendants()) do
        if child:IsA("Highlight") then
            child:Destroy()
        end
    end
end

local function updateHighlight(highlight, color, transparency)
    if highlight then
        highlight.FillColor = color
        highlight.FillTransparency = transparency
    end
end

local function highlightInterior(car)
    local interior = car:FindFirstChild("Car"):FindFirstChild("Body"):FindFirstChild("Interior")
    if interior then
        local highlight = interior:FindFirstChild("Interior_Highlight")
        if not highlight then
            highlight = Instance.new("Highlight")
            highlight.Name = "Interior_Highlight"
            highlight.Parent = interior
            highlight.FillTransparency = 0.8
        end

        if not checkSeatStatus(car.Name) then
            updateHighlight(highlight, Color3.fromRGB(255, 0, 0), 0.8)
        elseif interior:FindFirstChild("Marked") then
            updateHighlight(highlight, Color3.fromRGB(255, 255, 0), 0.8)
        else
            updateHighlight(highlight, Color3.fromRGB(0, 255, 0), 0.8)
        end
    end
end

local function highlightEngine(car)
    local engine = car:FindFirstChild("Car"):FindFirstChild("Body"):FindFirstChild("Engine")
    if engine then
        local enginehighlight = engine:FindFirstChild("Engine_Highlight")
        if not enginehighlight then
            enginehighlight = Instance.new("Highlight")
            enginehighlight.Name = "Engine_Highlight"
            enginehighlight.Parent = engine
            enginehighlight.FillTransparency = 0.8
        end

        if not checkSeatStatus(car.Name) then
            updateHighlight(enginehighlight, Color3.fromRGB(255, 0, 0), 0.8)
        elseif engine:FindFirstChild("Marked") then
            updateHighlight(enginehighlight, Color3.fromRGB(255, 255, 0), 0.8)
        else
            updateHighlight(enginehighlight, Color3.fromRGB(0, 255, 0), 0.8)
        end
    end
end

local function highlightWheels(car)
    local wheels = {
        FL = car:FindFirstChild("Car"):FindFirstChild("Wheels"):FindFirstChild("FL"),
        FR = car:FindFirstChild("Car"):FindFirstChild("Wheels"):FindFirstChild("FR"),
        RL = car:FindFirstChild("Car"):FindFirstChild("Wheels"):FindFirstChild("RL"),
        RR = car:FindFirstChild("Car"):FindFirstChild("Wheels"):FindFirstChild("RR"),
    }

    local wheelCount = 0
    for _, wheel in pairs(wheels) do
        if wheel and wheel:FindFirstChild("Rim") then
            wheelCount = wheelCount + 1
        end
    end

    local highlightColor = Color3.fromRGB(0, 255, 0)
    if wheelCount == 3 then
        highlightColor = Color3.fromRGB(255, 255, 0)
    elseif wheelCount <= 2 then
        highlightColor = Color3.fromRGB(255, 0, 0)
    end

    for _, wheel in pairs(wheels) do
        if wheel and wheel:FindFirstChild("Rim") then
            local highlight = wheel:FindFirstChild(wheel.Name .. "_Highlight")
            if not highlight then
                highlight = Instance.new("Highlight")
                highlight.Name = wheel.Name .. "_Highlight"
                highlight.Parent = wheel:FindFirstChild("Rim")
                highlight.FillTransparency = 0.8
            end
            updateHighlight(highlight, highlightColor, 0.8)
        end
    end
end

local function createESP(playerName)
    local car = game.Workspace.CarCollection:FindFirstChild(playerName)
    if car then
        removeOldHighlights(car)

        if _G.Highlight_Car then
            highlightWheels(car)
            highlightInterior(car)
            highlightEngine(car)
        end
    end
end

RunService.Heartbeat:Connect(function()
    for _, player in ipairs(game.Workspace.CarCollection:GetChildren()) do
        if player:IsA("Model") then
            createESP(player.Name)
        end
    end
end)

local DashDuration = 0.1

local function dashForward()
    if humanoid.Sit then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = humanoidRootPart.CFrame.LookVector * _G.ForwardSpeed
        bodyVelocity.MaxForce = Vector3.new(3.5e5, 3.5e5, 3.5e5)
        bodyVelocity.Parent = humanoidRootPart

        wait(DashDuration)
        bodyVelocity:Destroy()
    end
end

local function hyperdashForward()
    if humanoid.Sit then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = humanoidRootPart.CFrame.LookVector * _G.ForwardSpeed
        bodyVelocity.MaxForce = Vector3.new(5000e5, 5000e5, 5000e5)
        bodyVelocity.Parent = humanoidRootPart

        wait(DashDuration)
        bodyVelocity:Destroy()
    end
end

local function dashUpward()
    if humanoid.Sit then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, _G.JumpPower, 0)
        bodyVelocity.MaxForce = Vector3.new(3.5e5, 3.5e5, 3.5e5)
        bodyVelocity.Parent = humanoidRootPart

        wait(DashDuration)
        bodyVelocity:Destroy()
    end
end

local function dashDownward()
    if humanoid.Sit then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, -_G.brakePower, 0)
        bodyVelocity.MaxForce = Vector3.new(3.5e5, 3.5e5, 3.5e5)
        bodyVelocity.Parent = humanoidRootPart

        wait(DashDuration)
        bodyVelocity:Destroy()
    end
end

local function dashBackward()
    if humanoid.Sit then
        humanoid.Sit = false
        
        local bodyVelocity = Instance.new("BodyVelocity")
        local lookVector = humanoidRootPart.CFrame.LookVector
        bodyVelocity.Velocity = -lookVector * _G.bounce + Vector3.new(0, _G.bounce, 0)
        bodyVelocity.MaxForce = Vector3.new(3.5e5, 3.5e5, 3.5e5)
        bodyVelocity.Parent = humanoidRootPart

        wait(DashDuration)
        bodyVelocity:Destroy()
    end
end

local isCPressed = false

userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == _G.keyBindings.forward then
            dashForward()
        elseif input.KeyCode == _G.keyBindings.hyperforward then
            hyperdashForward()
        elseif input.KeyCode == _G.keyBindings.bounce then
            dashBackward()
        elseif input.KeyCode == _G.keyBindings.jump then
            dashUpward()
        elseif input.KeyCode == _G.keyBindings.brake then
            isCPressed = true
            while isCPressed do
                dashDownward()
                wait(0.1)
            end
        end
    end
end)

userInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == _G.keyBindings.brake then
            isCPressed = false
        end
    end
end)

local car
local isCarFlying = false
local bodyPosition

local function setCar()
    local playerCar = game.Workspace.CarCollection:FindFirstChild(player.Name)
    if playerCar then
        car = playerCar
    else
        car = nil
    end
end

game:GetService("RunService").Heartbeat:Connect(function()
    setCar()
end)

local function enableFlyingCar()
    if car and car.PrimaryPart and humanoid and humanoid.Sit then
        if not bodyPosition then
            bodyPosition = Instance.new("BodyPosition")
            bodyPosition.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyPosition.D = 5000
            bodyPosition.P = 10000
            bodyPosition.Parent = car.PrimaryPart
        end

        if car.PrimaryPart then
            bodyPosition.Position = car.PrimaryPart.Position + Vector3.new(0, -50, 0)
            car.PrimaryPart.Velocity = car.PrimaryPart.CFrame.lookVector * 100
        end

        isCarFlying = true
    else
        print("You need to sit in the car to fly.")
    end
end

local function disableFlyingCar()
    if bodyPosition then
        bodyPosition:Destroy()
        bodyPosition = nil
    end
    
    if car and car.PrimaryPart then
        car.PrimaryPart.Velocity = Vector3.new(0, 0, 0)
    end

    isCarFlying = false
end

userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == _G.keyBindings.CarLanding then
        if isCarFlying then
            disableFlyingCar()
        else
            enableFlyingCar()
        end
    end
end)

repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
local mouse = game.Players.LocalPlayer:GetMouse()
repeat wait() until mouse

local plr = game.Players.LocalPlayer
local torso = plr.Character.Torso
local flying = false
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 50
local speed = 0

function Fly()
    local bg = Instance.new("BodyGyro", torso)
    bg.P = 9e4
    bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.cframe = torso.CFrame

    local bv = Instance.new("BodyVelocity", torso)
    bv.velocity = Vector3.new(0, 0.1, 0)
    bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

    repeat wait()
        plr.Character.Humanoid.PlatformStand = true

        if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
            speed = speed + 0.5 + (speed / maxspeed)
            if speed > maxspeed then
                speed = maxspeed
            end
        elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
            speed = speed - 1
            if speed < 0 then
                speed = 0
            end
        end

        if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
            bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) + 
                           ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * 0.2, 0).p) - 
                            game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
            lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
        elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
            bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) + 
                           ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * 0.2, 0).p) - 
                            game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
        else
            bv.velocity = Vector3.new(0, 0.1, 0)
        end

        bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
    until not flying

    ctrl = {f = 0, b = 0, l = 0, r = 0}
    lastctrl = {f = 0, b = 0, l = 0, r = 0}
    speed = 0
    bg:Destroy()
    bv:Destroy()
    plr.Character.Humanoid.PlatformStand = false
end

mouse.KeyDown:connect(function(key)
    if key:lower() == _G.keyBindings.fly then
        if flying then
            flying = false
        else
            flying = true
            Fly()
        end
    elseif key:lower() == "w" then
        ctrl.f = 1
    elseif key:lower() == "s" then
        ctrl.b = -1
    elseif key:lower() == "a" then
        ctrl.l = -1
    elseif key:lower() == "d" then
        ctrl.r = 1
    end
end)

mouse.KeyUp:connect(function(key)
    if key:lower() == "w" then
        ctrl.f = 0
    elseif key:lower() == "s" then
        ctrl.b = 0
    elseif key:lower() == "a" then
        ctrl.l = 0
    elseif key:lower() == "d" then
        ctrl.r = 0
    end
end)

Fly()

userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == _G.keyBindings.fly then
            if flying then
                flying = false
            else
                flying = true
                Fly()
            end
        end

        if input.KeyCode == Enum.KeyCode.W then
            ctrl.f = 1
        elseif input.KeyCode == Enum.KeyCode.S then
            ctrl.b = -1
        elseif input.KeyCode == Enum.KeyCode.A then
            ctrl.l = -1
        elseif input.KeyCode == Enum.KeyCode.D then
            ctrl.r = 1
        end
    end
end)

userInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.W then
            ctrl.f = 0
        elseif input.KeyCode == Enum.KeyCode.S then
            ctrl.b = 0
        elseif input.KeyCode == Enum.KeyCode.A then
            ctrl.l = 0
        elseif input.KeyCode == Enum.KeyCode.D then
            ctrl.r = 0
        end
    end
end)
