local NVG = class("NVG")

local AnimationClass = require '__shared/classes/animation'
local Animation = AnimationClass()
local Tool = require '__shared/tools/tool'

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
            WebUI:ExecuteJS('playSound("/sounds/Switch_ON.ogg", 1.0, false);')
            done = false
            nvgRunner = true
            nvgEnable = true
            --print("activate")
            uiGoggleIcon(true) -- Update UI battery icon
        else
            --print("Animation Running")
            return
        end
    end
end

function NVG:Deactivate()
	--if(self.batteryLifeCurrent < self.batteryLifeMin) then
        if nvgRunner ~= true then
            WebUI:ExecuteJS('playSound("/sounds/Switch_OFF.ogg", 1.0, false);')
            done = false
            nvgRunner = true
            nvgDisable = true
            --print("deactivate")
		    uiDisableGoggleIcon(true) -- Update UI battery icon
        else
            --print("Animation Running")
            return
        end
	--else
		--uiGoggleIcon(false) -- Update UI battery icon
	--end
end

function NVG:Depleting()
    localPlayer = PlayerManager:GetLocalPlayer()

    if localPlayer.inVehicle == true then 
        if (self.batteryLifeCurrent + 0.5) < self.batteryLifeMax then 
            self.batteryLifeCurrent = self.batteryLifeCurrent + 0.5
        end
    else
	    self.batteryLifeCurrent = self.batteryLifeCurrent - 1
    end

	uiBattery(self.batteryLifeCurrent) -- Update UI battery

    Tool:DebugPrint("Battery Life: " .. self.batteryLifeCurrent, 'altering')

    if(self.batteryLifeCurrent == 0) then
        --print("Battery has depleted!")
        if nvgRunner ~= true then

            done = false
            nvgRunner = true
            nvgEnable = false
            nvgDisable = true
            uiDisableGoggleIcon(true) -- Update UI battery icon
            self.batteryEmptyTime = elapsedTime
            --print("Battery Depletion Animation Started")
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
