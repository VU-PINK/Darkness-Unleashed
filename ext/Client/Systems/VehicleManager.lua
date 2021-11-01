local m_Logger = Logger("VehicleManager", false)
class('VehicleManager')

function VehicleManager:__init()
    self:RegisterVars()
end

function VehicleManager:RegisterVars()
    self.m_CurrentVehicleEntityData = nil
    self.m_CurrentChassisData = nil
    self.m_CurrentVehicleData = nil
end

function VehicleManager:OnEntityRegister(p_LevelData)
    for l_VehicleType, l_Vehicles in pairs(VEHICLESETTINGS) do

        for l_Vehicle, l_VehicleData in pairs(l_Vehicles) do
            self.m_CurrentChassisData = g_RM:Find(l_VehicleData.partitionGUID, l_VehicleData.chassisGUID)

               if self.m_CurrentChassisData ~= nil then
                    self.m_CurrentChassisData = ChassisComponentData(self.m_CurrentChassisData)

                    for l_ComponentKey, l_Component in pairs(l_VehicleData.Components) do

                        if l_Component.type == 1 and l_Component.enabled then
							VehicleManager:AddPointLight(l_Component, self.m_CurrentChassisData, l_Vehicle)

                        elseif l_Component.type == 2 and l_Component.enabled then
							VehicleManager:AddSpotLight(l_Component, self.m_CurrentChassisData, l_Vehicle)
                        end
                    end
               end
        end
    end
end


function VehicleManager:AddPointLight(p_PointLightSettingsArray, p_ChassisData, p_Vehicle)
    if vehicle == nil then
		return
	end

	self.m_CurrentVehicleData = g_RM:VED(vehicle.partitionGUID, vehicle.vehicleDataGUID)
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
			s_WeaponData = g_RM:WCP(p_Vehicle.partitionGUID, p_Vehicle.weaponGUID2)	
	   	else
            s_WeaponData = g_RM:WCP(p_Vehicle.partitionGUID, p_Vehicle.weaponGUID)	
	   	end

 		if s_WeaponData.isReadOnly then
            s_WeaponData:MakeWritable()
 		end
 		s_WeaponData.components:add(s_NewPointlightComponentData)
        self.m_CurrentVehicleData.runtimeComponentCount = self.m_CurrentVehicleData.runtimeComponentCount + 1
 	else

 		if self.m_CurrentChassisData.isReadOnly then
            self.m_CurrentChassisData:MakeWritable()
 		end
 		self.m_CurrentChassisData.components:add(s_NewPointlightComponentData)
        self.m_CurrentVehicleData.runtimeComponentCount = self.m_CurrentVehicleData.runtimeComponentCount + 1
 	end
end


function VehicleManager:AddSpotLight(p_SpotLightSettingsArray, p_ChassisData, p_Vehicle)
	if vehicle == nil then
	    return
	end

	self.m_CurrentVehicleData = g_RM:VED(p_Vehicle.partitionGUID, p_Vehicle.vehicleDataGUID)
	self.m_CurrentVehicleData:MakeWritable()

 	local s_NewSpotLight = SpotLightEntityData()
 	s_NewSpotLight.shape = p_SpotLightSettingsArray.shape
 	s_NewSpotLight.intensity = p_SpotLightSettingsArray.intensity
 	s_NewSpotLight.color = p_SpotLightSettingsArray.color
 	s_NewSpotLight.frustumFov = p_SpotLightSettingsArray.frustumFov
 	s_NewSpotLight.frustumAspect = p_SpotLightSettingsArray.frustumAspect
 	s_NewSpotLight.texture = g_RM:Flashlight()
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

 	if p_SpotLightSettingsArray.weaponmounted then
		local s_WeaponData = nil

		if p_SpotLightSettingsArray.weapon2 == true then
            s_WeaponData = g_RM:WCP(p_Vehicle.partitionGUID, p_Vehicle.weaponGUID2)
		else
			s_WeaponData = g_RM:WCP(p_Vehicle.partitionGUID, p_Vehicle.weaponGUID)
		end

 		if s_WeaponData.isReadOnly then
            s_WeaponData:MakeWritable()
 		end
        self:AddLensFlare(p_SpotLightSettingsArray.name, s_WeaponData, p_SpotLightSettingsArray.transform.trans, p_Vehicle) 
        s_WeaponData.components:add(s_NewSpotlightComponentData)
		self.m_CurrentVehicleData.runtimeComponentCount = self.m_CurrentVehicleData.runtimeComponentCount + 1
 	else
 		if chassisData.isReadOnly then
 			chassisData:MakeWritable()
 		end

        self:AddLensFlare(p_SpotLightSettingsArray.name, self.m_CurrentChassisData, p_SpotLightSettingsArray.transform.trans, p_Vehicle)
        self.m_CurrentChassisData.components:add(s_NewSpotlightComponentData)
        self.m_CurrentVehicleData.runtimeComponentCount = self.m_CurrentVehicleData.runtimeComponentCount + 1

		if p_SpotLightSettingsArray.name.transform.mirrored == true then
		    self:AddMirrorSpotlight(p_SpotLightSettingsArray.name.name, chassisData, p_SpotLightSettingsArray.name, p_Vehicle)
		end
 	end
end


function VehicleManager:AddLensFlare(p_Name, p_Data, p_Trans, p_Vehicle)
	if p_Vehicle == nil then
		return
	end

	if p_Vehicle.name == 'SU35BM' or p_Vehicle.name == 'F35' then
		return
	end

	local s_LensFlare = g_RM:LFED("65A5BFD9-028A-4D4F-8B89-3A60B2E06F83","D8DB98E1-AEBA-485E-9AA4-D5F55C5CDECE")
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
		l_Value.size = value.size * 0.92
		l_Value.sizeOccluderCurve = l_Value.sizeOccluderCurve * 1
		l_Value.alphaCamDistCurve = l_Value.alphaCamDistCurve * 1
		l_Value.alphaOccluderCurve = l_Value.alphaOccluderCurve * 1
	end

	local s_Name = LensFlareComponentData()
	s_Name.lensFlare = LensFlare

	s_Name.transform = LinearTransform(
		Vec3(-1.0, 0.0, 8.74227765735e-08), --rotation
		Vec3(0, 1, 0),
		Vec3(-8.74227765735e-08, 0, -1),
		p_Trans
		)

    p_Data.components:add(s_Name)
	self.m_CurrentVehicleData.runtimeComponentCount = self.m_CurrentVehicleData.runtimeComponentCount + 1
end


function VehicleManager:AddMirrorSpotlight(p_Name, p_Data, p_Settings, p_Vehicle)
	local s_NewSpotLight = SpotLightEntityData()
    s_NewSpotLight.shape = settings.shape
    s_NewSpotLight.intensity = settings.intensity
    s_NewSpotLight.color = settings.color
    s_NewSpotLight.frustumFov = settings.frustumFov
    s_NewSpotLight.frustumAspect = settings.frustumAspect
    s_NewSpotLight.texture = RM:Flashlight()
    s_NewSpotLight.castShadowsMinLevel = 0
    s_NewSpotLight.castShadowsEnable = false
    s_NewSpotLight.radius = settings.radius

 	local s_Name = LightComponentData()
 	s_Name.light = newSpotLight
 	s_Name.transform = LinearTransform(
		settings.transform.left,
		settings.transform.up,
		settings.transform.forward,
		settings.transform.trans * Vec3((-1), 1, 1)
 	)

    p_Data.components:add(s_Name)
	self.m_CurrentVehicleData.runtimeComponentCount = self.m_CurrentVehicleData.runtimeComponentCount + 1
	self:AddLensFlare(p_Name, p_Data, p_Settings.transform.trans * Vec3((-1), 1, 1), p_Vehicle)
end


-- Singleton
if g_VehicleManager == nil then
    g_VehicleManager = VehicleManager()
end

return g_VehicleManager