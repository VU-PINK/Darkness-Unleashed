class("Patches")

Events:Subscribe('Level:Loaded', function(levelName, gameMode)
    --Patch https://github.com/EmulatorNexus/Venice-EBX/blob/f06c290fa43c80e07985eda65ba74c59f4c01aa0/Weapons/Accessories/flashlight/Flashlight_1p.txt
    patchFlashLight(ResourceManager:FindInstanceByGuid(Guid('83E2B938-E678-11DF-A7B3-CBA49C34928F'), Guid('995E49EE-8914-4AFD-8EF5-59125CA8F9CD')))

    --Patch https://github.com/EmulatorNexus/Venice-EBX/blob/f06c290fa43c80e07985eda65ba74c59f4c01aa0/Weapons/Accessories/flashlight/Flashlight_3p.txt
    patchFlashLight(ResourceManager:FindInstanceByGuid(Guid('65A5BFD9-028A-4D4F-8B89-3A60B2E06F83'), Guid('5FBA51D6-059F-4284-B5BB-6E20F145C064')))
end)

function patchFlashLight(instance)
    if instance == nil then
        return
    end

    instance = SpotLightEntityData(instance)
    instance:MakeWritable()

    instance.radius = 250 --range
    instance.intensity = 5.55 --brightness
    instance.frustumFov = 45 --size
    instance.castShadowsEnable = true
    instance.castShadowsMinLevel = QualityLevel.QualityLevel_Ultra
    print('Patched flashlight!')
end

if g_Patches == nil then
    g_Patches = Patches()
end

return g_Patches