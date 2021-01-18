require '__shared/settings' --settings
require '__shared/functions' -- functions
require '__shared/presetclean' --presets
require '__shared/skyboxrotation' --skyboxrotation

--------------------------------------------------------------------------------
function DarknessUnleashed(Map, Preset)
      Multipliers(Map)
	    SkyboxRotation:Rotate(Map)

      Events:Subscribe('Partition:Loaded', function(partition)
          for _, instance in pairs(partition.instances) do

            if Preset == 0 then
                Preset:Save(instance)
                print('Saving Standard Map Preset')

                    if Preset:Save() == true then
                        Preset:Standard()
                    end

                    if Preset:Standard() == true then
                        ApplyPatches(instance)
                    end

            elseif Preset == 1 then
                Preset:Save(instance)
                print('Saving Standard Map Preset')

                    if Preset:Save() == true then
                    Preset:Night()

                    if Preset:Night() == true then
                    ApplyPatches(instance)
                    end

            elseif Preset == 2 then
                Preset:Save(instance)
                print('Saving Standard Map Preset')

                    if Preset:Save() == true then
                    Preset:Bright_Night()

                    if Preset:Bright_Night() == true then
                    ApplyPatches(instance)
                    end

            elseif Preset == 3 then
                Preset:Save(instance)
                print('Saving Standard Map Preset')

                    if Preset:Save() == true then
                    Preset:Morning()

                    if Preset:Morning() == true then
                    ApplyPatches(instance)
                    end

            elseif Preset == 4 then
                Preset:Save(instance)
                print('Saving Standard Map Preset')

                    if Preset:Save() == true then
                    Preset:Evening()

                    if Preset:Evening() == true
                    ApplyPatches(instance)
                    end

            end

          end
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

          if
              sky.partition.name == 'levels/mp_subway/lighting/ve_mp_subway_city_01' or
              sky.partition.name == 'levels/mp_011/lighting/ve_mp_011_day01'
          then
              sky.staticEnvmapScale = 0.1
          end

          if sky.partition.name == 'levels/mp_subway/lighting/ve_mp_subway_subway_01' then
              local partitionGuid = Guid('36536A99-7BE3-11E0-8611-A913E18AE9A4') -- levels/sp_paris/lighting/sp_paris_static_envmap
              local instanceGuid = Guid('64EE680C-405E-2E81-E327-6DF58605AB0B') -- TextureAsset

              ResourceManager:RegisterInstanceLoadHandlerOnce(partitionGuid, instanceGuid, function(loadedInstance)
                  sky.staticEnvmapTexture = TextureAsset(loadedInstance)
              end)
          end
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

function DynamicLights(instance)
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

function ApplyPatches(instance)
          PatchOutdoorLightComponentData(instance)
          PatchSkyComponentData(instance)
          PatchFogComponentData(instance)
          PatchTonemapComponentData(instance)
          PatchColorCorrectionComponentData(instance)
          PatchEnlightenComponentData(instance)
          PatchSunFlareComponentData(instance)
          --PatchMeshAsset(instance)
          --PatchEmitterTemplateData(instance)
          DynamicLights(instance)
          PatchLensFlareEntityData(instance)
end
