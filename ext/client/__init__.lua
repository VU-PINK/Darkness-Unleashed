local Settings = require '__shared/settings'
local NetMessage = require '__shared/net'
local ClientTime = require 'systems/clienttime'
require 'resources'
require 'emitters'
require 'patchmapcomponents'
require 'functions'
require 'ui'


if Settings.cineTools == true then
require "__shared/DebugGUI"
end

if Settings.dayNightEnabled ~= true and Settings.cineTools == true then
require 'systems/cinematictools'
end

if Settings.weatherEnabled == true then
local ClientWeather = require 'systems/weather'
end

local NVG = require 'systems/nvg'
local Animation = require 'systems/animation'

local presetValues = require '__shared/presets'
local specialValues = require '__shared/special'
local currentVisualEnvironment = nil
local currentSpecialVisualEnvironment = nil
local currentOtherVisualEnvironment = nil
local levelLoaded = false

nvgActivated = nil

UserSettingsSaved = nil
UserSettings = {}
changedSpotlightSettings = nil

local multipliedValues = {
    SkyComponentData = {
        brightnessScale = 'BrightnessMultiplicator'
    },
    FogComponentData = {
        fogDistanceMultiplier = 'FogMultiplicator'
    },
}

Events:Subscribe('Level:Destroy', function()

    ResetVisualEnvironment()
    ResetOtherVisualEnvironment('Morning')
    ResetSpecialVisualEnvironment()
    levelLoaded = false

    if Settings.dayNightEnabled == true then
    ClientTime:OnLevelDestroyed()
    end

end)

Events:Subscribe('Level:Loaded', function(levelName, gameMode)

    -- ClientTime
    ClientTime:OnLevelLoaded()

    -- Animations
    Animation:__init()

    if Settings.cineTools == true and Settings.dayNightEnabled ~= true then
    CinematicTools()
    end

    -- Visual Environments
    local mapName = levelName:match('/[^/]+'):sub(2) -- MP_001
    local mapPreset = Settings.MapPresets[mapName]

    levelLoaded = true

    if mapPreset ~= nil then

        print('Calling Preset ' .. mapPreset .. ' on ' .. mapName)
        Multipliers(mapName)
        ApplyVisualEnvironment(mapPreset)

        --if Settings.useTicketBasedCycle == true then
            ApplyOtherVisualEnvironments('Morning')
        --end

        if mapPreset == 'Night' then

            EnforceBrightness()

        else

            ReleaseBrightness()

        end

    else
        
        print('Using Standard')
        ResetVisualEnvironment()

    end

end)


Events:Subscribe('Extension:Loaded', function()
    EmittersFlashlightsOnExtensionLoaded()
end)

-- Unload Forced Settings
Events:Subscribe('Extension:Unloading', function()

    ReleaseBrightness()
    resetMoreSpotlights()

end)

Events:Subscribe('Partition:Loaded', function(partition)
    PatchComponentsOnPartitionLoaded(partition)
    EmittersOnPartitionLoaded(partition)
    EmittersFlashlightsOnPartitionLoaded(partition)
end)

-- Change Settings to allow more Spotlight Shadows
Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)

    allowMoreSpotlights()

end)

Events:Subscribe('Player:Respawn', function(player)
	local localPlayer = PlayerManager:GetLocalPlayer()

    if player == localPlayer and Settings.useNightVisionGadget == true then

        NVG:Deactivate()
        NVG:__init()

	end

end)

Events:Subscribe('Player:UpdateInput', function(p_Player, p_DeltaTime)
    
    -- Night Vision Goggles
    NVG_OnPlayerUpdateInput(p_Player, p_DeltaTime)
    
    --Vehicle lights toggle
    --[[Vehicles_OnPlayerUpdateInput(p_Player, p_DeltaTime)]]
    Events:DispatchLocal('UpdateInput', p_Player, p_DeltaTime)

    -- Cinematic Tools
    --CineTools_OnPlayerInput(p_Player, p_DeltaTime)

end)

--[[Events:Subscribe('Player:Respawn', function(player)
    ImportFXShit()
end)]]

function ImportFXShit()
    local fxParams = EffectParams()
    fxParams:SetInt('size', 1000)
    local player = PlayerManager:GetLocalPlayer()

    if(player == nil) then
        print('Player is nil!')
        return
    end

    local fxDataContainer = ResourceManager:FindInstanceByGuid(guid('6EF8602F-47E5-40F2-A62D-6EC1441F364B'), guid('20BC5303-8915-4D5A-8D64-6E681273B733'))

    if(fxDataContainer == nil) then
        print('Effect DataContainer is nil!')
        return
    end

    EffectManager:PlayEffect(fxDataContainer, player.soldier.worldTransform, fxParams, true)
end

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

    if specialValues.isWeather[presetName] == true then
        visualEnvironmentData.visibility = 0.0
        visualEnvironmentData.priority = 1000000
    else
        visualEnvironmentData.visibility = 1.0
        visualEnvironmentData.priority = 1000001
    end

    -- looping through instance types
    for instanceType, values in pairs(selectedPreset) do
        -- creating new instance
        local newInstance = _G[instanceType]()

        -- patching instance properties
        for key, value in pairs(values) do
            if type(value) == 'string' then
                if value == 'FlirData' then
                newInstance[key] = 'FlirData'
                elseif key == cloudLayer1Texture then
                newInstance[key] = TextureAsset(_G[Stars])
                else
                -- patching texture property
                newInstance[key] = TextureAsset(_G[value])
                end
            else
                -- patching static property
                newInstance[key] = value
            end
        end

        -- adding visual environment components
        visualEnvironmentData.components:add(newInstance)
        visualEnvironmentData.runtimeComponentCount = visualEnvironmentData.runtimeComponentCount + 1
    end

    if visualEnvironmentData.priority == 1000000 then
        currentSpecialVisualEnvironment = EntityManager:CreateEntity(visualEnvironmentData, LinearTransform())
    end

    if visualEnvironmentData.priority == 1000001 then
        currentWeatherVisualEnvironment = EntityManager:CreateEntity(visualEnvironmentData, LinearTransform())
    end

    if currentSpecialVisualEnvironment ~= nil then
        currentSpecialVisualEnvironment:Init(Realm.Realm_Client, true)
        Tool:DebugPrint('Creating Special Environment: ' .. presetName, 'VE')
    end

    if currentWeatherVisualEnvironment ~= nil then
        currentWeatherVisualEnvironment:Init(Realm.Realm_Client, true)
        Tool:DebugPrint('Creating Weather Environment: ' .. presetName, 'VE')
    end

end

function ResetSpecialVisualEnvironment(presetName)

	if currentSpecialVisualEnvironment ~= nil then

		currentSpecialVisualEnvironment:Destroy()
        currentSpecialVisualEnvironment = nil

        nvgActivated = false

	end

end

-- Apply DayNight Presets
function ApplyOtherVisualEnvironments(presetName)
    if currentOtherVisualEnvironment ~= nil then
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
    visualEnvironmentData.priority = 999998

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

    currentOtherVisualEnvironment = EntityManager:CreateEntity(visualEnvironmentData, LinearTransform())

    if currentOtherVisualEnvironment ~= nil then
        currentOtherVisualEnvironment:Init(Realm.Realm_Client, true)
    end
end

function ResetOtherVisualEnvironment(presetName)

	if currentOtherVisualEnvironment ~= nil then

		currentOtherVisualEnvironment:Destroy()
        currentOtherVisualEnvironment = nil

	end

end

--- Night Vision Gadget  (For Now)
------------------------------------------------------------------------

function NVG_OnPlayerUpdateInput(p_Player, p_DeltaTime)
    -- Night Vision Goggles
    if Settings.useNightVisionGadget == true and isHud == true then

        if InputManager:WentKeyDown(8) then

            if nvgActivated ~= true then

                NVG:Activate()

            elseif nvgActivated then
                
                NVG:Deactivate()
                
            end

        end

    end 

end

Events:Subscribe('Engine:Update', function(deltaTime, simulationDeltaTime)
    -- Do stuff here.
    Events:DispatchLocal('DeltaTime', deltaTime)

    elapsedTime = elapsedTime + deltaTime

    if elapsedTime >= lastSecond + 1 then
        
        lastSecond = lastSecond + 1
        Events:DispatchLocal('SecondElapsed', lastSecond)
        
    end

    if elapsedTime >= lastSecond + 0.1 then

        Events:DispatchLocal('100msElapsed')

    end

    if nvgRunner == true then
        
		Animation:nvg()
        --Tool:DebugPrint("RunAnimation", 'nvg')

	end

    if weatherRunner == true then

        Animation:Weather()

    end 

end)

Events:Subscribe('SecondElapsed', function(lastSecond)

    -- Deplete or Charge the NVG
    if nvgActivated == true then
        
        NVG:Depleting()

    elseif NVG.batteryLifeCurrent ~= NVG.batteryLifeMax then
        
        NVG:Recharging()
        
    end

end)



------------------------------------------------------------------------
-- Weather

NetEvents:Subscribe(NetMessage.WEATHER_START, function(weatherType)

    if levelLoaded ~= true then
        return
    end

    ClientWeather:__Init(weatherType)
    Tool:DebugPrint('Received Weather NetEvent', 'weather')

<<<<<<< Updated upstream
end)





=======
              
>>>>>>> Stashed changes




































--[[ Vehicle Flash Light
Events:Subscribe('Player:UpdateInput', function(p_Player, p_DeltaTime)
    
    if InputManager:WentKeyDown(InputDeviceKeys.IDK_T) then
        if p_Player.inVehicle == false then
            print("Not in a vehicle")
            return
        end
        
        if p_Player.controlledControllable == nil then
            print("Not a driver")
            return
        end

        print('Pressed Key T')
        
        local s_VehicleEntityData = p_Player.controlledControllable.data

        local s_VehicleComponents = GameEntityData(p_Player.controlledControllable.data).components
        
        for _, l_component in pairs(s_VehicleComponents) do
            
            if l_component.typeInfo.name == "ChassisComponentData" then
                local s_ChassisComponents = ChassisComponentData(l_component).components
                for _, l_ChassisComponent in pairs(s_ChassisComponents) do
                    
                    --print(l_component.typeInfo.name)
                    if l_ChassisComponent.typeInfo.name == "LightComponentData" then
                        local s_LightComponentData = LightComponentData(l_ChassisComponent)

                        -- Invert boolean
                        local s_light = LocalLightEntityData(s_LightComponentData.light)
                        s_light.visible = not s_light.visible

                        --s_light:PropertyChanged('visible', (not s_light.visible))
                        s_light.excluded = not s_light.visible

                        local lightClone = s_LightComponentData:Clone()
                        s_LightComponentData:Destroy()
                        s_ChassisComponents.add(lightClone)

                        print("Light visible changed: " .. tostring(LocalLightEntityData(s_LightComponentData.light).visible))
                    end
                    
                end
            end
            --print(l_component.typeInfo.name)
            
        end
    end

    -- Debug: Apply settings on lights
	if InputManager:WentKeyDown(InputDeviceKeys.IDK_R) then
		if p_Player.inVehicle == false then
			print("Not in a vehicle")
			return
		end
		
		if p_Player.controlledControllable == nil then
			print("Not a driver")
			return
		end
		
        print('Pressed Key R')

		local s_VehicleEntityData = p_Player.controlledControllable.data
		local s_VehicleComponents = GameEntityData(p_Player.controlledControllable.data).components
		
		for _, l_component in pairs(s_VehicleComponents) do
			
			if l_component.typeInfo.name == "ChassisComponentData" then
				local s_ChassisComponents = ChassisComponentData(l_component).components
				for _, l_ChassisComponent in pairs(s_ChassisComponents) do
					

					--print(l_component.typeInfo.name)
					if l_ChassisComponent.typeInfo.name == "LightComponentData" then
						local s_LightComponentData = LightComponentData(l_ChassisComponent)

						s_LightComponentData.transform = LinearTransform(
							Vec3(-1, 0, 0), --rotation
							Vec3(0, 1, 0),
							Vec3(0, 0, 1),
							Vec3(0, 0, 0) -- CHANGE POSITION VALUE AND RELOAD THE MOD
						)
						
						-- Invert boolean
						local s_LocalLightEntityData = LocalLightEntityData(s_LightComponentData.light)
						s_LocalLightEntityData.radius = 10 -- CHANGE RADIUS VALUE AND RELOAD THE MOD
						s_LocalLightEntityData.intensity = 10 -- CHANGE RADIUS VALUE AND RELOAD THE MOD

                        local lightClone = s_LightComponentData:Clone()
                        s_LightComponentData:Destroy()
                        s_ChassisComponents.add(lightClone)

						print("Light settings changed")
					end
					
				end
			end
			--print(l_component.typeInfo.name)
			
		end
        
	end
end)]]


