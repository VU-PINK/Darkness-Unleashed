local Shared = class('Shared')
local Settings = require '__shared/settings'
local Tool = require '__shared/darknesstools/tools'


function Shared:__Init()

    Shared:RegisterVars()
    Shared:RegisterEvents()
    Shared:RegisterHooks()
    Shared:AddVehicleLights()

end 


function Shared:RegisterVars()

    self.lightEntities = {}
    self.bufferedLights = {}

end 


function Shared:RegisterEvents()

    self.vehicleDestroyEvent = Events:Subscribe('Vehicle:Destroyed', self, self.OnVehicleDestroy)
    self.playerInputEvent = Events:Subscribe('UpdateInput', self, self.OnPlayerInput)

end 


function Shared:RegisterHooks()

    self.entityFactoryCreateHook = Hooks:Install('EntityFactory:Create', self, self.OnEntityCreation)

end 


function Shared:AddVehicleLights()

    if Settings.useVehicleLights_Airborne == true or Settings.useVehicleLights_Ground == true then

        require '__shared/classes/vehiclemodifications'

    else

        Tool:DebugPrint('Not using Vehicle Lights', 'altering')

    end

end 


function Shared:OnEntityCreation(hookCtx, entityData, transform)

    if entityData:Is('SpotLightEntityData') then

        local createdEntity = hookCtx:Call()

        local entityBus = createdEntity.bus.parent

        if createdEntity.uniqueId == 0 then

            table.insert(lightEntities, entityBus)
            --print('added entity to table')

        end

    end

end 


function Shared:OnVehicleDestroy(vehicle, vehiclePoints, hotTeam)

    if vehicle == controllableEntity then

        Tool:DebugPrint('Vehicle Destroyed: ' .. lightEntities, 'removing')
        Tool:DebugPrint('---------------------------------------------------------------', 'removing')

    end

end 


function Shared:OnPlayerInput(player, deltaTime)

    --Vehicle lights toggle
    if InputManager:WentKeyDown(InputDeviceKeys.IDK_T) then

        if player.inVehicle == false then
            Tool:DebugPrint("Not in a vehicle", 'player')
            return
        end
        
        if player.controlledControllable == nil then
            Tool:DebugPrint("Not a driver", 'player')
            return
        end

        controllableEntity = player.controlledControllable

        if controllableEntity == nil then
            return
        end

        if controllableEntity ~= nil then
            --print('C Entity:')
            --print(controllableEntity)
            --print('DATA:')
            --print(controllableEntity.data)
            --print(controllableEntity.bus.entities)
            --print(controllableEntity.bus.parent.entities)
        end

        for _, component in pairs(controllableEntity.bus.parent.entities) do

            if component:Is('SpotlightComponentData') then

                print('Hi')

            else

                print(component)

            end

        end

    end

end 


return Shared












       --print('-------------------------------------------------------')

        --print('Vehicle Controllable Entity: ')

        --print(controllableEntity)

        --print('Vehicle Controllable Entity Bus: ')

        --print(controllableEntity.bus.entities)

        --print('-------------------------------------------------------')

        --[[ iterate through all entities
        local it = EntityManager:GetIterator('SpotLightEntity')

        local entity = it:Next()
        
        while entity ~= nil do

            -- get cloned entityData
            for _, entityParent in pairs(lightEntities) do 


                if entityParent == entity.bus.parent then 

                    -- go to parent entitybus
                    for _, busentity in pairs(entity.bus.parent.entities) do 

                        if busentity:Is('ClientVehicleEntity') then

                            --print('-----------------------')
                            --print('Bus:')
                            --print(busentity)
                            --print('-----------------------')
                            --print('Iterated Entity:')
                            --print(entity)
                            --print('-----------------------')

                            if busentity == controllableEntity and Tool:FindInArray(bufferedLights, entity.bus.parent) == true then
    
                                print('Enabling entity...')
    
                                indexItem = Tool:GetArrayItemIndex(bufferedLights, entity.bus.parent)
                                table.remove(bufferedLights, indexItem)
    
                                if Tool:FindInArray(bufferedLights, entity.bus.parent) ~= true then 
    
                                    print(entity)
                                    entity:FireEvent('Enable')  
                                    print('Enabled Lights')
    
                                end 
    
                            elseif busentity == controllableEntity and Tool:FindInArray(bufferedLights, entity.bus.parent) ~= true then
    
                                table.insert(bufferedLights, entity.bus.parent)
                                print('Disabling entity...')
    
                                if Tool:FindInArray(bufferedLights, entity.bus.parent) == true then 
    
                                    print(entity)
                                    entity:FireEvent('Disable')
                                    print('Disabled Lights')
    
                                end 
    
                            end
    
    
                        end 

                    end 
                end 

            end

        -- iterate to next entity
        entity = it:Next()   
        end    

    end


end]]

