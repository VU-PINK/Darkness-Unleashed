local Settings = require '__shared/settings'
local RM = require '__shared/classes/tools/resourcemanager'
local Tool = require '__shared/classes/tools/tool'

<<<<<<< HEAD
	-- HMMVWV 
	local hmveeChassisComponentData = nil
	--if ChassisComponentData(ResourceManager:FindInstanceByGuid(Guid("611F48A3-0919-11E0-985D-C512734E48AF"), Guid("DA89EB6C-A824-A813-A6C5-E2DEF9D4F4FF"))) then 
		--hmmwvChassisComponentData = ChassisComponentData(ResourceManager:FindInstanceByGuid(Guid("611F48A3-0919-11E0-985D-C512734E48AF"), Guid("DA89EB6C-A824-A813-A6C5-E2DEF9D4F4FF")))
	--elseif ChassisComponentData(ResourceManager:FindInstanceByGuid(Guid("F7C250D2-ECEB-481F-A130-D91FE8B693E0"), Guid("5D10A701-196F-4DA9-8D83-610ABF56124B"))) then
		hmmwvChassisComponentData = ChassisComponentData(ResourceManager:FindInstanceByGuid(Guid("F7C250D2-ECEB-481F-A130-D91FE8B693E0"), Guid("5D10A701-196F-4DA9-8D83-610ABF56124B")))
	--else 
	--	print("No HMMVWV found")
	--	return
	--end

	if hmmwvChassisComponentData ~= nil then
		-- Spotlights
		local vehicleSpotLight = SpotLightEntityData()
		vehicleSpotLight.shape = 1
		vehicleSpotLight.frustumFov = 100
		vehicleSpotLight.frustumAspect = 1.25
		vehicleSpotLight.texture = TextureAsset(ResourceManager:FindInstanceByGuid(Guid("04C62561-2236-11DF-A528-EA655525F02D"), Guid("2EE018E8-1451-908C-0974-DB7676407D61")))
		vehicleSpotLight.castShadowsMinLevel = 0
		vehicleSpotLight.castShadowsEnable = true
		vehicleSpotLight.intensity = 0.20
		vehicleSpotLight.radius = 150

		local vehicleSpotLightFar = SpotLightEntityData()
		vehicleSpotLightFar.shape = 1
		--vehicleSpotLightFar.orthoWidth = 50
		--vehicleSpotLightFar.orthoHeight = 20
		vehicleSpotLightFar.frustumFov = 55
		vehicleSpotLightFar.frustumAspect = 1
		vehicleSpotLightFar.texture = TextureAsset(ResourceManager:FindInstanceByGuid(Guid("04C62561-2236-11DF-A528-EA655525F02D"), Guid("2EE018E8-1451-908C-0974-DB7676407D61")))
		vehicleSpotLightFar.castShadowsMinLevel = 0
		vehicleSpotLightFar.castShadowsEnable = true
		vehicleSpotLightFar.intensity = 1.75
		vehicleSpotLightFar.radius = 220

		local vehicleLightComponentData = LightComponentData()
		vehicleLightComponentData.light = vehicleSpotLight

		vehicleLightComponentData.transform = LinearTransform(
			Vec3(-1, 0, 0), --rotation
			Vec3(0, 1, 0),
			Vec3(0, 0, 1),
			Vec3(-0.525, 0.65, 3) --pos (sideways,height,frontback)
		)
=======
local VehicleSettings = require '__shared/vehicles'
>>>>>>> 480e4742c7a56ca4b631f34145aa8881f5eec885

local vehicleNameList = {}
local vehicleEntityData = nil

function AddPointLight(pointLightSettingsArray, chassisData, vehicle)

	if vehicle == nil then
		return
	end

	vehicleEntityData = RM:VED(vehicle.partitionGUID, vehicle.vehicleDataGUID) 				--VehicleEntityData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.vehicleDataGUID)))
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
			weaponData = RM:WCP(vehicle.partitionGUID, vehicle.weaponGUID2)					--WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.weaponGUID2)))
	   	else
		   	weaponData = RM:WCP(vehicle.partitionGUID, vehicle.weaponGUID)					--WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.weaponGUID)))
	   	end

 		if weaponData.isReadOnly then
 			weaponData:MakeWritable()
 		end
		
 		weaponData.components:add(newPointlightComponentData)
		vehicleEntityData.runtimeComponentCount = vehicleEntityData.runtimeComponentCount + 1

		Tool:DebugPrint('Added weapon pointlight to ' .. vehicle.name)
		
 	else
 		--print(chassisData)
 		if chassisData.isReadOnly then
 			chassisData:MakeWritable()
 			--print('Made Writable')
 		end

 		chassisData.components:add(newPointlightComponentData)
		vehicleEntityData.runtimeComponentCount = vehicleEntityData.runtimeComponentCount + 1
		
		Tool:DebugPrint('Added '..pointLightSettingsArray.description..' to ' .. vehicle.name)
 	end

end

function AddSpotLight(spotLightSettingsArray, chassisData, vehicle)

	-- if vehicle == nil then
	-- 	return
	-- end

	vehicleEntityData = RM:VED(vehicle.partitionGUID, vehicle.vehicleDataGUID)				--VehicleEntityData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.vehicleDataGUID)))
	vehicleEntityData:MakeWritable()

 	local newSpotLight = SpotLightEntityData()
 	newSpotLight.shape = spotLightSettingsArray.shape
 	newSpotLight.intensity = spotLightSettingsArray.intensity
 	newSpotLight.color = spotLightSettingsArray.color
 	newSpotLight.frustumFov = spotLightSettingsArray.frustumFov
 	newSpotLight.frustumAspect = spotLightSettingsArray.frustumAspect
 	newSpotLight.texture = RM:Flashlight()													--TextureAsset(ResourceManager:FindInstanceByGuid(Guid('04C62561-2236-11DF-A528-EA655525F02D'), Guid('2EE018E8-1451-908C-0974-DB7676407D61')))
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
 			weaponData = RM:WCP(vehicle.partitionGUID, vehicle.weaponGUID2) 					--WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.weaponGUID2)))
		else
			weaponData = RM:WCP(vehicle.partitionGUID, vehicle.weaponGUID)					--WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.weaponGUID)))
		end
 		--print(weaponData)
 		if weaponData.isReadOnly then
 			weaponData:MakeWritable()
 			--print('Made Writable')
 		end

		AddLensFlare(spotLightSettingsArray.name, weaponData, spotLightSettingsArray.transform.trans, vehicle) 
		 
 		weaponData.components:add(newSpotlightComponentData)
		vehicleEntityData.runtimeComponentCount = vehicleEntityData.runtimeComponentCount + 1

		Tool:DebugPrint('Added weapon spotlight to ' .. vehicle.name)

		--FindInArray(weaponData.components, newSpotlightComponentData)
 	else
 		--print(chassisData)
 		if chassisData.isReadOnly then
 			chassisData:MakeWritable()
 			--print('Made Writable')
 		end

		AddLensFlare(spotLightSettingsArray.name, chassisData, spotLightSettingsArray.transform.trans, vehicle)

 		chassisData.components:add(newSpotlightComponentData)
		vehicleEntityData.runtimeComponentCount = vehicleEntityData.runtimeComponentCount + 1

		Tool:DebugPrint('Added '..spotLightSettingsArray.description..' to ' .. vehicle.name)

		if spotLightSettingsArray.transform.mirrored == true then
		AddMirrorSpotlight(spotLightSettingsArray.name, chassisData, spotLightSettingsArray, vehicle)
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
			chassisData = RM:Find(vehicle.partitionGUID, vehicle.chassisGUID)				--ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.chassisGUID))

				if chassisData ~= nil then
					chassisData = ChassisComponentData(chassisData)

 					for componentIndex, component in pairs(vehicle.Components) do

 						if component.type == 1 and component.enabled then

							AddPointLight(component, chassisData, vehicle)

 						elseif component.type == 2 and component.enabled then

							AddSpotLight(component, chassisData, vehicle)

						end

 					end
				Tool:DebugPrint('--------------------------------------------------')
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


--[[function AddLensFlare(name, data, trans)
	local LensFlare = LensFlareEntityData(ResourceManager:FindInstanceByGuid(Guid("65A5BFD9-028A-4D4F-8B89-3A60B2E06F83"), Guid("D8DB98E1-AEBA-485E-9AA4-D5F55C5CDECE")))
	LensFlare:MakeWritable()

	for key, value in pairs(LensFlare.elements) do
		value.sizeCamDistMax = 90
		value.sizeAngleCurve = value.sizeAngleCurve * 0.5
		value.size = value.size * 1
		value.sizeOccluderCurve = value.sizeOccluderCurve * 0.5
		value.sizeScreenPosCurve = value.sizeScreenPosCurve * 0.5
		value.alphaCamDistCurve = value.alphaCamDistCurve * 0.5
		value.alphaOccluderCurve = value.alphaOccluderCurve * 0.5
		value.alphaAngleCurve = value.alphaScreenPosCurve * 0.5
		value.alphaScreenPosCurve = value.alphaScreenPosCurve * 0.5
		value.alphaCamDistMax = 75
	end

	local name = LensFlareComponentData()
	name.lensFlare = LensFlare

	name.transform = LinearTransform(
		Vec3(-1.0, 0.0, 8.74227765735e-08), --rotation
		Vec3(0, 1, 0),
		Vec3(-8.74227765735e-08, 0, -1),
		trans
		)

	data.components:add(name)
	vehicleEntityData.runtimeComponentCount = vehicleEntityData.runtimeComponentCount + 1

	--print('Added Lensflare: ' .. tostring(name))
	--print('Component Data: ' .. tostring(data))

end]]

function AddLensFlare(name, data, trans, vehicle)

	if vehicle == nil then
		return
	end

<<<<<<< HEAD
	

	if viperWeaponComponentData ~= nil then

		viperWeaponComponentData:MakeWritable()
		viperChassisComponentData:MakeWritable()

		-- Spotlights
		local weaponSpotlight = SpotLightEntityData()
		weaponSpotlight.shape = 1
		weaponSpotlight.frustumFov = 35.6789
		weaponSpotlight.frustumAspect = 1.0
		weaponSpotlight.texture = TextureAsset(ResourceManager:FindInstanceByGuid(Guid("04C62561-2236-11DF-A528-EA655525F02D"), Guid("2EE018E8-1451-908C-0974-DB7676407D61")))
		weaponSpotlight.castShadowsMinLevel = 0
		weaponSpotlight.castShadowsEnable = true
		weaponSpotlight.intensity = 0.28245
		weaponSpotlight.radius = 1000
		local weaponSpotlightComponentData = LightComponentData()
		weaponSpotlightComponentData.light = weaponSpotlight

		weaponSpotlightComponentData.transform = LinearTransform(
			Vec3(-1, 0, 0), --rotation
			Vec3(0, 1, 0),
			Vec3(0, 0, 1),
			Vec3(0, 0, 0) --pos (sideways,height,frontback)
		)
=======
	if vehicle.name == 'SU35BM' or vehicle.name == 'F35' then
		return
	end
>>>>>>> 480e4742c7a56ca4b631f34145aa8881f5eec885

	local LensFlare = LensFlareEntityData(ResourceManager:FindInstanceByGuid(Guid("65A5BFD9-028A-4D4F-8B89-3A60B2E06F83"), Guid("D8DB98E1-AEBA-485E-9AA4-D5F55C5CDECE")))
	LensFlare:MakeWritable()

	for key, value in pairs(LensFlare.elements) do
		local dist = 80
		local dist2 = 60
		local sizeAngle = Vec4(0.13, 1, 0, 0)
		local alphaAngle = Vec4(0.04, 1, 0, 0)

		-- if vehicleType == Airborne and vehicle.name ~= 'Venom' then 
		-- 	dist = dist * 2.75
		-- 	dist2 = dist2 * 2.75
		-- 	sizeAngle = value.sizeAngleCurve
		-- 	alphaAngle = value.alphaAngleCurve
		-- 	print('Airborne Lensflare')
		-- end

		value.sizeCamDistMax = dist
		value.alphaCamDistMax = dist2
		value.sizeAngleCurve = sizeAngle
		value.alphaAngleCurve = alphaAngle
		value.sizeScreenPosCurve = value.sizeScreenPosCurve
		value.alphaScreenPosCurve = value.alphaScreenPosCurve
		value.size = value.size * 0.92
		value.sizeOccluderCurve = value.sizeOccluderCurve * 1
		value.alphaCamDistCurve = value.alphaCamDistCurve * 1
		value.alphaOccluderCurve = value.alphaOccluderCurve * 1

	end

	local name = LensFlareComponentData()
	name.lensFlare = LensFlare

	name.transform = LinearTransform(
		Vec3(-1.0, 0.0, 8.74227765735e-08), --rotation
		Vec3(0, 1, 0),
		Vec3(-8.74227765735e-08, 0, -1),
		trans
		)

	data.components:add(name)
	vehicleEntityData.runtimeComponentCount = vehicleEntityData.runtimeComponentCount + 1

	--print('Added Lensflare: ' .. tostring(name))
	--print('Component Data: ' .. tostring(data))

end


function AddMirrorSpotlight(name, data, settings, vehicle)
	local newSpotLight = SpotLightEntityData()
 	newSpotLight.shape = settings.shape
 	newSpotLight.intensity = settings.intensity
 	newSpotLight.color = settings.color
 	newSpotLight.frustumFov = settings.frustumFov
 	newSpotLight.frustumAspect = settings.frustumAspect
 	newSpotLight.texture = RM:Flashlight()
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

	-- add lensflare
	AddLensFlare(name, data, settings.transform.trans * Vec3((-1), 1, 1), vehicle)

	Tool:DebugPrint('Added ' .. settings.description .. ' Mirror Spotlight')

end