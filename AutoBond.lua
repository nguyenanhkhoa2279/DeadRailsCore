if getgenv().SkullHubDrBond then return end
getgenv().SkullHubDrBond = true

-- Main UI

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local blur = Instance.new("BlurEffect")
blur.Size = 20
blur.Parent = Lighting

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SkullHubUI"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.BackgroundTransparency = 1
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mainFrame.Parent = screenGui

local compactButton = Instance.new("TextButton")
compactButton.Size = UDim2.new(0, 60, 0, 60)
compactButton.Position = UDim2.new(0.5, -30, 0, -80)
compactButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
compactButton.Text = "▲"
compactButton.TextColor3 = Color3.fromRGB(255, 255, 255)
compactButton.Font = Enum.Font.FredokaOne
compactButton.TextSize = 24
compactButton.Visible = false
compactButton.Parent = mainFrame

local compactCorner = Instance.new("UICorner")
compactCorner.CornerRadius = UDim.new(1, 0)
compactCorner.Parent = compactButton

local compactStroke = Instance.new("UIStroke")
compactStroke.Thickness = 2
compactStroke.Color = Color3.fromRGB(72, 138, 182)
compactStroke.Transparency = 0.3
compactStroke.Parent = compactButton

local uiContainer = Instance.new("Frame")
uiContainer.Size = UDim2.new(0, 450, 0, 240)
uiContainer.Position = UDim2.new(0.5, -225, 1, 100)
uiContainer.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
uiContainer.BackgroundTransparency = 0.1
uiContainer.Parent = mainFrame

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = uiContainer

local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255,255,255)
stroke.Transparency = 0.3
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = uiContainer

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(72, 138, 182)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 35))
})
gradient.Rotation = 45
gradient.Parent = uiContainer

local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -40, 0, 10)
minimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.Font = Enum.Font.FredokaOne
minimizeButton.TextSize = 20
minimizeButton.Parent = uiContainer

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 8)
minimizeCorner.Parent = minimizeButton

local icon = Instance.new("ImageLabel")
icon.Size = UDim2.new(0, 64, 0, 64)
icon.Position = UDim2.new(0.5, -32, 0, 16)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://74725622037659"
icon.Parent = uiContainer

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 40)
title.Position = UDim2.new(0, 10, 0, 90)
title.BackgroundTransparency = 1
title.Text = "Auto Bond is Running"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.FredokaOne
title.TextSize = 32
title.TextXAlignment = Enum.TextXAlignment.Center
title.Parent = uiContainer

local desc = Instance.new("TextLabel")
desc.Size = UDim2.new(1, -40, 0, 60)
desc.Position = UDim2.new(0, 20, 0, 140)
desc.BackgroundTransparency = 1
desc.Text = "Script By AnhKhoa2279"
desc.TextColor3 = Color3.fromRGB(180, 180, 180)
desc.Font = Enum.Font.FredokaOne
desc.TextSize = 16
desc.TextWrapped = true
desc.TextYAlignment = Enum.TextYAlignment.Top
desc.TextXAlignment = Enum.TextXAlignment.Center
desc.Parent = uiContainer

local isMinimized = false

local function toggleMinimize()
    isMinimized = not isMinimized
    
    if isMinimized then
        -- Minimize animation
        TweenService:Create(uiContainer, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, -225, 0, -300),
            Size = UDim2.new(0, 450, 0, 0)
        }):Play()
        
        TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            BackgroundTransparency = 1
        }):Play()
        
        task.wait(0.2)
        compactButton.Visible = true
        TweenService:Create(compactButton, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, -30, 0, 10)
        }):Play()
        
        blur.Size = 0
        minimizeButton.Text = "+"
    else
        -- Maximize animation
        TweenService:Create(compactButton, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, -30, 0, -80)
        }):Play()
        
        task.wait(0.2)
        compactButton.Visible = false
        
        TweenService:Create(uiContainer, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, -225, 0.5, -120),
            Size = UDim2.new(0, 450, 0, 240)
        }):Play()
        
        TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            BackgroundTransparency = 0.4
        }):Play()
        
        blur.Size = 20
        minimizeButton.Text = "-"
    end
end

minimizeButton.MouseButton1Click:Connect(toggleMinimize)
compactButton.MouseButton1Click:Connect(toggleMinimize)

task.wait(0.1)

TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0.4
}):Play()

TweenService:Create(uiContainer, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -225, 0.5, -120)
}):Play()

-- Notification UI
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local gui = CoreGui:FindFirstChild("ModernNotificationUI") or Instance.new("ScreenGui")
gui.Name = "ModernNotificationUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 999999
gui.Parent = CoreGui

local container = gui:FindFirstChild("NotificationContainer") or Instance.new("Frame")
container.Name = "NotificationContainer"
container.AnchorPoint = Vector2.new(1, 1)
container.Size = UDim2.new(0, 320, 1, -20)
container.Position = UDim2.new(1, -20, 1, -20)
container.BackgroundTransparency = 1
container.Parent = gui

if not container:FindFirstChild("Scale") then
	local scale = Instance.new("UIScale")
	scale.Name = "Scale"
	scale.Scale = 1
	scale.Parent = container
end

local layout = container:FindFirstChildOfClass("UIListLayout") or Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 10)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
layout.Parent = container

local function notify(titleText, messageText, duration)
	duration = duration or 5

	local notif = Instance.new("Frame")
	notif.Size = UDim2.new(1, 0, 0, 0)
	notif.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	notif.BackgroundTransparency = 1
	notif.LayoutOrder = -tick()
	notif.ClipsDescendants = true
	notif.Parent = container

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 12)
	corner.Parent = notif

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(80, 160, 200)
	stroke.Thickness = 1
	stroke.Transparency = 0.5
	stroke.Parent = notif

	local title = Instance.new("TextLabel")
	title.Size = UDim2.new(1, -40, 0, 22)
	title.Position = UDim2.new(0, 14, 0, 10)
	title.BackgroundTransparency = 1
	title.Text = titleText
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.Font = Enum.Font.FredokaOne
	title.TextSize = 18
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Parent = notif

	local message = Instance.new("TextLabel")
	message.Size = UDim2.new(1, -40, 0, 40)
	message.Position = UDim2.new(0, 14, 0, 32)
	message.BackgroundTransparency = 1
	message.Text = messageText
	message.TextColor3 = Color3.fromRGB(200, 200, 200)
	message.Font = Enum.Font.FredokaOne
	message.TextSize = 14
	message.TextWrapped = true
	message.TextXAlignment = Enum.TextXAlignment.Left
	message.TextYAlignment = Enum.TextYAlignment.Top
	message.Parent = notif

	local closeBtn = Instance.new("TextButton")
	closeBtn.Size = UDim2.new(0, 22, 0, 22)
	closeBtn.Position = UDim2.new(1, -30, 0, 10)
	closeBtn.Text = "✕"
	closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
	closeBtn.BackgroundTransparency = 1
	closeBtn.Font = Enum.Font.FredokaOne
	closeBtn.TextSize = 18
	closeBtn.ZIndex = 2
	closeBtn.Parent = notif

	local progressBar = Instance.new("Frame")
	progressBar.Size = UDim2.new(1, -16, 0, 4)
	progressBar.Position = UDim2.new(0, 8, 1, -8)
	progressBar.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
	progressBar.BackgroundTransparency = 0.7
	progressBar.ZIndex = 2
	progressBar.Parent = notif

	local progressCorner = Instance.new("UICorner")
	progressCorner.CornerRadius = UDim.new(0, 2)
	progressCorner.Parent = progressBar

	local progressFill = Instance.new("Frame")
	progressFill.Size = UDim2.new(1, 0, 1, 0)
	progressFill.BackgroundTransparency = 0
	progressFill.Parent = progressBar

	local progressGradient = Instance.new("UIGradient")
	progressGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 160, 200)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 100, 140))
	})
	progressGradient.Parent = progressFill

	local progressFillCorner = Instance.new("UICorner")
	progressFillCorner.CornerRadius = UDim.new(0, 2)
	progressFillCorner.Parent = progressFill

	TweenService:Create(notif, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
		Size = UDim2.new(1, 0, 0, 80),
		BackgroundTransparency = 0
	}):Play()

	TweenService:Create(progressFill, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
		Size = UDim2.new(0, 0, 1, 0)
	}):Play()

	local function close()
		local tween = TweenService:Create(notif, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1
		})
		tween:Play()
		tween.Completed:Wait()
		notif:Destroy()
	end

	closeBtn.MouseButton1Click:Connect(close)
	task.delay(duration, function()
		if notif and notif.Parent then close() end
	end)
end

notify("NazuX hub Auto Bond", 10)


local Notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/hungquan99/Interface/main/Notify.lua"))()
if game.PlaceId == 70876832253163 or game.PlaceId == 98018823628597 then
    Notif.New("[NazuX Hub] Auto Bond Loaded!", 5)

    -- Hiển thị GUI ngay khi khởi động
    toggleMinimize()

    -- Tự động tải và chạy Auto Bond script
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shade-vex/DeadRails/refs/heads/main/Viet-Nam-Number-One.txt"))()
    end)

    if not success then
        warn("[NazuX Hub] Auto Bond script failed to load:", err)
    end
end
