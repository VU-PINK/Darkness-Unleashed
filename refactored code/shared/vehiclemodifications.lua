local Vehicle = class('Vehicle')
local Settings = require '__shared/settings'
local RM = require '__shared/darknesstools/resourcemanager'
local Tool = require '__shared/darknesstools/tools'
local VehicleSettings = require '__shared/vehicles'
local vehicleEntityData = nil 


function Vehicle:__Init()

    Vehicle:RegisterEvents()

end 


function Vehicle:RegisterEvents()

    self.entityResourcesRegisterEvent = Events:Subscribe('Level:RegisterEntityResources', self, self.OnEntityRegister)

end 


function Vehicle:OnEntityRegister()

    for typeIndex, vehicleType in pairs(VehicleSettings) do

        for vehicleIndex, vehicle in pairs(vehicleType) do

           Tool:DebugPrint(vehicle.name .." | ".. vehicle.partitionGUID .." |  ".. vehicle.chassisGUID, 'adding')
           chassisData = RM:Find(vehicle.partitionGUID, vehicle.chassisGUID)				

               if chassisData ~= nil then
                   chassisData = ChassisComponentData(chassisData)

                    for componentIndex, component in pairs(vehicle.Components) do

                        if component.type == 1 and component.enabled then

							Vehicle:AddPointLight(component, chassisData, vehicle)

                        elseif component.type == 2 and component.enabled then

							Vehicle:AddPointLight(component, chassisData, vehicle)

                       end

                    end
               Tool:DebugPrint('--------------------------------------------------', 'adding')
               end
               
        end
        

    end

end 


function Vehicle:AddPointLight(pointLightSettingsArray, chassisData, vehicle)

	if vehicle == nil then
		return
	end

	vehicleEntityData = RM:VED(vehicle.partitionGUID, vehicle.vehicleDataGUID) 				
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

			weaponData = RM:WCP(vehicle.partitionGUID, vehicle.weaponGUID2)	
            
	   	else

		   	weaponData = RM:WCP(vehicle.partitionGUID, vehicle.weaponGUID)	

	   	end

 		if weaponData.isReadOnly then

 			weaponData:MakeWritable()

 		end
		
 		weaponData.components:add(newPointlightComponentData)
        vehicleEntityData.runtimeComponentCount = vehicleEntityData.runtimeComponentCount + 1

		Tool:DebugPrint('Added weapon pointlight to ' .. vehicle.name, 'adding')
		
 	else

 		if chassisData.isReadOnly then

 			chassisData:MakeWritable()

 		end

 		chassisData.components:add(newPointlightComponentData)
        vehicleEntityData.runtimeComponentCount = vehicleEntityData.runtimeComponentCount + 1
		Tool:DebugPrint('Added '..pointLightSettingsArray.description..' to ' .. vehicle.name, 'adding')

 	end

end


function Vehicle:AddSpotLight(spotLightSettingsArray, chassisData, vehicle)

	if vehicle == nil then
	    return
	end

	vehicleEntityData = RM:VED(vehicle.partitionGUID, vehicle.vehicleDataGUID)				
	vehicleEntityData:MakeWritable()

 	local newSpotLight = SpotLightEntityData()
 	newSpotLight.shape = spotLightSettingsArray.shape
 	newSpotLight.intensity = spotLightSettingsArray.intensity
 	newSpotLight.color = spotLightSettingsArray.color
 	newSpotLight.frustumFov = spotLightSettingsArray.frustumFov
 	newSpotLight.frustumAspect = spotLightSettingsArray.frustumAspect
 	newSpotLight.texture = RM:Flashlight()													
 	newSpotLight.castShadowsMinLevel = 0
 	newSpotLight.castShadowsEnable = false
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

 			weaponData = RM:WCP(vehicle.partitionGUID, vehicle.weaponGUID2) 	

		else

			weaponData = RM:WCP(vehicle.partitionGUID, vehicle.weaponGUID)		

		end

 		if weaponData.isReadOnly then

 			weaponData:MakeWritable()

 		end

		Vehicle:AddLensFlare(spotLightSettingsArray.name, weaponData, spotLightSettingsArray.transform.trans, vehicle) 
		 
 		weaponData.components:add(newSpotlightComponentData)
		vehicleEntityData.runtimeComponentCount = vehicleEntityData.runtimeComponentCount + 1

		Tool:DebugPrint('Added weapon spotlight to ' .. vehicle.name, 'adding')

 	else

 		if chassisData.isReadOnly then

 			chassisData:MakeWritable()

 		end

		Vehicle:AddLensFlare(spotLightSettingsArray.name, chassisData, spotLightSettingsArray.transform.trans, vehicle)

 		chassisData.components:add(newSpotlightComponentData)
		vehicleEntityData.runtimeComponentCount = vehicleEntityData.runtimeComponentCount + 1

		Tool:DebugPrint('Added '..spotLightSettingsArray.description..' to ' .. vehicle.name, 'adding')

		if spotLightSettingsArray.transform.mirrored == true then

		Vehicle:AddMirrorSpotlight(spotLightSettingsArray.name, chassisData, spotLightSettingsArray, vehicle)

		end 

 	end

end


function Vehicle:AddLensFlare(name, data, trans, vehicle)

	if vehicle == nil then
		return
	end

	if vehicle.name == 'SU35BM' or vehicle.name == 'F35' then
		return
	end

	local LensFlare = RM:LFED("65A5BFD9-028A-4D4F-8B89-3A60B2E06F83","D8DB98E1-AEBA-485E-9AA4-D5F55C5CDECE")
	LensFlare:MakeWritable()

	for key, value in pairs(LensFlare.elements) do

		local dist = 80
		local dist2 = 60
		local sizeAngle = Vec4(0.13, 1, 0, 0)
		local alphaAngle = Vec4(0.04, 1, 0, 0)

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

end


function Vehicle:AddMirrorSpotlight(name, data, settings, vehicle)

	local newSpotLight = SpotLightEntityData()
 	newSpotLight.shape = settings.shape
 	newSpotLight.intensity = settings.intensity
 	newSpotLight.color = settings.color
 	newSpotLight.frustumFov = settings.frustumFov
 	newSpotLight.frustumAspect = settings.frustumAspect
 	newSpotLight.texture = RM:Flashlight()
 	newSpotLight.castShadowsMinLevel = 0
 	newSpotLight.castShadowsEnable = false
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

	Vehicle:AddLensFlare(name, data, settings.transform.trans * Vec3((-1), 1, 1), vehicle)

	Tool:DebugPrint('Added ' .. settings.description .. ' Mirror Spotlight', 'adding')

end


return Vehicle