local NVG = class("NVG")

local Animation = require 'systems/animation'
local Tool = require '__shared/classes/tools/tool'

nvgRunner = false

elapsedTime = 0
lastSecond = 0

local localPlayer = nil

function NVG:__init()
    self.batteryLifeMax = 60
    self.batteryLifeMin = 10

    self.batteryEmptyTime = 0
    self.batteryLifeCooldown = 10

    self.batteryLifeCurrent = 60

	-- Set value on the UI
	uiBatteries( self.batteryLifeMin, self.batteryLifeMax );
end

function NVG:Activate()
    if(self.batteryLifeCurrent >= self.batteryLifeMin) then
        if nvgRunner ~= true then
            Animation:__init()
            WebUI:ExecuteJS('playSound("/sounds/Switch_ON.ogg", 1.0, false);')
            done = false
            nvgRunner = true
            nvgEnable = true
            nvgActivated = true 
            Tool:DebugPrint('NVG Activate ...', 'nvg')
            uiGoggleIcon(true) -- Update UI battery icon
        else
            Tool:DebugPrint('Animation Running', 'nvg')
            return
        end
    end
end

function NVG:Deactivate()
	--if(self.batteryLifeCurrent < self.batteryLifeMin) then
        if nvgRunner ~= true then
            Animation:__init()
            WebUI:ExecuteJS('playSound("/sounds/Switch_OFF.ogg", 1.0, false);')
            done = false
            nvgRunner = true
            nvgDisable = true
            Tool:DebugPrint('Deactivate', 'nvg')
		    uiDisableGoggleIcon(true) -- Update UI battery icon
        else
            Tool:DebugPrint('Animation Running | NVG:Deactivate()', 'nvg')
            return
        end
	--else
		--uiGoggleIcon(false) -- Update UI battery icon
	--end
end

function NVG:Depleting()
    local localPlayer = PlayerManager:GetLocalPlayer()

    if localPlayer == nil then
        return
    end

    if localPlayer.inVehicle == true then 
        if (self.batteryLifeCurrent + 1) < self.batteryLifeMax then 
            self.batteryLifeCurrent = self.batteryLifeCurrent + 1
        end
    else
	    self.batteryLifeCurrent = self.batteryLifeCurrent - 1
    end

	uiBattery(self.batteryLifeCurrent) -- Update UI battery

    Tool:DebugPrint("Battery Life: " .. self.batteryLifeCurrent, 'altering')

    if(self.batteryLifeCurrent <= 0) then
        Tool:DebugPrint('Battery has depleted!', 'nvg')
        if nvgRunner ~= true then

            done = false
            nvgRunner = true
            nvgEnable = false
            nvgDisable = true
            uiDisableGoggleIcon(true) -- Update UI battery icon
            self.batteryEmptyTime = elapsedTime
            Tool:DebugPrint('Battery Depletion Animation Started', 'nvg')
        end
    end
end

function NVG:Recharging()
    if(self.batteryEmptyTime + self.batteryLifeCooldown > elapsedTime) then
        return;
	end

	-- Show Enabled/Disabled Goggles icon
	if(self.batteryLifeCurrent >= self.batteryLifeMin) then
		uiDisableGoggleIcon(false) -- Update UI battery icon
	end

    if(self.batteryLifeCurrent < self.batteryLifeMax) then
        self.batteryLifeCurrent = self.batteryLifeCurrent + 1
		uiBattery(self.batteryLifeCurrent) -- Update UI battery
        Tool:DebugPrint("Battery Charged To: " .. self.batteryLifeCurrent, 'altering')
    end
end


return NVG
