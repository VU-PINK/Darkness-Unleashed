-- Code by Reirei

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

function PatchComponentsOnPartitionLoaded(partition)
    for _, instance in pairs(partition.instances) do
        if instance:Is('MeshAsset') then
            PatchMeshAsset(instance)
        elseif instance:Is('MeshMaterialVariation') then
            PatchMeshMaterialVariation(instance)
        --elseif instance:Is('EmitterTemplateData') then
            --PatchEmitterTemplateData(instance)
        elseif instance:Is('EffectEntityData') then
            PatchEffectEntityData(instance)
	    --elseif instance:Is('LocalLightEntityData') then
	    --DynamicLights(instance)
	    end
    end
end

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

    sky.brightnessScale = 0.01
    sky.sunSize = 0.01
    sky.sunScale = 1

    sky.cloudLayer1SunLightIntensity = 0.01
    sky.cloudLayer1SunLightPower = 0.01
    sky.cloudLayer1AmbientLightIntensity = 0.01

    sky.cloudLayer2SunLightIntensity = 0.01
    sky.cloudLayer2SunLightPower = 0.01
    sky.cloudLayer2AmbientLightIntensity = 0.01

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
    tonemap.middleGray = 0.02

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
    Dynamic.specularEnable = true
end
