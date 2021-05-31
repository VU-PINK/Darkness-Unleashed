local UI = class('UI')
local Settings = require '__shared/settings'

-- by GreatApo
function UI:__Init()

	UI:RegisterVars()
	UI:RegisterEvents()

	if Settings.useNightVisionGadget == true then
		Tool:DebugPrint('Initializing NVG UI', 'nvg')
		WebUI:Init()
	end

end


function UI:RegisterVars()

	self.isHud = false
	self.isKilled = false
	self.showHintSeconds = 7 -- show the hint for X seconds
	self.localPlayer = nil

end


function UI:RegisterEvents()

	self.drawHudEvent = Events:Subscribe('UI:DrawHud', self, self.DrawHud)

end



-- On player spawn, show night vision goggles hint
function UI:PlayerRespawn(player, localPlayer)

	self.localPlayer = localPlayer

	if player == localPlayer then

		WebUI:ExecuteJS('window.showHintUI(' .. tostring(self.showHintSeconds) .. ');')

	end

end


-- Change Icons location
-- bottom = "5%"
-- right = "4%"
-- WebUI:ExecuteJS('window.iconsLocation("' .. bottom .. '","' .. right .. '");')

-- Update goggle icon
function UI:GoggleIcon(on)

	if on then

		UI:ChangeGoggleIcon(1) -- On

	else

		UI:ChangeGoggleIcon(2) -- Off

	end

end


-- Disable goggles use
function UI:DisableGoggleIcon(disable)

	if disable then

		UI:ChangeGoggleIcon(3) -- Disabled
		self.isDisabled = true

	elseif self.isDisabled then

		UI:ChangeGoggleIcon(2) -- Off
		self.isDisabled = false

	end

end


-- Update UI icon
function UI:ChangeGoggleIcon(state)

	-- State: 1 = On, 2 = Off, 3 = Disabled
	-- print('window.gogglesUpdate(' .. tostring(state) .. ');')
    WebUI:ExecuteJS('window.gogglesUpdate(' .. tostring(state) .. ');')

end


-- Set min/max battery
function UI:Batteries(min, max)

	WebUI:ExecuteJS('window.setBatteries(' .. tostring(min) .. ', ' .. tostring(max) .. ');')

end


-- Goggles battery update
function UI:Battery(battery)

	WebUI:ExecuteJS('window.batteryUpdate(' .. tostring(battery) .. ');')

end


-- Enable/disable UI
function UI:DrawHud()

	if self.localPlayer == nil or self.localPlayer.soldier == nil then

		if self.isKilled then

			WebUI:ExecuteJS('window.hideUI();')
			return

		end

	else

		self.isKilled = false

	end

	if self.isHud then

		WebUI:ExecuteJS('window.showUI();')

	else

		WebUI:ExecuteJS('window.hideUI();')

	end

end

Hooks:Install('UI:PushScreen', 999, function(hook, screen, graphPriority, parentGraph)
	local screen = UIGraphAsset(screen)

	-- only for debug
	-- print(screen.name)

	if screen.name == 'UI/Flow/Screen/IngameMenuMP' or screen.name == 'UI/Flow/Screen/SpawnScreenPC' then
		WebUI:ExecuteJS('window.hideUI();')
		UI.isHud = false
		Tool:DebugPrint('Hiding NVG HUD', 'nvg')
	end

	if screen.name == 'UI/Flow/Screen/HudMPScreen' then
		WebUI:ExecuteJS('window.showUI();')
		UI.isHud = true
		Tool:DebugPrint('Showing NVG HUD', 'nvg')
	end

	if screen.name == 'UI/Flow/Screen/KillScreen' then
		UI.isKilled = true
		Tool:DebugPrint('Player is dead', 'nvg')
	end
end)

return UI