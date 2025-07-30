-- XRNL HUB MOBILE - Estructura idéntica al ESP original

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Función para crear panel usando Rayfield-like
local function CreateUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "XRNL_GUI"
    ScreenGui.Parent = game:GetService("CoreGui")

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 350, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -175, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true

    local TabNames = {"GAME", "POPULAR", "UTILIDADES", "CRÉDITOS"}
    local tabs = {}
    local contents = {}

    local TabFrame = Instance.new("Frame", MainFrame)
    TabFrame.Size = UDim2.new(1, 0, 0, 30)
    TabFrame.BackgroundTransparency = 1

    for i, name in ipairs(TabNames) do
        local btn = Instance.new("TextButton", TabFrame)
        btn.Size = UDim2.new(0, 80, 1, 0)
        btn.Position = UDim2.new(0, (i - 1) * 90, 0, 0)
        btn.Text = name
        btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 14
        tabs[name] = btn

        contents[name] = Instance.new("ScrollingFrame", MainFrame)
        contents[name].Size = UDim2.new(1, -10, 1, -40)
        contents[name].Position = UDim2.new(0, 5, 0, 35)
        contents[name].BackgroundTransparency = 1
        contents[name].CanvasSize = UDim2.new(0, 0, 1, 0)
        contents[name].ScrollBarThickness = 6
        contents[name].Visible = false

        local layout = Instance.new("UIListLayout", contents[name])
        layout.Padding = UDim.new(0, 5)
    end

    local function ShowTab(name)
        for _, f in pairs(contents) do f.Visible = false end
        contents[name].Visible = true
    end

    for name, btn in pairs(tabs) do
        btn.MouseButton1Click:Connect(function()
            ShowTab(name)
        end)
    end

    ShowTab("GAME")

    -- Populate sections:

    -- GAME tab
    local gameTab = contents["GAME"]
    local games = {
        {"Teleport Tool", function()
            loadstring(game:HttpGet("https://pastebin.com/raw/PfA9L6h4"))()
        end},
        {"ESP Script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()
        end}
    }
    for _, item in ipairs(games) do
        local b = Instance.new("TextButton", gameTab)
        b.Size = UDim2.new(1, 0, 0, 30); b.Text = item[1]
        b.BackgroundColor3 = Color3.fromRGB(45,45,45); b.TextColor3 = Color3.new(1,1,1)
        b.Font = Enum.Font.Gotham; b.TextSize = 14
        b.MouseButton1Click:Connect(item[2])
    end

    -- POPULAR tab
    local popTab = contents["POPULAR"]
    local popular = {
        {"Blox Fruits", "https://raw.githubusercontent.com/Christianxddd/BLOXFRUITS-HEAD/main/main.lua"},
        {"Jailbreak", "https://raw.githubusercontent.com/Christianxddd/JAILBREAK/main.lua"},
        {"King Legacy", "https://raw.githubusercontent.com/Christianxddd/KL/main/main.lua"}
    }
    for _, v in ipairs(popular) do
        local b = Instance.new("TextButton", popTab)
        b.Size = UDim2.new(1,0,0,30); b.Text = v[1]
        b.BackgroundColor3 = Color3.fromRGB(45,45,45); b.TextColor3 = Color3.new(1,1,1)
        b.Font = Enum.Font.Gotham; b.TextSize = 14
        b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(v[2]))() end)
    end

    -- UTILIDADES tab
    local utilTab = contents["UTILIDADES"]
    local util = {
        {"Fly", "https://pastebin.com/raw/7H2k3S0v"},
        {"Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"}
    }
    for _, v in ipairs(util) do
        local b = Instance.new("TextButton", utilTab)
        b.Size = UDim2.new(1,0,0,30); b.Text = v[1]
        b.BackgroundColor3 = Color3.fromRGB(45,45,45); b.TextColor3 = Color3.new(1,1,1)
        b.Font = Enum.Font.Gotham; b.TextSize = 14
        b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(v[2]))() end)
    end

    -- CRÉDITOS tab
    local creditTab = contents["CRÉDITOS"]
    local credits = {
        {"TikTok: @Christianxddd", "https://www.tiktok.com/@Christianxddd"},
        {"Instagram: @Christianxddd", "https://www.instagram.com/Christianxddd"}
    }
    for _, v in ipairs(credits) do
        local b = Instance.new("TextButton", creditTab)
        b.Size = UDim2.new(1,0,0,30); b.Text = v[1]
        b.BackgroundColor3 = Color3.fromRGB(45,45,45); b.TextColor3 = Color3.new(1,1,1)
        b.Font = Enum.Font.Gotham; b.TextSize = 14
        b.MouseButton1Click:Connect(function() setclipboard(v[2]) end)
    end
end

-- Ícono flotante
local core = game:GetService("CoreGui")
local icon = Instance.new("ImageButton")
icon.Size = UDim2.new(0, 40, 0, 40)
icon.Position = UDim2.new(0, 10, 0.5, -20)
icon.CanvasSize = UDim2.new(0,0,0,0)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://15190936053"
icon.Parent = core
icon.ZIndex = 9999
icon.Draggable = true

local opened = false
icon.MouseButton1Click:Connect(function()
    if opened then
        for _,v in pairs(core:GetChildren()) do
            if v.Name == "XRNL_GUI" then v:Destroy() end
        end
        opened = false
    else
        CreateUI()
        opened = true
    end
end)
