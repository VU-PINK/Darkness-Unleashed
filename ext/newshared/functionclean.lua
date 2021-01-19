require '__shared/settings' --settings
require '__shared/presetclean' --presets

--------------------------------------------------------------------------------
function DarknessUnleashed(Map, Preset)
      Multipliers(Map)
	    SkyboxRotation:Rotate(Map)

      Events:Subscribe('Partition:Loaded', function(partition)
          if Preset == 1 then
                    for _, instance in pairs(partition.instances) do
                    print('Test')
                    end
          end
      end)
return 'Applying Preset'
end
----------------------------------------
function PatchOutdoorLightComponentData(instance)
          local outdoor = OutdoorLightComponentData(instance)
          outdoor:MakeWritable()

          outdoor.sunColor = SunColor
          outdoor.skyColor = SkyColor
          outdoor.groundColor = groundColor

          outdoor.skyEnvmapShadowScale = skyEnvmapShadowScale
  end

function PatchSkyComponentData(instance)
          local sky = SkyComponentData(instance)
          sky:MakeWritable()

          sky.brightnessScale = brightnessScale
          sky.sunSize = sunSize
          sky.sunScale = sunScale

          sky.cloudLayer1SunLightIntensity = cloudLayer1SunLightIntensity
          sky.cloudLayer1SunLightPower = cloudLayer1SunLightPower
          sky.cloudLayer1AmbientLightIntensity = cloudLayer1AmbientLightIntensity

          sky.cloudLayer2SunLightIntensity = cloudLayer2SunLightIntensity
          sky.cloudLayer2SunLightPower = cloudLayer2SunLightPower
          sky.cloudLayer2AmbientLightIntensity = cloudLayer2AmbientLightIntensity

          sky.staticEnvmapScale = staticEnvmapScale
          sky.skyEnvmap8BitTexScale = skyEnvmap8BitTexScale

          sky.customEnvmapAmbient = customEnvmapAmbient

          sky.panoramicRotation = panoramicRotation
end

function PatchFogComponentData(instance)
          local fog = FogComponentData(instance)
          fog:MakeWritable()

          fog.enable = fogEnable
          fog.fogColorEnable = fogColorEnable

          fog.start = fogStart
          fog.endValue = fogEndValue

          fog.fogColorStart = fogColorStart
          fog.fogColorEnd = fogColorEnd

          fog.fogColor = fogColor
          fog.fogColorCurve = fogColorCurve

          fog.transparencyFadeEnd = fogTransparencyFadeEnd
end

function PatchTonemapComponentData(instance)
          local tonemap = TonemapComponentData(instance)
          tonemap:MakeWritable()

          tonemap.minExposure = minExposure
          tonemap.exposureAdjustTime = exposureAdjustTime
          tonemap.bloomScale = bloomScale * 0.25

          tonemap.tonemapMethod = tonemapMethod
end

function PatchColorCorrectionComponentData(instance)
          local color = ColorCorrectionComponentData(instance)
          color:MakeWritable()

          color.contrast = Contrast
          color.saturation = Saturation
end

function PatchEnlightenComponentData(instance)
          local enlighten = EnlightenComponentData(instance)
          enlighten:MakeWritable()

          enlighten.enable = enlightenEnable
end

function PatchSunFlareComponentData(instance)
          local flare = SunFlareComponentData(instance)
          flare:MakeWritable()

          flare.excluded = SunFlareExcluded
end

function PatchMeshAsset(instance)
          if meshs[instance.partition.name] then
              local mesh = MeshAsset(instance)

              for _, value in pairs(mesh.materials) do
                  value:MakeWritable()

                  value.shader.shader = shadervalue
              end
          end
  end

function PatchEmitterTemplateData(instance)
          if emitters[instance.partition.name] then
              local template = EmitterTemplateData(instance)
              template:MakeWritable()

              template.emissive = templateemissive
          end
end

function PatchDynamicLights(instance)
          local Dynamic = LocalLightEntityData(instance)
              Dynamic:MakeWritable()

              Dynamic.visible = dynamicEnable
              Dynamic.enlightenEnable = enlightenEnable
              Dynamic.specularEnable = specularEnable
end

function PatchLensFlareEntityData(instance)
           local flares = LensFlareEntityData(instance)
           flares:MakeWritable()

           flares.visible = flaresVisible
end

function PatchFlashLights(instance)
          local flashLight1PGuid = Guid('995E49EE-8914-4AFD-8EF5-59125CA8F9CD', 'D')
          local flashLight3PGuid = Guid('5FBA51D6-059F-4284-B5BB-6E20F145C064', 'D')

          patchFlashLight(ResourceManager:SearchForInstanceByGuid(flashLight1PGuid))
          patchFlashLight(ResourceManager:SearchForInstanceByGuid(flashLight3PGuid))

            if instance.instanceGuid == flashLight1PGuid then
                  local spotLight = SpotLightEntityData(instance)
                  spotLight:MakeWritable()

                  spotLight.radius = 220
                  spotLight.intensity = 1.4 --brightness
                  spotLight.coneOuterAngle = 35
                  spotLight.orthoWidth = 7
                  spotLight.orthoHeight = 7
                  spotLight.frustumFov = 40 --size
                  spotLight.castShadowsEnable = true
                  spotLight.castShadowsMinLevel = QualityLevel.QualityLevel_Ultra
                  spotLight.shape = 1
                  print('Patching 1P Flashlight')
            elseif instance.instanceGuid == flashLight3PGuid then
                  local spotLight = SpotLightEntityData(instance)
                  spotLight:MakeWritable()

                  spotLight.radius = 220
                  spotLight.intensity = 1.4 --brightness
                  spotLight.coneOuterAngle = 35
                  spotLight.orthoWidth = 7
                  spotLight.orthoHeight = 7
                  spotLight.frustumFov = 40 --size
                  spotLight.castShadowsEnable = true
                  spotLight.castShadowsMinLevel = QualityLevel.QualityLevel_Ultra
                  spotLight.shape = 1
                  print('Patching 3P Flashlight')
            end
end

function ApplyPatches()
          if instance:Is == 'OutdoorLightComponentData' then
              PatchOutdoorLightComponentData(instance)
          elseif instance:Is == 'SkyComponentData' then
              PatchSkyComponentData(instance)
          elseif instance:Is == 'FogComponentData' then
              PatchFogComponentData(instance)
          elseif instance:Is == 'TonemapComponentData' then
              PatchTonemapComponentData(instance)
          elseif instance:Is == 'ColorCorrectionComponentData' then
              PatchColorCorrectionComponentData(instance)
          elseif instance:Is == 'EnlightenComponentData' then
              PatchEnlightenComponentData(instance)
          elseif instance:Is == 'SunFlareComponentData' then
              PatchSunFlareComponentData(instance)
          --elseif instance:Is == 'MeshAsset' then
          --    PatchMeshAsset(instance)
          --elseif instance:Is == 'EmitterTemplateData' then
          --    PatchEmitterTemplateData(instance)
          elseif instance:Is == 'SpotLightEntityData' then
              PatchDynamicLights(instance)
          elseif instance:Is == 'LensFlareEntityData' then
              PatchLensFlareEntityData(instance)
          end
end

--------------------------------------------------------------------------------

BrightnessMultiplicator = nil
FogMultiplicator = nil

--------------------------------------------------------------------------------

--Custom Map Settings Brightness/Fog

function Multipliers(Map)
	if Map == 1 then
			BrightnessMultiplicator = generalbrightness[1] * Bazaar_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Bazaar_fogMultiplier[1]
	end
	if Map == 2 then
			BrightnessMultiplicator = generalbrightness[1] * Teheran_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Teheran_fogMultiplier[1]
	end
	if Map == 3 then
			BrightnessMultiplicator = generalbrightness[1] * Caspian_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Caspian_fogMultiplier[1]
	end
	if Map == 4 then
			BrightnessMultiplicator = generalbrightness[1] * Seine_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Seine_fogMultiplier[1]
	end
	if Map == 5 then
			BrightnessMultiplicator = generalbrightness[1] * Firestorm_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Firestorm_fogMultiplier[1]
	end
	if Map == 6 then
			BrightnessMultiplicator = generalbrightness[1] * Davamand_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Davamand_fogMultiplier[1]
	end
	if Map == 7 then
			BrightnessMultiplicator = generalbrightness[1] * Noshahr_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Noshahr_fogMultiplier[1]
	end
	if Map == 8 then
			BrightnessMultiplicator = generalbrightness[1] * Kharg_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Kharg_fogMultiplier[1]
	end
	if Map == 9 then
			BrightnessMultiplicator = generalbrightness[1] * Metro_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Metro_fogMultiplier[1]
	end
		------------------------- DLC - Back to Karkand ----------------------
	if Map == 10 then
			BrightnessMultiplicator = generalbrightness[1] * Karkand_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Karkand_fogMultiplier[1]
	end
	if Map == 11 then
			BrightnessMultiplicator = generalbrightness[1] * Gulf_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Gulf_fogMultiplier[1]
	end
	if Map == 12 then
			BrightnessMultiplicator = generalbrightness[1] * Sharqi_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Sharqi_fogMultiplier[1]
	end
	if Map == 13 then
			BrightnessMultiplicator = generalbrightness[1] * Wake_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Wake_fogMultiplier[1]
	end
		----------------------- DLC - Close Quarters -------------------------
	if Map == 14 then
			BrightnessMultiplicator = generalbrightness[1] * Donya_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Donya_fogMultiplier[1]
	end
	if Map == 15 then
			BrightnessMultiplicator = generalbrightness[1] * Operation925_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Operation925_fogMultiplier[1]
	end
	if Map == 16 then
			BrightnessMultiplicator = generalbrightness[1] * Scrapmetal_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Scrapmetal_fogMultiplier[1]
	end
	if Map == 17 then
			BrightnessMultiplicator = generalbrightness[1] * Ziba_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Ziba_fogMultiplier[1]
	end
		---------------------- DLC - Armored Kill ----------------------------
	if Map == 18 then
			BrightnessMultiplicator = generalbrightness[1] * Alborz_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Alborz_fogMultiplier[1]
	end
	if Map == 19 then
			BrightnessMultiplicator = generalbrightness[1] * Shield_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Shield_fogMultiplier[1]
	end
	if Map == 20 then
			BrightnessMultiplicator = generalbrightness[1] * Bandar_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Bandar_fogMultiplier[1]
	end
	if Map == 21 then
			BrightnessMultiplicator = generalbrightness[1] * Death_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Death_fogMultiplier[1]
	end
		----------------------- DLC - Aftermath ------------------------------
	if Map == 22 then
			BrightnessMultiplicator = generalbrightness[1] * Azadi_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Azadi_fogMultiplier[1]
	end
	if Map == 23 then
			BrightnessMultiplicator = generalbrightness[1] * Epicenter_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Epicenter_fogMultiplier[1]
	end
	if Map == 24 then
			BrightnessMultiplicator = generalbrightness[1] * Markaz_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Markaz_fogMultiplier[1]
	end
	if Map == 25 then
			BrightnessMultiplicator = generalbrightness[1] * Talah_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Talah_fogMultiplier[1]
	end
		----------------------- DLC - End Game -------------------------------
	if Map == 26 then
			BrightnessMultiplicator = generalbrightness[1] * Riverside_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Riverside_fogMultiplier[1]
	end
	if Map == 27 then
			BrightnessMultiplicator = generalbrightness[1] * Nebandan_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Nebandan_fogMultiplier[1]
	end
	if Map == 28 then
			BrightnessMultiplicator = generalbrightness[1] * Kiasar_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Kiasar_fogMultiplier[1]
	end
	if Map == 29 then
			BrightnessMultiplicator = generalbrightness[1] * Pipeline_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Pipeline_fogMultiplier[1]
	end
	print("BrightnessMultiplicator: " ..BrightnessMultiplicator)
	print("FogMultiplicator: " ..FogMultiplicator)
end
