-- XRNL HUB - PANEL ESTILO ESP PERSONALIZADO

local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- ÍCONO FLOTANTE (movible)
local icon = Instance.new("ImageButton")
icon.Name = "XRNL_Icon"
icon.Size = UDim2.new(0, 50, 0, 50)
icon.Position = UDim2.new(0, 20, 0, 300)
icon.Image = "rbxassetid://120008128829681" -- Tu icono personalizado
icon.BackgroundTransparency = 1
icon.Draggable = true
icon.Parent = game.CoreGui

-- PANEL PRINCIPAL
local panel = Instance.new("Frame")
panel.Name = "XRNL_Panel"
panel.Size = UDim2.new(0, 400, 0, 300)
panel.Position = UDim2.new(0.5, -200, 0.5, -150)
panel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
panel.BorderSizePixel = 0
panel.Visible = false
panel.Active = true
panel.Draggable = true
panel.Parent = game.CoreGui

-- TÍTULO
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "XRNL HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = panel

-- PESTAÑAS
local tabs = {"GAME", "POPULAR", "UTILIDADES", "CRÉDITOS"}
local tabButtons = {}
local currentTab = nil

local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(1, 0, 0, 30)
tabFrame.Position = UDim2.new(0, 0, 0, 30)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = panel

for i, name in ipairs(tabs) do
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0, 100, 1, 0)
	button.Position = UDim2.new(0, (i - 1) * 100, 0, 0)
	button.Text = name
	button.Name = name
	button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.Gotham
	button.TextSize = 14
	button.Parent = tabFrame
	tabButtons[name] = button
end

-- ÁREA DE CONTENIDO
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -10, 1, -70)
content.Position = UDim2.new(0, 5, 0, 65)
content.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
content.BorderSizePixel = 0
content.ClipsDescendants = true
content.Parent = panel

-- FUNCIONES DE CAMBIO DE PESTAÑA
local function clearContent()
	for _, c in ipairs(content:GetChildren()) do
		if not c:IsA("UIListLayout") then
			c:Destroy()
		end
	end
end

local function showTab(tabName)
	currentTab = tabName
	clearContent()
	
	if tabName == "GAME" then
		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, 0, 0, 40)
		label.Text = "Bienvenido a XRNL HUB"
		label.BackgroundTransparency = 1
		label.TextColor3 = Color3.new(1, 1, 1)
		label.TextScaled = true
		label.Font = Enum.Font.GothamBold
		label.Parent = content
	
	elseif tabName == "POPULAR" then
		local scripts = {
			{"Blox Fruits", "https://raw.githubusercontent.com/Christianxddd/BLOXFRUITS-HEAD/main/main.lua"},
			{"Jailbreak", "https://raw.githubusercontent.com/Christianxddd/JAILBREAK/main/main.lua"},
			{"King Legacy", "https://raw.githubusercontent.com/Christianxddd/KL/main/main.lua"},
			{"Da Hood", "https://raw.githubusercontent.com/Christianxddd/DaHood/main.lua"}
		}
		for _, s in pairs(scripts) do
			local btn = Instance.new("TextButton")
			btn.Size = UDim2.new(1, 0, 0, 30)
			btn.Text = s[1]
			btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			btn.TextColor3 = Color3.new(1, 1, 1)
			btn.Font = Enum.Font.Gotham
			btn.TextSize = 14
			btn.MouseButton1Click:Connect(function()
				loadstring(game:HttpGet(s[2]))()
			end)
			btn.Parent = content
		end

	elseif tabName == "UTILIDADES" then
		local utils = {
			{"Fly", "https://raw.githubusercontent.com/InfinityHubScript/Fly/main/Fly.txt"},
			{"TP Tool", "https://pastebin.com/raw/PfA9L6h4"},
			{"Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"}
		}
		for _, u in pairs(utils) do
			local btn = Instance.new("TextButton")
			btn.Size = UDim2.new(1, 0, 0, 30)
			btn.Text = u[1]
			btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			btn.TextColor3 = Color3.new(1, 1, 1)
			btn.Font = Enum.Font.Gotham
			btn.TextSize = 14
			btn.MouseButton1Click:Connect(function()
				loadstring(game:HttpGet(u[2]))()
			end)
			btn.Parent = content
		end

	elseif tabName == "CRÉDITOS" then
		local links = {
			{"TikTok - @Christianxddd", "https://www.tiktok.com/@Christianxddd"},
			{"Instagram - @Christianxddd", "https://www.instagram.com/Christianxddd"}
		}
		for _, link in pairs(links) do
			local btn = Instance.new("TextButton")
			btn.Size = UDim2.new(1, 0, 0, 30)
			btn.Text = link[1]
			btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			btn.TextColor3 = Color3.new(1, 1, 1)
			btn.Font = Enum.Font.Gotham
			btn.TextSize = 14
			btn.MouseButton1Click:Connect(function()
				setclipboard(link[2])
			end)
			btn.Parent = content
		end
	end
end

-- BOTONES DE PESTAÑAS
for tabName, button in pairs(tabButtons) do
	button.MouseButton1Click:Connect(function()
		showTab(tabName)
	end)
end

-- MOSTRAR PANEL AL TOCAR ICONO
icon.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

-- INICIALIZA PESTAÑA
showTab("GAME")
