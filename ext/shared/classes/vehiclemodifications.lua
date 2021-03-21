local Settings = require '__shared/settings'

-- Dynamic Code
-- Detection Code <- 
local VehicleSettings = require '__shared/vehicles'

local vehicleNameList = {}
local newEntities = {}

Events:Subscribe('Extension:Loaded', function()
	-- if(Settings.useVehicleLights_Ground) then
	-- 	for index, vehicle in pairs(VehicleSettings.ground) do
	-- 		table.insert(vehicleNameList, VehicleSettings.name)
	-- 	end
	-- end
end)

Events:Subscribe('Partition:Loaded', function(partition)
	local vehicleGUID = tostring(partition.guid)
	local vehicleSettings = nil

	for typeIndex, vehicleType in pairs(VehicleSettings) do
		for vehicleIndex, vehicle in pairs(vehicleType) do
			if(vehicle.partitionGUID == vehicleGUID) then
				print('Vehicle found: ' .. vehicle.name)
				vehicleSettings = vehicle
			end
		end
	end	
	
	if vehicleSettings == nil then
		return
	end

	for _, instance in pairs(partition.instances) do
		if instance:Is('ChassisComponentData') then
			print('Found ChassisComponentData!')
			local chassisData = ChassisComponentData(instance)
			
			for componentIndex, component in pairs(vehicleSettings.Components) do
				if(component.type == 1) and (component.enabled) then
					AddPointLight(component, chassisData, vehicleSettings)
				elseif(component.type == 2) and (component.enabled) then
					AddSpotLight(component, chassisData, vehicleSettings)
				end
			end

		end
	end
end)

function AddPointLight(pointLightSettingsArray, chassisData, vehicle)
	local newPointLight = PointLightEntityData()
	local newPointlightComponentData = LightComponentData()

	newPointLight.radius = pointLightSettingsArray.radius
	newPointLight.color = pointLightSettingsArray.color

	newPointlightComponentData.light = newPointLight
	newPointlightComponentData.transform = LinearTransform(
		pointLightSettingsArray.transform.left,
		pointLightSettingsArray.transform.up,
		pointLightSettingsArray.transform.forward,
		pointLightSettingsArray.transform.trans
	)

	if(pointLightSettingsArray.weaponmounted) then
		--local weaponData = WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.weaponGUID)))
		--weaponData:MakeWritable()
		--weaponData.components:add(newPointlightComponentData)
		--print('Added weapon pointlight!')
		--newEntities[table.getn(newEntities)+1] = {weaponData, newPointlightComponentData}
		--table.insert(newEntities, {vehicle.partitionGUID, vehicle.weaponGUID, pointLightSettingsArray})
		--table.insert(newEntities, {weaponData, newPointlightComponentData})
	else
		chassisData:MakeWritable()
		chassisData.components:add(newPointlightComponentData)
		print('Added pointlight!')
		--newEntities[table.getn(newEntities)+1] = {weaponData, newPointlightComponentData}
		--table.insert(newEntities, {weaponData, newPointlightComponentData})
	end

end

function AddSpotLight(spotLightSettingsArray, chassisData, vehicle)
	local newSpotLight = SpotLightEntityData()
	newSpotLight.shape = spotLightSettingsArray.shape
	newSpotLight.frustumFov = spotLightSettingsArray.frustumFov
	newSpotLight.frustumAspect = spotLightSettingsArray.frustumAspect
	newSpotLight.castShadowsMinLevel = spotLightSettingsArray.castShadowsMinLevel
	newSpotLight.castShadowsEnable = spotLightSettingsArray.castShadowsEnable
	newSpotLight.intensity = spotLightSettingsArray.intensity
	newSpotLight.radius = spotLightSettingsArray.radius
	newSpotLight.texture = TextureAsset(ResourceManager:FindInstanceByGuid(Guid("04C62561-2236-11DF-A528-EA655525F02D"), Guid("2EE018E8-1451-908C-0974-DB7676407D61")))
	print(newSpotLight.texture)

	local newSpotlightComponentData = LightComponentData()
	newSpotlightComponentData.light = newSpotLight
	newSpotlightComponentData.transform = LinearTransform(
		spotLightSettingsArray.transform.left,
		spotLightSettingsArray.transform.up,
		spotLightSettingsArray.transform.forward,
		spotLightSettingsArray.transform.trans
	)

	if(spotLightSettingsArray.weaponmounted) then
		
		--print('Added weapon spotlight!')
		--newEntities[table.getn(newEntities)+1] = {weaponData, newSpotlightComponentData}
		table.insert(newEntities, {vehicle.partitionGUID, vehicle.weaponGUID, spotLightSettingsArray})
	else
		chassisData:MakeWritable()
		chassisData.components:add(newSpotlightComponentData)
		print('Added spotlight!')
		--newEntities[table.getn(newEntities)+1] = {chassisData, newSpotlightComponentData}
		--table.insert(newEntities, {chassisData, newSpotlightComponentData})
	end
end


Events:Subscribe('Level:RegisterEntityResources', function(levelData)
	for componentIndex, components in pairs(newEntities) do
		print('Added Light!')

		local newSpotLight = SpotLightEntityData()
		spotLightSettingsArray = components[3]
		newSpotLight.shape = spotLightSettingsArray.shape
		newSpotLight.frustumFov = spotLightSettingsArray.frustumFov
		newSpotLight.frustumAspect = spotLightSettingsArray.frustumAspect
		newSpotLight.castShadowsMinLevel = spotLightSettingsArray.castShadowsMinLevel
		newSpotLight.castShadowsEnable = spotLightSettingsArray.castShadowsEnable
		newSpotLight.intensity = spotLightSettingsArray.intensity
		newSpotLight.radius = spotLightSettingsArray.radius
		newSpotLight.texture = TextureAsset(ResourceManager:FindInstanceByGuid(Guid('04C62561-2236-11DF-A528-EA655525F02D'), Guid('2EE018E8-1451-908C-0974-DB7676407D61')))

		local newSpotlightComponentData = LightComponentData()
		newSpotlightComponentData.light = newSpotLight
		newSpotlightComponentData.transform = LinearTransform(
		spotLightSettingsArray.transform.left,
		spotLightSettingsArray.transform.up,
		spotLightSettingsArray.transform.forward,
		spotLightSettingsArray.transform.trans
		)

		local weaponData = WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid(components[1]), Guid(components[2])))
		weaponData:MakeWritable()
		weaponData.components:add(newSpotlightComponentData)
		
	end
end)