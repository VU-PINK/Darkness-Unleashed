local NVG = class("NVG")

local AnimationClass = require '__shared/classes/animation'
local Animation = AnimationClass()

elapsedTime = 0
lastSecond = 0

function NVG:__init()
    self.batteryLifeMax = 60
    self.batteryLifeMin = 10

    self.batteryEmptyTime = 0
    self.batteryLifeCooldown = 10

    self.batteryLifeCurrent = 60
end

function NVG:Activate(activationTime)
    if(self.batteryLifeCurrent >= self.batteryLifeMin) then
        ApplySpecialVisualEnvironment("NightVision")
        Animation:NVGAnimation(activationTime)
        goggleIcon(true)
    end
end

function NVG:Depleting()
    self.batteryLifeCurrent = self.batteryLifeCurrent - 1
    WebUI:ExecuteJS('window.batteryUpdate(' .. tostring(self.batteryLifeCurrent / self.batteryLifeMax * 100) .. ');')

    print("Battery Life: " .. self.batteryLifeCurrent)

    if(self.batteryLifeCurrent == 0) then
        print("Battery has depleted!")
        ResetSpecialVisualEnvironment("NightVision")
        disableGoggleIcon(true)
        self.batteryEmptyTime = elapsedTime
        
    end
end

function NVG:Recharging()

    if(self.batteryEmptyTime + self.batteryLifeCooldown > elapsedTime) then
        return;
	else
		disableGoggleIcon(false)
    end

    if(self.batteryLifeCurrent < self.batteryLifeMax) then
        self.batteryLifeCurrent = self.batteryLifeCurrent + 1
        WebUI:ExecuteJS('window.batteryUpdate(' .. tostring(self.batteryLifeCurrent / self.batteryLifeMax * 100) .. ');')
        print("Battery Charged To: " .. self.batteryLifeCurrent)
    end
end

return NVG