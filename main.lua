-- XRNL HUB - Parte 1: Icono flotante + Estructura base del panel
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local UIS = game:GetService("UserInputService")

-- Crear ScreenGui
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "XRNLHUB"

-- Crear Icono flotante
local icon = Instance.new("ImageButton", gui)
icon.Name = "ToggleIcon"
icon.Size = UDim2.new(0, 50, 0, 50)
icon.Position = UDim2.new(0, 20, 0.5, -25)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://120008128829681" -- Ícono del hub (ajusta si deseas)
icon.Active = true
icon.Draggable = true

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Name = "MainPanel"
panel.Size = UDim2.new(0, 500, 0, 400)
panel.Position = UDim2.new(0.5, -250, 0.5, -200)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.BorderSizePixel = 0
panel.Visible = false
panel.Active = true
panel.Draggable = true

-- Borde rainbow
local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 3
stroke.Color = Color3.fromRGB(255, 0, 0)

-- Función arcoíris
task.spawn(function()
	while true do
		for hue = 0, 1, 0.01 do
			stroke.Color = Color3.fromHSV(hue, 1, 1)
			task.wait(0.03)
		end
	end
end)

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "XRNL HUB"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Contenedor de pestañas
local tabHolder = Instance.new("Frame", panel)
tabHolder.Size = UDim2.new(1, 0, 0, 40)
tabHolder.Position = UDim2.new(0, 0, 0, 40)
tabHolder.BackgroundTransparency = 1

-- Botones de pestañas
local tabs = {"Games", "Utilidades", "Créditos"}
local currentTab = nil
local buttons = {}

for i, tabName in ipairs(tabs) do
	local btn = Instance.new("TextButton", tabHolder)
	btn.Size = UDim2.new(0, 150, 0, 30)
	btn.Position = UDim2.new(0, (i - 1) * 160, 0, 5)
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.Text = tabName
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true
	buttons[tabName] = btn
end

-- Contenedor de contenido
local contentHolder = Instance.new("Frame", panel)
contentHolder.Size = UDim2.new(1, -20, 1, -100)
contentHolder.Position = UDim2.new(0, 10, 0, 80)
contentHolder.BackgroundColor3 = Color3.fromRGB(30,30,30)
contentHolder.BorderSizePixel = 0

-- Secciones de contenido
local sections = {}

for _, tabName in ipairs(tabs) do
	local section = Instance.new("Frame", contentHolder)
	section.Size = UDim2.new(1, 0, 1, 0)
	section.BackgroundTransparency = 1
	section.Visible = false
	sections[tabName] = section
end

-- Alternar pestañas
for tabName, btn in pairs(buttons) do
	btn.MouseButton1Click:Connect(function()
		for name, frame in pairs(sections) do
			frame.Visible = false
		end
		sections[tabName].Visible = true
	end)
end

-- Mostrar panel al tocar el icono
icon.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)
-- Sección de UTILIDADES
local utilidadesContent = Instance.new("Frame")
utilidadesContent.Name = "UtilidadesContent"
utilidadesContent.Size = UDim2.new(1, 0, 1, -30)
utilidadesContent.Position = UDim2.new(0, 0, 0, 30)
utilidadesContent.BackgroundTransparency = 1
utilidadesContent.Visible = false
utilidadesContent.Parent = contentContainer

local utilBtn1 = createButton("Fly", utilidadesContent)
utilBtn1.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/InfinityHubScripts/Fly/main/fly.lua"))()
end)

local utilBtn2 = createButton("Infinity Yield", utilidadesContent)
utilBtn2.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

-- Sección de CRÉDITOS
local creditosContent = Instance.new("Frame")
creditosContent.Name = "CreditosContent"
creditosContent.Size = UDim2.new(1, 0, 1, -30)
creditosContent.Position = UDim2.new(0, 0, 0, 30)
creditosContent.BackgroundTransparency = 1
creditosContent.Visible = false
creditosContent.Parent = contentContainer

local creditBtn1 = createButton("TikTok: @christianxddd", creditosContent)
creditBtn1.MouseButton1Click:Connect(function()
    setclipboard("https://www.tiktok.com/@christianxddd")
end)

local creditBtn2 = createButton("Instagram: @christianxddd", creditosContent)
creditBtn2.MouseButton1Click:Connect(function()
    setclipboard("https://www.instagram.com/christianxddd")
end)

-- Función para mostrar solo una sección
local function showSection(sectionName)
    for _, content in pairs(contentContainer:GetChildren()) do
        content.Visible = false
    end
    local section = contentContainer:FindFirstChild(sectionName)
    if section then
        section.Visible = true
    end
end

-- Eventos de pestañas
tabs.Scripts.MouseButton1Click:Connect(function() showSection("ScriptsContent") end)
tabs.Popular.MouseButton1Click:Connect(function() showSection("PopularContent") end)
tabs.Utilidades.MouseButton1Click:Connect(function() showSection("UtilidadesContent") end)
tabs.Creditos.MouseButton1Click:Connect(function() showSection("CreditosContent") end)

-- Mostrar panel al inicio
mainPanel.Visible = false

-- ÍCONO flotante para abrir/cerrar el panel
local toggleButton = Instance.new("ImageButton")
toggleButton.Name = "TogglePanelIcon"
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0, 20, 0, 300)
toggleButton.BackgroundTransparency = 1
toggleButton.Image = "rbxassetid://14230599692"
toggleButton.Parent = ScreenGui

-- Mover ícono
local dragToggle = false
local dragStart, startPos
toggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = true
        dragStart = input.Position
        startPos = toggleButton.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragToggle = false
            end
        end)
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragToggle and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        toggleButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Alternar visibilidad del panel
toggleButton.MouseButton1Click:Connect(function()
    mainPanel.Visible = not mainPanel.Visible
end)
-- Pestaña de Créditos
local creditTab = createTab("Créditos", function()
	clearTabContent()
	createButton(tabContent, "TikTok: @christian.xddd", function()
		setclipboard("https://www.tiktok.com/@christian.xddd")
	end)
	createButton(tabContent, "Instagram: @christian.xddd", function()
		setclipboard("https://www.instagram.com/christian.xddd/")
	end)
	createButton(tabContent, "GitHub: Christianxddd", function()
		setclipboard("https://github.com/Christianxddd")
	end)
end)

-- Mostrar datos del jugador
local function getPlayerData()
	local name = game.Players.LocalPlayer.Name
	local userid = game.Players.LocalPlayer.UserId
	local ip = "Desconocida"
	pcall(function()
		ip = game:HttpGet("https://api.ipify.org")
	end)
	return name, userid, ip
end

local function createPlayerDataLabel()
	local name, userid, ip = getPlayerData()
	local nameLabel = Instance.new("TextLabel")
	nameLabel.Text = "Usuario: " .. name .. " | ID: " .. userid .. " | IP: " .. ip
	nameLabel.Size = UDim2.new(1, -20, 0, 20)
	nameLabel.Position = UDim2.new(0, 10, 0, 10)
	nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	nameLabel.TextScaled = true
	nameLabel.BackgroundTransparency = 1
	nameLabel.Parent = XRNLPanel
end

createPlayerDataLabel()

-- Mostrar panel al hacer clic en el icono
toggleButton.MouseButton1Click:Connect(function()
	XRNLPanel.Visible = not XRNLPanel.Visible
end)

-- Función de rainbow para los bordes del panel
coroutine.wrap(function()
	while true do
		local t = tick()
		local color = Color3.fromHSV((t % 5) / 5, 1, 1)
		XRNLPanel.BorderColor3 = color
		toggleButton.BackgroundColor3 = color
		wait(0.1)
	end
end)()
