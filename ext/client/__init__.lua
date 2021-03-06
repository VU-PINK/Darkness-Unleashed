require '__shared/settings'
require 'interchangable'
require 'emitters'
require 'patchmapcomponents'
require 'functions'
require 'ui'

local NVGClass = require '__shared/classes/nvg'
local NVG = NVGClass()

local AnimationClass = require '__shared/classes/animation'
local Animation = AnimationClass()

local presetValues = require '__shared/presets'
local specialValues = require '__shared/special'
local currentVisualEnvironment = nil
local currentSpecialVisualEnvironment = nil

local nvgActivated = nil
local useNightVisionGadget = true





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
    if useVote == true and votedPreset ~= nil then
        print("Calling Voted Preset " .. votedPreset .. " on " .. mapName)
        Multipliers(mapName)
        ApplyVisualEnvironment(votedPreset)
    else
    local mapPreset = mapPresets[mapName]
        if mapPreset ~= nil then
            print('Calling Preset ' .. mapPreset .. ' on ' .. mapName)
            Multipliers(mapName)
            ApplyVisualEnvironment(mapPreset)
        else
            print('Using Standard')
            ResetVisualEnvironment()
        end
    end
end)

Events:Subscribe('Player:Respawn', function(player)
	local localPlayer = PlayerManager:GetLocalPlayer()

    if player == localPlayer and useNightVisionGadget then
        NVG:__init()
	  end

end)
-- Apply Map Presets
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

-- Apply Special Environments (Gadgets)
function ApplySpecialVisualEnvironment(presetName)
    if currentSpecialVisualEnvironment ~= nil then
        return
    end

    local selectedPreset = specialValues[presetName]

    if selectedPreset == nil then
        print('Wrong Configuration')
        return
    end

    local visualEnvironmentData = VisualEnvironmentEntityData()
    visualEnvironmentData.enabled = true
    visualEnvironmentData.visibility = 1.0
    visualEnvironmentData.priority = 1000000


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
                -- patching static property
                newInstance[key] = value
            end
        end

        -- adding visual environment components
        visualEnvironmentData.components:add(newInstance)
        visualEnvironmentData.runtimeComponentCount = visualEnvironmentData.runtimeComponentCount + 1
    end

    currentSpecialVisualEnvironment = EntityManager:CreateEntity(visualEnvironmentData, LinearTransform())

    if currentSpecialVisualEnvironment ~= nil then
        currentSpecialVisualEnvironment:Init(Realm.Realm_Client, true)
    end
    nvgActivated = true
end

function ResetSpecialVisualEnvironment(presetName)
	if currentSpecialVisualEnvironment ~= nil then
		currentSpecialVisualEnvironment:Destroy()
        currentSpecialVisualEnvironment = nil

        nvgActivated = false
		--print('Removed Special Environment: ' .. presetName)
	end
end

-- Night Vision Gadget Activate (For Now)
Events:Subscribe('Player:UpdateInput', function(player, deltaTime)
    if useNightVisionGadget == true and isHud == true then
        if InputManager:WentKeyDown(8) then
            if nvgActivated ~= true then

                NVG:Activate()
            elseif nvgActivated == true then

				NVG:Deactivate()
            end
        end

    elseif nvgActivated == true then
        ResetSpecialVisualEnvironment("NightVision")
    end
end)

Events:Subscribe('Engine:Update', function(deltaTime, simulationDeltaTime)
    -- Do stuff here.
    Events:DispatchLocal('DeltaTime', deltaTime)

    elapsedTime = elapsedTime + deltaTime

    if(elapsedTime >= lastSecond + 1) then
        lastSecond = lastSecond + 1
        Events:DispatchLocal('SecondElapsed', lastSecond)
    end

end)

Events:Subscribe('SecondElapsed', function(lastSecond)
    if(nvgActivated) then
        NVG:Depleting()
    end

    if (NVG.batteryLifeCurrent ~= NVG.batteryLifeMax) and (nvgActivated == false) then
        NVG:Recharging()
    end
end)
