Events:Subscribe('Partition:Loaded', function(partition)
	if partition == nil then
		return
	end
	
	local instances = partition.instances

	for _, instance in ipairs(instances) do
		
		if instance.instanceGuid == Guid("C955ED1B-9EE8-4FB2-BA54-1C848A50EB83") then
			humveeVehicleEntityData = VehicleEntityData(instance)
		end

		if instance.instanceGuid == Guid("A90FFC31-3B0C-4217-B022-83DCC0097D1B") then
			loaded = true
		end
	end

	
	if loaded and not done and humveeVehicleEntityData ~= nil then
	
		humveeVehicleEntityData:MakeWritable()
		
		local humveeChassisComponentData = ChassisComponentData(humveeVehicleEntityData.components[1])
		humveeChassisComponentData:MakeWritable()

        local vehicleSpotLight = SpotLightEntityData()
        vehicleSpotLight.shape = "SpotLightShape_Cone"
        vehicleSpotLight.coneInnerAngle = 70
        vehicleSpotLight.coneOuterAngle = 50
        vehicleSpotLight.frustumFov = 25
        vehicleSpotLight.frustumAspect = 1
        vehicleSpotLight.orthoWidth = 50
        vehicleSpotLight.orthoHeight = 50
        vehicleSpotLight.texture = ResourceManager:SearchForInstanceByGuid("2EE018E8-1451-908C-0974-DB7676407D61")
        vehicleSpotLight.castShadowsMinLevel = "QualityLevel_Ultra"
        vehicleSpotLight.castShadowsEnable = true

        humveeChassisComponentData.components:add(vehicleSpotLight)
		
		print("Humvee modified")
		done = true
    else
        print("Failed to modified humvee")
	end
end)
