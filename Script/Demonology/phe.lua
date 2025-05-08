-- Services
local Players            = game:GetService("Players")
local CoreGui            = game:GetService("CoreGui")
local Workspace          = game:GetService("Workspace")
local Lighting           = game:GetService("Lighting")
local UserInputService   = game:GetService("UserInputService")

local player    = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root      = character:WaitForChild("HumanoidRootPart")

-- References
local ghost      = Workspace:WaitForChild("Ghost")
local map        = Workspace:WaitForChild("Map")
local rooms      = map:WaitForChild("Rooms")
local handprints = Workspace:WaitForChild("Handprints")
local itemfolder = Workspace:FindFirstChild("Items")

local existingGui = CoreGui:FindFirstChild("PHE")
if existingGui then existingGui:Destroy() end

-- Create ScreenGui in CoreGui
local PHE = Instance.new("ScreenGui")
PHE.Name           = "PHE"
PHE.ResetOnSpawn   = false
PHE.Parent         = CoreGui

-- Main Frame
local Main = Instance.new("Frame", PHE)
Main.Name               = "Main"
Main.BackgroundColor3   = Color3.new(1,1,1)
Main.BackgroundTransparency = 1
Main.Position           = UDim2.new(0.2266,0,0.0556,0)
Main.Size               = UDim2.new(0.1488,0,0.5473,0)

-- Layout for attributes
local attrLayout = Instance.new("UIListLayout", Main)
attrLayout.SortOrder = Enum.SortOrder.LayoutOrder
attrLayout.Padding   = UDim.new(0.01,0)

-- Attribute labels
local attributeNames = {
    "Age","Gender","Headless","Hunting","InLaser",
    "FavoriteRoom","CurrentRoom","GhostTemp","GhostOrb","Handprints","Writing","Wither"
}
local textLabels = {}

for _, name in ipairs(attributeNames) do
    local lbl = Instance.new("TextLabel", Main)
    lbl.Name               = name
    lbl.BackgroundColor3   = Color3.fromRGB(30,30,30)
    lbl.BackgroundTransparency = 0.4
    lbl.Size               = UDim2.new(1,0,0.0621,0)
    lbl.Font               = Enum.Font.SourceSans
    lbl.Text               = name.." : Loading..."
    lbl.TextColor3         = Color3.new(1,1,1)
    lbl.TextScaled         = true
    textLabels[name]       = lbl
end

-- UnderFrame for buttons
local UnderFrame = Instance.new("Frame", Main)
UnderFrame.Name               = "UnderFrame"
UnderFrame.BackgroundTransparency = 1
UnderFrame.Position           = UDim2.new(0,0,0.7214,0)
UnderFrame.Size               = UDim2.new(1,0,0.4164,0)

local underLayout = Instance.new("UIListLayout", UnderFrame)
underLayout.SortOrder = Enum.SortOrder.LayoutOrder
underLayout.Padding   = UDim.new(0.02,0)

-- === Item controls ===
local ItemFrame = Instance.new("Frame", UnderFrame)
ItemFrame.Name               = "Item"
ItemFrame.BackgroundColor3   = Color3.fromRGB(30,30,30)
ItemFrame.BackgroundTransparency = 0.4
ItemFrame.Size               = UDim2.new(1,0,0.549,0)

local highlightItemsBtn = Instance.new("TextButton", ItemFrame)
highlightItemsBtn.Name             = "Highlight_items"
highlightItemsBtn.Text             = "Highlight item : false"
highlightItemsBtn.TextColor3       = Color3.fromRGB(255, 255, 255)
highlightItemsBtn.TextScaled       = true
highlightItemsBtn.Font             = Enum.Font.SourceSansItalic
highlightItemsBtn.BackgroundColor3 = Color3.fromRGB(112,112,112)
highlightItemsBtn.BackgroundTransparency = 0.4
highlightItemsBtn.Size             = UDim2.new(0.9466,0,0.2858,0)
highlightItemsBtn.Position         = UDim2.new(0.0282,0,0.6638,0)

local itemTextbox = Instance.new("TextBox", ItemFrame)
itemTextbox.Name               = "TextBox"
itemTextbox.Text               = ""
itemTextbox.PlaceholderText    = "Item number or all"
itemTextbox.TextColor3         = Color3.fromRGB(255, 255, 255)
itemTextbox.TextScaled         = true
itemTextbox.Font               = Enum.Font.SourceSansItalic
itemTextbox.BackgroundTransparency = 1
itemTextbox.Size               = UDim2.new(1,0,0.2858,0)

local bringItemBtn = Instance.new("TextButton", ItemFrame)
bringItemBtn.Name             = "Bring_item"
bringItemBtn.Text             = "Bring item"
bringItemBtn.TextScaled       = true
bringItemBtn.TextColor3       = Color3.fromRGB(255, 255, 255)
bringItemBtn.Font             = Enum.Font.SourceSansItalic
bringItemBtn.BackgroundColor3 = Color3.fromRGB(112,112,112)
bringItemBtn.BackgroundTransparency = 0.4
bringItemBtn.Size             = UDim2.new(0.9466,0,0.2858,0)
bringItemBtn.Position         = UDim2.new(0.0282,0,0.3319,0)

-- === Ghost controls ===
local GhostFrame = Instance.new("Frame", UnderFrame)
GhostFrame.Name               = "Ghost"
GhostFrame.BackgroundColor3   = Color3.fromRGB(30,30,30)
GhostFrame.BackgroundTransparency = 0.4
GhostFrame.Size               = UDim2.new(1,0,0.549,0)

local highlightHandprintsBtn = Instance.new("TextButton", GhostFrame)
highlightHandprintsBtn.Name             = "Highlight_handprints"
highlightHandprintsBtn.Text             = "Highlight handprints : false"
highlightHandprintsBtn.TextScaled       = true
highlightHandprintsBtn.Font             = Enum.Font.SourceSansItalic
highlightHandprintsBtn.BackgroundColor3 = Color3.fromRGB(112,112,112)
highlightHandprintsBtn.TextColor3       = Color3.fromRGB(255, 255, 255)
highlightHandprintsBtn.BackgroundTransparency = 0.4
highlightHandprintsBtn.Size             = UDim2.new(0.9466,0,0.2606,0)
highlightHandprintsBtn.Position         = UDim2.new(0.0282,0,0.6889,0)

local highlightGhostorbBtn = Instance.new("TextButton", GhostFrame)
highlightGhostorbBtn.Name             = "Highlight_ghostorb"
highlightGhostorbBtn.Text             = "Highlight ghostOrb : false"
highlightGhostorbBtn.TextScaled       = true
highlightGhostorbBtn.Font             = Enum.Font.SourceSansItalic
highlightGhostorbBtn.BackgroundColor3 = Color3.fromRGB(112,112,112)
highlightGhostorbBtn.TextColor3       = Color3.fromRGB(255, 255, 255)
highlightGhostorbBtn.BackgroundTransparency = 0.4
highlightGhostorbBtn.Size             = UDim2.new(0.9466,0,0.2634,0)
highlightGhostorbBtn.Position         = UDim2.new(0.0282,0,0.3748,0)

local highlightGhostBtn = Instance.new("TextButton", GhostFrame)
highlightGhostBtn.Name             = "Highlight_ghost"
highlightGhostBtn.Text             = "Highlight ghost : false"
highlightGhostBtn.TextScaled       = true
highlightGhostBtn.Font             = Enum.Font.SourceSansItalic
highlightGhostBtn.BackgroundColor3 = Color3.fromRGB(112,112,112)
highlightGhostBtn.TextColor3       = Color3.fromRGB(255, 255, 255)
highlightGhostBtn.BackgroundTransparency = 0.4
highlightGhostBtn.Size             = UDim2.new(0.9466,0,0.2593,0)
highlightGhostBtn.Position         = UDim2.new(0.0282,0,0.0695,0)

-- === Player controls ===
local PlayerFrame = Instance.new("Frame", UnderFrame)
PlayerFrame.Name               = "Player"
PlayerFrame.BackgroundColor3   = Color3.fromRGB(30,30,30)
PlayerFrame.BackgroundTransparency = 0.4
PlayerFrame.Size               = UDim2.new(1,0,0.549,0)

local fullBrightBtn = Instance.new("TextButton", PlayerFrame)
fullBrightBtn.Name             = "Full_bright"
fullBrightBtn.Text             = "Full bright : false"
fullBrightBtn.TextScaled       = true
fullBrightBtn.Font             = Enum.Font.SourceSansItalic
fullBrightBtn.BackgroundColor3 = Color3.fromRGB(112,112,112)
fullBrightBtn.TextColor3       = Color3.fromRGB(255, 255, 255)
fullBrightBtn.BackgroundTransparency = 0.4
fullBrightBtn.Size             = UDim2.new(0.9466,0,0.2606,0)
fullBrightBtn.Position         = UDim2.new(0.028,0,0.375,0)

local hideGuiBtn = Instance.new("TextButton", PlayerFrame)
hideGuiBtn.Name             = "Hide_gui"
hideGuiBtn.Text             = "Hide gui"
hideGuiBtn.TextScaled       = true
hideGuiBtn.Font             = Enum.Font.SourceSansItalic
hideGuiBtn.BackgroundColor3 = Color3.fromRGB(112,112,112)
hideGuiBtn.TextColor3       = Color3.fromRGB(255, 255, 255)
hideGuiBtn.BackgroundTransparency = 0.4
hideGuiBtn.Size             = UDim2.new(0.9466,0,0.2634,0)
hideGuiBtn.Position         = UDim2.new(0.028,0,0.689,0)

local infStaminaBtn = Instance.new("TextButton", PlayerFrame)
infStaminaBtn.Name             = "Infinity_stamina"
infStaminaBtn.Text             = "Infinity stamina : false"
infStaminaBtn.TextScaled       = true
infStaminaBtn.Font             = Enum.Font.SourceSansItalic
infStaminaBtn.BackgroundColor3 = Color3.fromRGB(112,112,112)
infStaminaBtn.TextColor3       = Color3.fromRGB(255, 255, 255)
infStaminaBtn.BackgroundTransparency = 0.4
infStaminaBtn.Size             = UDim2.new(0.9466,0,0.2593,0)
infStaminaBtn.Position         = UDim2.new(0.0282,0,0.0695,0)

-- ===== Functions =====

-- 1. Handprints scanning
local handprintFound = false
local function updateHandprints()
    if not handprintFound then
        for _, obj in ipairs(handprints:GetDescendants()) do
            if obj:IsA("BasePart") then
                handprintFound = true
                textLabels.Handprints.Text = "Handprints : true"
                textLabels.Handprints.TextColor3 = Color3.fromRGB(255,100,100)
                break
            end
        end
    end
    if not handprintFound then
        textLabels.Handprints.Text = "Handprints : false"
        textLabels.Handprints.TextColor3 = Color3.new(1,1,1)
    end
end
updateHandprints()
handprints.DescendantAdded:Connect(function(desc)
    if not handprintFound and desc:IsA("BasePart") then
        handprintFound = true
        textLabels.Handprints.Text = "Handprints : true"
        textLabels.Handprints.TextColor3 = Color3.fromRGB(255,100,100)
    end
end)

local function addHandprintBillboard(part)
    if part:FindFirstChild("HandprintDisplay") then return end
    local b = Instance.new("BillboardGui", part)
    b.Name        = "HandprintDisplay"
    b.Adornee     = part
    b.Size        = UDim2.new(0,80,0,40)
    b.StudsOffset = Vector3.new(0,0,0)
    b.AlwaysOnTop = true
    local lbl = Instance.new("TextLabel", b)
    lbl.Size               = UDim2.new(0.7,0,0.7,0)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3         = Color3.new(1.000000, 0.949020, 0.211765)
    lbl.TextScaled         = true
    lbl.Font               = Enum.Font.SourceSansBold
    lbl.Text               = "Handprint"
end

local function addGhostOrbBillboard()
    local orbPart = Workspace:FindFirstChild("GhostOrb")
    if orbPart and orbPart:IsA("Model") then
        orbPart = orbPart:FindFirstChildWhichIsA("BasePart")
    end
    if orbPart and not orbPart:FindFirstChild("GhostOrbDisplay") then
        local b = Instance.new("BillboardGui", orbPart)
        b.Name        = "GhostOrbDisplay"
        b.Adornee     = orbPart
        b.Size        = UDim2.new(0,80,0,40)
        b.StudsOffset = Vector3.new(0,0,0)
        b.AlwaysOnTop = true
        local l = Instance.new("TextLabel", b)
        l.Size                   = UDim2.new(0.7,0,0.7,0)
        l.BackgroundTransparency = 1
        l.TextColor3             = Color3.new(0.058824, 0.968627, 1.000000)
        l.TextScaled             = true
        l.Font                   = Enum.Font.SourceSansBold
        l.Text                   = "GhostOrb"
    end
end

-- 2. GhostOrb scanning
local ghostOrbFound = false
local function updateGhostOrb(found)
    textLabels.GhostOrb.Text = "GhostOrb : " .. tostring(found)
    textLabels.GhostOrb.TextColor3 = found and Color3.fromRGB(255,100,100) or Color3.new(1,1,1)
end
local function scanGhostOrb()
    if ghostOrbFound then return end
    for _, desc in ipairs(Workspace:GetDescendants()) do
        if desc.Name=="GhostOrb" and desc:IsA("BasePart") then
            ghostOrbFound = true
            desc.Transparency = 0
            updateGhostOrb(true)
            return
        end
    end
    updateGhostOrb(false)
end
scanGhostOrb()
Workspace.DescendantAdded:Connect(function(desc)
    if not ghostOrbFound and desc.Name=="GhostOrb" and desc:IsA("BasePart") then
        ghostOrbFound = true
        desc.Transparency = 0
        updateGhostOrb(true)
    end
end)

-- 3. Temperature update
local function updateTemperature()
    local currentRoom = ghost:GetAttribute("CurrentRoom")
    if currentRoom and rooms:FindFirstChild(currentRoom) then
        local temp = rooms[currentRoom]:GetAttribute("Temperature")
        textLabels.GhostTemp.Text = "GhostTemp : " .. tostring(temp)
        if tonumber(temp) and temp < 0 then
            textLabels.GhostTemp.TextColor3 = Color3.fromRGB(255,100,100)
        else
            textLabels.GhostTemp.TextColor3 = Color3.new(1,1,1)
        end
    else
        textLabels.GhostTemp.Text = "GhostTemp : not found"
        textLabels.GhostTemp.TextColor3 = Color3.new(1,1,1)
    end
end

-- 4. Attribute updates
local inLaserLocked = false
for _, attr in ipairs({"Age","Gender","Headless","Hunting","InLaser","FavoriteRoom","CurrentRoom"}) do
    local v = ghost:GetAttribute(attr)
    if attr == "InLaser" and v == true then
        inLaserLocked = true
    end
    textLabels[attr].Text = attr.." : "..tostring(v)
    if attr=="Hunting" or attr=="Headless" or attr=="InLaser" then
        textLabels[attr].TextColor3 = v==true and Color3.fromRGB(255,100,100) or Color3.new(1,1,1)
    elseif attr=="CurrentRoom" then
        updateTemperature()
    end

    ghost:GetAttributeChangedSignal(attr):Connect(function()
        local val = ghost:GetAttribute(attr)
        if attr == "InLaser" then
            if inLaserLocked then
                val = true
            elseif val == true then
                inLaserLocked = true
            end
        end

        textLabels[attr].Text = attr.." : "..tostring(val)
        if attr=="Hunting" or attr=="Headless" or attr=="InLaser" then
            textLabels[attr].TextColor3 = val==true and Color3.fromRGB(255,100,100) or Color3.new(1,1,1)
        elseif attr=="CurrentRoom" then
            updateTemperature()
        else
            textLabels[attr].TextColor3 = Color3.new(1,1,1)
        end
    end)
end

-- 5. Helper for billboards
local function addGhostBillboard()
    local part = ghost:FindFirstChildWhichIsA("BasePart")
    if part then
        local b = Instance.new("BillboardGui", part)
        b.Name        = "GhostNameDisplay"
        b.Adornee     = part
        b.Size        = UDim2.new(0,80,0,40)
        b.StudsOffset = Vector3.new(0,3,0)
        b.AlwaysOnTop = true
        local l = Instance.new("TextLabel", b)
        l.Size               = UDim2.new(0.5,0,0.5,0)
        l.BackgroundTransparency = 1
        l.TextColor3         = Color3.fromRGB(255,0,0)
        l.TextScaled         = true
        l.Font               = Enum.Font.SourceSansBold
        l.Text               = "Ghost"
    end
end

-- 6. Highlight & bring functions
-- Highlight item
local itemHighlightOn = false
highlightItemsBtn.MouseButton1Click:Connect(function()
    itemHighlightOn = not itemHighlightOn
    highlightItemsBtn.Text = "Highlight item : " .. tostring(itemHighlightOn)
    for _, model in ipairs(itemfolder:GetChildren()) do
        if model:IsA("Model") then
            for _, c in ipairs(model:GetDescendants()) do
                if c:IsA("Highlight") or (c:IsA("BillboardGui") and c.Name == "ItemNameDisplay") then
                    c:Destroy()
                end
            end
            if itemHighlightOn then
                local hl = Instance.new("Highlight", model)
                hl.Adornee = model
                hl.FillColor = Color3.fromRGB(0,255,0)
                hl.OutlineColor = Color3.new(1,1,1)
                local primary = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
                if primary then
                    local b = Instance.new("BillboardGui", primary)
                    b.Name        = "ItemNameDisplay"
                    b.Adornee     = primary
                    b.Size        = UDim2.new(0,80,0,40)
                    b.StudsOffset = Vector3.new(0,2,0)
                    b.AlwaysOnTop = true
                    local lbl = Instance.new("TextLabel", b)
                    lbl.Size               = UDim2.new(1,0,0.5,0)
                    lbl.BackgroundTransparency = 1
                    lbl.TextColor3         = Color3.new(1,1,1)
                    lbl.TextScaled         = true
                    lbl.Font               = Enum.Font.SourceSansBold
                    lbl.Text               = model.Name
                end
            end
        end
    end
end)

-- 7. Writing scanning
local writingLocked = false

local function watchPartTransparency(part)
    if not part:IsA("BasePart") then return end
    part:GetPropertyChangedSignal("Transparency"):Connect(function()
        updateWriting()
    end)
end

function updateWriting()
    if writingLocked then
        textLabels.Writing.Text = "Writing : true"
        textLabels.Writing.TextColor3 = Color3.fromRGB(255,100,100)
        return
    end

    local found = false
    for _, model in ipairs(itemfolder:GetChildren()) do
        if model:IsA("Model") then
            local pencil = model:FindFirstChild("Pencil")
            if pencil then
                for _, obj in ipairs(pencil:GetDescendants()) do
                    watchPartTransparency(obj)

                    if obj:IsA("BasePart") and obj.Transparency == 0 then
                        found = true
                        break
                    end
                end
            end
        end
        if found then break end
    end

    if found then
        writingLocked = true
        textLabels.Writing.Text = "Writing : true"
        textLabels.Writing.TextColor3 = Color3.fromRGB(255,100,100)
    else
        textLabels.Writing.Text = "Writing : false"
        textLabels.Writing.TextColor3 = Color3.new(1,1,1)
    end
end
updateWriting()
itemfolder.ChildAdded:Connect(function(model)
    if model:IsA("Model") then
        model.ChildAdded:Connect(function(child)
            if child.Name == "Pencil" then
                child.DescendantAdded:Connect(watchPartTransparency)
                child.DescendantRemoving:Connect(updateWriting)
                updateWriting()
            end
        end)
        local pencil = model:FindFirstChild("Pencil")
        if pencil then
            pencil.DescendantAdded:Connect(watchPartTransparency)
            pencil.DescendantRemoving:Connect(updateWriting)
            updateWriting()
        end
    end
end)

-- 8. Wither scanning
local witherLocked = false
local function updateWither()
    if witherLocked then
        textLabels.Wither.Text = "Wither : true"
        textLabels.Wither.TextColor3 = Color3.fromRGB(255,100,100)
        return
    end

    local found = false
    for _, part in ipairs(itemfolder:GetDescendants()) do
        if part.Name == "Petals" and part:IsA("BasePart") then
            if part.Color == Color3.new(0, 0, 0) then
                found = true
                break
            end
        end
    end

    if found then
        witherLocked = true
        textLabels.Wither.Text = "Wither : true"
        textLabels.Wither.TextColor3 = Color3.fromRGB(255,100,100)
    else
        textLabels.Wither.Text = "Wither : false"
        textLabels.Wither.TextColor3 = Color3.new(1,1,1)
    end
end
updateWither()
for _, part in ipairs(itemfolder:GetDescendants()) do
    if part.Name == "Petals" and part:IsA("BasePart") then
        part:GetPropertyChangedSignal("Color"):Connect(updateWither)
    end
end
itemfolder.DescendantAdded:Connect(function(desc)
    if desc.Name == "Petals" and desc:IsA("BasePart") then
        desc:GetPropertyChangedSignal("Color"):Connect(updateWither)
        updateWither()
    end
end)

-- Bring item
bringItemBtn.MouseButton1Click:Connect(function()
    local name = itemTextbox.Text
    if name and itemfolder then
        for _, model in ipairs(itemfolder:GetChildren()) do
            if model:IsA("Model") and (name=="all" or model.Name==name) then
                local part = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
                if part then
                    model:SetPrimaryPartCFrame(root.CFrame * CFrame.new(0,0,-5))
                end
            end
        end
    end
end)

-- Highlight handprints
local handprintOn = false
highlightHandprintsBtn.MouseButton1Click:Connect(function()
    handprintOn = not handprintOn
    highlightHandprintsBtn.Text = "Highlight handprints : " .. tostring(handprintOn)
    for _, part in ipairs(handprints:GetDescendants()) do
        if part:IsA("BasePart") then
            local gui = part:FindFirstChild("HandprintDisplay")
            if gui then gui:Destroy() end
            if handprintOn then addHandprintBillboard(part) end
        end
    end
end)
handprints.DescendantAdded:Connect(function(desc)
    if handprintOn and desc:IsA("BasePart") then
        addHandprintBillboard(desc)
    end
end)

-- Highlight GhostOrb
local orbOn = false
highlightGhostorbBtn.MouseButton1Click:Connect(function()
    orbOn = not orbOn
    highlightGhostorbBtn.Text = "Highlight ghostOrb : " .. tostring(orbOn)
    local orb = Workspace:FindFirstChild("GhostOrb")
    if orb then
        for _, c in ipairs(orb:GetChildren()) do
            if c:IsA("Highlight") or (c:IsA("BillboardGui") and c.Name == "GhostOrbDisplay") then c:Destroy() end
        end
        if orbOn then
            local hl = Instance.new("Highlight", orb)
            hl.Adornee      = orb
            hl.FillColor    = Color3.new(1,1,1)
            hl.OutlineColor = Color3.new(0.058824, 0.968627, 1.000000)
            addGhostOrbBillboard()
        end
    end
end)

-- Highlight Ghost
local ghostOn = false
highlightGhostBtn.MouseButton1Click:Connect(function()
    ghostOn = not ghostOn
    highlightGhostBtn.Text = "Highlight ghost : " .. tostring(ghostOn)
    for _, desc in ipairs(ghost:GetDescendants()) do
        if desc:IsA("Highlight") or (desc:IsA("BillboardGui") and desc.Name == "GhostNameDisplay") then
            desc:Destroy()
        end
    end
    if ghostOn then
        local hl = Instance.new("Highlight", ghost)
        hl.Adornee      = ghost
        hl.FillColor    = Color3.fromRGB(255,0,0)
        hl.OutlineColor = Color3.new(1,1,1)
        addGhostBillboard()
    end
end)

-- Full bright toggle
local fullBrightOn = false
fullBrightBtn.MouseButton1Click:Connect(function()
    fullBrightOn = not fullBrightOn
    fullBrightBtn.Text = "Full bright : "..tostring(fullBrightOn)
    if fullBrightOn then
        Lighting.Ambient = Color3.new(1,1,1)
    else
        Lighting.Ambient = Color3.new(0,0,0)
    end
end)

-- Hide GUI
local guiHidden = false
hideGuiBtn.MouseButton1Click:Connect(function()
    guiHidden = not guiHidden

    for _, lbl in pairs(textLabels) do
        lbl.Visible = not guiHidden
    end

    ItemFrame.Visible  = not guiHidden
    GhostFrame.Visible = not guiHidden

    PlayerFrame.Visible = true
    hideGuiBtn.Text = guiHidden and "Show gui" or "Hide gui"
end)

-- Toggle with H key
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.H then
        PHE.Enabled = not PHE.Enabled
    end
end)

-- Infinite stamina
local staminaOn = false
local stamConn
infStaminaBtn.MouseButton1Click:Connect(function()
    staminaOn = not staminaOn
    infStaminaBtn.Text = "Infinity stamina : "..tostring(staminaOn)
    if staminaOn then
        if stamConn then stamConn:Disconnect() end
        repeat task.wait() until player:GetAttribute("Stamina")~=nil
        local baseStam = player:GetAttribute("Stamina")
        stamConn = player:GetAttributeChangedSignal("Stamina"):Connect(function()
            if player:GetAttribute("Stamina")<baseStam then
                player:SetAttribute("Stamina", baseStam)
            end
        end)
    else
        if stamConn then stamConn:Disconnect() stamConn=nil end
    end
end)
