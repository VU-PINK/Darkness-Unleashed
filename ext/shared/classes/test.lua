local Settings = require '__shared/settings'

 -- Dynamic Code
-- Detection Code <-
local VehicleSettings = require '__shared/vehicles'

local vehicleNameList = {}

function AddPointLight(pointLightSettingsArray, chassisData, vehicle)
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
 		local weaponData = WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.weaponGUID)))
 		print(weaponData)
 		if weaponData.isReadOnly then
 			weaponData:MakeWritable()
 			print('Made Writable')
 		end

 		weaponData.components:add(newPointlightComponentData)
 		print('Added weapon pointlight to ' .. vehicle.name)
		
 	else
 		print(chassisData)
 		if chassisData.isReadOnly then
 			chassisData:MakeWritable()
 			print('Made Writable')
 		end

 		chassisData.components:add(newPointlightComponentData)
 		print('Added pointlight to ' .. vehicle.name)
 	end

end

function AddSpotLight(spotLightSettingsArray, chassisData, vehicle)
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
 		local weaponData = WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.weaponGUID)))
 		print(weaponData)
 		if weaponData.isReadOnly then
 			weaponData:MakeWritable()
 			print('Made Writable')
 		end
 		weaponData.components:add(newSpotlightComponentData)
 		print('Added weapon spotlight to ' .. vehicle.name)
 	else
 		print(chassisData)
 		if chassisData.isReadOnly then
 			chassisData:MakeWritable()
 			print('Made Writable')
 		end
 		chassisData.components:add(newSpotlightComponentData)
 		print('Added spotlight to ' .. vehicle.name)
 	end
end

local chassisData = nil
local vehicleData = nil
local instance

Events:Subscribe('Level:RegisterEntityResources', function(levelData)

 	for typeIndex, vehicleType in pairs(VehicleSettings) do

 		for vehicleIndex, vehicle in pairs(vehicleType) do

			print(vehicle.name .." | ".. vehicle.partitionGUID .." |  ".. vehicle.chassisGUID)
			chassisData = ResourceManager:FindInstanceByGuid(Guid(vehicle.partitionGUID), Guid(vehicle.chassisGUID))

				if chassisData ~= nil then
				chassisData = ChassisComponentData(chassisData)

 					for componentIndex, component in pairs(vehicle.Components) do

 						if component.type == 1 and component.enabled then
							
 							print(tostring(chassisData) .. ' Chassis Data')
 							AddPointLight(component, chassisData, vehicle)

 						elseif component.type == 2 and component.enabled then

 							print(tostring(chassisData) .. ' Chassis Data')
							AddSpotLight(component, chassisData, vehicle)

						end

 					end

				end
				
 		end

 	end

end)


-- LESLEY PLS NEVER DO THIS EVER AGAIN -- 
-- PLS USE --[[ ]] for large amounts of code

--[[Events:Subscribe('Level:RegisterEntityResources', function(levelData)
	-- AH1Z Viper 
	local viperWeaponComponentData = nil
	local viperChassisComponentData = nil
	if WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid("89BE53B6-2FF4-11DE-8C23-DAB1D69416DE"), Guid("89BEA24B-2FF4-11DE-8C23-DAB1D69416DE"))) then 
		viperWeaponComponentData = WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid("89BE53B6-2FF4-11DE-8C23-DAB1D69416DE"), Guid("89BEA24B-2FF4-11DE-8C23-DAB1D69416DE")))
		--y u dont liek dis c0mponent?!?!? 
		viperChassisComponentData = VehicleComponentData(ResourceManager:FindInstanceByGuid(Guid("89BE53B6-2FF4-11DE-8C23-DAB1D69416DE"), Guid("D959DF11-EA30-D238-A0D5-5687735963E4")))
		print("Found MI28")
	else 
		print("No MI28 found")
		return
	end

	

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

		viperWeaponComponentData.components:add(weaponSpotlightComponentData)
		print("Added Spotlight MI28")

		local weaponPointlight = PointLightEntityData()
		weaponPointlight.width = 0.35

		local weaponPointlightComponentData = LightComponentData()
		weaponPointlightComponentData.light = weaponPointlight

		weaponPointlightComponentData.transform = LinearTransform(
			Vec3(-1, 0, 0), --rotation
			Vec3(0, 1, 0),
			Vec3(0, 0, 1),
			Vec3(0, 0, 0) --pos (sideways,height,frontback)
		)

		-- PointLights
		local VehiclePointlight = PointLightEntityData()
		VehiclePointlight.radius = 2
		VehiclePointlight.color = Vec3(1, 0, 0)
		VehiclePointlight.intensity = 5
		VehiclePointlight.visible = true
		VehiclePointlight.enlightenEnable = false

		local VehiclePointlightComponentData = LightComponentData()
		VehiclePointlightComponentData.light = VehiclePointlight

		VehiclePointlightComponentData.transform = LinearTransform(
			Vec3(-1, 0, 0), --rotation
			Vec3(0, 1, 0),
			Vec3(0, 0, 1),
			Vec3(0, 1, -2.25) --pos (sideways,height,frontback)
		)

		local VehiclePointlight2 = PointLightEntityData()
		VehiclePointlight2.radius = 3
		VehiclePointlight2.color = Vec3(0, 1, 0)
		VehiclePointlight2.intensity = 5
		VehiclePointlight2.visible = true
		VehiclePointlight2.enlightenEnable = true

		local VehiclePointlightComponentData2 = LightComponentData()
		VehiclePointlightComponentData2.light = VehiclePointlight2

		VehiclePointlightComponentData2.transform = LinearTransform(
			Vec3(-1, 0, 0), --rotation
			Vec3(0, 1, 0),
			Vec3(0, 0, 1),
			Vec3(0, 0.25, 2.5) --pos (sideways,height,frontback)
		)

		-- Lens Flares
		local LensFlare = LensFlareEntityData(ResourceManager:FindInstanceByGuid(Guid("65A5BFD9-028A-4D4F-8B89-3A60B2E06F83"), Guid("D8DB98E1-AEBA-485E-9AA4-D5F55C5CDECE")))

		LensFlare:MakeWritable()

		for key, value in pairs(LensFlare.elements) do
			value.sizeCamDistMax = value.sizeCamDistMax*4
			value.sizeAngleCurve = value.sizeAngleCurve*0.75
			value.size = value.size*0.35
			value.sizeOccluderCurve = value.sizeOccluderCurve*1.5
			value.sizeScreenPosCurve = value.sizeScreenPosCurve*1.5
			value.alphaCamDistCurve = value.alphaCamDistCurve*1.5
			value.alphaOccluderCurve = value.alphaOccluderCurve*1.5
			value.alphaAngleCurve = value.alphaScreenPosCurve*0.75
			value.alphaScreenPosCurve = value.alphaScreenPosCurve*1.5
			value.alphaCamDistMax = value.alphaCamDistMax*4
			print("LensFlare Changed")
		end

		local LensFlare1 = LensFlareComponentData()
		LensFlare1.lensFlare = LensFlare
		
		LensFlare1.transform = LinearTransform(
			Vec3(-1.0, 0.0, 8.74227765735e-08), --rotation
			Vec3(0, 1, 0),
			Vec3(-8.74227765735e-08, 0, -1),
			Vec3(0, -0.19, -1.1) --pos (sideways,height,frontback)
			)

		viperWeaponComponentData.components:add(weaponPointlightComponentData)
		viperWeaponComponentData.components:add(LensFlare1)
		viperChassisComponentData.components:add(VehiclePointlightComponentData)
		viperChassisComponentData.components:add(VehiclePointlightComponentData2)
		print("Added Lights MI28")
	end


end)]]