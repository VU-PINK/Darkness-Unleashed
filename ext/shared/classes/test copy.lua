local Settings = require '__shared/settings'

 -- Dynamic Code
-- Detection Code <-
local VehicleSettings = require '__shared/vehicles'

local vehicleNameList = {}
local vehicleEntityData = nil

function AddPointLight(pointLightSettingsArray, chassisData, vehicle)

	vehicleEntityData = VehicleEntityData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.vehicleDataGUID)))
	vehicleEntityData:MakeWritable()

 	local newPointLight = PointLightEntityData()
 	newPointLight.radius = pointLightSettingsArray.radius
 	--newPointLight.width = pointLightSettingsArray.width
 	newPointLight.color = pointLightSettingsArray.color
 	newPointLight.intensity = pointLightSettingsArray.intensity
 	newPointLight.visible = pointLightSettingsArray.visible

 	local newPointlightComponentData = LightComponentData()
 	newPointlightComponentData.light = newPointLight
 	newPointlightComponentData.transform = LinearTransform(
 		pointLightSettingsArray.transform.left,
 		pointLightSettingsArray.transform.up,
 		pointLightSettingsArray.transform.forward,
 		pointLightSettingsArray.transform.trans
 	)

 	if pointLightSettingsArray.weaponmounted then
		local weaponData = nil
		if pointLightSettingsArray.weapon2 == true then
			weaponData = WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.weaponGUID2)))
	   	else
		   	weaponData = WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.weaponGUID)))
	   	end
 		--print(weaponData)
 		if weaponData.isReadOnly then
 			weaponData:MakeWritable()
 			--print('Made Writable')
 		end
		
 		weaponData.components:add(newPointlightComponentData)
		vehicleEntityData.runtimeComponentCount = vehicleEntityData.runtimeComponentCount + 1

 		print('Added weapon pointlight to ' .. vehicle.name)
		
 	else
 		--print(chassisData)
 		if chassisData.isReadOnly then
 			chassisData:MakeWritable()
 			--print('Made Writable')
 		end

 		chassisData.components:add(newPointlightComponentData)
		vehicleEntityData.runtimeComponentCount = vehicleEntityData.runtimeComponentCount + 1
		
 		print('Added '..pointLightSettingsArray.description..' to ' .. vehicle.name)
 	end

end

function AddSpotLight(spotLightSettingsArray, chassisData, vehicle)

	vehicleEntityData = VehicleEntityData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.vehicleDataGUID)))
	vehicleEntityData:MakeWritable()

 	local newSpotLight = SpotLightEntityData()
 	newSpotLight.shape = spotLightSettingsArray.shape
 	newSpotLight.intensity = spotLightSettingsArray.intensity
 	newSpotLight.color = spotLightSettingsArray.color
 	newSpotLight.frustumFov = spotLightSettingsArray.frustumFov
 	newSpotLight.frustumAspect = spotLightSettingsArray.frustumAspect
 	newSpotLight.texture = TextureAsset(ResourceManager:FindInstanceByGuid(Guid('04C62561-2236-11DF-A528-EA655525F02D'), Guid('2EE018E8-1451-908C-0974-DB7676407D61')))
 	newSpotLight.castShadowsMinLevel = 0
 	newSpotLight.castShadowsEnable = true
 	newSpotLight.radius = spotLightSettingsArray.radius

 	local newSpotlightComponentData = LightComponentData()
 	newSpotlightComponentData.light = newSpotLight
 	newSpotlightComponentData.transform = LinearTransform(
 		spotLightSettingsArray.transform.left,
 		spotLightSettingsArray.transform.up,
 		spotLightSettingsArray.transform.forward,
 		spotLightSettingsArray.transform.trans
 	)

 	if spotLightSettingsArray.weaponmounted then
		local weaponData = nil
		if spotLightSettingsArray.weapon2 == true then
 			weaponData = WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.weaponGUID2)))
		else
			weaponData = WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.weaponGUID)))
		end
 		--print(weaponData)
 		if weaponData.isReadOnly then
 			weaponData:MakeWritable()
 			--print('Made Writable')
 		end

		AddLensFlare(spotLightSettingsArray.name, weaponData, spotLightSettingsArray.transform.trans) 
		 
 		weaponData.components:add(newSpotlightComponentData)
		vehicleEntityData.runtimeComponentCount = vehicleEntityData.runtimeComponentCount + 1

 		print('Added weapon spotlight to ' .. vehicle.name)

		--FindInArray(weaponData.components, newSpotlightComponentData)
 	else
 		--print(chassisData)
 		if chassisData.isReadOnly then
 			chassisData:MakeWritable()
 			--print('Made Writable')
 		end

		AddLensFlare(spotLightSettingsArray.name, chassisData, spotLightSettingsArray.transform.trans)

 		chassisData.components:add(newSpotlightComponentData)
		vehicleEntityData.runtimeComponentCount = vehicleEntityData.runtimeComponentCount + 1

		print('Added '..spotLightSettingsArray.description..' to ' .. vehicle.name)

		if spotLightSettingsArray.mirrored == true then
		AddMirrorSpotlight(spotLightSettingsArray.name, chassisData, spotLightSettingsArray)
		end 

		--FindInArray(chassisData.components, newSpotlightComponentData)
 	end
end

local chassisData = nil
local vehicleData = nil

Events:Subscribe('Level:RegisterEntityResources', function(levelData)

 	for typeIndex, vehicleType in pairs(VehicleSettings) do

 		for vehicleIndex, vehicle in pairs(vehicleType) do

			--print(vehicle.name .." | ".. vehicle.partitionGUID .." |  ".. vehicle.chassisGUID)
			chassisData = ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.chassisGUID))

				if chassisData ~= nil then
					chassisData = ChassisComponentData(chassisData)

 					for componentIndex, component in pairs(vehicle.Components) do

 						if component.type == 1 and component.enabled then

							AddPointLight(component, chassisData, vehicle)

 						elseif component.type == 2 and component.enabled then

							AddSpotLight(component, chassisData, vehicle)

						end

 					end
				print('--------------------------------------------------')
				end
				
 		end
		 

 	end

end)

function FindInArray(array, value)
	for index,item in pairs(array) do
		if(item == value) then
			print('Found '..item..' in '..index)
			return true
		else 
			print(array)
		end
	end
	return false
end


function AddLensFlare(name, data, trans)
	local LensFlare = LensFlareEntityData(ResourceManager:FindInstanceByGuid(Guid("65A5BFD9-028A-4D4F-8B89-3A60B2E06F83"), Guid("D8DB98E1-AEBA-485E-9AA4-D5F55C5CDECE")))
	LensFlare:MakeWritable()

	for key, value in pairs(LensFlare.elements) do
		value.sizeCamDistMax = 90
		value.sizeAngleCurve = value.sizeAngleCurve * 1
		value.size = value.size * 1
		value.sizeOccluderCurve = value.sizeOccluderCurve * 1
		value.sizeScreenPosCurve = value.sizeScreenPosCurve * 1
		value.alphaCamDistCurve = value.alphaCamDistCurve * 1
		value.alphaOccluderCurve = value.alphaOccluderCurve * 1
		value.alphaAngleCurve = value.alphaScreenPosCurve * 1
		value.alphaScreenPosCurve = value.alphaScreenPosCurve * 1
		value.alphaCamDistMax = 75
	end

	local name = LensFlareComponentData()
	name.lensFlare = LensFlare

	name.transform = LinearTransform(
		Vec3(-1.0, 0.0, 8.74227765735e-08), --rotation
		Vec3(0, 1, 0),
		Vec3(-8.74227765735e-08, 0, -1),
		trans*1
		)

	data.components:add(name)
	vehicleEntityData.runtimeComponentCount = vehicleEntityData.runtimeComponentCount + 1

	print('Added Lensflare: ' .. tostring(name))
	print('Component Data: ' .. tostring(data))

end


function AddMirrorSpotlight(name, data, settings)
	local newSpotLight = SpotLightEntityData()
 	newSpotLight.shape = settings.shape
 	newSpotLight.intensity = settings.intensity
 	newSpotLight.color = settings.color
 	newSpotLight.frustumFov = settings.frustumFov
 	newSpotLight.frustumAspect = settings.frustumAspect
 	newSpotLight.texture = TextureAsset(ResourceManager:FindInstanceByGuid(Guid('04C62561-2236-11DF-A528-EA655525F02D'), Guid('2EE018E8-1451-908C-0974-DB7676407D61')))
 	newSpotLight.castShadowsMinLevel = 0
 	newSpotLight.castShadowsEnable = true
 	newSpotLight.radius = settings.radius

 	local name = LightComponentData()
 	name.light = newSpotLight
 	name.transform = LinearTransform(
		settings.transform.left,
		settings.transform.up,
		settings.transform.forward,
		settings.transform.trans * Vec3((-1), 1, 1)
 	)

	data.components:add(name)
	vehicleEntityData.runtimeComponentCount = vehicleEntityData.runtimeComponentCount + 1

	print('Added ' .. settings.description .. ' Mirror Spotlight')

end