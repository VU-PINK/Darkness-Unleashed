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



--FailProtection
NetEvents:Subscribe('FailProtection', function(data)
		print('Got NetEvent from server with data:' .. data)

		function Check()
				if data == 'Check' then
				NetEvents:Send('FailProtection', "OK" ..name "," ..playerGuid)
				else
				NetEvents:Send('FailProtection', "NoCheck" ..name "," ..playerGuid)
				end
		Check()
		end

end)
