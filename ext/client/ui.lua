-- by GreatApo
isHud = false
isKilled = false

-- Load UI
Events:Subscribe('Extension:Loaded', function()
    WebUI:Init()
end)

-- On player spawn, show night vision goggles hint
showHintSeconds = 5 -- show the hint for X seconds
Events:Subscribe('Player:Respawn', function(player)
    WebUI:ExecuteJS('window.showHintUI(' .. tostring(showHintSeconds) .. ');')
end)

-- Goggles battery update
-- battery = 100 -- battery 0 to 100
-- WebUI:ExecuteJS('window.batteryUpdate(' .. tostring(battery) .. ');')

-- Change Icons location
-- bottom = "5%"
-- right = "4%"
-- WebUI:ExecuteJS('window.iconsLocation("' .. bottom .. '","' .. right .. '");')

-- Update goggle icon
function goggleIcon(on)
	print('window.gogglesUpdate(' .. tostring(on) .. ');')
    WebUI:ExecuteJS('window.gogglesUpdate(' .. tostring(on) .. ');')
end

-- Enable/disable UI
Events:Subscribe('UI:DrawHud', function()
	-- get player
	local player = PlayerManager:GetLocalPlayer()
	if player == nil or player.soldier == nil then
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