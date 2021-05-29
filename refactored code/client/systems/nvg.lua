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

    if self.batteryLifeCurrent >= self.batteryLifeMin then

        if self.activated ~= true and Animation.animationRunning == false then

            self.activated = true 
            Animation:FadeIn('nightvision')
            WebUI:ExecuteJS('playSound("/sounds/Switch_ON.ogg", 1.0, false);')
            Tool:DebugPrint('NVG Activate ...', 'nvg')
            UI:GoggleIcon(true) -- Update UI battery icon

        else

            Tool:DebugPrint('Animation Running', 'nvg')
            return

        end

    end

end


function NVG:Deactivate()

        if self.activated == true and Animation.animationRunning == false then

            self.activated = false
            Animation:FadeOut('nightvision')
            WebUI:ExecuteJS('playSound("/sounds/Switch_OFF.ogg", 1.0, false);')
            Tool:DebugPrint('Deactivate', 'nvg')
		    uiDisableGoggleIcon(true) -- Update UI battery icon

        else

            Tool:DebugPrint('Animation Running | NVG:Deactivate()', 'nvg')
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


function NVG:Recharging()

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