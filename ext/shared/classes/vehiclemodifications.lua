Events:Subscribe('Level:RegisterEntityResources', function(levelData)

	-- STANDARD 
	--local humveeVehicleEntityData = VehicleEntityData(ResourceManager:FindInstanceByGuid(Guid("611F48A3-0919-11E0-985D-C512734E48AF"), Guid("34ADD228-7E03-C4A4-665F-E0F0955098EE")))
	-- ASRAD
	local humveeVehicleEntityData = VehicleEntityData(ResourceManager:FindInstanceByGuid(Guid("F7C250D2-ECEB-481F-A130-D91FE8B693E0"), Guid("1DE37416-42D8-461E-B727-2159DB141204")))	

	if humveeVehicleEntityData ~= nil then
	
		humveeVehicleEntityData:MakeWritable()

		-- Spotlights
		local vehicleSpotLight = SpotLightEntityData()
		vehicleSpotLight.shape = 1
		vehicleSpotLight.coneInnerAngle = 10
		vehicleSpotLight.coneOuterAngle = 5
		vehicleSpotLight.frustumFov = 100
		vehicleSpotLight.frustumAspect = 1.25
		vehicleSpotLight.texture = TextureAsset(ResourceManager:FindInstanceByGuid(Guid("04C62561-2236-11DF-A528-EA655525F02D"), Guid("2EE018E8-1451-908C-0974-DB7676407D61")))
		vehicleSpotLight.castShadowsMinLevel = 0
		vehicleSpotLight.castShadowsEnable = true
		vehicleSpotLight.intensity = 0.20
		vehicleSpotLight.radius = 150

		local vehicleSpotLightFar = SpotLightEntityData()
		vehicleSpotLightFar.shape = 1
		vehicleSpotLightFar.coneInnerAngle = 10
		vehicleSpotLightFar.coneOuterAngle = 5
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

		local vehicleLightComponentData2 = LightComponentData()
		vehicleLightComponentData2.light = vehicleSpotLight

		vehicleLightComponentData2.transform = LinearTransform(
			Vec3(-1, 0, 0), --rotation
			Vec3(0, 1, 0),
			Vec3(0, 0, 1),
			Vec3(0.525, 0.65, 3) --pos (sideways,height,frontback)
		)

		local vehicleLightComponentDataFar = LightComponentData()
		vehicleLightComponentDataFar.light = vehicleSpotLightFar

		vehicleLightComponentDataFar.transform = LinearTransform(
			Vec3(-1, 0, 0), --rotation
			Vec3(0, 1, 0),
			Vec3(0, 0, 1),
			Vec3(-0.525, 0.65, 3) --pos (sideways,height,frontback)
		)

		local vehicleLightComponentDataFar2 = LightComponentData()
		vehicleLightComponentDataFar2.light = vehicleSpotLightFar

		vehicleLightComponentDataFar2.transform = LinearTransform(
			Vec3(-1, 0, 0), --rotation  
			Vec3(0, 1, 0), 
			Vec3(0, 0, 1), 
			Vec3(0.525, 0.65, 3) --pos (sideways,height,frontback)
		)

		-- PointLights


		-- Lens Flares
		local LensFlare = LensFlareEntityData(ResourceManager:FindInstanceByGuid(Guid("65A5BFD9-028A-4D4F-8B89-3A60B2E06F83"), Guid("D8DB98E1-AEBA-485E-9AA4-D5F55C5CDECE")))
		local LensFlare1 = LensFlareComponentData()
		LensFlare1.lensFlare = LensFlare

		LensFlare1.transform = LinearTransform(
			Vec3(-1.0, 0.0, 8.74227765735e-08), --rotation
			Vec3(0, 1, 0),
			Vec3(-8.74227765735e-08, 0, -1),
			Vec3(-0.525, 1.5, 3) --pos (sideways,height,frontback)
		)

		local LensFlare2 = LensFlareComponentData()
		LensFlare2.lensFlare = LensFlare

		LensFlare2.transform = LinearTransform(
			Vec3(-1.0, 0.0, 8.74227765735e-08), --rotation
			Vec3(0, 1, 0),
			Vec3(-8.74227765735e-08, 0, -1),
			Vec3(0, 0, 0) --pos (sideways,height,frontback)
		)

		-- Standard
		--local humveeChassisComponentData = ChassisComponentData(ResourceManager:FindInstanceByGuid(Guid("611F48A3-0919-11E0-985D-C512734E48AF"), Guid("DA89EB6C-A824-A813-A6C5-E2DEF9D4F4FF")))
		-- ASRAD
		local humveeChassisComponentData = ChassisComponentData(ResourceManager:FindInstanceByGuid(Guid("F7C250D2-ECEB-481F-A130-D91FE8B693E0"), Guid("5D10A701-196F-4DA9-8D83-610ABF56124B")))
		--local humveeChassisComponentData = ChassisComponentData(humveeChassisComponentDataGuid)
		humveeChassisComponentData:MakeWritable()

		humveeChassisComponentData.components:add(vehicleLightComponentData)
		humveeChassisComponentData.components:add(vehicleLightComponentData2)
		humveeChassisComponentData.components:add(vehicleLightComponentDataFar)
		humveeChassisComponentData.components:add(vehicleLightComponentDataFar2)
		--humveeChassisComponentData.components:add(LensFlare1)
		--humveeChassisComponentData.components:add(LensFlare2)

		
		print("Humweed goes poof")
		done = true

	else
		print("A")
	end
	
end)
