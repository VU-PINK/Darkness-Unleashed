-- ---@class ServerVehicleController
-- ---@overload fun(): ServerVehicleController
-- ServerVehicleController = class('ServerVehicleController')

-- local m_Logger = DULogger("ServerVehicleController", true)

-- function ServerVehicleController:__init()
--     if DU_CONFIG.VEHICLES.USE_VEHICLE_LIGHTS then
--         self:RegisterEvents()
--     end
-- end

-- function ServerVehicleController:RegisterEvents()
--     print("########## INITIALIZED #################")
--     NetEvents:Subscribe("ClientVehicleController:ToggleLights", self, self.OnToggleLights)
-- end

-- ---@param p_Player Player
-- function ServerVehicleController:OnToggleLights(p_Player)
--     --Vehicle lights toggle
--     print("REACHED THE SERVER")
--     if p_Player.controlledControllable == nil then
--         return
--     end
--     local vehicleEntity = ControllableEntity(p_Player.controlledControllable)
--     local interface = VehicleBlueprint(vehicleEntity.data.partition.primaryInstance).descriptor
--     if interface then
--         vehicleEntity.bus:FireEvent(interface, 'ToggleLights')
--         print("Sent Toggle")
--     end
-- end

-- return ServerVehicleController()
