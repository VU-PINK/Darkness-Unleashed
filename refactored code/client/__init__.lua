local Main = class('Main')

local Settings = require '__shared/settings'
local Tool = require '__shared/tool'
local Patches = require 'patches'
local Resources = require 'resources'
local NetMessage = require '__shared/net'
local clientTime = require 'systems/clienttime'
local Animation = require 'systems/animation'
local Presets = require '__shared/presets'
local specialPresets = require '__shared/special'
local cineTools = nil 
local clientWeather = nil 
local NVG = nil
require 'ui'
require "__shared/DebugGUI"

if Settings.dayNightEnabled ~= true and Settings.cineTools == true then
    cineTools = require 'systems/cinematictools'
end


if Settings.weatherEnabled == true then
    clientWeather = require 'systems/weather'
end


if Settings.useNightVisionGadget == true then 
    NVG = require 'systems/nvg'
end


function Main:__Init()

    Main:RegisterVars()
    Main:RegisterEvents()

end


function Main:RegisterVars()

    self.levelLoaded = false 
    self.elapsedTime = 0
    self.lastSecond = 0

    self.currentMainVE = nil
    self.currentSpecialVE = nil 
    self.currentWeatherVE = nil
    self.presetMultipliers = {
        SkyComponentData = {
            brightnessScale = self.BrightnessMultiplicator
        },
        FogComponentData = {
            fogDistanceMultiplier = self.FogMultiplicator
        },
    }

end 


function Main:RegisterEvents()

    self.extensionLoadedEvent = Events:Subscribe('Extension:Loaded', self, self.OnExtensionLoad)
    self.extensionUnloadEvent = Events:Subscribe("Extension:Unloaded", self, self.OnExtensionUnload)
    self.levelLoadedEvent = Events:Subscribe('Level:Loaded', self, self.OnLevelLoad)
    self.levelDestroyEvent = Events:Subscribe('Level:Destroy', self, self.OnLevelDestroy)
    self.partitionLoadedEvent = Events:Subscribe('Partition:Loaded', self, self.OnPartitionLoad)
    self.resourcesLoadEvent = Events:Subscribe('Level:LoadResources', self, self.OnResourceLoad)
    self.playerRespawnEvent = Events:Subscribe('Player:Respawn', self, self.OnPlayerRespawn)
    self.playerUpdateInputEvent = Events:Subscribe('Player:UpdateInput', self, self.OnPlayerInput)
    self.engineUpdateEvent = Events:Subscribe('Engine:Update', self, self.OnEngineUpdate)

end


function Main:OnExtensionLoad()

    Patches:__Init()

    if Settings.useNightVisionGadget == true then
    	UI:__Init()
	end

end


function Main:OnLevelLoad(levelName, gameMode)

        -- ClientTime
        if Settings.dayNightEnabled == true then 
            ClientTime:OnLevelLoaded()
        end
        
        if Settings.dayNightEnabled ~= true and Settings.cineTools == true then 
            CinematicTools()
        end 
            
        -- Visual Environments
        local mapName = levelName:match('/[^/]+'):sub(2) -- MP_001
        local mapPreset = self.Settings.mapPresets[mapName]
        
            if mapPreset ~= nil then
        
                print('Calling Preset ' .. mapPreset .. ' on ' .. mapName)
                self.brightnessMultiplicator, self.fogMultiplicator = self.Patches:Multipliers(mapName)
                Main:ApplyVisualEnvironment(mapPreset, 'main')

                if mapPreset == 'Night' then
        
                    Patches:EnforceBrightness()
        
                else 
        
                    Patches:ReleaseBrightness()
        
                end
        
            else

                Tool:DebugPrint('Using Standard', 'common')
                ResetVisualEnvironment('all')

            end

end


function Main:OnPartitionLoad(partition)

    Patches:Emitters(partition)
    Patches:Components(partition)

end


function Main:OnResourceLoad()

    Patches:AllowMoreSpotlights()

end


function Main:OnPlayerRespawn(player)

    local localPlayer = PlayerManager:GetLocalPlayer()

    if player == localPlayer and useNightVisionGadget then

        NVG:__Init()

	end

    UI:PlayerRespawn(player, localPlayer)

end


function Main:OnPlayerInput(player, deltaTime)

    -- Night Vision Goggles
    Main:NVGPlayerInput(player, deltaTime)

end


-- Apply Map Presets
function Main:ApplyVisualEnvironment(presetName, presetType)

    local visualEnvironmentData = nil

    if self.currentMainVE ~= nil then
        return
    elseif self.currentSpecialVE ~= nil then
        return
    elseif self.currentWeatherVE ~= nil then 
        return
    end

    local selectedPreset = presetValues[presetName]

    if selectedPreset == nil then
        print('Wrong Configuration')
        return
    end

    visualEnvironmentData = VisualEnvironmentEntityData()
    visualEnvironmentData.enabled = true

    if presetType == 'main' then 

        visualEnvironmentData.priority = 999998
        visualEnvironmentData.visibility = 1.0

    elseif presetType == 'special' then 

        visualEnvironmentData.priority = 1000001
        visualEnvironmentData.visibility = 1.0

    elseif presetType == 'weather' and specialValues.isWeather[presetName] == true then 

        visualEnvironmentData.priority = 1000000
        visualEnvironmentData.visibility = 0.0

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

                    newInstance[key] = TextureAsset(Resources.Stars)

                else 
                    -- patching texture property
                    newInstance[key] = TextureAsset(Resources[value])

                end

            elseif presetType == 'main' then 

                -- applying multiplier
                if self.presetMultipliers[instanceType] ~= nil and self.presetMultipliers[instanceType][key] ~= nil then
                    local multiplier = self.presetMultipliers[instanceType][key]
                    value = value * multiplier
                end

            else 

                newInstance[key] = value

            end

        end

        -- adding visual environment components
        visualEnvironmentData.components:add(newInstance)
        visualEnvironmentData.runtimeComponentCount = visualEnvironmentData.runtimeComponentCount + 1

    end

    if presetType == 'main' then

        self.currentMainVE = EntityManager:CreateEntity(visualEnvironmentData, LinearTransform())

        if self.currentMainVE ~= nil then

            self.currentMainVE:Init(Realm.Realm_Client, true)

        end

    elseif presetType == 'special' then 

        self.currentSpecialVE = EntityManager:CreateEntity(visualEnvironmentData, LinearTransform())

        if self.currentSpecialVE ~= nil then

            self.currentSpecialVE:Init(Realm.Realm_Client, true)

        end

    elseif presetType == 'weather' then 

        self.currentWeatherVE = EntityManager:CreateEntity(visualEnvironmentData, LinearTransform())

        if self.currentWeatherVE ~= nil then

            self.currentWeatherVE:Init(Realm.Realm_Client, true)

        end

    end 

end


function Main:ResetVisualEnvironment(type)


	if self.currentMainVE ~= nil and type == 'main' then

		self.currentMainVE:Destroy()
        self.currentMainVE = nil

		Tool:DebugPrint('Removed Current Preset', 'VE')

	end

    if self.currentSpecialVE ~= nil and type == 'special' then

		self.currentSpecialVE:Destroy()
        self.currentSpecialVE = nil

		Tool:DebugPrint('Removed Current Special Preset', 'VE')

	end

    if self.currentWeatherVE ~= nil and type == 'weather' then

		self.currentWeatherVE:Destroy()
        self.currentWeatherVE = nil

		Tool:DebugPrint('Removed Current Weather Preset', 'VE')

	end

    if type == 'all' then 

        if self.currentMainVE ~= nil then 

            self.currentMainVE:Destroy()
            self.currentMainVE = nil

        end 

        if self.currentSpecialVE ~= nil then 

            self.currentSpecialVE:Destroy()
            self.currentSpecialVE = nil

        end 

        if self.currentWeatherVE ~= nil then 

            self.currentWeatherVE:Destroy()
            self.currentWeatherVE = nil

        end

        Tool:DebugPrint('Removed All Visual Environments', 'VE')

    end

end


-- Night Vision Gadget -- 
function Main:NVGPlayerInput(player, deltaTime)
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


function Main:OnEngineUpdate(deltaTime, simulationDeltaTime)

    Animation:Lerper(deltaTime)

    elapsedTime = elapsedTime + deltaTime

    if elapsedTime >= lastSecond + 1 then
        
        lastSecond = lastSecond + 1

        if NVG.activated == true then
        
            NVG:Depleting(elapsedTime)
    
        elseif NVG.batteryLifeCurrent ~= NVG.batteryLifeMax then
            
            NVG:Recharging()
            
        end
        
    end

    if elapsedTime >= lastSecond + 0.1 then

        Events:DispatchLocal('100msElapsed')

    end

end



-- Weather --
NetEvents:Subscribe(NetMessage.WEATHER_START, function(weatherType)

    if levelLoaded ~= true then
        return
    end

    ClientWeather:Call(weatherType)
    Tool:DebugPrint('Received Weather NetEvent', 'weather')

end)


return Main













---- WIP VEHICLE LIGHT SWITCH

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
