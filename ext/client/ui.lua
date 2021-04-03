-- by GreatApo
isHud = false
isKilled = false

-- Load UI
Events:Subscribe('Extension:Loaded', function()

	if useNightVisionGadget == true then 
    	WebUI:Init()
	end
	
end)

-- On player spawn, show night vision goggles hint
local showHintSeconds = 5 -- show the hint for X seconds
local localPlayer = nil
Events:Subscribe('Player:Respawn', function(player)
	localPlayer = PlayerManager:GetLocalPlayer()

	if(player == localPlayer) then
		WebUI:ExecuteJS('window.showHintUI(' .. tostring(showHintSeconds) .. ');')
	end
end)

-- Change Icons location
-- bottom = "5%"
-- right = "4%"
-- WebUI:ExecuteJS('window.iconsLocation("' .. bottom .. '","' .. right .. '");')

-- Update goggle icon
function uiGoggleIcon(on)
	if on then
		uiChangeGoggleIcon(1) -- On
	else
		uiChangeGoggleIcon(2) -- Off
	end
end

-- Disable goggles use
isDisabled = false
function uiDisableGoggleIcon(disable)
	if disable then
		uiChangeGoggleIcon(3) -- Disabled
		isDisabled = true
	elseif (isDisabled) then
		uiChangeGoggleIcon(2) -- Off
		isDisabled = false
	end
end

-- Update UI icon
function uiChangeGoggleIcon(state)
	-- State: 1 = On, 2 = Off, 3 = Disabled
	-- print('window.gogglesUpdate(' .. tostring(state) .. ');')
    WebUI:ExecuteJS('window.gogglesUpdate(' .. tostring(state) .. ');')
end

-- Set min/max battery
function uiBatteries(min, max)
	WebUI:ExecuteJS('window.setBatteries(' .. tostring(min) .. ', ' .. tostring(max) .. ');')
end

-- Goggles battery update
function uiBattery(battery)
	WebUI:ExecuteJS('window.batteryUpdate(' .. tostring(battery) .. ');')
end

-- Enable/disable UI
Events:Subscribe('UI:DrawHud', function()
	-- get player
	local lplayer = PlayerManager:GetLocalPlayer()
	if lplayer == nil or lplayer.soldier == nil then
		if isKilled then
			WebUI:ExecuteJS('window.hideUI();')
			return
		end
	else
		isKilled = false
	end

	if (isHud and true) then
		WebUI:ExecuteJS('window.showUI();')
	else
		WebUI:ExecuteJS('window.hideUI();')
	end
end)

Hooks:Install('UI:PushScreen', 999, function(hook, screen, graphPriority, parentGraph)
	local screen = UIGraphAsset(screen)

	-- only for debug
	-- print(screen.name)

	if screen.name == 'UI/Flow/Screen/IngameMenuMP' or screen.name == 'UI/Flow/Screen/SpawnScreenPC' then
		WebUI:ExecuteJS('window.hideUI();')
		isHud = false
	end

	if screen.name == 'UI/Flow/Screen/HudMPScreen' then
		WebUI:ExecuteJS('window.showUI();')
		isHud = true
	end
	
	if screen.name == 'UI/Flow/Screen/KillScreen' then
		isKilled = true
	end
end)