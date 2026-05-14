-- ---@class ClientVehicleController
-- ---@overload fun(): ClientVehicleController
-- ClientVehicleController = class('ClientVehicleController')

-- local m_Logger = DULogger("ClientVehicleController", true)

-- function ClientVehicleController:__init()
-- 	if DU_CONFIG.VEHICLES.USE_VEHICLE_LIGHTS then
-- 		self:RegisterEvents()
-- 	end
-- end

-- function ClientVehicleController:RegisterEvents()
-- 	print("########## INITIALIZED #################")
-- 	Events:Subscribe('Player:UpdateInput', self, self.OnPlayerUpdate)
-- end

-- ---@param p_DeltaTime number
-- function ClientVehicleController:OnPlayerUpdate(p_DeltaTime)
-- 	--Vehicle lights toggle
-- 	local s_localPlayer = PlayerManager:GetLocalPlayer()

-- 	if InputManager:WentKeyDown(InputDeviceKeys.IDK_T) then
-- 		print("Player Pressed T")
-- 		if not s_localPlayer.inVehicle then
-- 			return
-- 		end

-- 		if not s_localPlayer.controlledControllable then
-- 			return
-- 		end

-- 		NetEvents:Send("ClientVehicleController:ToggleLights", s_localPlayer)
-- 		print("Sent event")
-- 	end
-- end

-- return ClientVehicleController()
