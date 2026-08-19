---@class ServerVehicleController
---@overload fun(): ServerVehicleController
ServerVehicleController = class('ServerVehicleController')

local m_Logger = DULogger("ServerVehicleController", true)

function ServerVehicleController:__init()
    if DU_CONFIG.VEHICLES.USE_VEHICLE_LIGHTS then
        self:RegisterEvents()
    end
end

function ServerVehicleController:RegisterEvents()
    print("########## INITIALIZED #################")
    NetEvents:Subscribe("ClientVehicleController:ToggleLights", self, self.OnToggleLights)
end

---@param p_Player Player
function ServerVehicleController:OnToggleLights(p_Player)
    --Vehicle lights toggle
    
    -- Verify player has a controllable entity (vehicle)
    if p_Player.controlledControllable == nil then
        m_Logger:Write("Player has no controlledControllable")
        return
    end
    
    -- Verify player is in the driver seat (entry 0 = driver)
    -- This server-side check ensures only the driver can toggle lights,
    -- even if a client tries to spoof the event
    if p_Player.controlledEntryId ~= 0 then
        m_Logger:Write("Player attempted to toggle lights from non-driver entry (entryId=" .. p_Player.controlledEntryId .. ")")
        return
    end
    
    local vehicleEntity = ControllableEntity(p_Player.controlledControllable)
    local interface = VehicleBlueprint(vehicleEntity.data.partition.primaryInstance).descriptor
    if interface then
        vehicleEntity.bus:FireEvent(interface, 'ToggleLights')
        print("Sent Toggle")
    end
end

return ServerVehicleController()
