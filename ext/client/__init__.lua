require '__shared/settings'
require 'interchangable'
require 'emitters'
require 'patchmapcomponents'
require 'functions'

local presetValues = require '__shared/presets'
local currentVisualEnvironment = nil

local multipliedValues = {
    SkyComponentData = {
        brightnessScale = 'BrightnessMultiplicator'
    },
    FogComponentData = {
        fogColorCurve = 'FogMultiplicator'
    },
}

Events:Subscribe('Level:Destroy', function()
    ResetVisualEnvironment()
end)

Events:Subscribe('Level:Loaded', function(levelName, gameMode)
    local mapName = levelName:match('/[^/]+'):sub(2) -- MP_001
    local mapPreset = mapPresets[mapName]

    if mapPreset ~= nil then
        print('Calling Preset ' .. mapPreset .. ' on ' .. mapName)
        Multipliers(mapName)
        ApplyVisualEnvironment(mapPreset)
    else
        print('Using Standard')
        ResetVisualEnvironment()
    end
end)

function ApplyVisualEnvironment(presetName)
    if currentVisualEnvironment ~= nil then
        return
    end

    local selectedPreset = presetValues[presetName]

    if selectedPreset == nil then
        print('Wrong Configuration')
        return
    end

    local visualEnvironmentData = VisualEnvironmentEntityData()
    visualEnvironmentData.enabled = true
    visualEnvironmentData.visibility = 1.0
    visualEnvironmentData.priority = 999999

    -- looping through instance types
    for instanceType, values in pairs(selectedPreset) do
        -- creating new instance
        local newInstance = _G[instanceType]()

        -- patching instance properties
        for key, value in pairs(values) do
            if type(value) == 'string' then
                -- patching texture property
                newInstance[key] = TextureAsset(_G[value])
            else
                -- applying multiplier
                if multipliedValues[instanceType] ~= nil and multipliedValues[instanceType][key] ~= nil then
                    local multiplier = _G[multipliedValues[instanceType][key]]
                    value = value * multiplier
                end

                -- patching static property
                newInstance[key] = value
            end
        end

        -- adding visual environment components
        visualEnvironmentData.components:add(newInstance)
        visualEnvironmentData.runtimeComponentCount = visualEnvironmentData.runtimeComponentCount + 1
    end

    currentVisualEnvironment = EntityManager:CreateEntity(visualEnvironmentData, LinearTransform())

    if currentVisualEnvironment ~= nil then
        currentVisualEnvironment:Init(Realm.Realm_Client, true)
    end
end

function ResetVisualEnvironment()
	if currentVisualEnvironment ~= nil then
		currentVisualEnvironment:Destroy()
        currentVisualEnvironment = nil

		print('Removed Current Preset')
	end
end