-- ---@class VehicleManager
-- ---@class VehicleManager
-- ---@overload fun(): VehicleManager
-- VehicleManager = class('VehicleManager')


-- local m_Logger = DULogger("VehicleManager", true)

-- function VehicleManager:__init()

-- end

-- ---@param p_LevelData LevelData
-- function VehicleManager:OnEntityRegister(p_LevelData)
-- 	if not DU_CONFIG.VEHICLES.USE_VEHICLE_LIGHTS then
-- 		return
-- 	end

-- 	for l_VehicleType, l_Vehicles in pairs(VEHICLESETTINGS) do
-- 		for l_VehicleName, l_VehicleSettings in pairs(l_Vehicles) do
-- 			self:ModifyVehicle(l_VehicleName, l_VehicleSettings)
-- 		end
-- 	end

-- 	print('Modified all vehicles')
-- end

-- ---@param p_VehicleName string
-- ---@param p_VehicleSettings table
-- function VehicleManager:ModifyVehicle(p_VehicleName, p_VehicleSettings)
-- 	local s_Partition = ResourceManager:FindDatabasePartition(Guid(p_VehicleSettings.partitionGUID))
-- 	if s_Partition == nil then
-- 		print("Vehicle not loaded: " .. p_VehicleName)
-- 		return
-- 	end

-- 	local s_VehicleBlueprint = VehicleBlueprint(s_Partition.primaryInstance)
-- 	s_VehicleBlueprint:MakeWritable()
-- 	local s_VehicleEntityData = VehicleEntityData(s_VehicleBlueprint.object)
-- 	s_VehicleEntityData:MakeWritable()
-- 	local s_ChassisComponentData = ChassisComponentData(s_VehicleEntityData.components[1])
-- 	s_ChassisComponentData:MakeWritable()

-- 	local s_SyncedBoolData = SyncedBoolEntityData(MathUtils:RandomGuid())

-- 	if s_VehicleBlueprint.descriptor then
-- 		-- An input event on the blueprint will be used to toggle the lights
-- 		local s_InputEvent = DynamicEvent()
-- 		s_InputEvent.id = MathUtils:FNVHash('ToggleLights')
-- 		local s_Descriptor = InterfaceDescriptorData(s_VehicleBlueprint.descriptor)
-- 		s_Descriptor:MakeWritable()
-- 		s_Descriptor.inputEvents:add(s_InputEvent)

-- 		-- A SyncedBoolEntity will store the on/off state of the vehicle lights
-- 		-- It will also fire events to Enable/Disable the relevant entities
-- 		local s_SyncedBoolData = SyncedBoolEntityData(MathUtils:RandomGuid())
-- 		s_SyncedBoolData.inValue = false -- initial state
-- 		s_SyncedBoolData.isEventConnectionTarget = Realm.Realm_Server
-- 		s_VehicleEntityData.components:add(s_SyncedBoolData)
-- 		s_Partition:AddInstance(s_SyncedBoolData)

-- 		-- Keep track of the number of added components

-- 		-- Use an event to toggle the SyncedBoolEntity from the input event
-- 		self:AddEventConnection(
-- 			s_VehicleBlueprint,
-- 			EventConnectionTargetType.EventConnectionTargetType_Server,
-- 			s_Descriptor, 'ToggleLights',
-- 			s_SyncedBoolData, 'Toggle'
-- 		)
-- 	end
-- 	local s_ComponentCount = 1

-- 	-- Iterate table of settings for each light to add
-- 	for _, l_ComponentSettings in pairs(p_VehicleSettings.Components) do
-- 		-- Mount the light to either the weapon or the chassis
-- 		local s_ParentComponent = nil
-- 		if l_ComponentSettings.weaponmounted then
-- 			local s_Key = nil
-- 			if l_ComponentSettings.weapon2 then
-- 				s_Key = 'weaponGUID2'
-- 			else
-- 				s_Key = 'weaponGUID'
-- 			end
-- 			-- TODO: improve this in VehicleSettings
-- 			s_ParentComponent = ComponentData(s_Partition:FindInstance(Guid(p_VehicleSettings[s_Key])))
-- 			s_ParentComponent:MakeWritable()
-- 		else
-- 			s_ParentComponent = s_ChassisComponentData
-- 		end
-- 		-- Create the light related instances
-- 		local s_Instances = self:CreateLightInstances(l_ComponentSettings)
-- 		s_ParentComponent.components:add(s_Instances['light-component'])
-- 		-- s_ComponentCount = s_ComponentCount + 1
-- 		-- Add all instances to partition
-- 		for _, l_Instance in pairs(s_Instances) do
-- 			s_Partition:AddInstance(l_Instance)
-- 		end

-- 		-- Table of instances that wil receive the Enable/Disable event
-- 		local s_Targets = { s_Instances['light-data'] }

-- 		local s_MeshComponentData = s_Instances['mesh-component']
-- 		if s_MeshComponentData ~= nil then
-- 			s_ParentComponent.components:add(s_MeshComponentData)
-- 			-- s_ComponentCount = s_ComponentCount + 1
-- 			table.insert(s_Targets, s_MeshComponentData)
-- 		end

-- 		if p_VehicleName ~= 'SU35BM' and p_VehicleName ~= 'F35' then
-- 			local s_FlareComponentData = self:CreateLensFlare(l_ComponentSettings)
-- 			if s_FlareComponentData ~= nil then
-- 				s_ParentComponent.components:add(s_FlareComponentData)
-- 				-- s_ComponentCount = s_ComponentCount + 1
-- 				s_Partition:AddInstance(s_FlareComponentData)
-- 				table.insert(s_Targets, s_FlareComponentData)
-- 			else
-- 				print("Error in CreateLensFlare") -- TODO: remove this check once everything is working
-- 			end
-- 		end

-- 		-- Add Enable/Disable connections for the light, mesh and lensflare components
-- 		for _, l_Target in ipairs(s_Targets) do
-- 			self:AddEventConnection(
-- 				s_VehicleBlueprint,
-- 				EventConnectionTargetType.EventConnectionTargetType_Client,
-- 				s_SyncedBoolData, 'OnTrue',
-- 				l_Target, 'Enable')

-- 			self:AddEventConnection(
-- 				s_VehicleBlueprint,
-- 				EventConnectionTargetType.EventConnectionTargetType_Client,
-- 				s_SyncedBoolData, 'OnFalse',
-- 				l_Target, 'Disable')
-- 		end
-- 	end
-- 	-- Patch runtimeComponentCount
-- 	s_VehicleEntityData.runtimeComponentCount =
-- 		s_VehicleEntityData.runtimeComponentCount + s_ComponentCount
-- end

-- ---@param p_Settings table
-- function VehicleManager:CreateLightInstances(p_Settings)
-- 	local s_CreatedInstances = {}

-- 	local s_LightDataType = ({
-- 		[1] = 'PointLightEntityData',
-- 		[2] = 'SpotLightEntityData'
-- 	})[p_Settings.type]

-- 	-- Set shared properties
-- 	local s_LightData = _G[s_LightDataType](MathUtils:RandomGuid())
-- 	s_LightData.radius = p_Settings.radius
-- 	s_LightData.color = p_Settings.color
-- 	s_LightData.intensity = p_Settings.intensity
-- 	s_LightData.isEventConnectionTarget = Realm.Realm_Client
-- 	s_CreatedInstances['light-data'] = s_LightData

-- 	-- Set additional settings and add mesh for SpotLightEntities
-- 	if p_Settings.type == 2 then
-- 		s_LightData.shape = p_Settings.shape
-- 		s_LightData.frustumFov = p_Settings.frustumFov
-- 		s_LightData.frustumAspect = p_Settings.frustumAspect
-- 		s_LightData.texture = RM:GetFlashlightTextureAsset()
-- 		s_LightData.castShadowsMinLevel = 0
-- 		s_LightData.castShadowsEnable = false

-- 		local s_LightBeamMesh = RigidMeshAsset(RM:Find(
-- 			"77C2CBE6-7180-C6CB-8282-6235F2B9AC2E",
-- 			"587C9B0B-B8A1-2675-0CC8-20D6F0F14347"))

-- 		-- Use a mesh component to mount the mesh to the vehicle
-- 		local s_MeshComponentData = MeshComponentData(MathUtils:RandomGuid())
-- 		s_MeshComponentData.mesh = s_LightBeamMesh
-- 		s_MeshComponentData.isEventConnectionTarget = Realm.Realm_Client
-- 		s_MeshComponentData.transform = LinearTransform(
-- 			p_Settings.lightbeamTransform.left,
-- 			p_Settings.lightbeamTransform.up,
-- 			p_Settings.lightbeamTransform.forward,
-- 			p_Settings.lightbeamTransform.trans
-- 		)
-- 		s_CreatedInstances['mesh-component'] = s_MeshComponentData
-- 	end

-- 	-- Use a light component to mount the light to a vehicle
-- 	local s_LightComponentData = LightComponentData(MathUtils:RandomGuid())
-- 	s_LightComponentData.light = s_LightData
-- 	s_LightComponentData.transform = LinearTransform(
-- 		p_Settings.transform.left,
-- 		p_Settings.transform.up,
-- 		p_Settings.transform.forward,
-- 		p_Settings.transform.trans
-- 	)
-- 	s_CreatedInstances['light-component'] = s_LightComponentData

-- 	return s_CreatedInstances
-- end

-- ---@param p_Settings table
-- function VehicleManager:CreateLensFlare(p_Settings)
-- 	local s_LensFlareData = RM:GetLensFlareEntityData("65A5BFD9-028A-4D4F-8B89-3A60B2E06F83",
-- 		"D8DB98E1-AEBA-485E-9AA4-D5F55C5CDECE")

-- 	if s_LensFlareData == nil then
-- 		m_Logger:Error("Lensflare is nil")
-- 		return
-- 	end

-- 	s_LensFlareData:MakeWritable()
-- 	for l_Key, l_Value in pairs(s_LensFlareData.elements) do
-- 		local dist = 80
-- 		local dist2 = 60
-- 		local sizeAngle = Vec4(0.13, 1, 0, 0)
-- 		local alphaAngle = Vec4(0.04, 1, 0, 0)
-- 		l_Value.sizeCamDistMax = dist
-- 		l_Value.alphaCamDistMax = dist2
-- 		l_Value.sizeAngleCurve = sizeAngle
-- 		l_Value.alphaAngleCurve = alphaAngle
-- 		l_Value.sizeScreenPosCurve = l_Value.sizeScreenPosCurve
-- 		l_Value.alphaScreenPosCurve = l_Value.alphaScreenPosCurve
-- 		l_Value.size = l_Value.size * 0.92
-- 		l_Value.sizeOccluderCurve = l_Value.sizeOccluderCurve * 1
-- 		l_Value.alphaCamDistCurve = l_Value.alphaCamDistCurve * 1
-- 		l_Value.alphaOccluderCurve = l_Value.alphaOccluderCurve * 1
-- 	end

-- 	local s_ComponentData = LensFlareComponentData(MathUtils:RandomGuid())
-- 	s_ComponentData.lensFlare = s_LensFlareData
-- 	s_ComponentData.transform = LinearTransform(
-- 		Vec3(-1, 0, 0),
-- 		Vec3(0, 1, 0),
-- 		Vec3(0, 0, -1),
-- 		Vec3(0, 0, 0)
-- 	)

-- 	return s_ComponentData
-- end

-- function VehicleManager:AddEventConnection(p_Blueprint, p_ConnectionType, p_Source, p_SourceEvent, p_Target,
-- 										   p_TargetEvent)
-- 	local s_EventConnection = EventConnection()
-- 	s_EventConnection.source = p_Source
-- 	s_EventConnection.target = p_Target
-- 	s_EventConnection.sourceEvent.id = tonumber(p_SourceEvent) or MathUtils:FNVHash(p_SourceEvent)
-- 	s_EventConnection.targetEvent.id = tonumber(p_TargetEvent) or MathUtils:FNVHash(p_TargetEvent)
-- 	s_EventConnection.targetType = p_ConnectionType

-- 	p_Blueprint.eventConnections:add(s_EventConnection)
-- end

-- return VehicleManager()
