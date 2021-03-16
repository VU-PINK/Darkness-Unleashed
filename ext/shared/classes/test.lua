local Settings = require '__shared/settings'

-- Dynamic Code
-- Detection Code <- 
local VehicleSettings = require '__shared/vehicles'

local vehicleNameList = {}

--Events:Subscribe('Extension:Loaded', function()
	-- if(Settings.useVehicleLights_Ground) then
	-- 	for index, vehicle in pairs(VehicleSettings.ground) do
	-- 		table.insert(vehicleNameList, VehicleSettings.name)
	-- 	end
	-- end
--end)

--Events:Subscribe('Partition:Loaded', function(partition)
	-- do nothing
--end)

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

	if pointLightSettingsArray.weaponmounted then
		local weaponData = WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.weaponGUID)))
		
		if weaponData.isReadOnly then
			weaponData:MakeWritable()
		end

		weaponData.components:add(newPointlightComponentData)
		print('Added weapon pointlight!')
	else
		
		if chassisData.isReadOnly then
			chassisData:MakeWritable()
		end
        
		chassisData.components:add(newPointlightComponentData)
		print('Added pointlight!')
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

	local newSpotlightComponentData = LightComponentData()
	newSpotlightComponentData.light = newSpotLight
	newSpotlightComponentData.transform = LinearTransform(
		spotLightSettingsArray.transform.left,
		spotLightSettingsArray.transform.up,
		spotLightSettingsArray.transform.forward,
		spotLightSettingsArray.transform.trans
	)

	if spotLightSettingsArray.weaponmounted then
		print('Added weapon spotlight!')
		local weaponData = WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.weaponGUID)))
		
		if weaponData.isReadOnly then
			weaponData:MakeWritable()
		end
		
		weaponData.components:add(newSpotlightComponentData)
	else
		
		if chassisData.isReadOnly then
			chassisData:MakeWritable()
		end
        
		chassisData.components:add(newSpotlightComponentData)
		print('Added spotlight!')
	end
end

local 
Events:Subscribe('Level:RegisterEntityResources', function(levelData)
	
	for typeIndex, vehicleType in pairs(VehicleSettings) do
		
		for vehicleIndex, vehicle in pairs(vehicleType) do
			
			local chassisData = ChassisComponentData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.chassisGUID)))
			
			if chassisData ~= nil then
				
				for componentIndex, component in pairs(vehicle.Components) do
					
					if component.type == 1 and component.enabled then
						
						AddPointLight(component, chassisData, vehicle)
					
					elseif component.type == 2 and component.enabled then
						
						AddSpotLight(component, chassisData, vehicle)
					
					end

				end

			end
		end

	end

end)