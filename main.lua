local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Crear ícono flotante
local icon = Instance.new("ImageButton")
icon.Name = "OpenXRNL"
icon.Size = UDim2.new(0, 60, 0, 60)
icon.Position = UDim2.new(0, 20, 0.5, -30)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://7733960981" -- Ícono estilo XRNL
icon.Parent = game.CoreGui

-- Crear el panel principal (inicialmente oculto)
local main = Instance.new("ScreenGui", game.CoreGui)
main.Name = "XRNL_GUI"
main.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 340)
frame.Position = UDim2.new(0.5, -210, 0.5, -170)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0
frame.Visible = false
frame.Active = true
frame.Draggable = true
frame.Parent = main

local title = Instance.new("TextLabel", frame)
title.Text = "XRNL HUB"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 24

-- Sección de botones de pestañas
local tabFrame = Instance.new("Frame", frame)
tabFrame.Size = UDim2.new(1, 0, 0, 40)
tabFrame.Position = UDim2.new(0, 0, 0, 40)
tabFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local tabs = {"Games", "Utilidades", "Créditos"}
local tabButtons = {}
local sections = {}

for i, tabName in ipairs(tabs) do
	local button = Instance.new("TextButton", tabFrame)
	button.Size = UDim2.new(0, 140, 1, 0)
	button.Position = UDim2.new(0, (i-1)*140, 0, 0)
	button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	button.Text = tabName
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Font = Enum.Font.Gotham
	button.TextSize = 14
	tabButtons[tabName] = button

	local section = Instance.new("Frame", frame)
	section.Size = UDim2.new(1, -20, 1, -100)
	section.Position = UDim2.new(0, 10, 0, 90)
	section.Visible = false
	section.BackgroundTransparency = 1
	sections[tabName] = section

	button.MouseButton1Click:Connect(function()
		for _, s in pairs(sections) do
			s.Visible = false
		end
		section.Visible = true
	end)
end

-- Contenido para cada sección
do
	-- Games
	local label = Instance.new("TextLabel", sections["Games"])
	label.Size = UDim2.new(1, 0, 0, 30)
	label.Text = "Blox Fruits, Jailbreak, etc"
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.Gotham
	label.TextSize = 16
end

do
	-- Utilidades
	local fly = Instance.new("TextButton", sections["Utilidades"])
	fly.Size = UDim2.new(0, 120, 0, 30)
	fly.Position = UDim2.new(0, 0, 0, 0)
	fly.Text = "Fly"
	fly.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	fly.TextColor3 = Color3.new(1, 1, 1)
	fly.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/InfinityHubScripts/FlyScript/main/fly.lua"))()
	end)

	local esp = Instance.new("TextButton", sections["Utilidades"])
	esp.Size = UDim2.new(0, 120, 0, 30)
	esp.Position = UDim2.new(0, 0, 0, 40)
	esp.Text = "ESP"
	esp.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	esp.TextColor3 = Color3.new(1, 1, 1)
	esp.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/wa0101/Roblox-ESP/refs/heads/main/esp.lua"))()
	end)
end

do
	-- Créditos
	local credit1 = Instance.new("TextButton", sections["Créditos"])
	credit1.Size = UDim2.new(0, 200, 0, 30)
	credit1.Text = "TikTok: @christianxrnl"
	credit1.Position = UDim2.new(0, 0, 0, 0)
	credit1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	credit1.TextColor3 = Color3.new(1, 1, 1)
	credit1.MouseButton1Click:Connect(function()
		setclipboard("https://tiktok.com/@christianxrnl")
	end)

	local credit2 = Instance.new("TextButton", sections["Créditos"])
	credit2.Size = UDim2.new(0, 200, 0, 30)
	credit2.Text = "Instagram: @christianxrnl"
	credit2.Position = UDim2.new(0, 0, 0, 40)
	credit2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	credit2.TextColor3 = Color3.new(1, 1, 1)
	credit2.MouseButton1Click:Connect(function()
		setclipboard("https://instagram.com/christianxrnl")
	end)
end

-- Mostrar sección por defecto
sections["Games"].Visible = true

-- Alternar visibilidad del panel al tocar el ícono
local panelVisible = false
icon.MouseButton1Click:Connect(function()
	panelVisible = not panelVisible
	frame.Visible = panelVisible
end)
