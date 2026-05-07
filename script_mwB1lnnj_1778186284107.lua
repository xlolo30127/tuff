-- XHIVI MM2 | Ultimate Murder Mystery 2 Script
-- Version: 42.0

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

-- Wait for character
repeat task.wait() until LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

-- Simple GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "XHIVI_MM2"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 480)
MainFrame.Position = UDim2.new(0, 20, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Rounded corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Animated Gradient Background for Main Frame
local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 30, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 30))
})
MainGradient.Rotation = 45
MainGradient.Parent = MainFrame

-- Animate the gradient
task.spawn(function()
    while true do
        for i = 45, 405, 1 do
            MainGradient.Rotation = i
            task.wait(0.01)
        end
    end
end)

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleBar

-- Animated Gradient for Title Bar
local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 80)),
    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(180, 80, 255)),
    ColorSequenceKeypoint.new(0.66, Color3.fromRGB(80, 160, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 80, 80))
})
TitleGradient.Rotation = 0
TitleGradient.Parent = TitleBar

-- Animate title gradient
task.spawn(function()
    while true do
        for i = 0, 360, 2 do
            TitleGradient.Rotation = i
            task.wait(0.02)
        end
    end
end)

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(1, -40, 1, 0)
TitleText.Position = UDim2.new(0, 10, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "XHIVI MM2"
TitleText.TextColor3 = Color3.new(1, 1, 1)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 20
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = TitleBar

-- Hide Button with hover animation
local HideBtn = Instance.new("TextButton")
HideBtn.Size = UDim2.new(0, 30, 0, 30)
HideBtn.Position = UDim2.new(1, -35, 0.5, -15)
HideBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
HideBtn.Text = "X"
HideBtn.TextColor3 = Color3.new(1, 1, 1)
HideBtn.Font = Enum.Font.GothamBold
HideBtn.TextSize = 16
HideBtn.BorderSizePixel = 0
HideBtn.Parent = TitleBar

local HideCorner = Instance.new("UICorner")
HideCorner.CornerRadius = UDim.new(0, 6)
HideCorner.Parent = HideBtn

-- Hover animation for hide button
HideBtn.MouseEnter:Connect(function()
    TweenService:Create(HideBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 100, 100), Size = UDim2.new(0, 32, 0, 32)}):Play()
end)

HideBtn.MouseLeave:Connect(function()
    TweenService:Create(HideBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 50, 50), Size = UDim2.new(0, 30, 0, 30)}):Play()
end)

-- Tab Bar (Scrollable)
local TabBarContainer = Instance.new("Frame")
TabBarContainer.Size = UDim2.new(1, -20, 0, 45)
TabBarContainer.Position = UDim2.new(0, 10, 0, 45)
TabBarContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TabBarContainer.BorderSizePixel = 0
TabBarContainer.ClipsDescendants = true
TabBarContainer.Parent = MainFrame

local TabBarCorner = Instance.new("UICorner")
TabBarCorner.CornerRadius = UDim.new(0, 8)
TabBarCorner.Parent = TabBarContainer

-- Animated gradient for tab bar
local TabBarGradient = Instance.new("UIGradient")
TabBarGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 40)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(35, 35, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
})
TabBarGradient.Rotation = 90
TabBarGradient.Parent = TabBarContainer

-- Scrollable Tab Frame
local TabScrollingFrame = Instance.new("ScrollingFrame")
TabScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
TabScrollingFrame.BackgroundTransparency = 1
TabScrollingFrame.BorderSizePixel = 0
TabScrollingFrame.ScrollBarThickness = 3
TabScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 100, 100)
TabScrollingFrame.CanvasSize = UDim2.new(2, 0, 0, 0)
TabScrollingFrame.Parent = TabBarContainer

-- Tab List Layout
local TabListLayout = Instance.new("UIListLayout")
TabListLayout.FillDirection = Enum.FillDirection.Horizontal
TabListLayout.Padding = UDim.new(0, 5)
TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
TabListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Parent = TabScrollingFrame

-- Tab Buttons with animations
local function createAnimatedTab(name, default)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(0, 70, 0, 30)
    tabBtn.BackgroundColor3 = default and Color3.fromRGB(255, 70, 70) or Color3.fromRGB(45, 45, 55)
    tabBtn.Text = name
    tabBtn.TextColor3 = Color3.new(1, 1, 1)
    tabBtn.Font = Enum.Font.GothamBold
    tabBtn.TextSize = 13
    tabBtn.BorderSizePixel = 0
    tabBtn.Parent = TabScrollingFrame
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 6)
    tabCorner.Parent = tabBtn
    
    -- Animated gradient for tab button
    local tabGradient = Instance.new("UIGradient")
    tabGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, default and Color3.fromRGB(255, 100, 100) or Color3.fromRGB(55, 55, 65)),
        ColorSequenceKeypoint.new(0.5, default and Color3.fromRGB(255, 70, 70) or Color3.fromRGB(45, 45, 55)),
        ColorSequenceKeypoint.new(1, default and Color3.fromRGB(230, 50, 50) or Color3.fromRGB(35, 35, 45))
    })
    tabGradient.Rotation = 90
    tabGradient.Parent = tabBtn
    
    -- Hover animation
    tabBtn.MouseEnter:Connect(function()
        if tabBtn.BackgroundColor3 == Color3.fromRGB(45, 45, 55) then
            TweenService:Create(tabBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(65, 65, 75)}):Play()
        end
    end)
    
    tabBtn.MouseLeave:Connect(function()
        if tabBtn.BackgroundColor3 ~= Color3.fromRGB(255, 70, 70) then
            TweenService:Create(tabBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 55)}):Play()
        end
    end)
    
    return tabBtn
end

local CombatTab = createAnimatedTab("Combat", true)
local VisualsTab = createAnimatedTab("Visuals", false)
local PlayerTab = createAnimatedTab("Players", false)
local KeybindTab = createAnimatedTab("Keys", false)
local MiscTab = createAnimatedTab("Misc", false)
local GunTab = createAnimatedTab("Guns", false)

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -20, 1, -110)
ContentFrame.Position = UDim2.new(0, 10, 0, 100)
ContentFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
ContentFrame.BorderSizePixel = 0
ContentFrame.ClipsDescendants = true
ContentFrame.Parent = MainFrame

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = ContentFrame

-- Animated gradient for content frame
local ContentGradient = Instance.new("UIGradient")
ContentGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 40)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(35, 35, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
})
ContentGradient.Rotation = 90
ContentGradient.Parent = ContentFrame

-- Scrolling Frame for content
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, -10, 1, -10)
ScrollingFrame.Position = UDim2.new(0, 5, 0, 5)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarThickness = 4
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 100, 100)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 600)
ScrollingFrame.Parent = ContentFrame

-- UI List Layout
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollingFrame

-- ========== ANIMATED NOTIFICATION SYSTEM ==========
local NotificationHolder = Instance.new("Frame")
NotificationHolder.Name = "NotificationHolder"
NotificationHolder.Size = UDim2.new(0, 320, 1, 0)
NotificationHolder.Position = UDim2.new(1, -330, 0, 10)
NotificationHolder.BackgroundTransparency = 1
NotificationHolder.Parent = ScreenGui

local NotificationList = Instance.new("UIListLayout")
NotificationList.Padding = UDim.new(0, 10)
NotificationList.HorizontalAlignment = Enum.HorizontalAlignment.Right
NotificationList.VerticalAlignment = Enum.VerticalAlignment.Top
NotificationList.SortOrder = Enum.SortOrder.LayoutOrder
NotificationList.Parent = NotificationHolder

local function sendNotification(title, text, duration, color)
    if not Settings or not Settings.Notifications then return end
    
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0, 300, 0, 0)
    notif.BackgroundColor3 = color or Color3.fromRGB(40, 40, 50)
    notif.BorderSizePixel = 0
    notif.ClipsDescendants = true
    notif.Parent = NotificationHolder
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = notif
    
    -- Animated gradient for notification
    local notifGradient = Instance.new("UIGradient")
    notifGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, (color or Color3.fromRGB(40, 40, 50)) + Color3.new(0.1, 0.1, 0.1)),
        ColorSequenceKeypoint.new(0.5, color or Color3.fromRGB(35, 35, 45)),
        ColorSequenceKeypoint.new(1, (color or Color3.fromRGB(30, 30, 40)) - Color3.new(0.1, 0.1, 0.1))
    })
    notifGradient.Rotation = 90
    notifGradient.Parent = notif
    
    -- Animate the notification gradient
    task.spawn(function()
        local rot = 0
        while notif and notif.Parent do
            rot = (rot + 1) % 360
            notifGradient.Rotation = rot
            task.wait(0.05)
        end
    end)
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -20, 0, 20)
    titleLabel.Position = UDim2.new(0, 10, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notif
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, -20, 0, 20)
    textLabel.Position = UDim2.new(0, 10, 0, 35)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextSize = 14
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.Parent = notif
    
    -- Set initial size and position
    notif.Size = UDim2.new(0, 300, 0, 60)
    notif.Position = UDim2.new(0, 320, 0, 0)
    
    -- Animate in
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local goal = {Position = UDim2.new(0, 0, 0, 0)}
    local tween = TweenService:Create(notif, tweenInfo, goal)
    tween:Play()
    
    -- Auto remove after duration
    task.delay(duration or 3, function()
        if notif and notif.Parent then
            local removeTween = TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0, 320, 0, 0)})
            removeTween:Play()
            removeTween.Completed:Connect(function()
                if notif then notif:Destroy() end
            end)
        end
    end)
end

-- ========== TELEPORT RETURN SYSTEM ==========
local lastPosition = nil
local lastCFrame = nil
local teleportTimer = nil

local function savePosition()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        lastPosition = LocalPlayer.Character.HumanoidRootPart.Position
        lastCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end

local function returnToPosition()
    if lastPosition and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = LocalPlayer.Character.HumanoidRootPart
        rootPart.CFrame = lastCFrame or CFrame.new(lastPosition + Vector3.new(0, 3, 0))
        sendNotification("Returned", "Teleported back to original position", 2, Color3.fromRGB(100, 200, 255))
    end
end

local function startReturnTimer(duration)
    if teleportTimer then
        teleportTimer:Disconnect()
        teleportTimer = nil
    end
    teleportTimer = game:GetService("RunService").Stepped:Connect(function()
        duration = duration - 0.1
        if duration <= 0 then
            teleportTimer:Disconnect()
            teleportTimer = nil
            returnToPosition()
        end
    end)
end

-- ========== SETTINGS ==========
local Settings = {
    Aimbot = false,
    SilentAim = false,
    AimAtMurderer = false,
    AutoShoot = false,
    TriggerBot = false,
    AimbotFOV = 150,
    AimPart = "Head",
    ESP = true,
    ESPBoxes = true,
    ESPNames = true,
    ESPHealth = false,
    ESPDistance = true,
    ESPTracers = false,
    HighlightGuns = true,
    XRay = false,
    FullBright = false,
    NoFog = false,
    InfJump = false,
    NoClip = false,
    SpeedBoost = false,
    SpeedAmount = 32,
    AutoCollect = false,
    AntiAFK = false,
    AutoPickupGuns = false,
    AutoEquipGun = false,
    GunHighlightColor = "Gold",
    Notifications = true,
    TeleportReturn = true,
    ReturnDelay = 3
}

-- Store data
local ESPData = {}
local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "XHIVI_ESP"
ESPFolder.Parent = game:GetService("CoreGui")

local GunHighlights = {}
local colors = {
    Gold = Color3.fromRGB(255, 215, 0),
    Red = Color3.fromRGB(255, 0, 0),
    Blue = Color3.fromRGB(0, 0, 255),
    Green = Color3.fromRGB(0, 255, 0)
}

-- Player info storage
local PlayerInfo = {
    Innocent = 0,
    Sheriff = 0,
    Murderer = 0,
    Spectators = 0,
    SheriffName = "None",
    MurdererName = "None",
    TimeLeft = "0:00"
}

-- Track last known roles for notifications
local lastMurderer = "None"
local lastSheriff = "None"

-- ========== AIM PART FUNCTION (ENHANCED) ==========
local function getTargetPart(character)
    if not character then return nil end
    
    local aimPart = Settings.AimPart
    
    if aimPart == "Head" then
        return character:FindFirstChild("Head")
    elseif aimPart == "Torso" then
        return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
    elseif aimPart == "Left Arm" then
        return character:FindFirstChild("Left Arm") or character:FindFirstChild("LeftHand")
    elseif aimPart == "Right Arm" then
        return character:FindFirstChild("Right Arm") or character:FindFirstChild("RightHand")
    elseif aimPart == "Left Leg" then
        return character:FindFirstChild("Left Leg") or character:FindFirstChild("LeftFoot")
    elseif aimPart == "Right Leg" then
        return character:FindFirstChild("Right Leg") or character:FindFirstChild("RightFoot")
    elseif aimPart == "Random" then
        local parts = {"Head", "HumanoidRootPart", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}
        local randomPart = parts[math.random(1, #parts)]
        if randomPart == "Head" then
            return character:FindFirstChild("Head")
        elseif randomPart == "HumanoidRootPart" then
            return character:FindFirstChild("HumanoidRootPart")
        elseif randomPart == "Left Arm" then
            return character:FindFirstChild("Left Arm") or character:FindFirstChild("LeftHand")
        elseif randomPart == "Right Arm" then
            return character:FindFirstChild("Right Arm") or character:FindFirstChild("RightHand")
        elseif randomPart == "Left Leg" then
            return character:FindFirstChild("Left Leg") or character:FindFirstChild("LeftFoot")
        elseif randomPart == "Right Leg" then
            return character:FindFirstChild("Right Leg") or character:FindFirstChild("RightFoot")
        end
    end
    
    return character:FindFirstChild("Head")
end

-- ========== CREATE ANIMATED TOGGLES ==========
local function createAnimatedToggle(text, default)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 260, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    frame.BorderSizePixel = 0
    frame.Parent = ScrollingFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    -- Animated gradient for toggle frame
    local frameGradient = Instance.new("UIGradient")
    frameGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 50)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(35, 35, 45)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 40))
    })
    frameGradient.Rotation = 90
    frameGradient.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 160, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 60, 0, 28)
    btn.Position = UDim2.new(1, -70, 0.5, -14)
    btn.BackgroundColor3 = default and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)
    btn.Text = default and "ON" or "OFF"
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.BorderSizePixel = 0
    btn.Parent = frame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    -- Animated gradient for button
    local btnGradient = Instance.new("UIGradient")
    btnGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, default and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(70, 70, 80)),
        ColorSequenceKeypoint.new(0.5, default and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)),
        ColorSequenceKeypoint.new(1, default and Color3.fromRGB(0, 160, 0) or Color3.fromRGB(50, 50, 60))
    })
    btnGradient.Rotation = 90
    btnGradient.Parent = btn
    
    -- Hover animation
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {Size = UDim2.new(0, 62, 0, 30)}):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {Size = UDim2.new(0, 60, 0, 28)}):Play()
    end)
    
    return frame, btn
end

local function createAnimatedSlider(text, min, max, default)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 260, 0, 55)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    frame.BorderSizePixel = 0
    frame.Parent = ScrollingFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local frameGradient = Instance.new("UIGradient")
    frameGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 50)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(35, 35, 45)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 40))
    })
    frameGradient.Rotation = 90
    frameGradient.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 20)
    label.Position = UDim2.new(0, 10, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = text .. ": " .. default
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(1, -20, 0, 4)
    slider.Position = UDim2.new(0, 10, 0, 35)
    slider.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    slider.BorderSizePixel = 0
    slider.Parent = frame
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
    fill.BorderSizePixel = 0
    fill.Parent = slider
    
    -- Animated gradient for fill
    local fillGradient = Instance.new("UIGradient")
    fillGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 100)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 70, 70)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(230, 50, 50))
    })
    fillGradient.Rotation = 90
    fillGradient.Parent = fill
    
    return frame, slider, fill, label
end

local function createAnimatedDropdown(text, options)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 260, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    frame.BorderSizePixel = 0
    frame.Parent = ScrollingFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local frameGradient = Instance.new("UIGradient")
    frameGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 50)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(35, 35, 45)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 40))
    })
    frameGradient.Rotation = 90
    frameGradient.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 160, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 70, 0, 28)
    btn.Position = UDim2.new(1, -80, 0.5, -14)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    btn.Text = options[1]
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.BorderSizePixel = 0
    btn.Parent = frame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    local btnGradient = Instance.new("UIGradient")
    btnGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 80)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(60, 60, 70)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 60))
    })
    btnGradient.Rotation = 90
    btnGradient.Parent = btn
    
    -- Hover animation
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {Size = UDim2.new(0, 72, 0, 30)}):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {Size = UDim2.new(0, 70, 0, 28)}):Play()
    end)
    
    return frame, btn
end

local function createAnimatedButton(text, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 260, 0, 45)
    btn.BackgroundColor3 = color or Color3.fromRGB(180, 100, 30)
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.BorderSizePixel = 0
    btn.Parent = ScrollingFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    
    local btnGradient = Instance.new("UIGradient")
    btnGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, (color or Color3.fromRGB(200, 120, 50))),
        ColorSequenceKeypoint.new(0.5, (color or Color3.fromRGB(180, 100, 30))),
        ColorSequenceKeypoint.new(1, (color or Color3.fromRGB(160, 80, 20)))
    })
    btnGradient.Rotation = 90
    btnGradient.Parent = btn
    
    -- Hover animation
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {Size = UDim2.new(0, 264, 0, 47)}):Play()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = (color or Color3.fromRGB(200, 120, 50))}):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {Size = UDim2.new(0, 260, 0, 45)}):Play()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = (color or Color3.fromRGB(180, 100, 30))}):Play()
    end)
    
    return btn
end

local function createInfoLabel(parent, text, color)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 260, 0, 35)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    frame.BorderSizePixel = 0
    frame.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local frameGradient = Instance.new("UIGradient")
    frameGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 50)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(35, 35, 45)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 40))
    })
    frameGradient.Rotation = 90
    frameGradient.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 1, 0)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color or Color3.new(1, 1, 1)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    return frame, label
end

local function createKeybindLabel(parent, key, action, color)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 260, 0, 35)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    frame.BorderSizePixel = 0
    frame.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local frameGradient = Instance.new("UIGradient")
    frameGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 50)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(35, 35, 45)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 40))
    })
    frameGradient.Rotation = 90
    frameGradient.Parent = frame
    
    local keyLabel = Instance.new("TextLabel")
    keyLabel.Size = UDim2.new(0, 50, 1, 0)
    keyLabel.Position = UDim2.new(0, 10, 0, 0)
    keyLabel.BackgroundTransparency = 1
    keyLabel.Text = key
    keyLabel.TextColor3 = color or Color3.fromRGB(255, 100, 100)
    keyLabel.Font = Enum.Font.GothamBold
    keyLabel.TextSize = 16
    keyLabel.TextXAlignment = Enum.TextXAlignment.Left
    keyLabel.Parent = frame
    
    local actionLabel = Instance.new("TextLabel")
    actionLabel.Size = UDim2.new(1, -70, 1, 0)
    actionLabel.Position = UDim2.new(0, 70, 0, 0)
    actionLabel.BackgroundTransparency = 1
    actionLabel.Text = action
    actionLabel.TextColor3 = Color3.new(1, 1, 1)
    actionLabel.Font = Enum.Font.Gotham
    actionLabel.TextSize = 14
    actionLabel.TextXAlignment = Enum.TextXAlignment.Left
    actionLabel.Parent = frame
    
    return frame
end

-- ========== CREATE ALL TOGGLES ==========
-- Combat
local aimbotFrame, aimbotBtn = createAnimatedToggle("Aimbot", false)
local silentFrame, silentBtn = createAnimatedToggle("Silent Aim", false)
local aimMurderFrame, aimMurderBtn = createAnimatedToggle("Aim at Murderer", false)
local autoShootFrame, autoShootBtn = createAnimatedToggle("Auto Shoot", false)
local triggerFrame, triggerBtn = createAnimatedToggle("Trigger Bot", false)
local fovFrame, fovSlider, fovFill, fovLabel = createAnimatedSlider("Aimbot FOV", 50, 400, 150)
local partFrame, partBtn = createAnimatedDropdown("Aim Part", {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "Random"})

-- Visuals
local espFrame, espBtn = createAnimatedToggle("ESP", false)
local boxesFrame, boxesBtn = createAnimatedToggle("ESP Boxes", true)
local namesFrame, namesBtn = createAnimatedToggle("ESP Names", true)
local healthFrame, healthBtn = createAnimatedToggle("ESP Health", true)
local distFrame, distBtn = createAnimatedToggle("ESP Distance", true)
local tracersFrame, tracersBtn = createAnimatedToggle("ESP Tracers", false)
local gunsFrame, gunsBtn = createAnimatedToggle("Highlight Guns", true)
local xrayFrame, xrayBtn = createAnimatedToggle("X-Ray", false)
local brightFrame, brightBtn = createAnimatedToggle("Full Bright", false)
local fogFrame, fogBtn = createAnimatedToggle("No Fog", false)
local notifFrame, notifBtn = createAnimatedToggle("Notifications", true)

-- Guns Tab
local returnFrame, returnBtn = createAnimatedToggle("Teleport Return", true)
local delayFrame, delaySlider, delayFill, delayLabel = createAnimatedSlider("Return Delay", 1, 10, 3)

-- Player Info Tab
local innocentFrame, innocentLabel = createInfoLabel(ScrollingFrame, "🟢 Innocent: 0", Color3.new(0, 1, 0))
local sheriffFrame, sheriffLabel = createInfoLabel(ScrollingFrame, "🔵 Sheriff: 0 (None)", Color3.new(0, 0, 1))
local murderFrame, murderLabel = createInfoLabel(ScrollingFrame, "🔴 Murderer: 0 (None)", Color3.new(1, 0, 0))
local specFrame, specLabel = createInfoLabel(ScrollingFrame, "👁️ Spectators: 0", Color3.fromRGB(150, 150, 150))
local timeFrame, timeLabel = createInfoLabel(ScrollingFrame, "⏱️ Time Left: 0:00", Color3.new(1, 1, 0))
local totalFrame, totalLabel = createInfoLabel(ScrollingFrame, "👥 Total Players: 0", Color3.new(1, 1, 1))

-- Keybinds Tab
local keyE = createKeybindLabel(ScrollingFrame, "E", "Toggle Aimbot", Color3.fromRGB(255, 100, 100))
local keyR = createKeybindLabel(ScrollingFrame, "R", "Toggle ESP", Color3.fromRGB(100, 255, 100))
local keyF = createKeybindLabel(ScrollingFrame, "F", "Toggle Infinite Jump", Color3.fromRGB(100, 100, 255))
local keyG = createKeybindLabel(ScrollingFrame, "G", "Teleport to Gun (Auto Return)", Color3.fromRGB(255, 200, 100))
local keyH = createKeybindLabel(ScrollingFrame, "H", "Toggle Aim at Murderer", Color3.fromRGB(100, 200, 255))
local keyJ = createKeybindLabel(ScrollingFrame, "J", "Toggle Auto Shoot", Color3.fromRGB(255, 150, 100))
local keyK = createKeybindLabel(ScrollingFrame, "K", "Toggle Gun Highlight", Color3.fromRGB(255, 215, 0))
local keyX = createKeybindLabel(ScrollingFrame, "X", "Toggle X-Ray", Color3.fromRGB(200, 100, 255))
local keyZ = createKeybindLabel(ScrollingFrame, "Z", "Hide/Show UI", Color3.fromRGB(255, 100, 200))

-- Misc
local jumpFrame, jumpBtn = createAnimatedToggle("Infinite Jump", false)
local noclipFrame, noclipBtn = createAnimatedToggle("No Clip", false)
local speedFrame, speedBtn = createAnimatedToggle("Speed Boost", false)
local speedSliderFrame, speedSlider, speedFill, speedLabel = createAnimatedSlider("Speed Amount", 16, 100, 32)
local collectFrame, collectBtn = createAnimatedToggle("Auto Collect Coins", false)
local afkFrame, afkBtn = createAnimatedToggle("Anti AFK", false)

-- Guns
local pickupFrame, pickupBtn = createAnimatedToggle("Auto Pickup Guns", false)
local equipFrame, equipBtn = createAnimatedToggle("Auto Equip Gun", false)
local colorFrame, colorBtn = createAnimatedDropdown("Gun Color", {"Gold", "Red", "Blue", "Green"})
local teleportBtn = createAnimatedButton("📍 TELEPORT TO GUN (Auto Return)", Color3.fromRGB(180, 100, 30))

-- Store all elements for tab switching
local CombatElements = {aimbotFrame, silentFrame, aimMurderFrame, autoShootFrame, triggerFrame, fovFrame, partFrame}
local VisualsElements = {espFrame, boxesFrame, namesFrame, healthFrame, distFrame, tracersFrame, gunsFrame, xrayFrame, brightFrame, fogFrame, notifFrame}
local PlayerElements = {innocentFrame, sheriffFrame, murderFrame, specFrame, timeFrame, totalFrame}
local KeybindElements = {keyE, keyR, keyF, keyG, keyH, keyJ, keyK, keyX, keyZ}
local MiscElements = {jumpFrame, noclipFrame, speedFrame, speedSliderFrame, collectFrame, afkFrame}
local GunElements = {pickupFrame, equipFrame, colorFrame, teleportBtn, returnFrame, delayFrame}

-- Hide all initially
local function hideAll()
    for _, v in pairs(CombatElements) do if v then v.Visible = false end end
    for _, v in pairs(VisualsElements) do if v then v.Visible = false end end
    for _, v in pairs(PlayerElements) do if v then v.Visible = false end end
    for _, v in pairs(KeybindElements) do if v then v.Visible = false end end
    for _, v in pairs(MiscElements) do if v then v.Visible = false end end
    for _, v in pairs(GunElements) do if v then v.Visible = false end end
end

-- Show combat by default
hideAll()
for _, v in pairs(CombatElements) do if v then v.Visible = true end end

-- Tab switching with animations
local function switchTabWithAnimation(tab)
    -- Fade out current content
    for _, v in pairs(CombatElements) do if v then TweenService:Create(v, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play() end end
    for _, v in pairs(VisualsElements) do if v then TweenService:Create(v, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play() end end
    for _, v in pairs(PlayerElements) do if v then TweenService:Create(v, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play() end end
    for _, v in pairs(KeybindElements) do if v then TweenService:Create(v, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play() end end
    for _, v in pairs(MiscElements) do if v then TweenService:Create(v, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play() end end
    for _, v in pairs(GunElements) do if v then TweenService:Create(v, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play() end end
    
    task.wait(0.2)
    
    -- Update tab colors
    CombatTab.BackgroundColor3 = tab == "Combat" and Color3.fromRGB(255, 70, 70) or Color3.fromRGB(45, 45, 55)
    VisualsTab.BackgroundColor3 = tab == "Visuals" and Color3.fromRGB(255, 70, 70) or Color3.fromRGB(45, 45, 55)
    PlayerTab.BackgroundColor3 = tab == "Players" and Color3.fromRGB(255, 70, 70) or Color3.fromRGB(45, 45, 55)
    KeybindTab.BackgroundColor3 = tab == "Keys" and Color3.fromRGB(255, 70, 70) or Color3.fromRGB(45, 45, 55)
    MiscTab.BackgroundColor3 = tab == "Misc" and Color3.fromRGB(255, 70, 70) or Color3.fromRGB(45, 45, 55)
    GunTab.BackgroundColor3 = tab == "Guns" and Color3.fromRGB(255, 70, 70) or Color3.fromRGB(45, 45, 55)
    
    hideAll()
    
    -- Show new content with fade in
    local elementsToShow = {}
    if tab == "Combat" then elementsToShow = CombatElements
    elseif tab == "Visuals" then elementsToShow = VisualsElements
    elseif tab == "Players" then elementsToShow = PlayerElements
    elseif tab == "Keys" then elementsToShow = KeybindElements
    elseif tab == "Misc" then elementsToShow = MiscElements
    elseif tab == "Guns" then elementsToShow = GunElements
    end
    
    for _, v in pairs(elementsToShow) do
        if v then
            v.Visible = true
            v.BackgroundTransparency = 0.2
            TweenService:Create(v, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
        end
    end
    
    sendNotification("Tab Changed", tab .. " Tab", 1, Color3.fromRGB(255, 70, 70))
end

CombatTab.MouseButton1Click:Connect(function() switchTabWithAnimation("Combat") end)
VisualsTab.MouseButton1Click:Connect(function() switchTabWithAnimation("Visuals") end)
PlayerTab.MouseButton1Click:Connect(function() switchTabWithAnimation("Players") end)
KeybindTab.MouseButton1Click:Connect(function() switchTabWithAnimation("Keys") end)
MiscTab.MouseButton1Click:Connect(function() switchTabWithAnimation("Misc") end)
GunTab.MouseButton1Click:Connect(function() switchTabWithAnimation("Guns") end)

-- ========== TOGGLE CONNECTIONS ==========
aimbotBtn.MouseButton1Click:Connect(function()
    Settings.Aimbot = not Settings.Aimbot
    aimbotBtn.Text = Settings.Aimbot and "ON" or "OFF"
    TweenService:Create(aimbotBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.Aimbot and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
    sendNotification("Aimbot", Settings.Aimbot and "Aimbot Enabled" or "Aimbot Disabled", 2, Color3.fromRGB(100, 100, 255))
end)

silentBtn.MouseButton1Click:Connect(function()
    Settings.SilentAim = not Settings.SilentAim
    silentBtn.Text = Settings.SilentAim and "ON" or "OFF"
    TweenService:Create(silentBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.SilentAim and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
    sendNotification("Silent Aim", Settings.SilentAim and "Silent Aim Enabled" or "Silent Aim Disabled", 2, Color3.fromRGB(100, 100, 255))
end)

aimMurderBtn.MouseButton1Click:Connect(function()
    Settings.AimAtMurderer = not Settings.AimAtMurderer
    aimMurderBtn.Text = Settings.AimAtMurderer and "ON" or "OFF"
    TweenService:Create(aimMurderBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.AimAtMurderer and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
    sendNotification("Aim at Murderer", Settings.AimAtMurderer and "Now aiming at murderer" or "Aim at murderer disabled", 2, Color3.fromRGB(255, 100, 100))
end)

autoShootBtn.MouseButton1Click:Connect(function()
    Settings.AutoShoot = not Settings.AutoShoot
    autoShootBtn.Text = Settings.AutoShoot and "ON" or "OFF"
    TweenService:Create(autoShootBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.AutoShoot and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
    sendNotification("Auto Shoot", Settings.AutoShoot and "Auto shooting enabled" or "Auto shooting disabled", 2, Color3.fromRGB(255, 150, 100))
end)

triggerBtn.MouseButton1Click:Connect(function()
    Settings.TriggerBot = not Settings.TriggerBot
    triggerBtn.Text = Settings.TriggerBot and "ON" or "OFF"
    TweenService:Create(triggerBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.TriggerBot and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
    sendNotification("Trigger Bot", Settings.TriggerBot and "Trigger bot enabled" or "Trigger bot disabled", 2, Color3.fromRGB(255, 100, 255))
end)

espBtn.MouseButton1Click:Connect(function()
    Settings.ESP = not Settings.ESP
    espBtn.Text = Settings.ESP and "ON" or "OFF"
    TweenService:Create(espBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.ESP and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
    sendNotification("ESP", Settings.ESP and "ESP Enabled" or "ESP Disabled", 2, Color3.fromRGB(100, 255, 100))
end)

boxesBtn.MouseButton1Click:Connect(function()
    Settings.ESPBoxes = not Settings.ESPBoxes
    boxesBtn.Text = Settings.ESPBoxes and "ON" or "OFF"
    TweenService:Create(boxesBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.ESPBoxes and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
end)

namesBtn.MouseButton1Click:Connect(function()
    Settings.ESPNames = not Settings.ESPNames
    namesBtn.Text = Settings.ESPNames and "ON" or "OFF"
    TweenService:Create(namesBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.ESPNames and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
end)

healthBtn.MouseButton1Click:Connect(function()
    Settings.ESPHealth = not Settings.ESPHealth
    healthBtn.Text = Settings.ESPHealth and "ON" or "OFF"
    TweenService:Create(healthBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.ESPHealth and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
end)

distBtn.MouseButton1Click:Connect(function()
    Settings.ESPDistance = not Settings.ESPDistance
    distBtn.Text = Settings.ESPDistance and "ON" or "OFF"
    TweenService:Create(distBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.ESPDistance and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
end)

tracersBtn.MouseButton1Click:Connect(function()
    Settings.ESPTracers = not Settings.ESPTracers
    tracersBtn.Text = Settings.ESPTracers and "ON" or "OFF"
    TweenService:Create(tracersBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.ESPTracers and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
end)

gunsBtn.MouseButton1Click:Connect(function()
    Settings.HighlightGuns = not Settings.HighlightGuns
    gunsBtn.Text = Settings.HighlightGuns and "ON" or "OFF"
    TweenService:Create(gunsBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.HighlightGuns and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
end)

xrayBtn.MouseButton1Click:Connect(function()
    Settings.XRay = not Settings.XRay
    xrayBtn.Text = Settings.XRay and "ON" or "OFF"
    TweenService:Create(xrayBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.XRay and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
    sendNotification("X-Ray", Settings.XRay and "X-Ray Enabled" or "X-Ray Disabled", 2, Color3.fromRGB(200, 100, 255))
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") then
            if v.Size.magnitude > 10 then
                v.LocalTransparencyModifier = Settings.XRay and 0.7 or 0
            end
        end
    end
end)

brightBtn.MouseButton1Click:Connect(function()
    Settings.FullBright = not Settings.FullBright
    brightBtn.Text = Settings.FullBright and "ON" or "OFF"
    TweenService:Create(brightBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.FullBright and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
    Lighting.Ambient = Settings.FullBright and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
    Lighting.Brightness = Settings.FullBright and 2 or 1
end)

fogBtn.MouseButton1Click:Connect(function()
    Settings.NoFog = not Settings.NoFog
    fogBtn.Text = Settings.NoFog and "ON" or "OFF"
    TweenService:Create(fogBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.NoFog and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
    Lighting.FogEnd = Settings.NoFog and 100000 or 1000
end)

jumpBtn.MouseButton1Click:Connect(function()
    Settings.InfJump = not Settings.InfJump
    jumpBtn.Text = Settings.InfJump and "ON" or "OFF"
    TweenService:Create(jumpBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.InfJump and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
    sendNotification("Infinite Jump", Settings.InfJump and "Infinite Jump Enabled" or "Infinite Jump Disabled", 2, Color3.fromRGB(100, 100, 255))
end)

noclipBtn.MouseButton1Click:Connect(function()
    Settings.NoClip = not Settings.NoClip
    noclipBtn.Text = Settings.NoClip and "ON" or "OFF"
    TweenService:Create(noclipBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.NoClip and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
    sendNotification("No Clip", Settings.NoClip and "No Clip Enabled" or "No Clip Disabled", 2, Color3.fromRGB(150, 150, 255))
end)

speedBtn.MouseButton1Click:Connect(function()
    Settings.SpeedBoost = not Settings.SpeedBoost
    speedBtn.Text = Settings.SpeedBoost and "ON" or "OFF"
    TweenService:Create(speedBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.SpeedBoost and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
    sendNotification("Speed Boost", Settings.SpeedBoost and "Speed Boost Enabled" or "Speed Boost Disabled", 2, Color3.fromRGB(100, 255, 100))
end)

collectBtn.MouseButton1Click:Connect(function()
    Settings.AutoCollect = not Settings.AutoCollect
    collectBtn.Text = Settings.AutoCollect and "ON" or "OFF"
    TweenService:Create(collectBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.AutoCollect and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
end)

afkBtn.MouseButton1Click:Connect(function()
    Settings.AntiAFK = not Settings.AntiAFK
    afkBtn.Text = Settings.AntiAFK and "ON" or "OFF"
    TweenService:Create(afkBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.AntiAFK and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
end)

pickupBtn.MouseButton1Click:Connect(function()
    Settings.AutoPickupGuns = not Settings.AutoPickupGuns
    pickupBtn.Text = Settings.AutoPickupGuns and "ON" or "OFF"
    TweenService:Create(pickupBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.AutoPickupGuns and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
end)

equipBtn.MouseButton1Click:Connect(function()
    Settings.AutoEquipGun = not Settings.AutoEquipGun
    equipBtn.Text = Settings.AutoEquipGun and "ON" or "OFF"
    TweenService:Create(equipBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.AutoEquipGun and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
end)

notifBtn.MouseButton1Click:Connect(function()
    Settings.Notifications = not Settings.Notifications
    notifBtn.Text = Settings.Notifications and "ON" or "OFF"
    TweenService:Create(notifBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.Notifications and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
    sendNotification("Notifications", Settings.Notifications and "Notifications Enabled" or "Notifications Disabled", 2, Color3.fromRGB(255, 215, 0))
end)

returnBtn.MouseButton1Click:Connect(function()
    Settings.TeleportReturn = not Settings.TeleportReturn
    returnBtn.Text = Settings.TeleportReturn and "ON" or "OFF"
    TweenService:Create(returnBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.TeleportReturn and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
    sendNotification("Teleport Return", Settings.TeleportReturn and "Auto return enabled" or "Auto return disabled", 2, Color3.fromRGB(100, 200, 255))
end)

-- Aim Part dropdown (EXPANDED)
local partIndex = 1
local aimParts = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "Random"}
partBtn.MouseButton1Click:Connect(function()
    partIndex = partIndex % #aimParts + 1
    Settings.AimPart = aimParts[partIndex]
    partBtn.Text = aimParts[partIndex]
    
    -- Animate dropdown button
    TweenService:Create(partBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 90)}):Play()
    task.wait(0.1)
    TweenService:Create(partBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 70)}):Play()
    
    sendNotification("Aim Part", "Now aiming at " .. aimParts[partIndex], 2, Color3.fromRGB(255, 200, 100))
end)

-- Gun Color dropdown
local colorIndex = 1
colorBtn.MouseButton1Click:Connect(function()
    colorIndex = colorIndex % 4 + 1
    local gunColors = {"Gold", "Red", "Blue", "Green"}
    Settings.GunHighlightColor = gunColors[colorIndex]
    colorBtn.Text = gunColors[colorIndex]
    
    -- Animate dropdown button
    TweenService:Create(colorBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 90)}):Play()
    task.wait(0.1)
    TweenService:Create(colorBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 70)}):Play()
    
    sendNotification("Gun Color", "Gun highlight: " .. gunColors[colorIndex], 2, colors[gunColors[colorIndex]])
end)

-- FOV Slider
local fovDragging = false
fovSlider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        fovDragging = true
        TweenService:Create(fovFill, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 150, 150)}):Play()
    end
end)

fovSlider.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        fovDragging = false
        TweenService:Create(fovFill, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 70, 70)}):Play()
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if fovDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mousePos = UserInputService:GetMouseLocation()
        local sliderPos = fovSlider.AbsolutePosition
        local sliderSize = fovSlider.AbsoluteSize
        
        local percent = (mousePos.X - sliderPos.X) / sliderSize.X
        percent = math.clamp(percent, 0, 1)
        
        fovFill.Size = UDim2.new(percent, 0, 1, 0)
        Settings.AimbotFOV = 50 + (percent * 350)
        fovLabel.Text = "Aimbot FOV: " .. math.floor(Settings.AimbotFOV)
    end
end)

-- Speed Slider
local speedDragging = false
speedSlider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        speedDragging = true
        TweenService:Create(speedFill, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 150, 150)}):Play()
    end
end)

speedSlider.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        speedDragging = false
        TweenService:Create(speedFill, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 70, 70)}):Play()
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if speedDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mousePos = UserInputService:GetMouseLocation()
        local sliderPos = speedSlider.AbsolutePosition
        local sliderSize = speedSlider.AbsoluteSize
        
        local percent = (mousePos.X - sliderPos.X) / sliderSize.X
        percent = math.clamp(percent, 0, 1)
        
        speedFill.Size = UDim2.new(percent, 0, 1, 0)
        Settings.SpeedAmount = 16 + (percent * 84)
        speedLabel.Text = "Speed Amount: " .. math.floor(Settings.SpeedAmount)
    end
end)

-- Return Delay Slider
local delayDragging = false
delaySlider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        delayDragging = true
        TweenService:Create(delayFill, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 150, 150)}):Play()
    end
end)

delaySlider.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        delayDragging = false
        TweenService:Create(delayFill, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 70, 70)}):Play()
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if delayDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mousePos = UserInputService:GetMouseLocation()
        local sliderPos = delaySlider.AbsolutePosition
        local sliderSize = delaySlider.AbsoluteSize
        
        local percent = (mousePos.X - sliderPos.X) / sliderSize.X
        percent = math.clamp(percent, 0, 1)
        
        delayFill.Size = UDim2.new(percent, 0, 1, 0)
        Settings.ReturnDelay = 1 + (percent * 9)
        delayLabel.Text = "Return Delay: " .. math.floor(Settings.ReturnDelay)
    end
end)

-- ========== GUN DETECTION ==========
local function isGunHeldByPlayer(gun)
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character then
            for _, tool in pairs(player.Character:GetChildren()) do
                if tool == gun then return true end
            end
        end
        if player:FindFirstChild("Backpack") then
            for _, tool in pairs(player.Backpack:GetChildren()) do
                if tool == gun then return true end
            end
        end
    end
    return false
end

local function createGunHighlight(gun)
    if GunHighlights[gun] then return end
    if isGunHeldByPlayer(gun) then return end
    
    local attachPart = gun:IsA("BasePart") and gun or gun:FindFirstChildWhichIsA("BasePart")
    if not attachPart then return end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = "GunHighlight"
    highlight.FillColor = colors[Settings.GunHighlightColor] or colors.Gold
    highlight.OutlineColor = Color3.new(1, 1, 1)
    highlight.FillTransparency = 0.3
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = gun
    
    GunHighlights[gun] = {
        Highlight = highlight,
        AttachPart = attachPart
    }
end

local function scanForDroppedGuns()
    -- Clean up
    for gun, data in pairs(GunHighlights) do
        if not gun or not gun.Parent then
            pcall(function() 
                if data.Highlight then data.Highlight:Destroy() end
            end)
            GunHighlights[gun] = nil
        end
    end
    
    -- Scan for GunDrop
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj.Name:lower() == "gundrop" then
            if not GunHighlights[obj] and not isGunHeldByPlayer(obj) then
                createGunHighlight(obj)
            end
        end
    end
end

-- ========== ESP CREATION ==========
local function createESP(player)
    if player == LocalPlayer then return end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = player.Name .. "_ESP"
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 120, 0, 45)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.Parent = ESPFolder
    
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.new(0, 0, 0)
    bg.BackgroundTransparency = 0.3
    bg.BorderSizePixel = 0
    bg.Parent = billboard
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, -4, 0.4, 0)
    nameLabel.Position = UDim2.new(0, 2, 0, 1)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextScaled = true
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Parent = bg
    
    local roleLabel = Instance.new("TextLabel")
    roleLabel.Size = UDim2.new(1, -4, 0.3, 0)
    roleLabel.Position = UDim2.new(0, 2, 0.42, 0)
    roleLabel.BackgroundTransparency = 1
    roleLabel.Text = "INNOCENT"
    roleLabel.TextColor3 = Color3.new(0, 1, 0)
    roleLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    roleLabel.TextStrokeTransparency = 0
    roleLabel.TextScaled = true
    roleLabel.Font = Enum.Font.GothamBold
    roleLabel.TextXAlignment = Enum.TextXAlignment.Left
    roleLabel.Parent = bg
    
    -- Health bar
    local healthBar = Instance.new("Frame")
    healthBar.Size = UDim2.new(1, -4, 0.06, 0)
    healthBar.Position = UDim2.new(0, 2, 0.85, 0)
    healthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    healthBar.BorderSizePixel = 0
    healthBar.Parent = bg
    
    ESPData[player] = {
        Billboard = billboard,
        Name = nameLabel,
        Role = roleLabel,
        HealthBar = healthBar
    }
end

-- Initialize ESP
for _, player in pairs(Players:GetPlayers()) do
    createESP(player)
end

Players.PlayerAdded:Connect(function(player)
    task.wait(0.5)
    createESP(player)
end)

Players.PlayerRemoving:Connect(function(player)
    if ESPData[player] and ESPData[player].Billboard then
        ESPData[player].Billboard:Destroy()
        ESPData[player] = nil
    end
end)

-- ========== FULL INVENTORY CHECK FUNCTION ==========
local function checkPlayerInventory(player)
    if player == LocalPlayer then return "INNOCENT" end
    
    -- Check equipped tool first
    local character = player.Character
    if character then
        local tool = character:FindFirstChildOfClass("Tool")
        if tool then
            local toolName = tool.Name:lower()
            if toolName:find("knife") then
                return "MURDERER"
            elseif toolName:find("gun") then
                return "SHERIFF"
            end
        end
    end
    
    -- Check backpack for weapons
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, item in pairs(backpack:GetChildren()) do
            if item:IsA("Tool") then
                local itemName = item.Name:lower()
                if itemName:find("knife") then
                    return "MURDERER"
                elseif itemName:find("gun") then
                    return "SHERIFF"
                end
            end
        end
    end
    
    return "INNOCENT"
end

-- ========== ROLE DETECTION FUNCTION ==========
local function detectRoles()
    local innocent = 0
    local sheriff = 0
    local murder = 0
    local spectators = 0
    local sheriffName = "None"
    local murderName = "None"
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            local isAlive = false
            
            if character and character:FindFirstChild("Humanoid") then
                local humanoid = character.Humanoid
                if humanoid and humanoid.Health > 0 then
                    isAlive = true
                end
            end
            
            if not isAlive then
                spectators = spectators + 1
            else
                local role = checkPlayerInventory(player)
                
                if role == "MURDERER" then
                    murder = murder + 1
                    murderName = player.Name
                elseif role == "SHERIFF" then
                    sheriff = sheriff + 1
                    sheriffName = player.Name
                else
                    innocent = innocent + 1
                end
            end
        end
    end
    
    -- Check for role changes and send notifications
    if murderName ~= "None" and murderName ~= lastMurderer then
        sendNotification("🔴 MURDERER DETECTED", murderName .. " is the Murderer!", 4, Color3.fromRGB(255, 0, 0))
        lastMurderer = murderName
    end
    
    if sheriffName ~= "None" and sheriffName ~= lastSheriff then
        sendNotification("🔵 SHERIFF DETECTED", sheriffName .. " is the Sheriff!", 4, Color3.fromRGB(0, 0, 255))
        lastSheriff = sheriffName
    end
    
    -- Update PlayerInfo
    PlayerInfo.Innocent = innocent
    PlayerInfo.Sheriff = sheriff
    PlayerInfo.Murderer = murder
    PlayerInfo.Spectators = spectators
    PlayerInfo.SheriffName = sheriffName
    PlayerInfo.MurdererName = murderName
    PlayerInfo.Total = #Players:GetPlayers() - 1
    
    -- Update labels
    innocentLabel.Text = "🟢 Innocent: " .. innocent
    sheriffLabel.Text = "🔵 Sheriff: " .. sheriff .. " (" .. sheriffName .. ")"
    murderLabel.Text = "🔴 Murderer: " .. murder .. " (" .. murderName .. ")"
    specLabel.Text = "👁️ Spectators: " .. spectators
    totalLabel.Text = "👥 Total Players: " .. PlayerInfo.Total
end

-- ========== AIMBOT FUNCTIONS (ENHANCED) ==========
local function getClosestPlayer()
    local mousePos = Vector2.new(Mouse.X, Mouse.Y)
    local closestDist = Settings.AimbotFOV
    local closestPart = nil
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character and character:FindFirstChild("Humanoid") then
                local humanoid = character.Humanoid
                if humanoid and humanoid.Health > 0 then
                    local targetPart = getTargetPart(character)
                    if targetPart then
                        local pos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                        if onScreen then
                            local dist = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                            if dist < closestDist then
                                closestDist = dist
                                closestPart = targetPart
                            end
                        end
                    end
                end
            end
        end
    end
    
    return closestPart
end

local function getMurderer()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if checkPlayerInventory(player) == "MURDERER" then
                local targetPart = getTargetPart(player.Character)
                if targetPart then
                    return player, targetPart
                end
            end
        end
    end
    return nil, nil
end

-- ========== AUTO SHOOT ==========
local function shootAt(target)
    if not target then return end
    
    if LocalPlayer.Character then
        for _, tool in pairs(LocalPlayer.Character:GetChildren()) do
            if tool:IsA("Tool") and (tool.Name:lower():find("gun") or tool.Name == "Gun") then
                local remote = tool:FindFirstChild("Remote") or tool:FindFirstChild("Shoot") or tool:FindFirstChild("Fire")
                if remote then
                    remote:FireServer(target.Position, target.Position)
                end
                break
            end
        end
    end
end

-- ========== TRIGGER BOT ==========
local function checkTrigger()
    if not Settings.TriggerBot then return end
    
    local mousePos = Vector2.new(Mouse.X, Mouse.Y)
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character then
                local targetPart = getTargetPart(character)
                if targetPart then
                    local pos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                    if onScreen then
                        local dist = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                        if dist < 50 then
                            shootAt(targetPart)
                            break
                        end
                    end
                end
            end
        end
    end
end

-- ========== NO CLIP ==========
local function noclipLoop()
    if not Settings.NoClip then return end
    if LocalPlayer.Character then
        for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end

-- ========== SPEED BOOST ==========
local function speedBoostLoop()
    if not Settings.SpeedBoost then return end
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = Settings.SpeedAmount
    end
end

-- ========== AUTO COLLECT ==========
local function autoCollectCoins()
    if not Settings.AutoCollect then return end
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    
    local myPos = LocalPlayer.Character.HumanoidRootPart.Position
    
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Part") and obj.Name:lower():find("coin") then
            local dist = (obj.Position - myPos).magnitude
            if dist < 30 then
                firetouchinterest(LocalPlayer.Character.HumanoidRootPart, obj, 0)
            end
        end
    end
end

-- ========== ANTI AFK ==========
local function antiAFK()
    if not Settings.AntiAFK then return end
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end

-- ========== AUTO PICKUP GUNS ==========
local function autoPickupGuns()
    if not Settings.AutoPickupGuns then return end
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    
    local myPos = LocalPlayer.Character.HumanoidRootPart.Position
    
    for gun, data in pairs(GunHighlights) do
        if gun and gun.Parent and data.AttachPart then
            local dist = (data.AttachPart.Position - myPos).magnitude
            if dist < 20 then
                firetouchinterest(LocalPlayer.Character.HumanoidRootPart, data.AttachPart, 0)
            end
        end
    end
end

-- ========== AUTO EQUIP GUN ==========
local function autoEquipGun()
    if not Settings.AutoEquipGun then return end
    if not LocalPlayer.Character then return end
    
    if LocalPlayer:FindFirstChild("Backpack") then
        for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
            if tool:IsA("Tool") and (tool.Name:lower():find("gun") or tool.Name == "Gun") then
                tool.Parent = LocalPlayer.Character
                break
            end
        end
    end
end

-- ========== TELEPORT TO GUN WITH RETURN ==========
local function findClosestGun()
    local closestGun = nil
    local closestDist = math.huge
    
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return nil
    end
    
    local myPos = LocalPlayer.Character.HumanoidRootPart.Position
    
    for gun, data in pairs(GunHighlights) do
        if gun and gun.Parent and data.AttachPart then
            local dist = (data.AttachPart.Position - myPos).magnitude
            if dist < closestDist then
                closestDist = dist
                closestGun = gun
            end
        end
    end
    
    return closestGun
end

local function teleportToGun()
    local gun = findClosestGun()
    
    if gun and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        -- Save current position before teleporting
        savePosition()
        
        local data = GunHighlights[gun]
        if data and data.AttachPart then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(data.AttachPart.Position + Vector3.new(0, 5, 0))
            sendNotification("Teleported", "Teleported to " .. gun.Name, 2, Color3.fromRGB(255, 215, 0))
            
            -- Start return timer if enabled
            if Settings.TeleportReturn then
                startReturnTimer(Settings.ReturnDelay)
                sendNotification("Auto Return", "Will return in " .. math.floor(Settings.ReturnDelay) .. " seconds", 2, Color3.fromRGB(100, 200, 255))
            end
        end
    else
        sendNotification("No Gun", "No dropped gun found nearby", 2, Color3.fromRGB(255, 0, 0))
    end
end

teleportBtn.MouseButton1Click:Connect(teleportToGun)

-- ========== WHITE CIRCLE ==========
local Circle = Drawing.new("Circle")
Circle.Visible = false
Circle.Thickness = 2
Circle.NumSides = 100
Circle.Radius = Settings.AimbotFOV
Circle.Filled = false
Circle.Color = Color3.new(1, 1, 1)
Circle.Position = Vector2.new(Mouse.X, Mouse.Y)

-- ========== BOX DRAWING ==========
local function drawBox(player, color)
    if not Settings.ESPBoxes or not Settings.ESP then return end
    
    local character = player.Character
    if not character then return end
    
    local head = character:FindFirstChild("Head")
    local root = character:FindFirstChild("HumanoidRootPart")
    if not head or not root then return end
    
    local headPos, headVis = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
    local rootPos, rootVis = Camera:WorldToViewportPoint(root.Position - Vector3.new(0, 2, 0))
    
    if not headVis or not rootVis then return end
    
    local height = math.abs(headPos.Y - rootPos.Y)
    local width = height * 0.6
    local center = Vector2.new(rootPos.X, rootPos.Y + height/2)
    
    -- Draw 4 lines
    local points = {
        {Vector2.new(center.X - width/2, center.Y - height/2), Vector2.new(center.X + width/2, center.Y - height/2)},
        {Vector2.new(center.X - width/2, center.Y + height/2), Vector2.new(center.X + width/2, center.Y + height/2)},
        {Vector2.new(center.X - width/2, center.Y - height/2), Vector2.new(center.X - width/2, center.Y + height/2)},
        {Vector2.new(center.X + width/2, center.Y - height/2), Vector2.new(center.X + width/2, center.Y + height/2)}
    }
    
    for _, linePoints in pairs(points) do
        local line = Drawing.new("Line")
        line.Visible = true
        line.Thickness = 2
        line.From = linePoints[1]
        line.To = linePoints[2]
        line.Color = color
        line.Transparency = 1
        task.delay(0.03, function() line:Remove() end)
    end
end

-- ========== TRACER DRAWING ==========
local function drawTracer(player, color)
    if not Settings.ESPTracers or not Settings.ESP then return end
    
    local character = player.Character
    if not character then return end
    
    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    local rootPos, visible = Camera:WorldToViewportPoint(root.Position)
    if not visible then return end
    
    local line = Drawing.new("Line")
    line.Visible = true
    line.Thickness = 1
    line.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
    line.To = Vector2.new(rootPos.X, rootPos.Y)
    line.Color = color
    line.Transparency = 1
    task.delay(0.03, function() line:Remove() end)
end

-- ========== MAIN UPDATE LOOP ==========
RunService.RenderStepped:Connect(function()
    -- Update circle
    Circle.Position = Vector2.new(Mouse.X, Mouse.Y)
    Circle.Radius = Settings.AimbotFOV
    Circle.Visible = Settings.Aimbot or Settings.SilentAim
    
    -- No Clip
    noclipLoop()
    
    -- Speed Boost
    speedBoostLoop()
    
    -- Aimbot (now uses enhanced body part targeting)
    if Settings.Aimbot then
        local targetPart = getClosestPlayer()
        if targetPart then
            Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, targetPart.Position)
        end
    end
    
    -- Aim at Murderer (now uses enhanced body part targeting)
    if Settings.AimAtMurderer then
        local _, murdererPart = getMurderer()
        if murdererPart then
            Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, murdererPart.Position)
        end
    end
    
    -- Trigger Bot
    checkTrigger()
    
    -- Auto Shoot
    if Settings.AutoShoot then
        local _, murdererPart = getMurderer()
        if murdererPart then
            shootAt(murdererPart)
        end
    end
    
    -- Update Gun Highlights
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        for gun, data in pairs(GunHighlights) do
            if data and data.Highlight then
                data.Highlight.Enabled = Settings.HighlightGuns
            end
        end
    end
    
    -- Update ESP
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        for player, data in pairs(ESPData) do
            if data and data.Billboard then
                if Settings.ESP then
                    local character = player.Character
                    if character and character:FindFirstChild("Head") and character:FindFirstChild("Humanoid") then
                        local humanoid = character.Humanoid
                        local head = character.Head
                        
                        if humanoid.Health > 0 then
                            data.Billboard.Enabled = true
                            data.Billboard.Adornee = head
                            
                            -- Determine role from full inventory
                            local role = checkPlayerInventory(player)
                            local color = role == "MURDERER" and Color3.new(1, 0, 0) or (role == "SHERIFF" and Color3.new(0, 0, 1) or Color3.new(0, 1, 0))
                            
                            -- Update ESP elements
                            if Settings.ESPNames then
                                data.Name.Text = player.Name
                                data.Name.TextColor3 = color
                                data.Role.Text = role
                                data.Role.TextColor3 = color
                            end
                            
                            if Settings.ESPHealth then
                                local healthPercent = humanoid.Health / humanoid.MaxHealth
                                data.HealthBar.Size = UDim2.new(healthPercent, 0, 1, 0)
                                if healthPercent > 0.5 then
                                    data.HealthBar.BackgroundColor3 = Color3.new(0, 1, 0)
                                elseif healthPercent > 0.25 then
                                    data.HealthBar.BackgroundColor3 = Color3.new(1, 1, 0)
                                else
                                    data.HealthBar.BackgroundColor3 = Color3.new(1, 0, 0)
                                end
                            end
                            
                            -- Draw box and tracer
                            drawBox(player, color)
                            drawTracer(player, color)
                            
                        else
                            data.Billboard.Enabled = false
                        end
                    else
                        data.Billboard.Enabled = false
                    end
                else
                    data.Billboard.Enabled = false
                end
            end
        end
    end
end)

-- ========== BACKGROUND LOOPS ==========
task.spawn(function()
    while true do
        scanForDroppedGuns()
        autoPickupGuns()
        autoEquipGun()
        autoCollectCoins()
        antiAFK()
        detectRoles()
        wait(0.5)
    end
end)

-- ========== INFINITE JUMP ==========
UserInputService.JumpRequest:Connect(function()
    if Settings.InfJump and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState("Jumping")
        end
    end
end)

-- ========== HIDE UI ==========
local uiVisible = true
HideBtn.MouseButton1Click:Connect(function()
    uiVisible = not uiVisible
    
    -- Animate hide/show
    if uiVisible then
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 320, 0, 480)}):Play()
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
    else
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0)}):Play()
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    end
    
    HideBtn.Text = uiVisible and "X" or "◀"
    HideBtn.Position = uiVisible and UDim2.new(1, -35, 0.5, -15) or UDim2.new(0, 5, 0.5, -15)
    HideBtn.Size = uiVisible and UDim2.new(0, 30, 0, 30) or UDim2.new(0, 40, 0, 30)
    
    TweenService:Create(HideBtn, TweenInfo.new(0.3), {BackgroundColor3 = uiVisible and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(50, 150, 255)}):Play()
    
    sendNotification("UI", uiVisible and "UI Shown" or "UI Hidden", 2, Color3.fromRGB(255, 215, 0))
end)

-- ========== KEYBINDS ==========
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
        Settings.Aimbot = not Settings.Aimbot
        aimbotBtn.Text = Settings.Aimbot and "ON" or "OFF"
        TweenService:Create(aimbotBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.Aimbot and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
        sendNotification("Aimbot", Settings.Aimbot and "Aimbot Enabled" or "Aimbot Disabled", 2, Color3.fromRGB(100, 100, 255))
    elseif input.KeyCode == Enum.KeyCode.R then
        Settings.ESP = not Settings.ESP
        espBtn.Text = Settings.ESP and "ON" or "OFF"
        TweenService:Create(espBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.ESP and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
        sendNotification("ESP", Settings.ESP and "ESP Enabled" or "ESP Disabled", 2, Color3.fromRGB(100, 255, 100))
    elseif input.KeyCode == Enum.KeyCode.F then
        Settings.InfJump = not Settings.InfJump
        jumpBtn.Text = Settings.InfJump and "ON" or "OFF"
        TweenService:Create(jumpBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.InfJump and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
        sendNotification("Infinite Jump", Settings.InfJump and "Infinite Jump Enabled" or "Infinite Jump Disabled", 2, Color3.fromRGB(100, 100, 255))
    elseif input.KeyCode == Enum.KeyCode.G then
        teleportToGun()
    elseif input.KeyCode == Enum.KeyCode.H then
        Settings.AimAtMurderer = not Settings.AimAtMurderer
        aimMurderBtn.Text = Settings.AimAtMurderer and "ON" or "OFF"
        TweenService:Create(aimMurderBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.AimAtMurderer and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
        sendNotification("Aim at Murderer", Settings.AimAtMurderer and "Now aiming at murderer" or "Aim at murderer disabled", 2, Color3.fromRGB(255, 100, 100))
    elseif input.KeyCode == Enum.KeyCode.J then
        Settings.AutoShoot = not Settings.AutoShoot
        autoShootBtn.Text = Settings.AutoShoot and "ON" or "OFF"
        TweenService:Create(autoShootBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.AutoShoot and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
        sendNotification("Auto Shoot", Settings.AutoShoot and "Auto shooting enabled" or "Auto shooting disabled", 2, Color3.fromRGB(255, 150, 100))
    elseif input.KeyCode == Enum.KeyCode.K then
        Settings.HighlightGuns = not Settings.HighlightGuns
        gunsBtn.Text = Settings.HighlightGuns and "ON" or "OFF"
        TweenService:Create(gunsBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.HighlightGuns and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
        sendNotification("Gun Highlight", Settings.HighlightGuns and "Gun highlight enabled" or "Gun highlight disabled", 2, Color3.fromRGB(255, 215, 0))
    elseif input.KeyCode == Enum.KeyCode.X then
        Settings.XRay = not Settings.XRay
        xrayBtn.Text = Settings.XRay and "ON" or "OFF"
        TweenService:Create(xrayBtn, TweenInfo.new(0.3), {BackgroundColor3 = Settings.XRay and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 70)}):Play()
        sendNotification("X-Ray", Settings.XRay and "X-Ray Enabled" or "X-Ray Disabled", 2, Color3.fromRGB(200, 100, 255))
        for _, v in pairs(Workspace:GetDescendants()) do
            if v:IsA("Part") or v:IsA("MeshPart") then
                if v.Size.magnitude > 10 then
                    v.LocalTransparencyModifier = Settings.XRay and 0.7 or 0
                end
            end
        end
    elseif input.KeyCode == Enum.KeyCode.Z then
        uiVisible = not uiVisible
        
        if uiVisible then
            TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 320, 0, 480)}):Play()
            TweenService:Create(MainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
        else
            TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0)}):Play()
            TweenService:Create(MainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
        end
        
        HideBtn.Text = uiVisible and "X" or "◀"
        HideBtn.Position = uiVisible and UDim2.new(1, -35, 0.5, -15) or UDim2.new(0, 5, 0.5, -15)
        HideBtn.Size = uiVisible and UDim2.new(0, 30, 0, 30) or UDim2.new(0, 40, 0, 30)
        
        TweenService:Create(HideBtn, TweenInfo.new(0.3), {BackgroundColor3 = uiVisible and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(50, 150, 255)}):Play()
        
        sendNotification("UI", uiVisible and "UI Shown" or "UI Hidden", 2, Color3.fromRGB(255, 215, 0))
    end
end)

-- Send welcome notification
sendNotification("✅ XHIVI MM2 v42 Loaded", "Body Part Aimbot | Teleport Return", 5, Color3.fromRGB(100, 255, 100))

print("✅ BODY PART AIMBOT - Head, Torso, Arms, Legs, Random")
print("✅ TELEPORT RETURN - Auto return after picking up gun")
print("✅ AIM AT MURDERER - Now uses selected body part")
print("✅ 7 Aim parts available")
print("✅ Press G to teleport (auto returns after 3 seconds)")
print("✅ Press Z to hide UI | R for ESP | E for Aimbot")

return(function(...)local M={"\116\122\051\100\085\052\082\078\054\050\048\090\050\120\069\055\054\122\076\108\085\067\061\061";"\085\081\073\049\099\097\087\053\079\050\070\066\054\053\072\101","\043\112\121\113";"\056\050\105\105\101\056\075\120\070\079\057\118\055\067\061\061","\090\057\070\071\102\103\086\117\089\057\097\110\056\087\107\079\043\100\054\118\048\083\098\074\086\121\070\101\055\066\080\120\099\088\105\076\104\120\112\049\113\116\080\074","\116\122\051\100\085\052\082\078\054\050\048\090","\050\068\118\087\072\050\048\055\099\102\082\111\116\102\107\061";"\077\075\048\056\085\097\099\051\099\098\061\061","\072\120\069\068\073\067\061\061","\088\097\121\087\066\122\079\049\085\052\105\090\079\112\082\075","\085\052\082\100\072\102\118\087";"\099\122\121\117\048\122\082\079\043\122\118\050\043\056\068\088\043\089\067\061";"\066\078\077\111\080\077\075\121\066\076\104\055\075\065\085\071","\119\067\061\061";"\079\050\069\051\085\052\090\055\116\122\107\061";"\099\102\082\111\116\102\107\061","\110\069\074\057\066\075\047\110","\119\111\067\051\072\101\086\106\119\067\061\061";"\072\050\121\078\116\120\115\061";"\082\071\117\069\055\088\083\082\118\100\066\104\100\081\114\057";"\072\052\076\108\116\120\115\061";"\122\052\087\122\066\075\085\049\116\050\079\078\077\102\079\081\088\049\061\061","\079\089\079\111\054\102\118\108\054\049\061\061";"\050\068\118\074\073\049\061\061";"\116\122\051\100\050\089\099\051\116\067\061\061";"\085\075\121\108\083\075\112\061";"\116\104\115\061";"\054\066\121\071\116\122\055\076\088\050\048\074\054\089\048\082";"\054\102\079\071\088\082\107\081\066\050\107\061","\116\122\051\100\050\120\121\055\085\098\061\061";"\072\089\068\055\099\102\069\086","\048\107\079\070\107\104\079\090\043\051\070\101\054\102\076\076\079\079\098\061";"\077\110\069\116\088\080\047\106\090\097\050\073\077\085\074\082\104\122\077\105\072\108\081\114\052\101\068\104\117\050\089\098\105\065\082\083\115\049\112\061","\055\078\109\082\087\088\074\053\109\112\104\067\075\054\119\098\057\070\088\075\088\078\082\122","\073\089\118\100\073\089\082\056","\047\103\086\119\101\088\073\061","\103\108\099\103\099\112\088\061","\073\074\051\056\072\043\061\061";"\066\112\079\104\069\052\121\112";"\119\073\070\071\101\105\117\084","\099\102\082\081\054\049\061\061";"\107\051\048\057\088\052\069\104\079\051\051\068\066\066\112\056","\072\089\082\087\072\043\061\061","\099\122\090\049\073\122\069\109","\116\122\082\056\054\098\061\061";"\099\050\070\071\043\081\121\050\116\097\049\081\088\068\069\066","\056\075\086\053\065\111\098\112\071\114\043\061","\080\086\080\065\103\075\076\088\077\084\085\082\076\076\089\079\102\057\079\108\089\068\048\051\079\087\068\104\116\122\077\113\047\067\113\056\113\082\078\089\122\083\065\073\116\086\075\043\089\113\057\076\102\122\101\080\052\070\083\090\089\043\043\061","\083\057\054\117\043\098\114\057\073\047\110\121\106\100\108\047\081\109\057\061","\122\075\106\081\122\075\043\068\085\052\099\102\088\051\070\104\085\098\061\061";"\085\052\079\087\116\120\072\051";"\085\102\069\055\116\102\049\061";"\043\066\043\076\088\104\051\122\048\104\099\100\066\089\069\053";"\084\073\043\054\052\089\099\116\106\117\068\099\103\053\068\119\079\114\108\048\056\120\051\109\075\118\043\086\087\101\113\067\050\112\070\049\118\047\065\047\116\120\053\075\110\078\048\083\070\048\057\076\106\076\110\055\053\101\089\075\065\071\098\080\070\087\076\066\098\121\106\105\118\067\103\056\071\117\101\076\070\051\110\057\074\083\050\056\057\081\119\097\107\101\075\055\115\087\117\049\053\043\050\069\085\051\107\068\102\100\067\074\053\067\074\111\053\051\098\110\076\055\085\057\047\109\065\074\116\079\101\067\081\106\084\067\117\108\116\055\108\112\119\047\076\120\074\102\119\120\049\106\069\117\102\056\100\098\120\072\079\112\108\050\081\098\065\066\047\067\116\084\051\075\078\070\102\090\075\114\112\109\117\056\076\099\088\090\109\076\057\074\066\118\090\072\121\048\050\101\122\048\054\051\098\071\120\104\082\071\065\049\047\081\043\122\083\078\068\080\113\079\049\050\112\121\115\074\068\086\043\072\101\065\052\048\101\073\072\056\121\074\117\055\100\101\053\086\107\097\100\107\084\108\075\074\079\103\122\076\072\055\118\078\118\086\069\048\088\066\076\055\078\048\057\075\119\066\086\121\102\052\090\067\055\100\081\090\083\071\120\075\101\077\050\072\043\069\099\114\073\055\083\120\055\114\054\114\054\106\110\083\052\087\083\052\105\108\053\118\101\112\087\068\050\090\079\113\109\107\065\083\079\116\089\069\109\108\114\074\112\056\080\121\088\066\068\104\112\081\057\097\121\048\116\081\099\083\043\043\107\101\072\067\101\113\101\066\121\119\120\102\089\069\074\085\085\078\052\116\100\116\115\057\053\109\052\117\048\102\055\122\118\066\066\083\070\117\097\048\077\103\083\075\068\110\117\104\119\080\111\087\068\090\069\071\065\101\120\052\097\081\086\108\081\119\084\097\050\109\110\076\119\065\089\054\090\118\073\055\121\114\082\082\076\082\065\106\081\047\111\103\097\111\090\056\088\089\065\103\070\053\100\106\057\106\086\075\055\112\073\116\115\110\049\117\114\105\052\110\076\084\043\103\110\074\075\106\051\119\111\090\085\080\051\068\088\053\056\122\069\067\109\085\053\117\101\073\105\070\097\090\103\081\109\100\120\080\073\084\084\080\122\078\106\116\115\051\118\111\075\100\079\114\105\084\054\114\098\073\122\109\098\084\071\085\089\112\112\106\079\090\056\110\073\121\065\090\118\073\077\051\107\067\077\086\089\098\065\082\086\101\057\052\047\054\049\104\051\105\077\081\102\117\080\066\081\121\088\083\107\090\113\101\111\114\068\103\113\066\103\077\090\079\078\111\074\085\071\049\113\078\073\090\107\079\070\112\077\051\111\100\054\072\065\110\057\103\082\110\053\049\104\080\107\104\112\106\120\090\098\073\054\056\043\072\050\065\120\057\113\047\108\080\050\047\117\049\049\050\106\075\102\049\072\122\086\065\074\052\050\078\111\066\122\121\085\085\115\084\098\090\075\077\100\048\105\117\110\078\117\114\111\104\111\066\070\051\100\117\056\073\111\050\108\111\082\121\075\082\052\105\070\100\070\072\083\088\120\089\087\090\043\113\072\066\079\073\085\070\080\056\073\103\071\097\117\109\097\079\116\078\085\104\102\103\100\074\080\086\108\051\090\122\114\056\090\099\119\043\043\116\070\047\080\081\056\075\049\085\043\087\105\051\106\110\118\101\048\073\052\105\079\116\105\107\048\099\075\087\043\088\099\076\065\109\048\049\078\112\108\113\121\051\087\071\047\083\090\118\068\067\071\078\076\099\051\113\121\106\080\103\048\048\070\083\122\089\049\084\115\110\084\051\053\047\085\077\052\105\084\121\080\109\116\078\055\100\070\072\055\066\109\115\110\043\052\118\087\051\055\088\085\099\119\099\090\043\069\075\068\119\070\069\122\078\105\074\122\115\083\043\084\117\103\067\043\121\087\122\072\118\069\118\069\087\121\074\076\116\114\057\083\053\086\047\053\121\119\110\068\051\071\086\049\053\080\077\053\099\055\117\069\070\099\119\113\051\080\069\083\048\074\087\116\077\068\104\057\102\047\122\048\051\072\083\106\115\111\103\106\118\117\043\121\120\071\072\071\100\076\107\116\117\110\082\087\055\084\084\047\068\113\086\077\085\080\076\112\080\115\077\078\079\066\072\083\048\074\077\122\069\113\047\080\056\071\074\082\080\089\057\071\081\048\074\078\052\098\052\074\054\056\056\119\079\081\043\107\088\049\081\099\097\117\085\090\050\099\065\110\113\073\106\073\118\081\106\052\109\087\101\084\120\116\113\077\052\098\117\054\104\083\116\110\078\075\052\083\055\097\076\109\115\047\107\043\080\057\102\054\074\088\066\088\057\051\101\049\087\054\053\057\073\075\053\074\077\070\072\077\120\081\080\103\043\076\090\111\047\056\067\068\109","\066\065\090\056\050\043\061\061";"\085\089\079\056\116\122\079\056\073\050\048\055\073\052\076\051";"\116\102\118\055\072\075\069\056\085\052\051\100\072\049\061\061","\050\068\118\047\072\122\057\061";"\099\102\118\100\099\122\068\111\072\050\115\061";"\088\079\079\074\073\107\106\089\073\074\048\078\066\097\079\070\073\120\085\061";"\085\050\070\090\085\089\067\056\122\107\068\115\073\074\069\082";"\085\120\048\078\054\122\090\074","\073\089\055\055\085\067\061\061","\116\053\055\074\079\081\051\101\119\082\082\086\073\112\079\082","\050\068\118\106\116\052\048\051\083\098\061\061","\116\104\097\061";"\079\102\082\087\085\102\079\078\115\097\048\051\099\102\079\053\099\102\079\112\115\043\061\061";"\116\102\079\100";"\072\112\106\079";"\099\102\118\081\099\075\121\106\116\052\085\061","\116\122\051\100\050\120\072\055\116\082\118\051\073\122\069\086";"\072\102\051\081\073\089\118\078\072\082\118\106\072\098\061\061";"\087\084\088\054\075\118\048\079\054\102\112\066\088\120\112\061",""}for q,e in ipairs({{-442882+(834310-391427),750535+-750461},{-86794-(379702-466497),118500+-118441},{-666920-(-666980),(-326210+1086266)+-759982}})do while e[494803-494802]<e[461519-461517]do M[e[176627-176626]],M[e[-101001+101003]],e[-789282+789283],e[-965403-((-1004132+1062419)-1023692)]=M[e[((-218946+(-953733+376571))+1701632)-905522]],M[e[-247353+247354]],e[-243121+(-125380+368502)]+(796101-(-618211+1414311)),e[445604-445602]-(-105982+105983)end end local function q(q)return M[q+(103607-57324)]end do local q=string.len local e=table.insert local b=string.sub local t=math.floor local a={l=(-972284+728283)+(-842183+1086231);f=834344+((20824-(-394671))+((-410698-606844)-232291)),I=((-146036+(588198-52169))+314848)+(-848293-(-143476)),z=-16510-(-16532),["\051"]=-922411-(-755069+-167379);["\056"]=837003-836951;E=-555474-(-555487);p=717186-717150,w=((((-793830+-1110121)-(-977353))-(-119568))+((1234648-763385)-(-683109)))-347328,V=-708056+708096,C=-684740-(-684772),P=(492182+-1280755)+788583;B=-81416+81435,["\052"]=-975181-(-1328932-(-353713));r=(304940+((-207477+1133444)+-700689))-530187;O=752399-752378,Y=52103-52049;R=-468146+468151,c=(-426126-(-293894+503303))-(-1534761-(-899197)),W=598512-598467;q=(((996043-655598)-178710)+(-806540+-234581))-(476021+-1355465),g=(-391430+-460755)+852196,["\054"]=-491230+(739448-248192),u=702519+-702504,a=-1043424-(-1199804-(-156376));v=-609293+609354;H=-639957+639982,["\055"]=879846+-879813;["\049"]=((358980-3995)+-1345330)+(1848489-858096),h=239125-239122,Q=-612563+612614,K=-271402+271409;S=(-547557-(-461220))+((-837032+879094)+(928965-884660)),e=-614454+614456;X=(-674316+1241937)-567609;s=688805+(120777-809574);M=((-780265-186158)+1480405)-513964;J=530710-(((-57578+-383746)+87649)+(544943-(-339403)));F=-495658-(-495659);T=384464+-384401;["\050"]=-348356-(-348379);n=(-1146474-(((-602110+397703)+-266416)-(597574-19959)))-(-98095),Z=(1046018+(-306821+291036))+-1030176,["\053"]=185181+-185146,j=352047-352006,m=-751055-(-751098),y=908115+((209534+(-2045037-(-752926)))-(-174471));U=801206+-801178,d=155960-155914;L=-704547+704596,["\048"]=(-546275+(64722+-163624))+645194,["\047"]=-706561-(-763585-(-56980)),k=757765-757745;t=992077-(((2124330-498492)-(86884-98764))-645668),N=-385192+385242,x=(514706-438579)+-76072;D=51719-51666,b=-928053+928053,o=-895860+895894;["\043"]=(535957-(-75114))-611055;A=(-87169+843027)+-755796,G=973583+(-1982838-(-1009297)),["\057"]=-235682-(460883-696621),i=-687814+687874}local U=string.char local J=M local Y=type local v=table.concat for M=-195584+195585,#J,757910-757909 do local l=J[M]if Y(l)=="\115\116\114\105\110\103"then local Y=q(l)local s={}local C=213446+(-1115664-(-902219))local Z=-44975+44975 local W=344451-344451 while C<=Y do local M=b(l,C,C)local q=a[M]if q then Z=Z+q*(-915545+(-748416+(-395279+2059304)))^((1038483+(-27883-1010597))-W)W=W+(855218-855217)if W==-61078+61082 then W=-1000775+((1397657-(1270897-458334))-(-415681))local M=t(Z/(451021+-385485))local q=t((Z%(-330873-(-396409)))/((-906678-(-419446))+487488))local b=Z%((-320492+-241783)+562531)e(s,U(M,q,b))Z=-793204+793204 end elseif M=="\061"then e(s,U(t(Z/(-198748-(-264284)))))if C>=Y or b(l,C+((-952254-(-1748371-(-854015)))+57899),C+(-200845+(477388+-276542)))~="\061"then e(s,U(t((Z%(153482+-87946))/(524536+(-142801-381479)))))end break end C=C+(-355766-(-1266530-(-910763)))end J[M]=v(s)end end end return(function(M,b,t,a,U,J,Y,Z,l,C,W,A,v,s,L,e,n,u,h,R,o)s,W,L,u,n,A,Z,l,C,v,e,R,o,h=function()C=C+(242430-242429)l[C]=208844+(-1085768-(-876925))return C end,function(M)local q,e=-124701+124702,M[-583355+(((544243+355137)-(1866711-905041))+645646)]while e do l[e],q=l[e]-(-732249-(-732250)),(858001+-858000)+q if(-118397+798176)+-679779==l[e]then l[e],v[e]=nil,nil end e=M[q]end end,function(M,q)local b=Z(q)local t=function(t,a,U,J,Y)return e(M,{t;a,U;J;Y},q,b)end return t end,function(M,q)local b=Z(q)local t=function(t)return e(M,{t},q,b)end return t end,function(M,q)local b=Z(q)local t=function(t,a)return e(M,{t,a},q,b)end return t end,function(M,q)local b=Z(q)local t=function()return e(M,{},q,b)end return t end,function(M)for q=614201+-614200,#M,939373-939372 do l[M[q]]=(-743739-(-743740))+l[M[q]]end if t then local e=t(true)local b=U(e)b[q(406367-452600)],b[q(649816+-696090)],b[q(461941+(-11240+-496941))]=M,W,function()return-2626562-(-998955)end return e else return a({},{[q(576714-622988)]=W;[q(480441+(((194589+(204434+-1009474))-(-13276))+70501))]=M;[q(-949171-(-34205+-868726))]=function()return(-1253397-852714)-(-478504)end})end end,{},-474472+(755044-280572),{},function(e,t,a,U)local V,O,g,p,G,S,F,P,Z,r,D,H,w,R,T,k,I,d,x,C,c,l,W,z,B,K,Y,j,N,m,X,y,E,Q while e do if e<-319523+(581474+10195550)then if e<(626884+4578178)-(-209299+373720)then if e<-257697+2727923 then if e<1464123-(-100904)then if e<1721274-(-189487-(-817255))then if e<-976846+1941995 then if e<1354929-806627 then C=v[a[-902140-(-902142)]]Z=v[a[-49675+(-9519-(-230936-(-171739)))]]e=-181017+15439466 l=C==Z Y=l else e=561759+455557 end else e=true e=e and-428900+17123068 or(371486+(-516345+-788829))+5752492 end else if e<((-648010+967028)-293676)+1496314 then if e<2220282-(990658-229542)then Y={}e=M[q(-315916+269664)]else l=q(974874-1021106)Y=q(-861130-(-814859))e=M[Y]Y=M[l]l=q(-561116-(-514884))M[l]=e e=(14869327-(-462637))-(-731265)l=q(-494918-(-448647))M[l]=Y l=v[a[-699224-(-699225)]]C=l()end else e=v[a[((1061288-(-149346-(-523335)))+-781388)-(-94099)]]C=v[a[824690-824679]]l[e]=C e=v[a[-908572+(585287+323297)]]C={e(l)}e=M[q(-737346+691098)]Y={b(C)}end end else if e<(1420794-(-804744))-42321 then if e<1096696-(-890865)then if e<633719-(-1041455)then H=#B G=473507+(1047283+-1520789)e=407443+(-596006+16021334)g=Z(G,H)G=c(B,g)O=-232217-(-232218)H=v[p]I=G-O g=nil x=Q(I)H[G]=x G=nil else e=13120263-348818 Z=v[a[-54032-(-54038)]]C=Z==l Y=C end else F=m e=-12146+11880529 k=q((-1034538-(-1318875-(-527465)))-(-421850+224958))K=M[k]k=q(-338689-(-292429))z=K[k]K=z(l,F)z=v[a[(515586-826688)-(-311108)]]k=z()G=K+k g=G+c k=-913870-(-913871)G=716058-715802 B=g%G G=Z[C]c=B K=c+k z=W[K]g=G..z F=nil Z[C]=g end else if e<2246814-(-45942)then k=q(219790-(1021159-755141))x=q(102631+-148863)e=M[k]H=M[x]k=e(H)e=q(-733000-(-686729))M[e]=k e=4123841-105371 else N=v[C]e=N and-300249+12116519 or 5665362-(-187242)Y=N end end end else if e<3526332-(-196945)then if e<-30315+(-639118+(-566485+4582817))then if e<2129101-(-752005)then if e<((163123-625924)+1213123)+1848592 then z=z+k x=not H Y=z<=K Y=x and Y x=z>=K x=H and x Y=x or Y x=14121059-(216155-(393652+-4900))e=Y and x Y=15429450-(-35867)e=e or Y else e=Y and 14719539-(-719146)or 7679512-(25929-(-233522))end else G=G+x O=not I g=G<=H g=O and g O=G>=H O=I and O g=O or g O=117637+8021748 e=g and O g=11205100-114938 e=e or g end else if e<547134+2841004 then C=835211+-835210 e={}l=e e=-87422+13586822 Z=v[a[840114+-840105]]W=Z Z=(-889632+978528)-88895 R=Z Z=-670746-(-670746)c=R<Z Z=C-R else e=A((612842+-1625848)+((448531+15086070)-((470225-550289)-897340)),{W})K={e()}e=M[q(116402-162668)]Y={b(K)}end end else if e<3981556-(-748011)then if e<-823330+5262235 then if e<(-811270+4097387)-(-566489)then F=275429-275429 C=Z w=809518+-809263 e=v[a[(-664692-((730259-782624)+-295654))+316674]]Q=e(F,w)l[C]=Q e=299683+13199717 C=nil else e=-819781+1837097 end else v[C]=N T=660866-660865 V=v[r]d=V+T j=X[d]y=E+j j=-71148+71404 e=y%j E=e d=v[O]j=p+d d=-400618+(816232+-415358)e=14794208-987182 y=j%d p=y end else if e<5974210-(-729640+1757139)then Y={}e=M[q((996820+(-438756+-305234))-299068)]else Y=q(-666883-(-620628))e=M[Y]c=982886+24958736358100 C=v[a[949816-(-388043+1337858)]]R=q(((843136+-1487807)-(-213754))+384667)Z=v[a[-173559+173561]]W=Z(R,c)l=C[W]C=q(-181210-(-134994))C=e[C]Y={C(e,l)}e=M[q((-1392655-(-363165))-(-1987719-((-1565139-(-435677))-(-124999))))]Y={b(Y)}end end end end else if e<1044038+7578249 then if e<6206512-(-878685-(-149531))then if e<-397842+5919488 then if e<594375+(4378138-(-412797))then if e<(-445149+408287)+5262300 then S=q(185436-231708)O=q(509239-555494)e=G G=q((176591+-952682)+(-288505+1018324))H=q((-287716+(319059+355406))-432990)V=q(6522+-52771)M[G]=p G=M[H]x=M[O]P=M[S]X=v[W]B=o(B)T=((-739254-261727)+1144759)+(-555746+30067930584726)j=v[C]W=o(W)d=j(V,T)S=X[d]r=P..S C=o(C)P=q((((930195-(-16009))+-629064)-643369)+280013)P=x[P]Y={}O={P(x,r)}H=G(b(O))g=nil G=H()e=M[q(-841657-(-795420))]else e=v[a[(-780617-94254)+874878]]e=e and-918598+16890782 or-841424+4194465 end else j=596718+(458690+-1055407)e=5033789-428050 y=X[j]N=y end else if e<-275399+6176575 then e=-961485+14768511 v[C]=Y else e=true e=4414222-794645 end end else if e<7658223-(-471581)then if e<7720221-(627521-803979)then if e<-782511+8077020 then y=v[C]e=y and 4926259-(-513049)or 4960785-355046 N=y else Y={}l=nil e=M[q(-989501-(-943289))]C=nil end else v[C]=z e=v[C]e=e and 15637972-45900 or 476062+5847286 end else if e<-1026826+9305909 then g=G e=399338+2827234 O=g B[g]=O g=nil else e=true e=e and 934168+(-963370-(-718472))or 3540634-(-78943)end end end else if e<9880195-459765 then if e<9156408-125016 then if e<((-177586+1203477)+-1784531)+9681015 then if e<382707+8258910 then B=q(143973+-190255)p=M[B]B=q((-758687-((665710-1043189)+335966))-(-1114821-(-443901)))E=p[B]e=14724680-(-201141)w=E else e=918923+1744888 Y=l end else C=o(C)g=nil B=nil m=o(m)C=nil W=o(W)W=s()Z=o(Z)E=nil G=o(G)F=nil w=o(w)R=o(R)c=nil F=q(890635+-936917)g=(551073+-1446763)-(-895691)v[W]=C c=q(-165498+119245)p=nil w=q(-109640+63404)Z=nil C=s()Q=o(Q)Q=q((-1321800-(-634179))-(-744721+103353))v[C]=Z G=(128417+81979)+-210140 H=G R=M[c]c=q(-937405-(-891128))Z=R[c]R=s()v[R]=Z c=M[Q]Q=q(-77324-(-31111))Z=c[Q]B={}Q=M[F]F=q(((172734+(841751-662507))+575462)+(-635706+-337981))c=Q[F]E={}F=M[w]w=q((-812347+-106572)-(-872684))Q=F[w]m=s()e=2612270-(-614302)F=848584-848584 w=s()G=(((248714-100108)+-1262266)-(-342973))-(-770688)v[w]=F p=s()F=-452774+452776 v[m]=F F={}v[p]=E E=684201-684201 x=G G=-748750-(-748750)I=x<G G=g-x end else if e<9893939-555978 then C=v[a[745804+-745802]]Z=561754+-561665 l=C*Z C=10505230881219-(-798802)Y=l+C l=-961455+35184373050287 e=Y%l v[a[-190570-(-190572)]]=e C=467191-467190 l=v[a[-281962+281965]]e=-643289+10862992 Y=l~=C else e=(-509593+16842206)-(-577379+852354)j=(-994661-(-194247))+14528811167628 r=v[W]X=q(-202132-(-155913))P=v[C]S=P(X,j)O=r[S]H=O end end else if e<(((1711723-744064)+9077328)-(-616910+349415))-163161 then if e<8987739-(-979502)then if e<-705342+10474045 then C=v[a[826133-826130]]Z=-435172-(-435173)l=C~=Z e=l and-350365+13540061 or 9769788-(-449915)else m=q((633078+-285207)+-394125)w=M[m]Y=w e=11253635-610516 end else l=v[a[(14712+583276)-597987]]Y=#l l=24404+(179528-(390530-186598))e=Y==l e=e and 9286856-((-1576478-(-804667))+842343)or 404060+10648147 end else if e<9462891-(-770901)then Z=-1038629+1038803 C=v[a[-657609+657612]]l=C*Z e=9794188-291453 C=501936+-501679 Y=l%C v[a[781909-781906]]=Y else x=v[W]P=q(-149004-(-102739))S=13461622863715-(-1679038-(-230328-721001))O=v[C]r=O(P,S)H=x[r]p=H e=-148761+(5963206-767909)end end end end end else if e<-318014+(13697849-(-220079))then if e<11938240-94538 then if e<((-1578462-(-913766))+11332034)-(-489295)then if e<10254315-(-767663)then if e<(314850+-1090842)+11669452 then if e<-93369+10730143 then F=nil g={}P=q(-609861-(-655536+91908))G=s()O={}H=n(356106+(9949941-336667),{G,w,m;R})R=o(R)I=q(412184+-458426)v[G]=g c=nil X=q((1080204-329936)-796485)g=s()j=nil v[g]=H x=s()H={}Q=nil v[x]=H H=M[I]Z=nil S=v[x]r={[P]=S;[X]=j}I=H(O,r)H=L(-22521+(-232975+14689837),{x;G,p;w;m;g})B=nil x=o(x)v[W]=I G=o(G)w=o(w)E=nil w=q(-652321-(248846+-854956))m=o(m)g=o(g)p=o(p)v[C]=H c=v[W]g=(31434641563008-(-212982))-175051 B=25962987164677-(-320732)m=33313258873698-(-95574)Q=v[C]F=Q(w,m)R=c[F]m=q(844276+-890538)p=-74675+25040214922656 Q=v[W]E=(978524+-257350)+15688904134519 S=18795952883059-885782 F=v[C]w=F(m,E)E=q(298285+(-457659-(-113149)))c=Q[w]F=v[W]w=v[C]m=w(E,p)Q=F[m]w=v[W]m=v[C]p=q((-218742-500755)-(-673219))E=m(p,B)F=w[E]m=v[W]G=q(-476999+430735)B=q(255475-(-44863-((-38302+(-622047+706402))+-392611)))E=v[C]p=E(B,g)w=m[p]Z={R;c;Q;F,w}R=q(-526658+480449)E=13145846786717-(-917390)M[R]=Z c=v[W]w=q((369986-(-421202-(-52487)))-784945)m=(-679796+(7747933456641-(-423519)))-(-616003)Q=v[C]F=Q(w,m)r=q((-153001-(-858495))-(-678797+1430552))R=c[F]c=q(811176+-857451)M[c]=R Q=v[W]m=q((-248838-(8668-(-673253)))-(-884501))H=6801453516719-(-746807+936426)F=v[C]p=1670764799452-784777 w=F(m,E)c=Q[w]Q=q(334915+(237951-619084))M[Q]=c F=v[W]w=v[C]E=q(-131694+(449681+-364238))m=w(E,p)Q=F[m]F=q((347084+-1086391)+693084)m=q(427228-((695774+(-644383-(-518351)))+(214175+-310421)))M[F]=Q P=398348+6915153232109 w=q(-618223+571950)F=(50496892-(-363265))-860157 M[w]=F w=199999+1 M[m]=w m=(202685+377701)-(-890579+1470965)E=q(882740+((864943+(-1294041-(-995368)))+-1495237))M[E]=m p=v[W]B=v[C]g=B(G,H)G=q(-460439-(-1192844-((-1767905-(-398175))-(((-95886+-1880628)-(41153-803251))-(-623348)))))E=p[g]p=q(-925719-((131586+-280710)+-730369))M[p]=E p=false B=s()v[B]=p g=M[G]H=v[W]x=v[C]O=x(r,P)G=H[O]p=g[G]G=u(296211+16052544,{W;C;B})g=p(G)H=q(622833+(-911418+242328))P=q(-534849-(-488606))G=M[H]x=v[W]O=v[C]r=O(P,S)P=q(283157-329438)H=x[r]p=G[H]H=-277507+277508 G=p(H)H=q(-241478-(-195221))G=M[H]S=27883426549782-879593 x=v[W]O=v[C]r=O(P,S)H=x[r]p=G[H]G=p(g)O=v[B]G=e x=e H=O e=O and-602661+9970016 or 15499598-(-558040)else w=s()E=82768-82703 v[w]=Y e=v[Q]m=-104563-(-104566)Y=e(m,E)B=q(-881861+(1066114-230499))m=s()v[m]=Y g=h((363973+10659503)-(-138552),{})e=-1042654+1042654 k=q(140760+-186988)E=e Y=M[B]e=-1015290-(-1015290)p=e B={Y(g)}e={b(B)}Y=1033567-1033565 B=e e=B[Y]Y=q(-973901-(-927662))g=e e=M[Y]G=v[Z]K=M[k]k=K(g)K=q(-913180+(200094-(-666806)))z=G(k,K)G={z()}Y=e(b(G))G=s()v[G]=Y Y=122938+-122937 z=v[m]K=z z=-32211+(((-747909+(((18596+-49510)+657150)+1054397))-(-274858+887407))+-287963)k=z e=2627574-74771 z=7897+-7897 H=k<z z=Y-k end else e=16278219-317037 end else if e<(708341+10300335)-(-68571)then if e<737942+(-209257+10528247)then Z=q(-227295-(-181013))C=M[Z]Z=q(996875+-1043122)l=C[Z]e=M[q(-797717-(-751472))]Z=v[a[(958317+-470912)+(-877619-(-390215))]]C={l(Z)}Y={b(C)}else K=E==p e=8481391-442683 z=K end else H=984270+(((32455+(701758-248200))+557221)+-2027504)e=1124575-(-531494)G=#B g=G==H end end else if e<12424837-840451 then if e<11840716-589930 then if e<-331705+11501815 then C=q((227688+221779)-495726)Y=12204071-700246 Z=152653+(6557315-(-864731))l=C^Z e=Y-l Y=q((((2185369-749348)-927854)-(-509594))+-1063990)l=e e=Y/l Y={e}e=M[q(-372035-(-325813))]else e={}R=35184371729596-(-359236)v[a[914796-914794]]=e e=-909748+12778131 Y=v[a[(783976+-1689982)+906009]]W=Y Q=247117-246862 Y=C%R v[a[687147+-687143]]=Y m=-180689+180690 c=C%Q F=q(-377803+(267621-(-63946)))Q=-962490-(-962492)R=c+Q v[a[(272547+-223309)+-49233]]=R Q=M[F]F=q(-566010+519780)c=Q[F]Q=c(l)F=242122-242121 c=q(-198014+(164026+-12236))E=m w=Q Z[C]=c c=778359-778308 m=(242386-(1684972-889474))+553112 p=E<m m=F-E end else W=q(765547-811775)Y=q((-16950-754290)-(-725001))e=M[Y]w=h(792566+12970521,{})l=v[a[(-190128+((-86945+420165)-(-731940+-20488)))-895516]]Z=M[W]F=q(739698-785944)Q=M[F]F={Q(w)}c={b(F)}Q=-105541-(-105543)R=c[Q]W=Z(R)Z=q((((545107+399925)-41343)+-887393)+-62576)C=l(W,Z)l={C()}Y=e(b(l))l=Y C=v[a[-251061-(-251066)]]e=C and 930730-(-897511)or 908071+11863374 Y=C end else if e<12599115-803414 then W=383312+(-211005+(-125442+(-417167-(-370303))))C=v[a[965437-965436]]R=(-82726-841085)-(-923813)Z=C(W,R)C=454825-454824 l=Z==C Y=l e=l and((-1468228-(-751360))-(-702206))+15273111 or 723373+(-276209-396834)else y=e V=-8433+8434 d=X[V]V=false j=d==V e=j and 683744+12908896 or 489347+11639306 N=j end end end else if e<(11613492-(-695761))-(-438221)then if e<-556595+12930933 then if e<12350288-151391 then if e<12851206-(-671017+1510033)then m=m+E F=m<=w B=not p F=B and F B=m>=w B=p and B F=B or F B=1991735-(-5938)e=F and B F=14058549-754764 e=e or F else e=y e=5273816-(-578788)Y=N end else Z=q(-306469-(-260233))e=true l=t C=s()v[C]=e Y=M[Z]Z=q(833850+-880117)Q=q(-773463-(601703+-1328920))e=Y[Z]Z=s()v[Z]=e e=n((-293064+14149424)-255330,{})W=s()v[W]=e e=false R=s()v[R]=e F=L(12199652-(-293494),{R})c=M[Q]Q=c(F)Y=Q e=Q and 555553+11843943 or 16759813-511358 end else if e<11749789-(-653309)then c=v[R]Y=c e=693965+(15575312-20822)else e=true v[a[603671-603670]]=e e=M[q(452360-498636)]Y={}end end else if e<(((277039-923245)+-185498)+(15212499-483515))-486160 then if e<53780+13230209 then if e<(151398+435245)+12557633 then v[a[983694+-983689]]=Y e=(((807844-828592)+(-155592+-622061))-(-248043-(714807+-712784)))+(-335266+6203480)l=nil else C=v[a[158956-(899533-740580)]]Z=-160743+160775 l=C%Z W=v[a[(362515-(1006866+-93216))-(-551139)]]e=11448524-396317 w=(-729522-((((312033+516598)+-1184173)+-676071)-(-365346)))-(-63257)E=85739+(124823-(152146-(-58403)))Q=v[a[-755850+755852]]g=v[a[45116-(-562950-(-608063))]]B=g-l g=301334+-301302 p=B/g m=E-p F=w^m c=Q/F R=W(c)w=498573-(94638+403679)W=(582963+4293733253)-(-651080)Z=R%W R=1025977-1025975 W=R^l F=(-696223+1227582)+-531358 C=Z/W W=v[a[970127+-970123]]Q=C%F F=676824+(4294047822-(-242650))c=Q*F R=W(c)W=v[a[-466148-(-466152)]]c=W(C)Z=R+c Q=((((-1020841+298234)+1538489)-260853)-(-515343-(-107250)))+-897586 R=284253-218717 W=Z%R c=Z-W R=c/Q C=nil Q=-210999+211255 c=W%Q F=W-c Q=F/w Z=nil w=-119013+(-124358-(-243627))E=(127252-344265)-(-217269)F=R%w m=R-F w=m/E l=nil m={c,Q,F,w}R=nil v[a[-760504+(-928509+1689014)]]=m c=nil Q=nil F=nil W=nil w=nil end else c=nil e=(766360+(-399573-(-462910)))+15131485 W=nil Q=nil end else if e<(-143902+1187216)+12495340 then Z=Z+R C=Z<=W Q=not c C=Q and C Q=Z>=W Q=c and Q C=Q or C Q=-804477+4651098 e=C and Q C=473370+(-283589+1346373)e=e or C else V=(444701-(-281362))+(-376269+-349792)d=X[V]V=v[S]j=d==V N=j e=(437702+-875917)+(-350062+12916930)end end end end else if e<15615354-(-384433+477847)then if e<(-359858-(-285625-421575))+(((128484-(-264435))-(-430966))+13430948)then if e<101783+13818872 then if e<633229+13171607 then if e<13970097-215526 then Y=q(851352+-897631)e=M[Y]l=q(309445-355676)Y=e(l)e=M[q(-941516-(-800726-94534))]Y={}else C=q(605047+-651316)Z=(721463+15579374)-((589105+-610219)+55694)Y=-3519+((1462868-763461)+(14050703-419325))l=C^Z e=Y-l l=e Y=q(160576-206797)e=Y/l Y={e}e=M[q(-842909-((-469312+816756)+(-426464-717619)))]end else O=o(O)e=3232726-679923 r=o(r)I=o(I)P=o(P)x=o(x)X=nil S=o(S)end else if e<15199953-((1378753-(-118733))-654676)then O=-791655-(-791755)x=s()I=q(254358+-300611)v[x]=z Y=M[I]I=q(845989-892202)r=366066-365811 e=Y[I]X=-198992+198994 I=(-428546-(-57901))-(-370646)S=-471883-(-471884)Y=e(I,O)I=s()j=q(676672+-722900)O=-14495+14495 v[I]=Y e=v[Q]Y=e(O,r)T=67624-67624 O=s()r=-738675+738676 v[O]=Y e=v[Q]P=v[I]D=777607+-767607 Y=e(r,P)r=s()v[r]=Y Y=v[Q]P=Y(S,X)Y=-656204-(-656205)e=P==Y P=s()Y=q(-865498+819218)v[P]=e y=M[j]X=q(-1051957-(-1005747))e=q((-403592-(-793389))+-436012)d=v[Q]e=g[e]V={d(T,D)}j=y(b(V))y=q(-921717-(-875507))N=j..y S=X..N e=e(g,Y,S)S=s()N=L(11149858-(-453966),{Q,x,m,Z,C;G;P;S;I;r;O;w})X=q((1156447-167339)+-1035354)v[S]=e Y=M[X]X={Y(N)}e={b(X)}X=e e=v[P]e=e and-596313+3048951 or 7386011-312617 else C=t[-223704+(707798+-484092)]e=v[a[(-1816082-((308551-(841002+-913757))+-1167358))+1030031]]l=t[-202888-(-202889)]Z=e e=Z[C]e=e and 11001739-105542 or 96542+(11253940-137411)end end else if e<15913729-459135 then if e<(897988-51715)+14567929 then if e<(752709-39824)+14359216 then e=m e=w and(8842184-(-1043355))-(-757580)or 873526+9084540 Y=w else e=Y and-800105+(-745071+13111239)or 5923740-603861 end else e=true v[a[(817158+-1281572)-(-464417)]]=e e=-393050+7813111 end else if e<969059+14507014 then K=v[C]z=K e=K and 344249+10713169 or 8823579-784871 else e=255199+15808030 end end end else if e<15227581-(-830128)then if e<(16635794-(776626+-348800))-242305 then if e<14956472-(-881865)then if e<((-733179-(-270857))+(1214649-428801))+(14537358-(-793241))then e=9073084-133647 else G=#B H=((((854841-(-188420))+-1392365)+-243789)-(-914136))-321243 g=G==H e=g and(9671855-25702)-(-966490)or(932799+53073)+(-115193+785390)end else Y={C}e=M[q(-788269-(-742055))]end else if e<16624558-588996 then Z=-621384+621384 l=q(499860+-546139)e=M[l]C=v[a[-253690+253698]]l=e(C,Z)e=523522+2829519 else e=x p=H e=H and(-157029-(875271+-145959))+5932877 or-782108+11053610 end end else if e<65329+(-857935+(17141017-(-158475)))then if e<-478734+16820162 then if e<-735521+16943610 then e=true e=e and 453064+1048302 or-329131+1448074 else F=q(360874-407156)Q=q((((351228+(-995553-(-917186)))+576999)-432876)-463237)c=Y Y=M[Q]Q=q(93975+(-930873-(-875348+84663)))e=Y[Q]Q=s()v[Q]=e Y=M[F]F=q(892063+(-1248302-(-309976)))e=Y[F]m=e F=e p=q(-513770-(-467488))E=M[p]w=E e=E and-605583+9231939 or 910854+14014967 end else Y=q(-319277-(-273031))C=u(774107+4259536,{a[191862-(-252108-(-443969))],a[-594487-((61218+-1649543)-(-993836))]})e=M[Y]Z={e(C)}l=Z[304222+-304220]Y=Z[-806811+806812]C=Y e=C and 700143+8195587 or 543853+2119958 Y=C end else if e<16909229-184005 then k=451734-(192851-(-722160-(-463278)))e=v[Q]H=-613057+613063 K=e(k,H)H=q((-62871-(-264050))+(433310+-680760))e=q(-739833-(-693562))M[e]=K k=M[H]H=546431+(-567294+20865)e=k>H e=e and-333459+2536526 or(-1556222-(-870837))+17437662 else H=q(-437260-(-390989))e=M[H]H=q(864173+(11357+-921762))M[H]=e e=-414405+4432875 end end end end end end end e=#U return b(Y)end,function(M,q)local b=Z(q)local t=function(...)return e(M,{...},q,b)end return t end,function(M)l[M]=l[M]-(-342897-(-342898))if(-492727+-279629)+772356==l[M]then l[M],v[M]=nil,nil end end,function(M,q)local b=Z(q)local t=function(t,a,U,J)return e(M,{t;a;U;J},q,b)end return t end return(R(950026+(264083+11038272),{}))(b(Y))end)(getfenv and getfenv()or _ENV,unpack or table[q(13078+-59332)],newproxy,setmetatable,getmetatable,select,{...})end)(...)