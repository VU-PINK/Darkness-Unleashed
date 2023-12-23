-- Your server side code here

-- Logger
local m_Logger = Logger("DarknessServer", true)

---@class DarknessServer
---@overload fun(): DarknessServer
DarknessServer = class("DarknessServer")

function DarknessServer:__init()
    self:RegisterEvents()
end

function DarknessServer:RegisterEvents()
    NetEvents:Subscribe("VEManager:PresetsLoaded", self, self._OnPresetsLoaded)

    Events:Subscribe('Vehicle:Enter', self, self._OnVehicleInteract)
    Events:Subscribe('Vehicle:Exit', self, self._OnVehicleInteract)
end

---@param vehicle string
---@param player Player
function DarknessServer:_OnVehicleInteract(vehicle, player)
    NetEvents:BroadcastLocal('DarknessServer:VehicleInteract', player.name)
end

function setDayNightCycle(p_StartingTime, p_LengthOfCycle)
    -- Is time static?
    if p_LengthOfCycle <= 0 then
        ---@diagnostic disable-next-line: cast-local-type
        p_LengthOfCycle = nil
    end

    -- Fix incorrect time
    if p_StartingTime < 0 or p_StartingTime >= 24 then
        p_StartingTime = 0
    end
    Events:Dispatch('TimeServer:Enable', p_StartingTime, p_LengthOfCycle)
end

function DarknessServer:_OnPresetsLoaded()
    if CONFIG.TIME.ENABLED then
        setDayNightCycle(CONFIG.TIME.START_HOUR, CONFIG.TIME.DAY_DURATION)
    end
end

-- function stopDayNightVECycle()
--     Events:Dispatch('TimeServer:Pause')
-- end

-- function disableDayNightVECycle()
--     Events:Dispatch('TimeServer:Disable')
-- end

DarknessServer = DarknessServer()

return DarknessServer
