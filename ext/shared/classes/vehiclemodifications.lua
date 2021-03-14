Events:Subscribe('Level:RegisterEntityResources', function(levelData)

	-- HMMVWV 
	local hmveeChassisComponentData = nil
	if ChassisComponentData(ResourceManager:FindInstanceByGuid(Guid("611F48A3-0919-11E0-985D-C512734E48AF"), Guid("DA89EB6C-A824-A813-A6C5-E2DEF9D4F4FF"))) then 
		hmmwvChassisComponentData = ChassisComponentData(ResourceManager:FindInstanceByGuid(Guid("611F48A3-0919-11E0-985D-C512734E48AF"), Guid("DA89EB6C-A824-A813-A6C5-E2DEF9D4F4FF")))
	elseif ChassisComponentData(ResourceManager:FindInstanceByGuid(Guid("F7C250D2-ECEB-481F-A130-D91FE8B693E0"), Guid("5D10A701-196F-4DA9-8D83-610ABF56124B"))) then
		hmmwvChassisComponentData = ChassisComponentData(ResourceManager:FindInstanceByGuid(Guid("F7C250D2-ECEB-481F-A130-D91FE8B693E0"), Guid("5D10A701-196F-4DA9-8D83-610ABF56124B")))
	else 
		print("No HMMVWV found")
		return
	end

	if hmmwvChassisComponentData ~= nil then
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

		-- Add new components to Vehicle Chassis

		hmmwvChassisComponentData:MakeWritable()

		hmmwvChassisComponentData.components:add(vehicleLightComponentData)
		hmmwvChassisComponentData.components:add(vehicleLightComponentData2)
		hmmwvChassisComponentData.components:add(vehicleLightComponentDataFar)
		hmmwvChassisComponentData.components:add(vehicleLightComponentDataFar2)
		--hmmwvChassisComponentData.components:add(LensFlare1)
		--hmmwvChassisComponentData.components:add(LensFlare2)

		
		print("Humweed goes poof")
	else
		print("A")
	end

	-- Venom 
	local venomWeaponComponentData = nil
	if ChassisComponentData(ResourceManager:FindInstanceByGuid(Guid("97945D87-011D-11E0-B97C-FC495C335A52"), Guid("39663C49-6C7F-429B-A00F-4885D0BBEDB8"))) then 
		venomWeaponComponentData = WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid("97945D87-011D-11E0-B97C-FC495C335A52"), Guid("39663C49-6C7F-429B-A00F-4885D0BBEDB8")))
	else 
		print("No Venom found")
		return
	end

	if venomWeaponComponentData ~= nil then
		-- Spotlights
		local weaponSpotlight = SpotLightEntityData()
		weaponSpotlight.shape = 1
		weaponSpotlight.coneInnerAngle = 10
		weaponSpotlight.coneOuterAngle = 5
		weaponSpotlight.frustumFov = 100
		weaponSpotlight.frustumAspect = 1.25
		weaponSpotlight.texture = TextureAsset(ResourceManager:FindInstanceByGuid(Guid("04C62561-2236-11DF-A528-EA655525F02D"), Guid("2EE018E8-1451-908C-0974-DB7676407D61")))
		weaponSpotlight.castShadowsMinLevel = 0
		weaponSpotlight.castShadowsEnable = true
		weaponSpotlight.intensity = 0.20
		weaponSpotlight.radius = 150

		local weaponSpotlightComponentData = LightComponentData()
		weaponSpotlightComponentData.light = weaponSpotlight

		weaponSpotlightComponentData.transform = LinearTransform(
			Vec3(-1, 0, 0), --rotation
			Vec3(0, 1, 0),
			Vec3(0, 0, 1),
			Vec3(0, 0, 0) --pos (sideways,height,frontback)
		)

		venomWeaponComponentData:MakeWritable()
		venomWeaponComponentData.components:add(weaponSpotlightComponentData)

	end


end)
	


































	-- Trying to create a usable class
	local VehicleModifications = class 'VehicleModifications'

	local Spotlights = {}
	local Spotlights.componentdata = {}
	local Vehicles = {}


	function VehicleModifications:Scan(vehicle, partitionGUID, instanceGUID, chassisGUID)
		if VehicleEntityData(ResourceManager:FindInstanceByGuid(partitionGUID, instanceGUID) then 
			Vehicles.vehicle = ChassisComponentData(ResourceManager:FindInstanceByGuid(ResourceManager:FindInstanceByGuid(partitionGUID, chassisGUID))
		else 
			print("No HMMVWV found")
			return
		end
	end

	function VehicleModifications:ScanWeapons(partitionGUID, instanceGUID, weaponGUID)
		if VehicleEntityData(ResourceManager:FindInstanceByGuid(partitionGUID, instanceGUID) then 
			Vehicles.vehicle = ChassisComponentData(ResourceManager:FindInstanceByGuid(ResourceManager:FindInstanceByGuid(partitionGUID, chassisGUID))
		else 
			print("No HMMVWV found")
			return
		end
	end

	function VehicleModifications:CreateSpotlight(name, shape, coneInnerAngle, coneOuterAngle, frustumFov, frustumAspect, texture, castShadowsMinLevel, castShadowsEnable, intensity, radius)
		Spotlights.name = SpotLightEntityData()
		Spotlights.name.shape = shape
		Spotlights.name.coneInnerAngle = coneInnerAngle
		Spotlights.name.coneOuterAngle = coneOuterAngle
		Spotlights.name.frustumFov = frustumFov
		Spotlights.name.frustumAspect = frustumAspect
		Spotlights.name.texture = texture
		Spotlights.name.castShadowsMinLevel = castShadowsMinLevel
		Spotlights.name.castShadowsEnable = castShadowsEnable
		Spotlights.name.intensity = intensity
		Spotlights.name.radius = radius
	end

	function VehicleModifications:CreateLightComponentData(name, lightname, trans1, trans2, trans3, trans4)
		Spotlights.componentdata.name = LightComponentData()
		Spotlights.componentdata.name.light = lightname

		Spotlights.componentdata.name.transform = LinearTransform(
			trans1, --rotation
			trans2,
			trans3,
			trans4 	--pos (sideways,height,frontback)
		)
	end

	function VehicleModifications:AddComponentsToVehicleChassis()
    	-- looping through instance types
    	for instanceType, values in pairs(Vehicles) do
        	-- creating new instance
        	local newInstance = _G[instanceType]()
			newInstance:MakeWritable()

			for key, value in pairs(Spotlights.componentdata) do 
				key.components:add(value)
			end
			
		end
	end

	function VehicleModifications:AddComponentsToVehicleWeapon()
		hmmwvChassisComponentData:MakeWritable()
		for key, value in pairs(Spotlights.componentdata) do 
			hmmwvChassisComponentData.components:add(key)
		end
	end

