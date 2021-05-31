local NVG = class("NVG")
local Animation = require 'systems/animations'
local Tool = require '__shared/darknesstools/tools'

function NVG:__Init()

    NVG:RegisterVars()

    -- Set value on the UI
	UI:Batteries(self.batteryLifeMin, self.batteryLifeMax)

end


function NVG:RegisterVars()

    self.activated = false

    self.batteryLifeMax = 60
    self.batteryLifeMin = 10

    self.batteryEmptyTime = 0
    self.batteryLifeCooldown = 10

    self.batteryLifeCurrent = 60

end


function NVG:Activate()
    Tool:DebugPrint('NVG Activate called!', 'nvg')

    if self.batteryLifeCurrent >= self.batteryLifeMin then

        if self.activated == false and Animation.animationRunning == false then

            self.activated = true
            Animation:FadeIn('nightvision')
            WebUI:ExecuteJS('playSound("/sounds/Switch_ON.ogg", 1.0, false);')
            Tool:DebugPrint('NVG Activate ...', 'nvg')
            UI:GoggleIcon(true) -- Update UI battery icon

        else
			if(self.activated == true) then
				Tool:DebugPrint('NVG Already active | NVG:Activate()', 'nvg')
			else
				Tool:DebugPrint('Animation Running | NVG:Activate()', 'nvg')
			end

            return

        end

    else
        Tool:DebugPrint('Not enough battery to activate | ' .. tostring(self.batteryLifeCurrent) .. '/' .. tostring(self.batteryLifeMax), 'nvg')
        Tool:DebugPrint('Needs more than ' .. tostring(self.batteryLifeMin) .. ' to activate!')
    end

end


function NVG:Deactivate()
    Tool:DebugPrint('NVG Deactivate called!', 'nvg')

    if self.activated == true and Animation.animationRunning == false then

        self.activated = false
        Animation:FadeOut('nightvision')
        WebUI:ExecuteJS('playSound("/sounds/Switch_OFF.ogg", 1.0, false);')
        Tool:DebugPrint('Deactivate', 'nvg')
        UI:DisableGoggleIcon(true) -- Update UI battery icon

    else

		if(self.activated == false) then
			Tool:DebugPrint('NVG not active | NVG:Deactivate()', 'nvg')
		else
			Tool:DebugPrint('Animation Running | NVG:Deactivate()', 'nvg')
		end

        return

    end

end


function NVG:Depleting(elapsedTime)

    local localPlayer = PlayerManager:GetLocalPlayer()

    if localPlayer == nil then
        return
    end

    if localPlayer.inVehicle == true then

        if self.batteryLifeCurrent + 1 < self.batteryLifeMax then

            self.batteryLifeCurrent = self.batteryLifeCurrent + 1

        end

    else

		self.batteryLifeCurrent = self.batteryLifeCurrent - 1

    end

	UI:Battery(self.batteryLifeCurrent) -- Update UI battery

    Tool:DebugPrint("Battery Life: " .. self.batteryLifeCurrent, 'altering')

    if self.batteryLifeCurrent <= 0 then

        Tool:DebugPrint('Battery has depleted!', 'nvg')

        if self.activated == true and Animation.animationRunning == false then

            UI:DisableGoggleIcon(true) -- Update UI battery icon
            self.batteryEmptyTime = elapsedTime
            Tool:DebugPrint('Battery Depletion Animation Started', 'nvg')

        end

    end

end


function NVG:Recharging(elapsedTime)

    if self.batteryEmptyTime + self.batteryLifeCooldown > elapsedTime then
        return
	end

	-- Show Enabled/Disabled Goggles icon
	if self.batteryLifeCurrent >= self.batteryLifeMin then

		UI:DisableGoggleIcon(false) -- Update UI battery icon

	end

    if self.batteryLifeCurrent < self.batteryLifeMax then

        self.batteryLifeCurrent = self.batteryLifeCurrent + 1
		UI:Battery(self.batteryLifeCurrent) -- Update UI battery
        Tool:DebugPrint("Battery Charged To: " .. self.batteryLifeCurrent, 'altering')

    end

end


return NVG