---@class VehicleManager
---@overload fun(): VehicleManager
VehicleManager = class('VehicleManager')

local m_Logger = Logger("VehicleManager", false)

function VehicleManager:__init()
	self:RegisterVars()
end

function VehicleManager:RegisterVars()
	self.m_CurrentVehicleEntityData = nil
	self.m_CurrentChassisData = nil
	self.m_CurrentVehicleData = nil
end

---@param p_LevelData LevelData
function VehicleManager:OnEntityRegister(p_LevelData)
	if CONFIG.VEHICLES.USE_VEHICLE_LIGHTS then
		for l_VehicleType, l_Vehicles in pairs(VEHICLESETTINGS) do
			for l_Vehicle, l_VehicleData in pairs(l_Vehicles) do
				self.m_CurrentChassisData = RM:Find(l_VehicleData.partitionGUID, l_VehicleData.chassisGUID)

				if self.m_CurrentChassisData ~= nil then
					self.m_CurrentChassisData = ChassisComponentData(self.m_CurrentChassisData)

					for l_ComponentKey, l_Component in pairs(l_VehicleData.Components) do
						if l_Component.type == 1 and l_Component.enabled then
							VehicleManager:AddPointLight(l_Component, self.m_CurrentChassisData, l_VehicleData)
						elseif l_Component.type == 2 and l_Component.enabled then
							VehicleManager:AddSpotLight(l_Component, self.m_CurrentChassisData, l_VehicleData)
						end
					end
				end
			end
		end
	end
end

---@param p_PointLightSettingsArray table
---@param p_ChassisData ChassisComponentData|DataContainer
---@param p_Vehicle table
function VehicleManager:AddPointLight(p_PointLightSettingsArray, p_ChassisData, p_Vehicle)
	if p_Vehicle == nil then
		return
	end

	self.m_CurrentVehicleData = RM:VED(p_Vehicle.partitionGUID, p_Vehicle.vehicleDataGUID)
	self.m_CurrentVehicleData:MakeWritable()

	local s_NewPointLight = PointLightEntityData()
	s_NewPointLight.radius = p_PointLightSettingsArray.radius
	s_NewPointLight.color = p_PointLightSettingsArray.color
	s_NewPointLight.intensity = p_PointLightSettingsArray.intensity
	--newPointLight.width = pointLightSettingsArray.width
	--newPointLight.visible = pointLightSettingsArray.visible

	local s_NewPointlightComponentData = LightComponentData()
	s_NewPointlightComponentData.light = s_NewPointLight
	s_NewPointlightComponentData.transform = LinearTransform(
		p_PointLightSettingsArray.transform.left,
		p_PointLightSettingsArray.transform.up,
		p_PointLightSettingsArray.transform.forward,
		p_PointLightSettingsArray.transform.trans
	)

	if p_PointLightSettingsArray.weaponmounted then
		local s_WeaponData = nil

		if p_PointLightSettingsArray.weapon2 == true then
			s_WeaponData = RM:WCP(p_Vehicle.partitionGUID, p_Vehicle.weaponGUID2)
		else
			s_WeaponData = RM:WCP(p_Vehicle.partitionGUID, p_Vehicle.weaponGUID)
		end

		if s_WeaponData then
			if s_WeaponData.isReadOnly then
				s_WeaponData:MakeWritable()
			end
			s_WeaponData.components:add(s_NewPointlightComponentData)
			self.m_CurrentVehicleData.runtimeComponentCount = self.m_CurrentVehicleData.runtimeComponentCount + 1
		else
			m_Logger:Error("WeaponData is nil: " .. p_Vehicle.weaponGUID2)
		end
	else
		if p_ChassisData.isReadOnly then
			p_ChassisData:MakeWritable()
		end
		p_ChassisData.components:add(s_NewPointlightComponentData)
		self.m_CurrentVehicleData.runtimeComponentCount = self.m_CurrentVehicleData.runtimeComponentCount + 1
	end
end

---@param p_SpotLightSettingsArray table
---@param p_ChassisData ChassisComponentData|DataContainer
---@param p_Vehicle table
function VehicleManager:AddSpotLight(p_SpotLightSettingsArray, p_ChassisData, p_Vehicle)
	if p_Vehicle == nil then
		return
	end

	self.m_CurrentVehicleData = RM:VED(p_Vehicle.partitionGUID, p_Vehicle.vehicleDataGUID)
	self.m_CurrentVehicleData:MakeWritable()

	local s_NewSpotLight = SpotLightEntityData()
	s_NewSpotLight.shape = p_SpotLightSettingsArray.shape
	s_NewSpotLight.intensity = p_SpotLightSettingsArray.intensity
	s_NewSpotLight.color = p_SpotLightSettingsArray.color
	s_NewSpotLight.frustumFov = p_SpotLightSettingsArray.frustumFov
	s_NewSpotLight.frustumAspect = p_SpotLightSettingsArray.frustumAspect
	s_NewSpotLight.texture = RM:Flashlight()
	s_NewSpotLight.castShadowsMinLevel = 0
	s_NewSpotLight.castShadowsEnable = false
	s_NewSpotLight.radius = p_SpotLightSettingsArray.radius

	local s_NewSpotlightComponentData = LightComponentData()
	s_NewSpotlightComponentData.light = s_NewSpotLight
	s_NewSpotlightComponentData.transform = LinearTransform(
		p_SpotLightSettingsArray.transform.left,
		p_SpotLightSettingsArray.transform.up,
		p_SpotLightSettingsArray.transform.forward,
		p_SpotLightSettingsArray.transform.trans
	)

	local s_LightBeamMesh = RigidMeshAsset(RM:Find("77C2CBE6-7180-C6CB-8282-6235F2B9AC2E",
		"587C9B0B-B8A1-2675-0CC8-20D6F0F14347"):Clone())
	--  s_LightBeamMesh.lodGroup = MeshLodGroup(RM:Find("64991A4A-4C5E-11DE-B1F5-FE435F0A1D8F", "6F61313B-C996-C1CB-CE6F-34392F6CC1E1"))
	--  s_LightBeamMesh.lodScale = 1.0
	--  s_LightBeamMesh.cullScale = 1.0
	--  s_LightBeamMesh.streamingEnable = true
	--  s_LightBeamMesh.occluderMeshEnable = false
	--  s_LightBeamMesh.occluderHighPriority = false
	--  s_LightBeamMesh.destructionMaterialEnable = false
	--  s_LightBeamMesh.enlightenType = 0
	--  s_LightBeamMesh.name = "weapons/accessories/flashlight/flashlightbeam_3p_Mesh"
	--  local s_lightBeamMaterial = MeshMaterial(RM:Find("EF4BED7C-B1E4-1B36-0D95-19FF7A173B3D","B1202F61-67E8-4D57-8400-1EAA02E0014D"))
	--  s_LightBeamMesh.materials:add(s_lightBeamMaterial)
	--  s_LightBeamMesh.nameHash = 2097245143
	--  s_LightBeamMesh.name = "weapons/accessories/flashlight/bilightcone_01_3p_Mesh"

	local s_NewLightBeamEntity = MeshComponentData()
	s_NewLightBeamEntity.mesh = s_LightBeamMesh
	s_NewLightBeamEntity.transform = LinearTransform(
		p_SpotLightSettingsArray.lightbeamTransform.left,
		p_SpotLightSettingsArray.lightbeamTransform.up,
		p_SpotLightSettingsArray.lightbeamTransform.forward,
		p_SpotLightSettingsArray.lightbeamTransform.trans
	)

	if p_SpotLightSettingsArray.weaponmounted then
		local s_WeaponData = nil

		if p_SpotLightSettingsArray.weapon2 == true then
			s_WeaponData = RM:WCP(p_Vehicle.partitionGUID, p_Vehicle.weaponGUID2)
		else
			s_WeaponData = RM:WCP(p_Vehicle.partitionGUID, p_Vehicle.weaponGUID)
		end

		if s_WeaponData then
			if s_WeaponData.isReadOnly then
				s_WeaponData:MakeWritable()
			end
			self:AddLensFlare(p_SpotLightSettingsArray.name, s_WeaponData, p_SpotLightSettingsArray.transform.trans,
				p_Vehicle)
			s_WeaponData.components:add(s_NewSpotlightComponentData)
			s_WeaponData.components:add(s_NewLightBeamEntity)
			self.m_CurrentVehicleData.runtimeComponentCount = self.m_CurrentVehicleData.runtimeComponentCount + 2
		else
			m_Logger:Error("WeaponData is nil: " .. p_Vehicle.weaponGUID2)
		end
	else
		if p_ChassisData.isReadOnly then
			p_ChassisData:MakeWritable()
		end

		self:AddLensFlare(p_SpotLightSettingsArray.name, p_ChassisData, p_SpotLightSettingsArray.transform.trans,
			p_Vehicle)
		p_ChassisData.components:add(s_NewSpotlightComponentData)
		p_ChassisData.components:add(s_NewLightBeamEntity)
		self.m_CurrentVehicleData.runtimeComponentCount = self.m_CurrentVehicleData.runtimeComponentCount + 2

		if p_SpotLightSettingsArray.transform.mirrored == true then
			self:AddMirrorSpotlight(p_SpotLightSettingsArray.name, p_ChassisData, p_SpotLightSettingsArray, p_Vehicle)
		end
	end
end

---@param p_Name string
---@param p_Data table
---@param p_Trans Vec3
---@param p_Vehicle table
function VehicleManager:AddLensFlare(p_Name, p_Data, p_Trans, p_Vehicle)
	if p_Vehicle == nil then
		return
	end

	if p_Vehicle.name == 'SU35BM' or p_Vehicle.name == 'F35' then
		return
	end

	local s_LensFlare = RM:LFED("65A5BFD9-028A-4D4F-8B89-3A60B2E06F83", "D8DB98E1-AEBA-485E-9AA4-D5F55C5CDECE")

	if not s_LensFlare then
		m_Logger:Error("Lensflare is nil")
		return
	end

	s_LensFlare:MakeWritable()

	for l_Key, l_Value in pairs(s_LensFlare.elements) do
		local dist = 80
		local dist2 = 60
		local sizeAngle = Vec4(0.13, 1, 0, 0)
		local alphaAngle = Vec4(0.04, 1, 0, 0)
		l_Value.sizeCamDistMax = dist
		l_Value.alphaCamDistMax = dist2
		l_Value.sizeAngleCurve = sizeAngle
		l_Value.alphaAngleCurve = alphaAngle
		l_Value.sizeScreenPosCurve = l_Value.sizeScreenPosCurve
		l_Value.alphaScreenPosCurve = l_Value.alphaScreenPosCurve
		l_Value.size = l_Value.size * 0.92
		l_Value.sizeOccluderCurve = l_Value.sizeOccluderCurve * 1
		l_Value.alphaCamDistCurve = l_Value.alphaCamDistCurve * 1
		l_Value.alphaOccluderCurve = l_Value.alphaOccluderCurve * 1
	end

	local s_Name = LensFlareComponentData()
	s_Name.lensFlare = s_LensFlare

	s_Name.transform = LinearTransform(
		Vec3(-1.0, 0.0, 8.74227765735e-08), --rotation
		Vec3(0, 1, 0),
		Vec3(-8.74227765735e-08, 0, -1),
		p_Trans
	)

	p_Data.components:add(s_Name)
	self.m_CurrentVehicleData.runtimeComponentCount = self.m_CurrentVehicleData.runtimeComponentCount + 1
end

---@param p_Name string
---@param p_Data table
---@param p_Settings table
---@param p_Vehicle any
function VehicleManager:AddMirrorSpotlight(p_Name, p_Data, p_Settings, p_Vehicle)
	local s_NewSpotLight = SpotLightEntityData()
	s_NewSpotLight.shape = p_Settings.shape
	s_NewSpotLight.intensity = p_Settings.intensity
	s_NewSpotLight.color = p_Settings.color
	s_NewSpotLight.frustumFov = p_Settings.frustumFov
	s_NewSpotLight.frustumAspect = p_Settings.frustumAspect
	s_NewSpotLight.texture = RM:Flashlight()
	s_NewSpotLight.castShadowsMinLevel = 0
	s_NewSpotLight.castShadowsEnable = false
	s_NewSpotLight.radius = p_Settings.radius

	local s_Name = LightComponentData()
	s_Name.light = s_NewSpotLight
	s_Name.transform = LinearTransform(
		p_Settings.transform.left,
		p_Settings.transform.up,
		p_Settings.transform.forward,
		p_Settings.transform.trans * Vec3((-1), 1, 1)
	)

	local s_LightBeamMesh = RigidMeshAsset(RM:Find("77C2CBE6-7180-C6CB-8282-6235F2B9AC2E",
		"587C9B0B-B8A1-2675-0CC8-20D6F0F14347"):Clone())
	--  s_LightBeamMesh.lodGroup = MeshLodGroup(RM:Find("64991A4A-4C5E-11DE-B1F5-FE435F0A1D8F", "6F61313B-C996-C1CB-CE6F-34392F6CC1E1"))
	--  s_LightBeamMesh.lodScale = 1.0
	--  s_LightBeamMesh.cullScale = 1.0
	--  s_LightBeamMesh.streamingEnable = true
	--  s_LightBeamMesh.occluderMeshEnable = false
	--  s_LightBeamMesh.occluderHighPriority = false
	--  s_LightBeamMesh.destructionMaterialEnable = false
	--  s_LightBeamMesh.enlightenType = 0
	--  s_LightBeamMesh.name = "weapons/accessories/flashlight/flashlightbeam_3p_Mesh"
	--  local s_lightBeamMaterial = MeshMaterial(RM:Find("EF4BED7C-B1E4-1B36-0D95-19FF7A173B3D","B1202F61-67E8-4D57-8400-1EAA02E0014D"))
	--  s_LightBeamMesh.materials:add(s_lightBeamMaterial)
	--  s_LightBeamMesh.nameHash = 2097245143
	--  s_LightBeamMesh.name = "weapons/accessories/flashlight/bilightcone_01_3p_Mesh"

	local s_NewLightBeamEntity = MeshComponentData()
	s_NewLightBeamEntity.mesh = s_LightBeamMesh
	s_NewLightBeamEntity.transform = LinearTransform(
		p_Settings.lightbeamTransform.left,
		p_Settings.lightbeamTransform.up,
		p_Settings.lightbeamTransform.forward,
		p_Settings.lightbeamTransform.trans * Vec3((-1), 1, 1)
	)

	p_Data.components:add(s_Name)
	p_Data.components:add(s_NewLightBeamEntity)
	self.m_CurrentVehicleData.runtimeComponentCount = self.m_CurrentVehicleData.runtimeComponentCount + 2
	self:AddLensFlare(p_Name, p_Data, p_Settings.transform.trans * Vec3((-1), 1, 1), p_Vehicle)
end

return VehicleManager()
