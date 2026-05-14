Events:Subscribe('Level:Loaded', function(levelName, gameMode)
    --Patch https://github.com/EmulatorNexus/Venice-EBX/blob/f06c290fa43c80e07985eda65ba74c59f4c01aa0/Weapons/Accessories/flashlight/Flashlight_1p.txt
    PatchFlashLight(ResourceManager:FindInstanceByGuid(Guid('83E2B938-E678-11DF-A7B3-CBA49C34928F'),
        Guid('995E49EE-8914-4AFD-8EF5-59125CA8F9CD')))
    --Patch https://github.com/EmulatorNexus/Venice-EBX/blob/f06c290fa43c80e07985eda65ba74c59f4c01aa0/Weapons/Accessories/flashlight/Flashlight_3p.txt
    PatchFlashLight(ResourceManager:FindInstanceByGuid(Guid('65A5BFD9-028A-4D4F-8B89-3A60B2E06F83'),
        Guid('5FBA51D6-059F-4284-B5BB-6E20F145C064')))

    AllowMoreSpotlights()
end)

Events:Subscribe('Partition:Loaded', function(partition)
    PatchEmitters(partition)
end)

-- Purpose: Specifically modify optical parameters for flashlight light instances (SpotLight on 1P/3P models).
function PatchFlashLight(instance)
    if instance == nil then
        return
    end

    instance = SpotLightEntityData(instance)
    instance:MakeWritable()
    instance.radius = 75  --30 Illumination radius
    instance.intensity = 9 -- 20 Brightness
    instance.coneOuterAngle = 50  -- 32.37200164794922 Outer cone angle of the spotlight (degrees). Controls the beam spread; larger angle = wider spread but faster brightness decay.
    instance.orthoWidth = 40  --5.0 Width of the light in orthogonal projection mode. Used less often in flashlights, but increasing makes the illumination area larger
    instance.orthoHeight = 40  --5.0 Height of the light in orthogonal projection mode. Used less often in flashlights, but increasing makes the illumination area larger
    instance.frustumFov = 40 --20 Field of view of the light cone. Increasing makes the flashlight beam wider.
    instance.castShadowsEnable = true  -- Whether to cast shadows
    instance.castShadowsMinLevel = 0  --3 MinLevel controls minimum shadow quality level (0=lowest), from 0 to 3 low to high
    instance.shape = 1 --1 0 = cone, 1 = flat-top cone, 2 = cuboid

    instance = LocalLightEntityData(instance)
    instance:MakeWritable()
    instance.attenuationOffset = 250 --250 Attenuation offset, controls where light intensity starts to fall off. Increasing allows the flashlight to stay bright over longer distances
end

function PatchComponents(partition)
    for _, instance in pairs(partition.instances) do
        if instance:Is('LocalLightEntityData') then
            PatchHDLights(instance)
        end
    end
end

-- Purpose: For most static/dynamic point lights (LocalLightEntityData) in the map, expand range, adjust brightness, enable global illumination.
function PatchHDLights(instance)
    instance = LocalLightEntityData(instance)
    instance:MakeWritable()
    --instance.visible = true -- Uncomment to force light visibility
    instance.specularEnable = true --true Enable specular reflection (makes surfaces have highlights)
    instance.radius = instance.radius * 1.5 --Radius increased by 1.5x, larger light range
    instance.intensity = instance.intensity * 0.65 --Intensity reduced to 65% of original (to avoid overexposure when range increases)
    instance.enlightenColorMode = 0 --Global illumination color mode: 0 = default (preserves object's original color/texture, modulated by light color) ; 1 = completely overrides original color, ignoring object's surface color/texture
    instance.enlightenEnable = true --Enable Enlighten dynamic global illumination (affects global reflection and indirect lighting)
    instance.attenuationOffset = instance.attenuationOffset * 17.5 --Attenuation offset multiplied by 17.5 → light maintains higher brightness over much longer distance

    if instance.typeInfo.name == 'SpotLightEntityData' then
        PatchSpotlights(instance)
    end
end
-- For SpotLight sources, additional modifications for shadows and angles.
function PatchSpotlights(instance)
    instance = SpotLightEntityData(instance)
    instance:MakeWritable()

    instance.castShadowsEnable = true
    instance.castShadowsMinLevel = 3 --Enable shadows, only rendered at high shadow quality level
    instance.coneInnerAngle = instance.coneInnerAngle * 1 
    instance.coneOuterAngle = instance.coneOuterAngle * 2
end

-- WorldRenderSettings is a global configuration class or data structure that defines rendering parameters for the entire scene, typically including lighting, environment, post-processing, and other core visual effect settings.
-- DebrisSystemSettings is a set of parameters used to control debris/particle system behavior, typically used to simulate dynamic effects like object breakage, explosions, and environmental interactions (e.g., gravel from bullet impacts on walls).
function AllowMoreSpotlights()
    local worldRender = ResourceManager:GetSettings('WorldRenderSettings')

    if worldRender ~= nil then
        worldRender = WorldRenderSettings(worldRender)
        worldRender.maxSpotLightShadowCount = 9 --Maximum number of spotlight shadows allowed on screen
        worldRender.maxSpotLightCount = 1024 --Maximum total number of spotlights rendered on screen (including those without shadows)
        worldRender.shadowmapViewDistance = 75 --Maximum distance for shadowmap rendering
        worldRender.lightOverdrawMaxLayerCount = 256 --Maximum number of stacked light layers
        print("Patched World Renderer spotlights!")
    end

    local debris = ResourceManager:GetSettings('DebrisSystemSettings')

    if debris ~= nil then
        debris = DebrisSystemSettings(debris)
        debris.meshShadowEnable = false --Disable shadow rendering for debris meshes
        print("Patched debris shadows!")
    end
end

--Configure Smoke, Muzzle & Emitters
function PatchEmitters(partition)
    for _, instance in pairs(partition.instances) do
        if instance:Is("EmitterTemplateData") then
            local emitterTemplate = EmitterTemplateData(instance)
            emitterTemplate:MakeWritable()
            emitterTemplate.maxCount = emitterTemplate.maxCount * 2 --maxCount → maximum number of particles that can exist simultaneously, doubled from original
            emitterTemplate.maxSpawnDistance = emitterTemplate.maxSpawnDistance * 2 --MaxSpawnDistance → maximum distance at which particles can spawn (usually affects how far away you can see these effects), also doubled

            -- Adjust smoke and dust to last longer
            if string.find(emitterTemplate.name:lower(), "smoke" or string.find(emitterTemplate.name:lower(), "dust")) then
                emitterTemplate:MakeWritable()

                if not (emitterTemplate.emissive or emitterTemplate.actAsPointLight or emitterTemplate.repeatParticleSpawning or emitterTemplate.opaque) then
                    if emitterTemplate.rootProcessor:Is("UpdateAgeData") then
                        local rootProcessor = UpdateAgeData(emitterTemplate.rootProcessor)
                    
                        rootProcessor:MakeWritable()
                        rootProcessor.lifetime = rootProcessor.lifetime * 1.2  --Particle lifetime is 1.2 times the original
                        emitterTemplate.lifetime = emitterTemplate.lifetime * 1.2 --Emitter lifetime is 1.2 times the original
                        emitterTemplate.maxCount = emitterTemplate.maxCount * 1.5  --Max concurrent particles, 1.5x original
                    end
                end

                -- Make muzzle flash light up
            elseif string.find(emitterTemplate.name:lower(), "muzz") then
                emitterTemplate:MakeWritable()
                emitterTemplate.actAsPointLight = true  --actAsPointLight = true → particles become a point light (makes muzzle flash illuminate surroundings)
                emitterTemplate.maxCount = emitterTemplate.maxCount * 2

                if emitterTemplate.pointLightColor == Vec3(1, 1, 1) then --If default point light color is white (1,1,1), change to orange (1, 0.25, 0) and adjust radius and distance:
                    emitterTemplate.pointLightColor = Vec3(1, 0.25, 0)
                    emitterTemplate.pointLightRadius = emitterTemplate.pointLightRadius * 0.65
                    emitterTemplate.maxSpawnDistance = 3000 --Muzzle flash can illuminate surroundings, but distance set very far (3km)
                end

                -- Make bullets light up: similarly add light source to tracer rounds, with orange color, slightly increased brightness, 10% more radius
            elseif string.find(emitterTemplate.name:lower(), "tracer") then
                emitterTemplate:MakeWritable()
                emitterTemplate.actAsPointLight = true
                emitterTemplate.maxCount = emitterTemplate.maxCount * 2

                if emitterTemplate.pointLightColor == Vec3(1, 1, 1) then
                    emitterTemplate.pointLightColor = Vec3(1, 0.25, 0)
                    emitterTemplate.pointLightRadius = emitterTemplate.pointLightRadius * 1.10
                    emitterTemplate.maxSpawnDistance = 3000
                end

                -- Make sparks light up
            elseif string.find(emitterTemplate.name:lower(), "spark") then
                emitterTemplate:MakeWritable()
                emitterTemplate.actAsPointLight = true
                emitterTemplate.maxCount = emitterTemplate.maxCount * 1.5 --Max concurrent particles, 1.5x original

                if emitterTemplate.pointLightColor == Vec3(1, 1, 1) then
                    emitterTemplate.pointLightColor = Vec3(1, 0.25, 0)
                    emitterTemplate.pointLightRadius = emitterTemplate.pointLightRadius * 1.15
                    emitterTemplate.maxSpawnDistance = 3000
                end
            --Tank wreck fire
            elseif string.find(emitterTemplate.name:lower(), "wreck/tank/emitters") then
                emitterTemplate:MakeWritable()

                emitterTemplate.maxSpawnDistance = 3000
                emitterTemplate.actAsPointLight = true
                emitterTemplate.repeatParticleSpawning = true  --Set repeatParticleSpawning = true to make fire continuously regenerate
                emitterTemplate.maxCount = emitterTemplate.maxCount * 3   --Max concurrent particles, 3x original
                emitterTemplate.pointLightRadius = emitterTemplate.pointLightRadius * 1.5
                emitterTemplate.pointLightIntensity = emitterTemplate.pointLightIntensity * 1.5
                emitterTemplate.lifetime = emitterTemplate.lifetime * 3 
                emitterTemplate.forceFullRes = true  --Controls whether the particle emitter always renders at full resolution
                emitterTemplate.repeatParticleSpawning = true

                if emitterTemplate.pointLightColor == Vec3(1, 1, 1) then
                    emitterTemplate.pointLightColor = Vec3(1, 0.25, 0)
                end
                --Helicopter/car wreck fire
            elseif string.find(emitterTemplate.name:lower(), "wreck/heli/emitters") or string.find(emitterTemplate.name:lower(), "wreck/car/emitters") then
                emitterTemplate:MakeWritable()

                emitterTemplate.maxSpawnDistance = 3000
                emitterTemplate.actAsPointLight = true
                emitterTemplate.maxCount = emitterTemplate.maxCount * 3  --Max concurrent particles, 3x original
                emitterTemplate.pointLightRadius = emitterTemplate.pointLightRadius * 1.75
                emitterTemplate.pointLightIntensity = emitterTemplate.pointLightIntensity * 1.75
                emitterTemplate.forceFullRes = true --Controls whether the particle emitter always renders at full resolution
                emitterTemplate.lifetime = emitterTemplate.lifetime * 3

                if emitterTemplate.pointLightColor == Vec3(1, 1, 1) then
                    emitterTemplate.pointLightColor = Vec3(1, 0.25, 0)
                end
            end
        end
    end
end