Events:Subscribe('Level:RegisterEntityResources', function(levelData)

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
		local VehiclePointlight = PointLightEntityData()
		VehiclePointlight.width = 0.05

		local VehiclePointlightComponentData = LightComponentData()
		VehiclePointlightComponentData.light = VehiclePointlight

		VehiclePointlightComponentData.transform = LinearTransform(
			Vec3(-1, 0, 0), --rotation
			Vec3(0, 1, 0),
			Vec3(0, 0, 1),
			Vec3(0, 1, 5) --pos (sideways,height,frontback)
		)

		-- Lens Flares
		local LensFlare = LensFlareEntityData(ResourceManager:FindInstanceByGuid(Guid("65A5BFD9-028A-4D4F-8B89-3A60B2E06F83"), Guid("D8DB98E1-AEBA-485E-9AA4-D5F55C5CDECE")))
		local LensFlare1 = LensFlareComponentData()
		LensFlare1.lensFlare = LensFlare

		LensFlare:MakeWritable()

		for key, value in pairs(LensFlare.elements) do
			value.sizeCamDistMax = value.sizeCamDistMax*2
			value.sizeAngleCurve = value.sizeAngleCurve*1
			value.size = value.size*0.34
			value.sizeOccluderCurve = value.sizeOccluderCurve*1.5
			value.sizeScreenPosCurve = value.sizeScreenPosCurve*1.5
			value.alphaCamDistCurve = value.alphaCamDistCurve*1.5
			value.alphaOccluderCurve = value.alphaOccluderCurve*1.5
			value.alphaAngleCurve = value.alphaScreenPosCurve*1
			value.alphaScreenPosCurve = value.alphaScreenPosCurve*1.5
			value.alphaCamDistMax = value.alphaCamDistMax*2
			print("LensFlare Changed")
		end

		LensFlare1.transform = LinearTransform(
			Vec3(-1.0, 0.0, 8.74227765735e-08), --rotation
			Vec3(0, 1, 0),
			Vec3(-8.74227765735e-08, 0, -1),
			Vec3(0.55, 1, 2.7) --pos (sideways,height,frontback)
			)

		local LensFlare2 = LensFlareComponentData()
		LensFlare2.lensFlare = LensFlare

		LensFlare2.transform = LinearTransform(
			Vec3(-1.0, 0.0, 8.74227765735e-08), --rotation
			Vec3(0, 1, 0),
			Vec3(-8.74227765735e-08, 0, -1),
			Vec3(-0.55, 1, 2.7) --pos (sideways,height,frontback)
			)

		-- Add new components to Vehicle Chassis

		hmmwvChassisComponentData:MakeWritable()

		hmmwvChassisComponentData.components:add(vehicleLightComponentData)
		hmmwvChassisComponentData.components:add(vehicleLightComponentData2)
		hmmwvChassisComponentData.components:add(vehicleLightComponentDataFar)
		hmmwvChassisComponentData.components:add(vehicleLightComponentDataFar2)
		hmmwvChassisComponentData.components:add(VehiclePointlightComponentData)
		hmmwvChassisComponentData.components:add(LensFlare1)
		hmmwvChassisComponentData.components:add(LensFlare2)



		print("Humweed goes poof")
	else
		print("A")
	end

	--Tank
	local TankChassisComponentData = nil
	--if ChassisComponentData(ResourceManager:FindInstanceByGuid(Guid("611F48A3-0919-11E0-985D-C512734E48AF"), Guid("DA89EB6C-A824-A813-A6C5-E2DEF9D4F4FF"))) then
		--hmmwvChassisComponentData = ChassisComponentData(ResourceManager:FindInstanceByGuid(Guid("611F48A3-0919-11E0-985D-C512734E48AF"), Guid("DA89EB6C-A824-A813-A6C5-E2DEF9D4F4FF")))
	--elseif ChassisComponentData(ResourceManager:FindInstanceByGuid(Guid("F7C250D2-ECEB-481F-A130-D91FE8B693E0"), Guid("5D10A701-196F-4DA9-8D83-610ABF56124B"))) then
	TankChassisComponentData = ChassisComponentData(ResourceManager:FindInstanceByGuid(Guid("B069BA89-EECF-11DD-8117-9421284A74E5"), Guid("B06A08AD-EECF-11DD-8117-9421284A74E5")))
	--else
	--	print("No HMMVWV found")
	--	return
	--end

	if TankChassisComponentData ~= nil then
		-- Spotlights
		local vehicleSpotLight = SpotLightEntityData()
		vehicleSpotLight.shape = 1
		vehicleSpotLight.coneInnerAngle = 10
		vehicleSpotLight.coneOuterAngle = 5
		vehicleSpotLight.frustumFov = 80
		vehicleSpotLight.frustumAspect = 1.25
		vehicleSpotLight.texture = TextureAsset(ResourceManager:FindInstanceByGuid(Guid("04C62561-2236-11DF-A528-EA655525F02D"), Guid("2EE018E8-1451-908C-0974-DB7676407D61")))
		vehicleSpotLight.castShadowsMinLevel = 0
		vehicleSpotLight.castShadowsEnable = true
		vehicleSpotLight.intensity = 0.20
		vehicleSpotLight.radius = 150

		local vehicleLightComponentData = LightComponentData()
		vehicleLightComponentData.light = vehicleSpotLight

		vehicleLightComponentData.transform = LinearTransform(
			Vec3(-1, 0, 0), --rotation
			Vec3(0, 1, 0),
			Vec3(0, 0, 1),
			Vec3(-0.525, 0.65, 5) --pos (sideways,height,frontback)
		)

		local vehicleLightComponentData2 = LightComponentData()
		vehicleLightComponentData2.light = vehicleSpotLight

		vehicleLightComponentData2.transform = LinearTransform(
			Vec3(-1, 0, 0), --rotation
			Vec3(0, 1, 0),
			Vec3(0, 0, 1),
			Vec3(0.525, 0.65, 5) --pos (sideways,height,frontback)
		)

		-- PointLights
		local VehiclePointlight = PointLightEntityData()
		VehiclePointlight.width = 0.1

		local VehiclePointlightComponentData = LightComponentData()
		VehiclePointlightComponentData.light = VehiclePointlight

		VehiclePointlightComponentData.transform = LinearTransform(
			Vec3(-1, 0, 0), --rotation
			Vec3(0, 1, 0),
			Vec3(0, 0, 1),
			Vec3(0.525, 1, 6) --pos (sideways,height,frontback)
		)

		local VehiclePointlightComponentData2 = LightComponentData()
		VehiclePointlightComponentData2.light = VehiclePointlight

		VehiclePointlightComponentData2.transform = LinearTransform(
			Vec3(-1, 0, 0), --rotation
			Vec3(0, 1, 0),
			Vec3(0, 0, 1),
			Vec3(-0.525, 1, 6) --pos (sideways,height,frontback)
		)

		-- Lens Flares
		local LensFlare = LensFlareEntityData(ResourceManager:FindInstanceByGuid(Guid("65A5BFD9-028A-4D4F-8B89-3A60B2E06F83"), Guid("D8DB98E1-AEBA-485E-9AA4-D5F55C5CDECE")))
		local LensFlare1 = LensFlareComponentData()
		LensFlare1.lensFlare = LensFlare

		LensFlare:MakeWritable()

		for key, value in pairs(LensFlare.elements) do
			value.sizeCamDistMax = value.sizeCamDistMax*2
			value.sizeAngleCurve = value.sizeAngleCurve*1
			value.size = value.size*0.34
			value.sizeOccluderCurve = value.sizeOccluderCurve*1.5
			value.sizeScreenPosCurve = value.sizeScreenPosCurve*1.5
			value.alphaCamDistCurve = value.alphaCamDistCurve*1.5
			value.alphaOccluderCurve = value.alphaOccluderCurve*1.5
			value.alphaAngleCurve = value.alphaScreenPosCurve*1
			value.alphaScreenPosCurve = value.alphaScreenPosCurve*1.5
			value.alphaCamDistMax = value.alphaCamDistMax*2
			print("LensFlare Changed")
		end

		LensFlare1.transform = LinearTransform(
			Vec3(-1.0, 0.0, 8.74227765735e-08), --rotation
			Vec3(0, 1, 0),
			Vec3(-8.74227765735e-08, 0, -1),
			Vec3(0.85, 1.3, 3.7) --pos (sideways,height,frontback)
			)

		local LensFlare2 = LensFlareComponentData()
		LensFlare2.lensFlare = LensFlare

		LensFlare2.transform = LinearTransform(
			Vec3(-1.0, 0.0, 8.74227765735e-08), --rotation
			Vec3(0, 1, 0),
			Vec3(-8.74227765735e-08, 0, -1),
			Vec3(-0.85, 1.3, 3.7) --pos (sideways,height,frontback)
			)


		-- Add new components to Vehicle Chassis

		TankChassisComponentData:MakeWritable()

		TankChassisComponentData.components:add(vehicleLightComponentData)
		TankChassisComponentData.components:add(vehicleLightComponentData2)
		TankChassisComponentData.components:add(LensFlare1)
		TankChassisComponentData.components:add(LensFlare2)
		TankChassisComponentData.components:add(VehiclePointlightComponentData)
		TankChassisComponentData.components:add(VehiclePointlightComponentData2)

		print("Tank goes poof")
	else
		print("A")
	end


	-- Venom
	--[[local venomWeaponComponentData = nil
	local venomWeaponComponentData2 = nil
	if WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid("97945D87-011D-11E0-B97C-FC495C335A52"), Guid("39663C49-6C7F-429B-A00F-4885D0BBEDB8"))) then
		venomWeaponComponentData = WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid("97945D87-011D-11E0-B97C-FC495C335A52"), Guid("39663C49-6C7F-429B-A00F-4885D0BBEDB8")))
		venomWeaponComponentData2 = WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid("97945D87-011D-11E0-B97C-FC495C335A52"), Guid("C0F6F51D-0F12-41DE-8003-6252C78BE9E2")))
		print("Found Venom")
	else
		print("No Venom found")
		return
	end



	if venomWeaponComponentData ~= nil then
		-- Spotlights
		local weaponSpotlight = SpotLightEntityData()
		weaponSpotlight.shape = 1
		weaponSpotlight.frustumFov = 35.6789
		weaponSpotlight.frustumAspect = 1.0
		weaponSpotlight.texture = TextureAsset(ResourceManager:FindInstanceByGuid(Guid("04C62561-2236-11DF-A528-EA655525F02D"), Guid("2EE018E8-1451-908C-0974-DB7676407D61")))
		weaponSpotlight.castShadowsMinLevel = 0
		weaponSpotlight.castShadowsEnable = true
		weaponSpotlight.intensity = 0.17
		weaponSpotlight.radius = 1000

		local weaponSpotlightComponentData = LightComponentData()
		weaponSpotlightComponentData.light = weaponSpotlight

		weaponSpotlightComponentData.transform = LinearTransform(
			Vec3(-1, 0, 0), --rotation
			Vec3(0, 1, 0),
			Vec3(0, 0, 1),
			Vec3(0, 0, 0.5) --pos (sideways,height,frontback)
		)

		local weaponSpotlightComponentData2 = LightComponentData()
		weaponSpotlightComponentData2.light = weaponSpotlight

		weaponSpotlightComponentData2.transform = LinearTransform(
			Vec3(-1, 0, 0), --rotation
			Vec3(0, 1, 0),
			Vec3(0, 0, 1),
			Vec3(0, 0, 0.5) --pos (sideways,height,frontback)
		)

		venomWeaponComponentData:MakeWritable()
		venomWeaponComponentData.components:add(weaponSpotlightComponentData2)

		venomWeaponComponentData2:MakeWritable()
		venomWeaponComponentData2.components:add(weaponSpotlightComponentData2)


		-- Lens Flares
		local LensFlare = LensFlareEntityData(ResourceManager:FindInstanceByGuid(Guid("65A5BFD9-028A-4D4F-8B89-3A60B2E06F83"), Guid("D8DB98E1-AEBA-485E-9AA4-D5F55C5CDECE")))

		LensFlare:MakeWritable()

		for key, value in pairs(LensFlare.elements) do
			value.sizeCamDistMax = value.sizeCamDistMax*4
			value.sizeAngleCurve = value.sizeAngleCurve*0.5
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
			Vec3(0, -0.02, -0.001) --pos (sideways,height,frontback)
			)

		venomWeaponComponentData.components:add(LensFlare1)
		venomWeaponComponentData2.components:add(LensFlare1)

		print("Added Spotlight Venom")

	end]]

	-- AH1Z Viper
	local viperWeaponComponentData = nil
	if WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid("643135EA-6CA7-11DF-B6FA-F715AA601362"), Guid("DF0AEBA7-A3D6-4CCA-9572-E6FBAB9569C5"))) then
		viperWeaponComponentData = WeaponComponentData(ResourceManager:FindInstanceByGuid(Guid("643135EA-6CA7-11DF-B6FA-F715AA6013622"), Guid("DF0AEBA7-A3D6-4CCA-9572-E6FBAB9569C5")))
		print("Found viper")
	else
		print("No viper found")
		return
	end



	if viperWeaponComponentData ~= nil then

		viperWeaponComponentData:MakeWritable()

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
		print("Added Spotlight viper")

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
		print("Added Pointlight viper")
	end


end)































	-- Trying to create a usable class
	local VehicleModifications = class 'VehicleModifications'

	local Spotlights = {}
	Spotlights.componentdata = {}
	local Vehicles = {}


	function VehicleModifications:Scan(vehicle, partitionGUID, instanceGUID, chassisGUID)
		if VehicleEntityData(ResourceManager:FindInstanceByGuid(partitionGUID, instanceGUID)) then
			Vehicles.vehicle = ChassisComponentData(ResourceManager:FindInstanceByGuid(ResourceManager:FindInstanceByGuid(partitionGUID, chassisGUID)))
		else
			print("No" ..vehicle.. " found")
			return
		end
	end

	function VehicleModifications:ScanWeapons(partitionGUID, instanceGUID, weaponGUID)
		if VehicleEntityData(ResourceManager:FindInstanceByGuid(partitionGUID, instanceGUID)) then
			Vehicles.vehicle = ChassisComponentData(ResourceManager:FindInstanceByGuid(ResourceManager:FindInstanceByGuid(partitionGUID, chassisGUID)))
		else
			print("No" ..vehicle.. " found")
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
