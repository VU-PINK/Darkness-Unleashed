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