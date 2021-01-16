require '__shared/settings'
require '__shared/functions'

local Classes = require '__shared/classes'

---Presets
function Night(Map)
  --Code by Reirei ; Custom Settings + Extra Code by Lesley & IllustrisJack
	Multipliers(Map)
	SkyboxRotation:Rotate(Map)
					--------------------------------- Standard --------------------------------------
	local emitters = {
	    -- MP_Subway
	    ['fx/ambient/levelspecific/mp15/emitters/em_amb_mp15_background_smokepillar_m_01'] = true,

	    -- MP_007
	    ['fx/ambient/levelspecific/mp_07/emitters/em_mp7_distancemist_xxl_smoke'] = true,
	    ['fx/ambient/levelspecific/mp_07/emitters/em_mp7_battlesmoke_xl_smoke'] = true,

	    -- MP_013
	    ['fx/ambient/levelspecific/mp_013/emitters_clouds/em_amb_mp_013_clouds_area_s_01'] = true,
	    ['fx/ambient/levelspecific/mp_013/emitters_clouds/em_amb_mp_013_clouds_background_area_s_01'] = true,
	    ['fx/ambient/levelspecific/mp_013/emitters_clouds/em_amb_mp_013_clouds_background_downwards_area_s_01'] = true,
	    ['fx/ambient/levelspecific/mp_013/emitters_clouds/em_amb_mp_013_clouds_jumpthrough_01'] = true,

	    -- MP_018
	    ['levels/mp_018/fx/em_fogarea_smoke_m'] = true,
	    ['levels/mp_018/fx/em_fogarea_smoke_xl'] = true,
	    ['levels/mp_018/fx/em_fogarea_lowend_smoke_m'] = true,
	    ['levels/mp_018/fx/em_fogarea_lowend_smoke_xl'] = true,

	    -- XP2_Skybar
	    ['fx/dlc/xp2/ambient/levelspecific/mp_skybar/emitters/em_dlc_amb_mpskybar_bgsmog_smoke'] = true,
	}

	local meshs = {
	    -- MP_Subway
	    ['levels/mp_subway/objects/backdrops/mp15_smokepillar_01_mesh'] = true,
	    ['levels/mp_subway/objects/backdrops/mp15_smokepillarwhite_01_mesh'] = true,
	    ['levels/mp_subway/objects/backdrops/mp_subway_smokepillar02_mesh'] = true,

	    -- MP_007
	    ['levels/mp_007/terrain/mp007_matte01_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte02_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte03_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte04_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte05_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte06_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte07_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte_far01_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte_far02_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte_far03_mesh'] = true,
	    ['levels/mp_007/props/mp007_waterwash_01_mesh'] = true,
	    ['levels/mp_007/props/mp007_waterwash_02_mesh'] = true,

	    -- MP_011
	    ['levels/mp_011/objects/mp011_backdrop_01_mesh'] = true,
	    ['levels/mp_011/objects/mp011_backdropesplanade_01_mesh'] = true,
	    ['levels/mp_011/objects/mp011_backdropesplanade_02_mesh'] = true,
	    ['levels/mp_011/water/meshes/mp_011_watersurface01_mesh'] = true,

	    -- MP_012
	    ['levels/mp_012/terrain/mp012_matte_4parts_1_mesh'] = true,
	    ['levels/mp_012/terrain/mp012_matte_4parts_2_mesh'] = true,
	    ['levels/mp_012/terrain/mp012_matte_4parts_3_mesh'] = true,
	    ['levels/mp_012/terrain/mp012_matte_4parts_4_mesh'] = true,
	    ['levels/mp_012/terrain/mp012_matte_4parts_5_mesh'] = true,
	    ['levels/mp_012/terrain/mp012_matte_4parts_6_mesh'] = true,
	    ['levels/mp_012/objects/smokestacks/smokestack_01_mesh'] = true,

	    -- MP_013
	    ['levels/mp_013/props/mp013_cloudlayer_mesh'] = true,

	    -- MP_017
	    ['levels/mp_017/terrain/mp_017_waves_01_mesh'] = true,

	    -- MP_018
	    ['levels/mp_018/terrain/mp018_mattepainting_chunk01_mesh'] = true,
	    ['levels/mp_018/terrain/mp018_mattepainting_chunk02_mesh'] = true,
	    ['levels/mp_018/terrain/mp018_mattepainting_chunk03_mesh'] = true,
	    ['levels/mp_018/terrain/mp018_wave_01_mesh'] = true,

	    -- XP1_001
	    ['levels/xp1_001/objects/mattepainting_01_mesh'] = true,
	    ['levels/xp1_001/objects/mattepainting_02_mesh'] = true,
	    ['levels/xp1_001/objects/mattepainting_03_mesh'] = true,
	    ['levels/xp1_001/objects/mattepainting_04_mesh'] = true,

	    -- XP1_002
	    ['levels/xp1_002/objects/xp1_002__wave_01_mesh'] = true,

	    -- XP1_004
	    ['xp_raw/surrounding/smokepillars/smokepillar_01_mesh'] = true,
	    ['levels/xp1_004/props/wake_wave_02/wake_wave_02_mesh'] = true,
	    ['levels/xp1_004/props/wave_01/wave_01_mesh'] = true,

	    -- XP2_Palace
	    ['xp2/objects/godrays_01/godrays_01_mesh'] = true,

	    -- XP2_Skybar
	    ['levels/xp2_skybar/objects/smokepillar_bg/smokepillar_xp2_2_mesh'] = true,

	    -- XP3_Alborz
	    ['levels/mp_whitepeak/objects/mountainsidecloud_01_mesh'] = true,
	    ['levels/mp_whitepeak/objects/mountainsidecloud_02_mesh'] = true,
	    ['levels/mp_whitepeak/objects/mountainsidecloud_04_mesh'] = true,

	    -- XP3_Desert
	    ['levels/xp3_desert/props/xp3_bandar_backdropmatte_01_mesh'] = true,

	    -- XP4_Quake
	    ['levels/sp_valley/terrain/cloud_moving_mesh'] = true
	}

	local variations = {
	    -- MP_012
	    ['levels/mp_012/objects/smokestacks/smokestack_01_02'] = true,

	    -- MP_018
	    ['levels/xp1_001/objects/wave_01_xp001'] = true,

	    -- XP2_Skybar
	    ['levels/xp2_skybar/objects/smokepillar_bg/smokepillar_01_xp2'] = true,

	    -- XP3_Valley
	    ['levels/xp3_valley/objects/mountainsidecloud_01_valley'] = true,
	    ['levels/xp3_valley/objects/mountainsidecloud_02_valley'] = true,
	    ['levels/xp3_valley/objects/mountainsidecloud_04_vvalley'] = true
	}

	local effects = {
	    -- MP_007
	    ['fx/ambient/levelspecific/mp_07/fx_amb_mp_07_godrays'] = true,

	    -- XP2_Factory
	    ['fx/dlc/xp2/ambient/levelspecific/mp_factory/fx_factory_newpart_godrays_smallwindows'] = true,
	    ['fx/dlc/xp2/ambient/levelspecific/mp_factory/fx_factory_newpart_godrays_standalone'] = true,
	    ['fx/dlc/xp2/ambient/levelspecific/mp_factory/fx_factory_oldpart_godrays_bg'] = true,
	    ['fx/dlc/xp2/ambient/levelspecific/mp_factory/fx_factory_oldpart_godrays_standalone_big'] = true,
	    ['fx/dlc/xp2/ambient/levelspecific/mp_factory/fx_factory_oldpart_godrays_windows'] = true,

	    -- XP2_Office
	    ['fx/ambient/levelspecific/sp_villa/fx_amb_sp_villa_inhouse_window_godrays'] = true,

	    -- XP2_Palace
	    ['fx/dlc/xp2/ambient/levelspecific/mp_palace/fx_dlc2_mp_palace_godrays'] = true,
	    ['fx/dlc/xp2/ambient/levelspecific/mp_palace/fx_palace_window_godrays'] = true,

	    -- XP2_FD
	    ['fx/dlc/xp4/ambient/levelspecific/xp4_findistrict/fx_dlc_xp4_findistrict_godrays_l'] = true,

	    -- XP4_Parl
	    ['fx/dlc/xp4/ambient/levelspecific/xp4_parliament/fx_dlc_xp4_parliament_godrays_s'] = true,
	    ['fx/dlc/xp4/ambient/levelspecific/xp4_parliament/fx_dlc_xp4_parliament_godrays_xl'] = true,

	    -- XP5_002
	    ['fx/ambient/levelspecific/sp_03/fx_amb_sp03_littlewindow_godrays'] = true,
	}

	local waters = {
	    ['Levels/XP1_001/XP1_001'] = true,
	    ['Levels/XP1_002/XP1_002'] = true,
	    ['Levels/XP1_003/XP1_003'] = true,
	    ['Levels/XP1_004/XP1_004'] = true,
	}

	local envmaps = {
	    ['levels/mp_subway/lighting/ve_mp_subway_city_01'] = true,
	    ['levels/mp_011/lighting/ve_mp_011_day01'] = true,
	    ['levels/xp5_001/lighting/ve_xp5_001_01'] = true,
	    ['levels/xp5_002/lighting/ve_xp5_002_01'] = true,
	    ['levels/xp5_003/lighting/ve_xp5_003_01'] = true,
	    ['levels/xp5_004/lighting/ve_xp5_004_02'] = true
	}




        Events:Subscribe('Partition:Loaded', function(partition)
            for _, instance in pairs(partition.instances) do
                if instance:Is('OutdoorLightComponentData') then
                    PatchOutdoorLightComponentData(instance)
                elseif instance:Is('SkyComponentData') then
                    PatchSkyComponentData(instance)
                elseif instance:Is('FogComponentData') then
                    PatchFogComponentData(instance)
                elseif instance:Is('TonemapComponentData') then
                    PatchTonemapComponentData(instance)
                elseif instance:Is('ColorCorrectionComponentData') then
                    PatchColorCorrectionComponentData(instance)
                elseif instance:Is('EnlightenComponentData') then
                    PatchEnlightenComponentData(instance)
                elseif instance:Is('SunFlareComponentData') then
                    PatchSunFlareComponentData(instance)
                elseif instance:Is('MeshAsset') then
                    PatchMeshAsset(instance)
                elseif instance:Is('MeshMaterialVariation') then
                    PatchMeshMaterialVariation(instance)
                elseif instance:Is('EmitterTemplateData') then
                    PatchEmitterTemplateData(instance)
                elseif instance:Is('EffectEntityData') then
                    PatchEffectEntityData(instance)
								elseif instance:Is('LocalLightEntityData') then
										DynamicLights(instance)
								elseif instance:Is('LensFlareEntityData') then
										PatchLensFlareEntityData(instance)
                end
            end

        end)

        Events:Subscribe('Level:LoadResources', function(level)
    		local visual = ResourceManager:GetSettings("VisualTerrainSettings")

		    	if visual ~= nil then
		        		visual = VisualTerrainSettings(visual)
		        		if waters[level] then
		            	visual.drawWaterEnable = false
		        		else
		            	visual.drawWaterEnable = true
		        		end
		    	end
				end)


        function PatchOutdoorLightComponentData(instance)
                local outdoor = OutdoorLightComponentData(instance)
                outdoor:MakeWritable()

                outdoor.sunColor = Vec3(0.02, 0.02, 0.02)
                outdoor.skyColor = Vec3(0.01, 0.01, 0.01)
                outdoor.groundColor = Vec3(0, 0, 0)

                outdoor.skyEnvmapShadowScale = 0.25
        end

--
        function PatchSkyComponentData(instance)
                local sky = SkyComponentData(instance)
                sky:MakeWritable()

                sky.brightnessScale = (0.0005*BrightnessMultiplicator)

                sky.sunSize = 15
                sky.sunScale = 15

                sky.cloudLayer1SunLightIntensity = 0.0001
                sky.cloudLayer1SunLightPower = 0.0001
                sky.cloudLayer1AmbientLightIntensity = 0.0005

                sky.cloudLayer2SunLightIntensity = 0.0001
                sky.cloudLayer2SunLightPower = 0.0001
                sky.cloudLayer2AmbientLightIntensity = 0.0005

                sky.staticEnvmapScale = 0.1
                sky.skyEnvmap8BitTexScale = 1

								sky.customEnvmapAmbient = 0.05

								sky.panoramicRotation = rotation


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

                fog.enable = true
                fog.fogColorEnable = true

                fog.start = 2

                fog.fogColorStart = 2
                fog.fogColorEnd = 40
								--print(Settings.CustomFog)
                fog.fogColor = Vec3(0.0005, 0.0005, 0.0000000015)
                fog.fogColorCurve = Vec4((0.30*FogMultiplicator), (0.20*FogMultiplicator), (0.15*FogMultiplicator), 0)

                --print(fog.fogColor)
                fog.transparencyFadeEnd = 50
                fog.endValue = 65

        end

        function PatchTonemapComponentData(instance)
                local tonemap = TonemapComponentData(instance)
                tonemap:MakeWritable()

								tonemap.minExposure = 0.2
                tonemap.exposureAdjustTime = 1.5
                tonemap.bloomScale = tonemap.bloomScale * 0.25

                tonemap.tonemapMethod = TonemapMethod.TonemapMethod_FilmicNeutral
        end

        function PatchColorCorrectionComponentData(instance)
                local color = ColorCorrectionComponentData(instance)
                color:MakeWritable()
								--print("old brightness" .. color.brightness)
                --color.brightness = Vec3((1*BrightnessMultiplicator), (1*BrightnessMultiplicator), (1*BrightnessMultiplicator))
								--print("new brightness" .. color.brightness)
                color.contrast = Vec3(1.05, 1.05, 1.05)
                color.saturation = Vec3(1.22, 1.25, 1.5)
        end

        function PatchEnlightenComponentData(instance)
                local enlighten = EnlightenComponentData(instance)
                enlighten:MakeWritable()

                enlighten.enable = false
        end

        function PatchSunFlareComponentData(instance)
                local flare = SunFlareComponentData(instance)
                flare:MakeWritable()

                flare.excluded = true
        end

        function PatchMeshAsset(instance)
                if meshs[instance.partition.name] then
                    local mesh = MeshAsset(instance)

                    for _, value in pairs(mesh.materials) do
                        value:MakeWritable()

                        value.shader.shader = nil
                    end
                end
        end

        function PatchMeshMaterialVariation(instance)
                if variations[instance.partition.name] then
                    local variation = MeshMaterialVariation(instance)
                    variation:MakeWritable()

                    variation.shader.shader = nil
                end
        end

        function PatchEmitterTemplateData(instance)
                if emitters[instance.partition.name] then
                    local template = EmitterTemplateData(instance)
                    template:MakeWritable()
                    template.emissive = false
                end
        end

        function PatchEffectEntityData(instance)
                if effects[instance.partition.name] then
                    local effect = EffectEntityData(instance)
                    effect:MakeWritable()

                    effect.components:clear()
                end
        end

				function DynamicLights(instance)
								local Dynamic = LocalLightEntityData(instance)
										Dynamic:MakeWritable()
										Dynamic.visible = true
										Dynamic.enlightenEnable = true
										Dynamic.specularEnable = true
				end


				function PatchLensFlareEntityData(instance)
								 local flares = LensFlareEntityData(instance)
								 flares:MakeWritable()
								 flares.visible = false
				end

				-- CustomUserSettings

				PostProcessing = ResourceManager:GetSettings("GlobalPostProcessSettings")

										if PostProcessing ~= nil and UserSettingsSaved ~= true then
												PostProcessing = GlobalPostProcessSettings(PostProcessing)
												UserSettings_userBrightnessMin = PostProcessing.userBrightnessMin
												UserSettings_userBrightnessMax = PostProcessing.userBrightnessMax
												UserSettings_brightness = PostProcessing.brightness
												print('Saving User Settings:')
												print('Brightness_Min: ' .. UserSettings_userBrightnessMin)
												print('Brightness_Max: '..UserSettings_userBrightnessMax)
												UserSettingsSaved = true
										end

										if UserSettingsSaved == true then
												local PostProcessingX = ResourceManager:GetSettings("GlobalPostProcessSettings")
												PostProcessingX = GlobalPostProcessSettings(PostProcessing)
												PostProcessingX.userBrightnessMin = 1
												PostProcessingX.userBrightnessMax = 1
												PostProcessingX.brightness = Vec3(1.5, 1.5, 1.5)
												print('Changed PostProcessing')
										end


				-----------




        --function DisableBackgrounds(instance)
              --  if instance.instanceGuid == Guid('9CDAC6C3-9D3E-48F1-B8D9-737DB28AE936') then -- menu UI/Assets/MenuVisualEnvironment
                    --local s_Instance = ColorCorrectionComponentData(instance)
                    --s_Instance:MakeWritable()
                    --s_Instance.enable = false
                --end
                --if instance.instanceGuid == Guid('46FE1C37-5B7E-490C-8239-2EB2D6045D7B') then -- oob FX/VisualEnviroments/OutofCombat/OutofCombat
                    --local s_Instance = ColorCorrectionComponentData(instance)
                    --s_Instance:MakeWritable()
                    --s_Instance.enable = false
                --end
                --if instance.instanceGuid == Guid('36C2CEAE-27D2-45F3-B3F5-B831FE40ED9B') then -- FX/VisualEnviroments/OutofCombat/OutofCombat
                    --local s_Instance = FilmGrainComponentData(instance)
                    --s_Instance:MakeWritable()
                    --s_Instance.enable = false
                --end
        --end


        --Remove Backdrop / Ring around the Map
        local badstuff = ResourceManager:GetSettings("GameRenderSettings")
        if badstuff ~= nil then
        				badstuff = GameRenderSettings(badstuff)
        				badstuff.edgeModelsEnable = false
        end


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
        	spotLight.intensity = 1.4 --brightness
        	spotLight.coneOuterAngle = 35
        	spotLight.orthoWidth = 7
        	spotLight.orthoHeight = 7
        	spotLight.frustumFov = 40 --size
        	spotLight.castShadowsEnable = true
        	spotLight.castShadowsMinLevel = QualityLevel.QualityLevel_Ultra
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

        print('Using Preset Night')

return true
end

-------------------------------------------------------------------------------

function Bright_Night(Map)
	SkyboxRotation:Rotate(Map)
  --Code by Reirei ; Custom Settings + Extra Code by Lesley & IllustrisJack
					local emitters = {
				    -- MP_Subway
				    ['fx/ambient/levelspecific/mp15/emitters/em_amb_mp15_background_smokepillar_m_01'] = true,

				    -- MP_007
				    ['fx/ambient/levelspecific/mp_07/emitters/em_mp7_distancemist_xxl_smoke'] = true,
				    ['fx/ambient/levelspecific/mp_07/emitters/em_mp7_battlesmoke_xl_smoke'] = true,

				    -- MP_013
				    ['fx/ambient/levelspecific/mp_013/emitters_clouds/em_amb_mp_013_clouds_area_s_01'] = true,
				    ['fx/ambient/levelspecific/mp_013/emitters_clouds/em_amb_mp_013_clouds_background_area_s_01'] = true,
				    ['fx/ambient/levelspecific/mp_013/emitters_clouds/em_amb_mp_013_clouds_background_downwards_area_s_01'] = true,
				    ['fx/ambient/levelspecific/mp_013/emitters_clouds/em_amb_mp_013_clouds_jumpthrough_01'] = true,

				    -- MP_018
				    ['levels/mp_018/fx/em_fogarea_smoke_m'] = true,
				    ['levels/mp_018/fx/em_fogarea_smoke_xl'] = true,
				    ['levels/mp_018/fx/em_fogarea_lowend_smoke_m'] = true,
				    ['levels/mp_018/fx/em_fogarea_lowend_smoke_xl'] = true,

				    -- XP2_Skybar
				    ['fx/dlc/xp2/ambient/levelspecific/mp_skybar/emitters/em_dlc_amb_mpskybar_bgsmog_smoke'] = true,
				}

				local meshs = {
				    -- MP_Subway
				    ['levels/mp_subway/objects/backdrops/mp15_smokepillar_01_mesh'] = true,
				    ['levels/mp_subway/objects/backdrops/mp15_smokepillarwhite_01_mesh'] = true,
				    ['levels/mp_subway/objects/backdrops/mp_subway_smokepillar02_mesh'] = true,

				    -- MP_007
				    ['levels/mp_007/terrain/mp007_matte01_mesh'] = true,
				    ['levels/mp_007/terrain/mp007_matte02_mesh'] = true,
				    ['levels/mp_007/terrain/mp007_matte03_mesh'] = true,
				    ['levels/mp_007/terrain/mp007_matte04_mesh'] = true,
				    ['levels/mp_007/terrain/mp007_matte05_mesh'] = true,
				    ['levels/mp_007/terrain/mp007_matte06_mesh'] = true,
				    ['levels/mp_007/terrain/mp007_matte07_mesh'] = true,
				    ['levels/mp_007/terrain/mp007_matte_far01_mesh'] = true,
				    ['levels/mp_007/terrain/mp007_matte_far02_mesh'] = true,
				    ['levels/mp_007/terrain/mp007_matte_far03_mesh'] = true,
				    ['levels/mp_007/props/mp007_waterwash_01_mesh'] = true,
				    ['levels/mp_007/props/mp007_waterwash_02_mesh'] = true,

				    -- MP_011
				    ['levels/mp_011/objects/mp011_backdrop_01_mesh'] = true,
				    ['levels/mp_011/objects/mp011_backdropesplanade_01_mesh'] = true,
				    ['levels/mp_011/objects/mp011_backdropesplanade_02_mesh'] = true,
				    ['levels/mp_011/water/meshes/mp_011_watersurface01_mesh'] = true,

				    -- MP_012
				    ['levels/mp_012/terrain/mp012_matte_4parts_1_mesh'] = true,
				    ['levels/mp_012/terrain/mp012_matte_4parts_2_mesh'] = true,
				    ['levels/mp_012/terrain/mp012_matte_4parts_3_mesh'] = true,
				    ['levels/mp_012/terrain/mp012_matte_4parts_4_mesh'] = true,
				    ['levels/mp_012/terrain/mp012_matte_4parts_5_mesh'] = true,
				    ['levels/mp_012/terrain/mp012_matte_4parts_6_mesh'] = true,
				    ['levels/mp_012/objects/smokestacks/smokestack_01_mesh'] = true,

				    -- MP_013
				    ['levels/mp_013/props/mp013_cloudlayer_mesh'] = true,

				    -- MP_017
				    ['levels/mp_017/terrain/mp_017_waves_01_mesh'] = true,

				    -- MP_018
				    ['levels/mp_018/terrain/mp018_mattepainting_chunk01_mesh'] = true,
				    ['levels/mp_018/terrain/mp018_mattepainting_chunk02_mesh'] = true,
				    ['levels/mp_018/terrain/mp018_mattepainting_chunk03_mesh'] = true,
				    ['levels/mp_018/terrain/mp018_wave_01_mesh'] = true,

				    -- XP1_001
				    ['levels/xp1_001/objects/mattepainting_01_mesh'] = true,
				    ['levels/xp1_001/objects/mattepainting_02_mesh'] = true,
				    ['levels/xp1_001/objects/mattepainting_03_mesh'] = true,
				    ['levels/xp1_001/objects/mattepainting_04_mesh'] = true,

				    -- XP1_002
				    ['levels/xp1_002/objects/xp1_002__wave_01_mesh'] = true,

				    -- XP1_004
				    ['xp_raw/surrounding/smokepillars/smokepillar_01_mesh'] = true,
				    ['levels/xp1_004/props/wake_wave_02/wake_wave_02_mesh'] = true,
				    ['levels/xp1_004/props/wave_01/wave_01_mesh'] = true,

				    -- XP2_Palace
				    ['xp2/objects/godrays_01/godrays_01_mesh'] = true,

				    -- XP2_Skybar
				    ['levels/xp2_skybar/objects/smokepillar_bg/smokepillar_xp2_2_mesh'] = true,

				    -- XP3_Alborz
				    ['levels/mp_whitepeak/objects/mountainsidecloud_01_mesh'] = true,
				    ['levels/mp_whitepeak/objects/mountainsidecloud_02_mesh'] = true,
				    ['levels/mp_whitepeak/objects/mountainsidecloud_04_mesh'] = true,

				    -- XP3_Desert
				    ['levels/xp3_desert/props/xp3_bandar_backdropmatte_01_mesh'] = true,

				    -- XP4_Quake
				    ['levels/sp_valley/terrain/cloud_moving_mesh'] = true
				}

				local variations = {
				    -- MP_012
				    ['levels/mp_012/objects/smokestacks/smokestack_01_02'] = true,

				    -- MP_018
				    ['levels/xp1_001/objects/wave_01_xp001'] = true,

				    -- XP2_Skybar
				    ['levels/xp2_skybar/objects/smokepillar_bg/smokepillar_01_xp2'] = true,

				    -- XP3_Valley
				    ['levels/xp3_valley/objects/mountainsidecloud_01_valley'] = true,
				    ['levels/xp3_valley/objects/mountainsidecloud_02_valley'] = true,
				    ['levels/xp3_valley/objects/mountainsidecloud_04_vvalley'] = true
				}

				local effects = {
				    -- MP_007
				    ['fx/ambient/levelspecific/mp_07/fx_amb_mp_07_godrays'] = true,

				    -- XP2_Factory
				    ['fx/dlc/xp2/ambient/levelspecific/mp_factory/fx_factory_newpart_godrays_smallwindows'] = true,
				    ['fx/dlc/xp2/ambient/levelspecific/mp_factory/fx_factory_newpart_godrays_standalone'] = true,
				    ['fx/dlc/xp2/ambient/levelspecific/mp_factory/fx_factory_oldpart_godrays_bg'] = true,
				    ['fx/dlc/xp2/ambient/levelspecific/mp_factory/fx_factory_oldpart_godrays_standalone_big'] = true,
				    ['fx/dlc/xp2/ambient/levelspecific/mp_factory/fx_factory_oldpart_godrays_windows'] = true,

				    -- XP2_Office
				    ['fx/ambient/levelspecific/sp_villa/fx_amb_sp_villa_inhouse_window_godrays'] = true,

				    -- XP2_Palace
				    ['fx/dlc/xp2/ambient/levelspecific/mp_palace/fx_dlc2_mp_palace_godrays'] = true,
				    ['fx/dlc/xp2/ambient/levelspecific/mp_palace/fx_palace_window_godrays'] = true,

				    -- XP2_FD
				    ['fx/dlc/xp4/ambient/levelspecific/xp4_findistrict/fx_dlc_xp4_findistrict_godrays_l'] = true,

				    -- XP4_Parl
				    ['fx/dlc/xp4/ambient/levelspecific/xp4_parliament/fx_dlc_xp4_parliament_godrays_s'] = true,
				    ['fx/dlc/xp4/ambient/levelspecific/xp4_parliament/fx_dlc_xp4_parliament_godrays_xl'] = true,

				    -- XP5_002
				    ['fx/ambient/levelspecific/sp_03/fx_amb_sp03_littlewindow_godrays'] = true,
				}

				local waters = {
				    ['Levels/XP1_001/XP1_001'] = true,
				    ['Levels/XP1_002/XP1_002'] = true,
				    ['Levels/XP1_003/XP1_003'] = true,
				}

				local envmaps = {
				    ['levels/mp_subway/lighting/ve_mp_subway_city_01'] = true,
				    ['levels/mp_011/lighting/ve_mp_011_day01'] = true,
				    ['levels/xp5_001/lighting/ve_xp5_001_01'] = true,
				    ['levels/xp5_002/lighting/ve_xp5_002_01'] = true,
				    ['levels/xp5_003/lighting/ve_xp5_003_01'] = true,
				    ['levels/xp5_004/lighting/ve_xp5_004_02'] = true
				}

				Events:Subscribe('Partition:Loaded', function(partition)
				    for _, instance in pairs(partition.instances) do
				        if instance:Is('OutdoorLightComponentData') then
				            PatchOutdoorLightComponentData(instance)
				        elseif instance:Is('SkyComponentData') then
				            PatchSkyComponentData(instance)
				        elseif instance:Is('FogComponentData') then
				            PatchFogComponentData(instance)
				        elseif instance:Is('TonemapComponentData') then
				            PatchTonemapComponentData(instance)
				        elseif instance:Is('ColorCorrectionComponentData') then
				            PatchColorCorrectionComponentData(instance)
				        elseif instance:Is('EnlightenComponentData') then
				            PatchEnlightenComponentData(instance)
				        elseif instance:Is('SunFlareComponentData') then
				            PatchSunFlareComponentData(instance)
				        elseif instance:Is('MeshAsset') then
				            PatchMeshAsset(instance)
				        elseif instance:Is('MeshMaterialVariation') then
				            PatchMeshMaterialVariation(instance)
				        elseif instance:Is('EmitterTemplateData') then
				            PatchEmitterTemplateData(instance)
				        elseif instance:Is('EffectEntityData') then
				            PatchEffectEntityData(instance)
				        end
				    end
				end)

				Events:Subscribe('Level:LoadResources', function(level)
				    local visual = ResourceManager:GetSettings("VisualTerrainSettings")

				    if visual ~= nil then
				        visual = VisualTerrainSettings(visual)
				        if waters[level] then
				            visual.drawWaterEnable = false
				        else
				            visual.drawWaterEnable = true
				        end
				    end
				end)

				function PatchOutdoorLightComponentData(instance)
				    local outdoor = OutdoorLightComponentData(instance)
				    outdoor:MakeWritable()

				    outdoor.sunColor = Vec3(0.02, 0.02, 0.022)
				    outdoor.skyColor = Vec3(0.02, 0.02, 0.022)
				    outdoor.groundColor = Vec3(0, 0, 0)

				    outdoor.skyEnvmapShadowScale = 0.5
				end

				function PatchSkyComponentData(instance)
				    local sky = SkyComponentData(instance)
				    sky:MakeWritable()

				    sky.brightnessScale = 0.0001
				    sky.sunSize = 0
				    sky.sunScale = 0

				    sky.cloudLayer1SunLightIntensity = 0.01
				    sky.cloudLayer1SunLightPower = 0.01
				    sky.cloudLayer1AmbientLightIntensity = 0.04

				    sky.cloudLayer2SunLightIntensity = 0.01
				    sky.cloudLayer2SunLightPower = 0.01
				    sky.cloudLayer2AmbientLightIntensity = 0.04

				    sky.staticEnvmapScale = 0.1
				    sky.skyEnvmap8BitTexScale = 0.8

				    if envmaps[sky.partition.name] then
				        sky.staticEnvmapScale = 0.01
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

				    fog.fogColor = Vec3(0.02, 0.02, 0.02)
				end

				function PatchTonemapComponentData(instance)
				    local tonemap = TonemapComponentData(instance)
				    tonemap:MakeWritable()

				    tonemap.minExposure = 2
				    tonemap.maxExposure = 4

				    tonemap.exposureAdjustTime = 0.5
				    --tonemap.middleGray = 10

				    tonemap.tonemapMethod = TonemapMethod.TonemapMethod_FilmicNeutral
				end

				function PatchColorCorrectionComponentData(instance)
				    local color = ColorCorrectionComponentData(instance)
				    color:MakeWritable()

				    if instance.partition.name == 'ui/assets/menuvisualenvironment' then
				        color.brightness = Vec3(1, 1, 1)
				        color.contrast = Vec3(1, 1, 1)
				        color.saturation = Vec3(0.5, 0.5, 0.5)
				    end

				    if instance.partition.name == 'fx/visualenviroments/outofcombat/outofcombat' then
				        color.contrast = Vec3(0.9, 0.9, 0.9)
				    end
				end

				function PatchEnlightenComponentData(instance)
				    local enlighten = EnlightenComponentData(instance)
				    enlighten:MakeWritable()

				    enlighten.enable = false
				end

				function PatchSunFlareComponentData(instance)
				    local flare = SunFlareComponentData(instance)
				    flare:MakeWritable()

				    flare.excluded = true
				end

				function PatchMeshAsset(instance)
				    if meshs[instance.partition.name] then
				        local mesh = MeshAsset(instance)

				        for _, value in pairs(mesh.materials) do
				            value:MakeWritable()

				            value.shader.shader = nil
				        end
				    end
				end

				function PatchMeshMaterialVariation(instance)
				    if variations[instance.partition.name] then
				        local variation = MeshMaterialVariation(instance)
				        variation:MakeWritable()

				        variation.shader.shader = nil
				    end
				end

				function PatchEmitterTemplateData(instance)
				    if emitters[instance.partition.name] then
				        local template = EmitterTemplateData(instance)
				        template:MakeWritable()

				        template.emissive = false
				    end
				end

				function PatchEffectEntityData(instance)
				    if effects[instance.partition.name] then
				        local effect = EffectEntityData(instance)
				        effect:MakeWritable()

				        effect.components:clear()
				    end
				end

				function DynamicLights(instance)
								local Dynamic = LocalLightEntityData(instance)
										Dynamic:MakeWritable()
										Dynamic.visible = true
										Dynamic.enlightenEnable = true
				end


        function DisableBackgrounds(instance)
                if instance.instanceGuid == Guid('9CDAC6C3-9D3E-48F1-B8D9-737DB28AE936') then -- menu UI/Assets/MenuVisualEnvironment
                    local s_Instance = ColorCorrectionComponentData(instance)
                    s_Instance:MakeWritable()
                    s_Instance.enable = false
                end
                if instance.instanceGuid == Guid('46FE1C37-5B7E-490C-8239-2EB2D6045D7B') then -- oob FX/VisualEnviroments/OutofCombat/OutofCombat
                    local s_Instance = ColorCorrectionComponentData(instance)
                    s_Instance:MakeWritable()
                    s_Instance.enable = false
                end
                if instance.instanceGuid == Guid('36C2CEAE-27D2-45F3-B3F5-B831FE40ED9B') then -- FX/VisualEnviroments/OutofCombat/OutofCombat
                    local s_Instance = FilmGrainComponentData(instance)
                    s_Instance:MakeWritable()
                    s_Instance.enable = false
                end
        end


        --Remove Backdrop / Ring around the Map
        local badstuff = ResourceManager:GetSettings("GameRenderSettings")
        if badstuff ~= nil then
        		badstuff = GameRenderSettings(badstuff)
        		badstuff.edgeModelsEnable = false
        end


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

        	spotLight.radius = 120
        	spotLight.intensity = 1.4 --brightness
        	spotLight.coneOuterAngle = 50
        	spotLight.orthoWidth = 7
        	spotLight.orthoHeight = 7
        	spotLight.frustumFov = 40 --size
        	spotLight.castShadowsEnable = true
        	spotLight.castShadowsMinLevel = QualityLevel.QualityLevel_Ultra
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


				-- CustomUserSettings

				PostProcessing = ResourceManager:GetSettings("GlobalPostProcessSettings")

										if PostProcessing ~= nil and UserSettingsSaved ~= true then
												PostProcessing = GlobalPostProcessSettings(PostProcessing)
												UserSettings_userBrightnessMin = PostProcessing.userBrightnessMin
												UserSettings_userBrightnessMax = PostProcessing.userBrightnessMax
												UserSettings_brightness = PostProcessing.brightness
												print('Saving User Settings:')
												print('Brightness_Min: ' .. UserSettings_userBrightnessMin)
												print('Brightness_Max: '..UserSettings_userBrightnessMax)
												UserSettingsSaved = true
										end

										if UserSettingsSaved == true then
												local PostProcessingX = ResourceManager:GetSettings("GlobalPostProcessSettings")
												PostProcessingX = GlobalPostProcessSettings(PostProcessing)
												PostProcessingX.userBrightnessMin = UserSettings_userBrightnessMin
												PostProcessingX.userBrightnessMax = UserSettings_userBrightnessMax
												PostProcessingX.brightness = Vec3(1.0, 1.0, 1.0)
												print('Changed PostProcessing')
										end


        print('Using Preset Bright_Night')


return true
end

-------------------------------------------------------------------------------
function Morning(Map)
	SkyboxRotation:Rotate(Map)
  ----
        Events:Subscribe('Partition:Loaded', function(partition)
            for _, instance in pairs(partition.instances) do
                if instance:Is('OutdoorLightComponentData') then
                    PatchOutdoorLightComponentData(instance)
                --elseif instance:Is('SkyComponentData') then
                    --PatchSkyComponentData(instance)
                elseif instance:Is('FogComponentData') then
                    PatchFogComponentData(instance)
                elseif instance:Is('TonemapComponentData') then
                    PatchTonemapComponentData(instance)
                elseif instance:Is('ColorCorrectionComponentData') then
                    PatchColorCorrectionComponentData(instance)
                elseif instance:Is('SkyComponentData') then
                    PatchSkyComponentData(instance)
                elseif instance:Is('SunFlareComponentData') then
                    PatchSunFlareComponentData(instance)
                end
            DisableBackgrounds(instance)
            end
        end)

        function PatchSunFlareComponentData(instance)
                local flare = SunFlareComponentData(instance)
                flare:MakeWritable()
                local flaremultiplier = 0.2

                flare.element1Size = flare.element1Size*flaremultiplier
                flare.element2Size = flare.element2Size*flaremultiplier
                flare.element3Size = flare.element3Size*flaremultiplier
                flare.element4Size = flare.element4Size*flaremultiplier
                flare.element5Size = flare.element5Size*flaremultiplier


        end

        function PatchOutdoorLightComponentData(instance)
                local outdoor = OutdoorLightComponentData(instance)
                outdoor:MakeWritable()

								outdoor.sunColor = Vec3(0.5, 0.3, 0.3)
                outdoor.skyColor = Vec3(0.5, 0.3, 0.3)
                outdoor.groundColor = outdoor.skyColor/2

                outdoor.sunRotationY = 9.5;
                outdoor.sunRotationX = 255;

        end

        function PatchSkyComponentData(instance)
              local sky = SkyComponentData(instance)
                sky:MakeWritable()

                sky.brightnessScale = 0.45

								sky.panoramicRotation = rotation
                --sky.sunSize = 1
                --sky.sunScale = 15

                --sky.cloudLayer1SunLightIntensity = 0
                --sky.cloudLayer1SunLightPower = 0
                --sky.cloudLayer1AmbientLightIntensity = 0.08

                --sky.cloudLayer2SunLightIntensity = 0.1
                --sky.cloudLayer2SunLightPower = 0.2
                --sky.cloudLayer2AmbientLightIntensity = 0.08

                --sky.staticEnvmapScale = 0.005
                --sky.skyEnvmap8BitTexScale = 0.005

                --if
                --    sky.partition.name == 'levels/mp_subway/lighting/ve_mp_subway_city_01' or
                --    sky.partition.name == 'levels/mp_011/lighting/ve_mp_011_day01'
                --then
                --    sky.staticEnvmapScale = 0.01
                --end

                --if sky.partition.name == 'levels/mp_subway/lighting/ve_mp_subway_subway_01' then
                --    local partitionGuid = Guid('36536A99-7BE3-11E0-8611-A913E18AE9A4') -- levels/sp_paris/lighting/sp_paris_static_envmap
                --    local instanceGuid = Guid('64EE680C-405E-2E81-E327-6DF58605AB0B') -- TextureAsset

                --    ResourceManager:RegisterInstanceLoadHandlerOnce(partitionGuid, instanceGuid, function(loadedInstance)
                --        sky.staticEnvmapTexture = TextureAsset(loadedInstance)
                --    end)
              --  end
        end

        function PatchFogComponentData(instance)
                local fog = FogComponentData(instance)
                fog:MakeWritable()

                fog.enable = true
                fog.fogColorEnable = true

                --fog.start = 35

                fog.fogColorStart = 5
                fog.fogColorEnd = 100
                fog.fogColor = Vec3(0.005, 0.005, 0.005)
                fog.fogColorCurve = Vec4(0.04, 0.035, 0.03, 0.000)

                --fog.transparencyFadeStart = 2
                --fog.transparencyFadeEnd = 80

                --fog.endValue = 150

        end

        function PatchTonemapComponentData(instance)
                local tonemap = TonemapComponentData(instance)
                tonemap:MakeWritable()

                --tonemap.minExposure = 3
                --tonemap.maxExposure = 6

                tonemap.exposureAdjustTime = 1.5
                --tonemap.middleGray = 3

                tonemap.tonemapMethod = TonemapMethod.TonemapMethod_FilmicNeutral
        end

        function PatchColorCorrectionComponentData(instance)
                local color = ColorCorrectionComponentData(instance)
                color:MakeWritable()

                color.brightness = Vec3(0.9, 0.9, 0.9)
                color.contrast = Vec3(1.1, 1.1, 1.1)
                color.saturation = Vec3(1.2, 1.15, 1.15)
        end

        function DisableBackgrounds(instance)
                if instance.instanceGuid == Guid('9CDAC6C3-9D3E-48F1-B8D9-737DB28AE936') then -- menu UI/Assets/MenuVisualEnvironment
                    local s_Instance = ColorCorrectionComponentData(instance)
                    s_Instance:MakeWritable()
                    s_Instance.enable = false
                end
                if instance.instanceGuid == Guid('46FE1C37-5B7E-490C-8239-2EB2D6045D7B') then -- oob FX/VisualEnviroments/OutofCombat/OutofCombat
                    local s_Instance = ColorCorrectionComponentData(instance)
                    s_Instance:MakeWritable()
                    s_Instance.enable = false
                end
                if instance.instanceGuid == Guid('36C2CEAE-27D2-45F3-B3F5-B831FE40ED9B') then -- FX/VisualEnviroments/OutofCombat/OutofCombat
                    local s_Instance = FilmGrainComponentData(instance)
                    s_Instance:MakeWritable()
                    s_Instance.enable = false
                end
        end

				-- CustomUserSettings

				local PostProcessing = ResourceManager:GetSettings("GlobalPostProcessSettings")

										if PostProcessing ~= nil and UserSettingsSaved ~= true then
												PostProcessing = GlobalPostProcessSettings(PostProcessing)
												UserSettings_userBrightnessMin = PostProcessing.userBrightnessMin
												UserSettings_userBrightnessMax = PostProcessing.userBrightnessMax
												UserSettings_brightness = PostProcessing.brightness
												print('Saving User Settings:')
												print('Brightness_Min: ' .. UserSettings_userBrightnessMin)
												print('Brightness_Max: '..UserSettings_userBrightnessMax)
												UserSettingsSaved = true
										end

										if UserSettingsSaved == true then
												local PostProcessingX = ResourceManager:GetSettings("GlobalPostProcessSettings")
												PostProcessingX = GlobalPostProcessSettings(PostProcessing)
												PostProcessingX.userBrightnessMin = UserSettings_userBrightnessMin
												PostProcessingX.userBrightnessMax = UserSettings_userBrightnessMax
												PostProcessingX.brightness = Vec3(1.0, 1.0, 1.0)
												print('Changed PostProcessing')
										end



        print('Using Preset Morning')


return true
end

-------------------------------------------------------------------------------
function Evening(Map)
  --Code by Reirei ; Custom Settings + Extra Code by Lesley & IllustrisJack
	SkyboxRotation:Rotate(Map)
					--------------------------------- Standard --------------------------------------
	local emitters = {
	    -- MP_Subway
	    ['fx/ambient/levelspecific/mp15/emitters/em_amb_mp15_background_smokepillar_m_01'] = true,

	    -- MP_007
	    ['fx/ambient/levelspecific/mp_07/emitters/em_mp7_distancemist_xxl_smoke'] = true,
	    ['fx/ambient/levelspecific/mp_07/emitters/em_mp7_battlesmoke_xl_smoke'] = true,

	    -- MP_013
	    ['fx/ambient/levelspecific/mp_013/emitters_clouds/em_amb_mp_013_clouds_area_s_01'] = true,
	    ['fx/ambient/levelspecific/mp_013/emitters_clouds/em_amb_mp_013_clouds_background_area_s_01'] = true,
	    ['fx/ambient/levelspecific/mp_013/emitters_clouds/em_amb_mp_013_clouds_background_downwards_area_s_01'] = true,
	    ['fx/ambient/levelspecific/mp_013/emitters_clouds/em_amb_mp_013_clouds_jumpthrough_01'] = true,

	    -- MP_018
	    ['levels/mp_018/fx/em_fogarea_smoke_m'] = true,
	    ['levels/mp_018/fx/em_fogarea_smoke_xl'] = true,
	    ['levels/mp_018/fx/em_fogarea_lowend_smoke_m'] = true,
	    ['levels/mp_018/fx/em_fogarea_lowend_smoke_xl'] = true,

	    -- XP2_Skybar
	    ['fx/dlc/xp2/ambient/levelspecific/mp_skybar/emitters/em_dlc_amb_mpskybar_bgsmog_smoke'] = true,
	}

	local meshs = {
	    -- MP_Subway
	    ['levels/mp_subway/objects/backdrops/mp15_smokepillar_01_mesh'] = true,
	    ['levels/mp_subway/objects/backdrops/mp15_smokepillarwhite_01_mesh'] = true,
	    ['levels/mp_subway/objects/backdrops/mp_subway_smokepillar02_mesh'] = true,

	    -- MP_007
	    ['levels/mp_007/terrain/mp007_matte01_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte02_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte03_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte04_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte05_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte06_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte07_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte_far01_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte_far02_mesh'] = true,
	    ['levels/mp_007/terrain/mp007_matte_far03_mesh'] = true,
	    ['levels/mp_007/props/mp007_waterwash_01_mesh'] = true,
	    ['levels/mp_007/props/mp007_waterwash_02_mesh'] = true,

	    -- MP_011
	    ['levels/mp_011/objects/mp011_backdrop_01_mesh'] = true,
	    ['levels/mp_011/objects/mp011_backdropesplanade_01_mesh'] = true,
	    ['levels/mp_011/objects/mp011_backdropesplanade_02_mesh'] = true,
	    ['levels/mp_011/water/meshes/mp_011_watersurface01_mesh'] = true,

	    -- MP_012
	    ['levels/mp_012/terrain/mp012_matte_4parts_1_mesh'] = true,
	    ['levels/mp_012/terrain/mp012_matte_4parts_2_mesh'] = true,
	    ['levels/mp_012/terrain/mp012_matte_4parts_3_mesh'] = true,
	    ['levels/mp_012/terrain/mp012_matte_4parts_4_mesh'] = true,
	    ['levels/mp_012/terrain/mp012_matte_4parts_5_mesh'] = true,
	    ['levels/mp_012/terrain/mp012_matte_4parts_6_mesh'] = true,
	    ['levels/mp_012/objects/smokestacks/smokestack_01_mesh'] = true,

	    -- MP_013
	    ['levels/mp_013/props/mp013_cloudlayer_mesh'] = true,

	    -- MP_017
	    ['levels/mp_017/terrain/mp_017_waves_01_mesh'] = true,

	    -- MP_018
	    ['levels/mp_018/terrain/mp018_mattepainting_chunk01_mesh'] = true,
	    ['levels/mp_018/terrain/mp018_mattepainting_chunk02_mesh'] = true,
	    ['levels/mp_018/terrain/mp018_mattepainting_chunk03_mesh'] = true,
	    ['levels/mp_018/terrain/mp018_wave_01_mesh'] = true,

	    -- XP1_001
	    ['levels/xp1_001/objects/mattepainting_01_mesh'] = true,
	    ['levels/xp1_001/objects/mattepainting_02_mesh'] = true,
	    ['levels/xp1_001/objects/mattepainting_03_mesh'] = true,
	    ['levels/xp1_001/objects/mattepainting_04_mesh'] = true,

	    -- XP1_002
	    ['levels/xp1_002/objects/xp1_002__wave_01_mesh'] = true,

	    -- XP1_004
	    ['xp_raw/surrounding/smokepillars/smokepillar_01_mesh'] = true,
	    ['levels/xp1_004/props/wake_wave_02/wake_wave_02_mesh'] = true,
	    ['levels/xp1_004/props/wave_01/wave_01_mesh'] = true,

	    -- XP2_Palace
	    ['xp2/objects/godrays_01/godrays_01_mesh'] = true,

	    -- XP2_Skybar
	    ['levels/xp2_skybar/objects/smokepillar_bg/smokepillar_xp2_2_mesh'] = true,

	    -- XP3_Alborz
	    ['levels/mp_whitepeak/objects/mountainsidecloud_01_mesh'] = true,
	    ['levels/mp_whitepeak/objects/mountainsidecloud_02_mesh'] = true,
	    ['levels/mp_whitepeak/objects/mountainsidecloud_04_mesh'] = true,

	    -- XP3_Desert
	    ['levels/xp3_desert/props/xp3_bandar_backdropmatte_01_mesh'] = true,

	    -- XP4_Quake
	    ['levels/sp_valley/terrain/cloud_moving_mesh'] = true
	}

	local variations = {
	    -- MP_012
	    ['levels/mp_012/objects/smokestacks/smokestack_01_02'] = true,

	    -- MP_018
	    ['levels/xp1_001/objects/wave_01_xp001'] = true,

	    -- XP2_Skybar
	    ['levels/xp2_skybar/objects/smokepillar_bg/smokepillar_01_xp2'] = true,

	    -- XP3_Valley
	    ['levels/xp3_valley/objects/mountainsidecloud_01_valley'] = true,
	    ['levels/xp3_valley/objects/mountainsidecloud_02_valley'] = true,
	    ['levels/xp3_valley/objects/mountainsidecloud_04_vvalley'] = true
	}

	local effects = {
	    -- MP_007
	    ['fx/ambient/levelspecific/mp_07/fx_amb_mp_07_godrays'] = true,

	    -- XP2_Factory
	    ['fx/dlc/xp2/ambient/levelspecific/mp_factory/fx_factory_newpart_godrays_smallwindows'] = true,
	    ['fx/dlc/xp2/ambient/levelspecific/mp_factory/fx_factory_newpart_godrays_standalone'] = true,
	    ['fx/dlc/xp2/ambient/levelspecific/mp_factory/fx_factory_oldpart_godrays_bg'] = true,
	    ['fx/dlc/xp2/ambient/levelspecific/mp_factory/fx_factory_oldpart_godrays_standalone_big'] = true,
	    ['fx/dlc/xp2/ambient/levelspecific/mp_factory/fx_factory_oldpart_godrays_windows'] = true,

	    -- XP2_Office
	    ['fx/ambient/levelspecific/sp_villa/fx_amb_sp_villa_inhouse_window_godrays'] = true,

	    -- XP2_Palace
	    ['fx/dlc/xp2/ambient/levelspecific/mp_palace/fx_dlc2_mp_palace_godrays'] = true,
	    ['fx/dlc/xp2/ambient/levelspecific/mp_palace/fx_palace_window_godrays'] = true,

	    -- XP2_FD
	    ['fx/dlc/xp4/ambient/levelspecific/xp4_findistrict/fx_dlc_xp4_findistrict_godrays_l'] = true,

	    -- XP4_Parl
	    ['fx/dlc/xp4/ambient/levelspecific/xp4_parliament/fx_dlc_xp4_parliament_godrays_s'] = true,
	    ['fx/dlc/xp4/ambient/levelspecific/xp4_parliament/fx_dlc_xp4_parliament_godrays_xl'] = true,

	    -- XP5_002
	    ['fx/ambient/levelspecific/sp_03/fx_amb_sp03_littlewindow_godrays'] = true,
	}


	local envmaps = {
	    ['levels/mp_subway/lighting/ve_mp_subway_city_01'] = true,
	    ['levels/mp_011/lighting/ve_mp_011_day01'] = true,
	    ['levels/xp5_001/lighting/ve_xp5_001_01'] = true,
	    ['levels/xp5_002/lighting/ve_xp5_002_01'] = true,
	    ['levels/xp5_003/lighting/ve_xp5_003_01'] = true,
	    ['levels/xp5_004/lighting/ve_xp5_004_02'] = true
	}




        Events:Subscribe('Partition:Loaded', function(partition)
            for _, instance in pairs(partition.instances) do
                if instance:Is('OutdoorLightComponentData') then
                    PatchOutdoorLightComponentData(instance)
                elseif instance:Is('SkyComponentData') then
                    PatchSkyComponentData(instance)
                elseif instance:Is('FogComponentData') then
                    PatchFogComponentData(instance)
                elseif instance:Is('TonemapComponentData') then
                    PatchTonemapComponentData(instance)
                elseif instance:Is('ColorCorrectionComponentData') then
                    PatchColorCorrectionComponentData(instance)
                elseif instance:Is('EnlightenComponentData') then
                    PatchEnlightenComponentData(instance)
                elseif instance:Is('SunFlareComponentData') then
                    PatchSunFlareComponentData(instance)
                elseif instance:Is('MeshAsset') then
                    PatchMeshAsset(instance)
                --elseif instance:Is('MeshMaterialVariation') then
                --    PatchMeshMaterialVariation(instance)
                --elseif instance:Is('EmitterTemplateData') then
                --    PatchEmitterTemplateData(instance)
                --elseif instance:Is('EffectEntityData') then
                --    PatchEffectEntityData(instance)
								elseif instance:Is('LocalLightEntityData') then
										DynamicLights(instance)
								elseif instance:Is('LensFlareEntityData') then
										PatchLensFlareEntityData(instance)
                end
            end

        end)

				Events:Subscribe('Level:LoadResources', function(level)
    		local visual = ResourceManager:GetSettings("VisualTerrainSettings")

		    	if visual ~= nil then
		        		visual = VisualTerrainSettings(visual)
		            visual.drawWaterEnable = true
		    	end
				end)

				function PatchOutdoorLightComponentData(instance)
                local outdoor = OutdoorLightComponentData(instance)
                outdoor:MakeWritable()

								outdoor.sunColor = Vec3(1.0, 0.5, 0.2)
		            outdoor.skyColor = Vec3((1.0/2), (0.5/2), (0.2/2))
		            outdoor.groundColor = Vec3(0, 0, 0)

                outdoor.sunRotationY = 15;
                outdoor.sunRotationX = 50;

        end

--
        function PatchSkyComponentData(instance)
                local sky = SkyComponentData(instance)
                sky:MakeWritable()

                sky.brightnessScale = 0.25

                --sky.cloudLayer1SunLightIntensity = 0
                --sky.cloudLayer1SunLightPower = 0.05
                --sky.cloudLayer1AmbientLightIntensity = 0.05

                --sky.cloudLayer2SunLightIntensity = 0
                --sky.cloudLayer2SunLightPower = 0.05
                --sky.cloudLayer2AmbientLightIntensity = 0.05

                --sky.staticEnvmapScale = 0.01
                --sky.skyEnvmap8BitTexScale = 0.01

								sky.panoramicRotation = rotation


                if
                    sky.partition.name == 'levels/mp_subway/lighting/ve_mp_subway_city_01' or
                    sky.partition.name == 'levels/mp_011/lighting/ve_mp_011_day01'
                then
                    sky.staticEnvmapScale = 0.05
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

                fog.enable = true
                --fog.fogColorEnable = true

                --fog.start = 2

                --fog.fogColorStart = 2
                --fog.fogColorEnd = 40
								--print(Settings.CustomFog)
                --fog.fogColor = Vec3(0.000005, 0.000005, 0.0000000015)
                --fog.fogColorCurve = Vec4(0.00006, 0.00005, 0.00001, 0)

                --print(fog.fogColor)
                --fog.transparencyFadeEnd = 40
                --fog.endValue = 50

        end

        function PatchTonemapComponentData(instance)
                local tonemap = TonemapComponentData(instance)
                tonemap:MakeWritable()

                tonemap.exposureAdjustTime = 1.5
                tonemap.bloomScale = tonemap.bloomScale * 0.25

                tonemap.tonemapMethod = TonemapMethod.TonemapMethod_FilmicNeutral
        end

        function PatchColorCorrectionComponentData(instance)
                local color = ColorCorrectionComponentData(instance)
                color:MakeWritable()
								--print("old brightness" .. color.brightness)
                --color.brightness = Vec3((1*BrightnessMultiplicator), (1*BrightnessMultiplicator), (1*BrightnessMultiplicator))
								--print("new brightness" .. color.brightness)
								color.brightness = Vec3(0.6, 0.6, 0.6)
		            color.contrast = Vec3(1.3, 1.3, 1.3)
		            color.saturation = Vec3(1.25, 1.2, 1.2)
        end

        function PatchEnlightenComponentData(instance)
                local enlighten = EnlightenComponentData(instance)
                enlighten:MakeWritable()

                enlighten.enable = true
        end

				function PatchSunFlareComponentData(instance)
                local flare = SunFlareComponentData(instance)
                flare:MakeWritable()
                local flaremultiplier = 0.2

                flare.element1Size = flare.element1Size*flaremultiplier
                flare.element2Size = flare.element2Size*flaremultiplier
                flare.element3Size = flare.element3Size*flaremultiplier
                flare.element4Size = flare.element4Size*flaremultiplier
                flare.element5Size = flare.element5Size*flaremultiplier


        end

        function PatchMeshAsset(instance)
                if meshs[instance.partition.name] then
                    local mesh = MeshAsset(instance)

                    for _, value in pairs(mesh.materials) do
                        value:MakeWritable()

                        value.shader.shader = nil
                    end
                end
        end

        function PatchMeshMaterialVariation(instance)
                if variations[instance.partition.name] then
                    local variation = MeshMaterialVariation(instance)
                    variation:MakeWritable()

                    variation.shader.shader = nil
                end
        end

        function PatchEmitterTemplateData(instance)
                if emitters[instance.partition.name] then
                    local template = EmitterTemplateData(instance)
                    template:MakeWritable()
                    template.emissive = true
                end
        end

        function PatchEffectEntityData(instance)
                if effects[instance.partition.name] then
                    local effect = EffectEntityData(instance)
                    effect:MakeWritable()

                    effect.components:clear()
                end
        end

				function DynamicLights(instance)
								local Dynamic = LocalLightEntityData(instance)
										Dynamic:MakeWritable()
										Dynamic.visible = true
										Dynamic.enlightenEnable = false
										Dynamic.specularEnable = false
				end


				function PatchLensFlareEntityData(instance)
								 local flares = LensFlareEntityData(instance)
								 flares:MakeWritable()
								 flares.visible = false
				end

				--Remove Backdrop / Ring around the Map
        local badstuff = ResourceManager:GetSettings("GameRenderSettings")
        if badstuff ~= nil then
        				badstuff = GameRenderSettings(badstuff)
        				badstuff.edgeModelsEnable = false
								print("removed edgeModels")
        end


				-- CustomUserSettings


				PostProcessing = ResourceManager:GetSettings("GlobalPostProcessSettings")

										if PostProcessing ~= nil and UserSettingsSaved ~= true then
												PostProcessing = GlobalPostProcessSettings(PostProcessing)
												UserSettings_userBrightnessMin = PostProcessing.userBrightnessMin
												UserSettings_userBrightnessMax = PostProcessing.userBrightnessMax
												UserSettings_brightness = PostProcessing.brightness
												print('Saving User Settings:')
												print('Brightness_Min: ' .. UserSettings_userBrightnessMin)
												print('Brightness_Max: '..UserSettings_userBrightnessMax)
												UserSettingsSaved = true
										end

										if UserSettingsSaved == true then
												local PostProcessingX = ResourceManager:GetSettings("GlobalPostProcessSettings")
												PostProcessingX = GlobalPostProcessSettings(PostProcessing)
												PostProcessingX.userBrightnessMin = UserSettings_userBrightnessMin
												PostProcessingX.userBrightnessMax = UserSettings_userBrightnessMax
												PostProcessingX.brightness = Vec3(1.0, 1.0, 1.0)
												print('Changed PostProcessing')
										end


				-----------




        --function DisableBackgrounds(instance)
              --  if instance.instanceGuid == Guid('9CDAC6C3-9D3E-48F1-B8D9-737DB28AE936') then -- menu UI/Assets/MenuVisualEnvironment
                    --local s_Instance = ColorCorrectionComponentData(instance)
                    --s_Instance:MakeWritable()
                    --s_Instance.enable = false
                --end
                --if instance.instanceGuid == Guid('46FE1C37-5B7E-490C-8239-2EB2D6045D7B') then -- oob FX/VisualEnviroments/OutofCombat/OutofCombat
                    --local s_Instance = ColorCorrectionComponentData(instance)
                    --s_Instance:MakeWritable()
                    --s_Instance.enable = false
                --end
                --if instance.instanceGuid == Guid('36C2CEAE-27D2-45F3-B3F5-B831FE40ED9B') then -- FX/VisualEnviroments/OutofCombat/OutofCombat
                    --local s_Instance = FilmGrainComponentData(instance)
                    --s_Instance:MakeWritable()
                    --s_Instance.enable = false
                --end
        --end





        print('Using Preset Evening')


return true
end
