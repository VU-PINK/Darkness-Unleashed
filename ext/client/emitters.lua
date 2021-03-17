--Configure Smoke, Muzzle & Emmiters
Events:Subscribe('Partition:Loaded', function(partition)
	for _, instance in pairs(partition.instances) do
		if instance:Is("EmitterTemplateData") then
			local emitterTemplate = EmitterTemplateData(instance)

			-- Tweak smoke and dust to last longer
			if string.find(emitterTemplate.name:lower(), "smoke" or string.find(emitterTemplate.name:lower(), "dust")) then
				emitterTemplate:MakeWritable()

				if not (emitterTemplate.emissive or emitterTemplate.actAsPointLight or emitterTemplate.repeatParticleSpawning or emitterTemplate.opaque) then
					if emitterTemplate.rootProcessor:Is("UpdateAgeData") then
						local rootProcessor = UpdateAgeData(emitterTemplate.rootProcessor)

						rootProcessor:MakeWritable()
						rootProcessor.lifetime = rootProcessor.lifetime * 0.75
						emitterTemplate.lifetime = emitterTemplate.lifetime * 1.25
						emitterTemplate.maxCount = emitterTemplate.maxCount * 0.75
						emitterTemplate.timeScale = emitterTemplate.timeScale * 1
					end
				end

			-- Make muzzleflashes light up
			elseif string.find(emitterTemplate.name:lower(), "muzz") then
				emitterTemplate:MakeWritable()
				emitterTemplate.actAsPointLight = true

				if emitterTemplate.pointLightColor == Vec3(1,1,1) then
					emitterTemplate.pointLightColor = Vec3(1,0.25,0)
					emitterTemplate.pointLightRadius = emitterTemplate.pointLightRadius * 0.78
					emitterTemplate.maxSpawnDistance = 2000
				end

			-- Make bullets light up
			elseif string.find(emitterTemplate.name:lower(), "tracer") then
				emitterTemplate:MakeWritable()
				emitterTemplate.actAsPointLight = true

				if emitterTemplate.pointLightColor == Vec3(1,1,1) then
					emitterTemplate.pointLightColor = Vec3(1,0.25,0)
					emitterTemplate.pointLightRadius = emitterTemplate.pointLightRadius * 1.25
					emitterTemplate.maxSpawnDistance = 2000
				end

			-- Make sparks light up
			elseif string.find(emitterTemplate.name:lower(), "spark") then
				emitterTemplate:MakeWritable()
				emitterTemplate.actAsPointLight = true

				if emitterTemplate.pointLightColor == Vec3(1,1,1) then
					emitterTemplate.pointLightColor = Vec3(1,0.25,0)
					emitterTemplate.pointLightRadius = emitterTemplate.pointLightRadius * 1.80
					emitterTemplate.maxSpawnDistance = 2000
				end

			end
		end
	end
end)



--Configure Flashlights
--this mod is based on NoFate's infection Mod: https://github.com/OrfeasZ/infection/tree/38e60ebc1709a8b7586c3f44970c234d8572f45d
local flashLight1PGuid = Guid('995E49EE-8914-4AFD-8EF5-59125CA8F9CD', 'D')
local flashLight3PGuid = Guid('5FBA51D6-059F-4284-B5BB-6E20F145C064', 'D')

function patchFlashLight(instance)
	if instance == nil then
		return
	end

	local spotLight = SpotLightEntityData(instance)
	instance:MakeWritable()

	spotLight.radius = 220
	spotLight.intensity = 4.75 --brightness
	spotLight.coneOuterAngle = 50
	spotLight.orthoWidth = 8
	spotLight.orthoHeight = 8
	spotLight.frustumFov = 38 --size
	spotLight.castShadowsEnable = true
	spotLight.castShadowsMinLevel = 0
	spotLight.shape = 1

	--print('Patching flashlight')
end

Events:Subscribe('Partition:Loaded', function(partition)
	for _, instance in pairs(partition.instances) do
		if instance.instanceGuid == flashLight1PGuid then
			patchFlashLight(instance)
		elseif instance.instanceGuid == flashLight3PGuid then
			patchFlashLight(instance)
		end
	end
end)

Events:Subscribe('Extension:Loaded', function()
	patchFlashLight(ResourceManager:SearchForInstanceByGuid(flashLight1PGuid))
	patchFlashLight(ResourceManager:SearchForInstanceByGuid(flashLight3PGuid))
end)
