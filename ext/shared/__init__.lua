local Settings = require '__shared/settings'
local Tool = require '__shared/classes/tools/tool'

function VehicleLights()

    if Settings.useVehicleLights_Airborne == true or Settings.useVehicleLights_Ground == true then  

        local vehiclemodifications = require '__shared/classes/vehiclemodifications'

    else 

        Tool:DebugPrint('Not using Vehicle Lights', 'altering')

    end
end

VehicleLights()



--[[ResourceManager:RegisterInstanceLoadHandler(Guid('6F91A4CF-344D-11E0-930F-E8BE623140CB'),Guid('A11805B7-0656-4D9A-9226-D746EA0C857C'), function(engineInstance)
    local engine = EngineConfigData(engineInstance)
    engine:MakeWritable()
    engine.rpmMax = engine.rpmMax * 2.5
    engine.enginePowerMultiplier = engine.enginePowerMultiplier * 2.5
end)]]


