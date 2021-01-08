require '__shared/settings'


---Presets
function Night()
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

        -- MP_018
        ['levels/mp_018/terrain/mp018_mattepainting_chunk01_mesh'] = true,
        ['levels/mp_018/terrain/mp018_mattepainting_chunk02_mesh'] = true,
        ['levels/mp_018/terrain/mp018_mattepainting_chunk03_mesh'] = true,

        -- XP1_001
        ['levels/xp1_001/objects/mattepainting_01_mesh'] = true,
        ['levels/xp1_001/objects/mattepainting_02_mesh'] = true,
        ['levels/xp1_001/objects/mattepainting_03_mesh'] = true,
        ['levels/xp1_001/objects/mattepainting_04_mesh'] = true,

        -- XP1_004
        ['xp_raw/surrounding/smokepillars/smokepillar_01_mesh'] = true,

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

        function PatchOutdoorLightComponentData(instance)
                local outdoor = OutdoorLightComponentData(instance)
                outdoor:MakeWritable()

                outdoor.sunColor = Vec3(0.01, 0.01, 0.01)
                outdoor.skyColor = Vec3(0.01, 0.01, 0.01)
                outdoor.groundColor = Vec3(0, 0, 0)

                outdoor.skyEnvmapShadowScale = 0.5
        end

        function PatchSkyComponentData(instance)
                local sky = SkyComponentData(instance)
                sky:MakeWritable()

                sky.brightnessScale = 0.001
                sky.sunSize = 1
                sky.sunScale = 15

                sky.cloudLayer1SunLightIntensity = 0
                sky.cloudLayer1SunLightPower = 0
                sky.cloudLayer1AmbientLightIntensity = 0.08

                sky.cloudLayer2SunLightIntensity = 0.1
                sky.cloudLayer2SunLightPower = 0.2
                sky.cloudLayer2AmbientLightIntensity = 0.08

                sky.staticEnvmapScale = 0.005
                sky.skyEnvmap8BitTexScale = 0.005

                if
                    sky.partition.name == 'levels/mp_subway/lighting/ve_mp_subway_city_01' or
                    sky.partition.name == 'levels/mp_011/lighting/ve_mp_011_day01'
                then
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

                fog.enable = true
                fog.fogColorEnable = true

                fog.start = 2

                fog.fogColorStart = 2
                fog.fogColorEnd = 65
                fog.fogColor = Vec3(0.0012, 0.0012, 0.0012)
                fog.fogColorCurve = Vec4(0.25, 0.18, 0.14, 0.000)

                fog.transparencyFadeStart = 2
                fog.transparencyFadeEnd = 65

                fog.endValue = 80

        end

        function PatchTonemapComponentData(instance)
                local tonemap = TonemapComponentData(instance)
                tonemap:MakeWritable()

                tonemap.minExposure = 1
                tonemap.maxExposure = 4

                tonemap.exposureAdjustTime = 1
                tonemap.middleGray = 1.25

                tonemap.tonemapMethod = TonemapMethod.TonemapMethod_FilmicNeutral
        end

        function PatchColorCorrectionComponentData(instance)
                local color = ColorCorrectionComponentData(instance)
                color:MakeWritable()

                color.brightness = Vec3(0.9, 0.9, 0.9)
                color.contrast = Vec3(1.10, 1.10, 1.10)
                color.saturation = Vec3(1, 1.005, 1.005)

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


        --Additions by Lesley & IllustrisJack
        --Remove Backdrop / Ring around the Map
        local badstuff = ResourceManager:GetSettings("GameRenderSettings")
        if 	badstuff ~= nil then
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

        	spotLight.radius = 150
        	spotLight.intensity = 2.8 --brightness
        	spotLight.coneOuterAngle = 35
        	spotLight.orthoWidth = 7
        	spotLight.orthoHeight = 7
        	spotLight.frustumFov = 37.5 --size
        	spotLight.castShadowsEnable = true
        	spotLight.castShadowsMinLevel = QualityLevel.QualityLevel_Ultra
        	spotLight.shape = 1

        	print('Patching flashlight')
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

        print('Using Preset Night on Grand Bazaar')
end

-------------------------------------------------------------------------------
    --Sun East
function Morning()
    --remove some fx elements
        local RemoveFx = require('removeFx')

    Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)

    	  local levelDestroyEvent = Events:Subscribe('Level:Destroy', OnLevelDestroy)

    	  RemoveFx()
    end)

    -- Deregistering, uninstalling and uninstalling in case the next level isn't MP_001
    function OnLevelDestroy()

    	  entityFactoryCreateFromBlueprint = nil
    	  flagProgress = nil

    end

    Events:Subscribe('Partition:Loaded', function(partition)

        for _, instance in pairs(partition.instances) do

            if instance:Is('WorldRenderSettings') then
                local renderSettings = WorldRenderSettings(instance)
                renderSettings:MakeWritable()

                renderSettings.lensFlaresEnable = false;

            end

            if instance:Is('BlurEffectData') then
                local blur = BlurEffectData(instance)
                blur:MakeWritable()

                blur.explosionStrength = 0;
                blur.bulletStrength = 0;
                blur.explosionFalloffSpeed = 100;
                blur.bulletFalloffSpeed = 100;

            end

            if instance:Is('ColorCorrectionComponentData') then
                local color = ColorCorrectionComponentData(instance)
                color:MakeWritable()
                color.brightness = Vec3(0.8, 0.8, 0.8)
                color.contrast = Vec3(1.1, 1.1, 1.1)
                color.saturation = Vec3(1.1, 1.1, 1.1)
            end

            if instance:Is('OutdoorLightComponentData') then
                local outdoor = OutdoorLightComponentData(instance)
                outdoor:MakeWritable()
                outdoor.sunColor = Vec3(0.5, 0.5, 0.6)
                outdoor.skyColor = Vec3(0.5, 0.5, 0.6)
                outdoor.groundColor = Vec3(0.1, 0, 0)
                outdoor.sunRotationY = 55;
                outdoor.sunRotationX = -40;
    			--outdoor.skyEnvmapShadowScale = 0.5
            end

            if instance:Is('SkyComponentData') then
       			local sky = SkyComponentData(instance)
       			sky:MakeWritable()
       			sky.sunSize = 0.15;
       		end

            if instance:Is('TonemapComponentData') then
                local tonemap = TonemapComponentData(instance)
                tonemap:MakeWritable()

                --tonemap.bloomScale = tonemap.bloomScale * 0.5;
                --tonemap.maxExposure = tonemap.maxExposure * 0.1;
                --tonemap.minExposure = tonemap.minExposure * 0.1;
                --tonemap.exposureAdjustTime = tonemap.exposureAdjustTime * 0.75;

            end

            if instance:Is('FogComponentData') then
                local fog = FogComponentData(instance)
                fog:MakeWritable()

                fog.enable = false;

            end

            if instance:Is('FilmGrainData') then
                local filmGrain = CharacterLightingData(instance)
                filmGrain:MakeWritable()

                filmGrain.randomEnable = false;
                filmGrain.linearFilteringEnable = false;
                filmGrain.enable = false;

            end

            if instance:Is('SunFlareComponentData') then
                local flare = SunFlareComponentData(instance)
                flare:MakeWritable()

                flare.enable = false;
                flare.element1Enable = false;
                flare.element2Enable = false;
                flare.element3Enable = false;
                flare.element4Enable = false;
                flare.element5Enable = false;
            end

            if instance:Is('MeshAsset') then
                if
                    instance.partition.name:match('mp_011/objects/mp011_backdrop') or
                    instance.partition.name:match('mp_012/terrain/mp012_matte') or
                    instance.partition.name:match('mp_012/objects/smokestacks') or
                    instance.partition.name:match('mp_017/objects/mp011_backdrop') or
                    instance.partition.name:match('mp_017/terrain/mp012_matte') or
                    instance.partition.name:match('mp_017/objects/smokestacks') or
                    instance.partition.name:match('mp_018/terrain/mp018_matte')
                then
                    local mesh = MeshAsset(instance)
                    mesh:MakeWritable()

                    for _, value in pairs(mesh.materials) do
                        value:MakeWritable()
                        value.shader.shader = nil
                    end
                end
            end

            if instance:Is('MeshMaterialVariation') then
                if instance.partition.name:match('mp_012/objects/smokestacks') then
                    local variation = MeshMaterialVariation(instance)
                    variation:MakeWritable()
                    variation.shader.shader = nil
                end
                if instance.partition.name:match('mp_017/objects/smokestacks') then
                    local variation = MeshMaterialVariation(instance)
                    variation:MakeWritable()
                    variation.shader.shader = nil
                end
            end

            if instance.instanceGuid == Guid('9CDAC6C3-9D3E-48F1-B8D9-737DB28AE936') then -- menu UI/Assets/MenuVisualEnvironment
              local s_Instance = ColorCorrectionComponentData(instance)
              s_Instance:MakeWritable()
              s_Instance.enable = false
              s_Instance.brightness = Vec3(1, 1, 1)
              s_Instance.contrast = Vec3(1.2, 1.2, 1.2)
              s_Instance.saturation = Vec3(1.2, 1.2, 1.2)
            end
            if instance.instanceGuid == Guid('46FE1C37-5B7E-490C-8239-2EB2D6045D7B') then -- oob FX/VisualEnviroments/OutofCombat/OutofCombat
              local s_Instance = ColorCorrectionComponentData(instance)
              s_Instance:MakeWritable()
              s_Instance.enable = false
              s_Instance.brightness = Vec3(0.8, 0.8, 0.8)
              s_Instance.contrast = Vec3(1, 1, 1)
              s_Instance.saturation = Vec3(1, 1, 1)
            end

            if instance.instanceGuid == Guid('36C2CEAE-27D2-45F3-B3F5-B831FE40ED9B') then -- FX/VisualEnviroments/OutofCombat/OutofCombat
              local s_Instance = FilmGrainComponentData(instance)
              s_Instance:MakeWritable()
              s_Instance.enable = false
            end

            if instance:Is('VignetteComponentData') then
              local vignetteData = VignetteComponentData(instance)

              vignetteData:MakeWritable()
              vignetteData.enable = false;
            end

        end
    end)

end
