class("Patches")

Events:Subscribe('Level:Loaded', function(levelName, gameMode)
    --Patch https://github.com/EmulatorNexus/Venice-EBX/blob/f06c290fa43c80e07985eda65ba74c59f4c01aa0/Weapons/Accessories/flashlight/Flashlight_1p.txt
    PatchFlashLight(ResourceManager:FindInstanceByGuid(Guid('83E2B938-E678-11DF-A7B3-CBA49C34928F'), Guid('995E49EE-8914-4AFD-8EF5-59125CA8F9CD')))

    --Patch https://github.com/EmulatorNexus/Venice-EBX/blob/f06c290fa43c80e07985eda65ba74c59f4c01aa0/Weapons/Accessories/flashlight/Flashlight_3p.txt
    PatchFlashLight(ResourceManager:FindInstanceByGuid(Guid('65A5BFD9-028A-4D4F-8B89-3A60B2E06F83'), Guid('5FBA51D6-059F-4284-B5BB-6E20F145C064')))
end)

Events:Subscribe('Partition:Loaded', function(partition)
    PatchComponents(partition)
    PatchEmitters(partition)
end)

function PatchFlashLight(instance)
    if instance == nil then
        return
    end

    instance = SpotLightEntityData(instance)
    instance:MakeWritable()

    --instance.shape = 1
    --instance.radius = 250 --range
    --instance.intensity = 155.55 --brightness
    --instance.frustumFov = 45 --size
    --instance.castShadowsEnable = true
    --instance.castShadowsMinLevel = QualityLevel.QualityLevel_Ultra
    --instance.coneInnerAngle = 0.0
    --instance.coneOuterAngle = 32.3720016479

    instance.radius = 75
    instance.intensity = 9 --brightness
    instance.coneOuterAngle = 50
    instance.orthoWidth = 40
    instance.orthoHeight = 40
    instance.frustumFov = 40 --size
    instance.castShadowsEnable = true
    instance.castShadowsMinLevel = 0
    instance.shape = 1

    instance = LocalLightEntityData(instance)
    instance:MakeWritable()

    instance.attenuationOffset = 250
    print('Patched flashlight!')
end

function PatchComponents(partition)
    for _, instance in pairs(partition.instances) do
        if instance:Is('LocalLightEntityData') then
	        PatchHDLights(instance)
	    end
    end
end

--Configure Smoke, Muzzle & Emmiters
function PatchEmitters(partition)

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
						rootProcessor.lifetime = rootProcessor.lifetime * 1.2

						emitterTemplate.lifetime = emitterTemplate.lifetime * 1.2
						emitterTemplate.maxCount = emitterTemplate.maxCount * 3
					end
				end

			-- Make muzzleflashes light up
			elseif string.find(emitterTemplate.name:lower(), "muzz") then
				emitterTemplate:MakeWritable()
				emitterTemplate.actAsPointLight = true
                emitterTemplate.maxCount = emitterTemplate.maxCount * 4
				
				if emitterTemplate.pointLightColor == Vec3(1,1,1) then
					emitterTemplate.pointLightColor = Vec3(1,0.25,0)
                    emitterTemplate.pointLightRadius = emitterTemplate.pointLightRadius * 0.65
					emitterTemplate.maxSpawnDistance = 3000
				end

			-- Make bullets light up
			elseif string.find(emitterTemplate.name:lower(), "tracer") then
				emitterTemplate:MakeWritable()
				emitterTemplate.actAsPointLight = true
                emitterTemplate.maxCount = emitterTemplate.maxCount * 4

				if emitterTemplate.pointLightColor == Vec3(1,1,1) then
					emitterTemplate.pointLightColor = Vec3(1,0.25,0)
                    emitterTemplate.pointLightRadius = emitterTemplate.pointLightRadius * 1.10
					emitterTemplate.maxSpawnDistance = 3000
				end

			-- Make sparks light up
			elseif string.find(emitterTemplate.name:lower(), "spark") then
				emitterTemplate:MakeWritable()
				emitterTemplate.actAsPointLight = true
                emitterTemplate.maxCount = emitterTemplate.maxCount * 4

				if emitterTemplate.pointLightColor == Vec3(1,1,1) then
					emitterTemplate.pointLightColor = Vec3(1,0.25,0)
                    emitterTemplate.pointLightRadius = emitterTemplate.pointLightRadius * 1.15
					emitterTemplate.maxSpawnDistance = 3000
				end
            elseif string.find(emitterTemplate.name:lower(), "wreck/tank/emitters") or string.find(emitterTemplate.name:lower(), "wreck/heli/emitters") or string.find(emitterTemplate.name:lower(), "wreck/car/emitters") or string.find(emitterTemplate.name:lower(), "wreck/airplane/emitters") then
                emitterTemplate:MakeWritable()
                --emitterTemplate.lifetime = 300

                emitterTemplate.maxSpawnDistance = 3000
                --emitterTemplate.emissive = true
                emitterTemplate.actAsPointLight = true
                emitterTemplate.repeatParticleSpawning = true
                emitterTemplate.pointLightRadius = emitterTemplate.pointLightRadius * 1.5
                emitterTemplate.pointLightIntensity = emitterTemplate.pointLightIntensity * 1.5

                if emitterTemplate.pointLightColor == Vec3(1,1,1) then
                    emitterTemplate.pointLightColor = Vec3(1,0.25,0)
                end
			end
		end
	end

end

function PatchHDLights(instance)

    instance = LocalLightEntityData(instance)
    instance:MakeWritable()
    --instance.visible = true
    instance.specularEnable = true
    instance.radius = instance.radius * 1.5
    instance.intensity = instance.intensity * 0.65
    instance.enlightenColorMode = 0
    instance.enlightenEnable = true
    instance.attenuationOffset = instance.attenuationOffset * 17.5

    if instance.typeInfo.name == 'SpotLightEntityData' then

        PatchSpotlights(instance)

    end

end


function PatchSpotlights(instance)

    instance = SpotLightEntityData(instance)
    instance:MakeWritable()

    instance.castShadowsEnable = true
    instance.castShadowsMinLevel = 3
    instance.coneInnerAngle = instance.coneInnerAngle * 1
    instance.coneOuterAngle = instance.coneOuterAngle * 2

end

if g_Patches == nil then
    g_Patches = Patches()
end

return g_Patches