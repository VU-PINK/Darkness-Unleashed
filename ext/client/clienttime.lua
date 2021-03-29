local ClientTime = class('ClientTime')
local Tool = require '__shared/classes/tools/tool'
local Settings = require '__shared/settings'
local NetMessage = require '__shared/net'
local states = nil

function ClientTime:OnLevelLoaded()
    ClientTime:__Init()
end

function ClientTime:__Init()

    self.factor = 1
    self.clientDayLength = 0
    self.previousNightFactor = nil
    self.t = 0
    ClientTime:GetVE()
    ClientTime:Ticks()
    ClientTime:Sync()

end

function ClientTime:GetVE()

    VE = VisualEnvironmentManager:GetStates()

end

function ClientTime:Ticks()

    -- Record Ticks
    self.engineUpdateTimer = 0.0 

    Events:Subscribe('DeltaTime', function(dt)

        if Settings.useTicketBasedCycle ~= true then 

            self.clientDayLength = self.clientDayLength + dt

            self.engineUpdateTimer = 0.0
            
            -- Offset seconds to 0:00 AM
            self.seconds = self.clientDayLength % Settings.dayLengthInSeconds 

            --print(self.seconds)

            -- Offset seconds (0 is the middle of the night, but it should be the start of the night)
            --seconds = seconds + pure_night_duration_sec / 2
            
            self.factor = nil
            
            -- Check if it is night
            if self.seconds < Settings.pureNightDurationInSeconds / 2 then
                self.factor = 1.0
            
            -- Check if it is night -> day
            elseif self.seconds < Settings.dayLengthInSeconds / 2 - Settings.pureDayDurationInSeconds / 2 then
                self.factor = 1.0 - (self.seconds - Settings.pureNightDurationInSeconds / 2) / (Settings.dayLengthInSeconds / 2 - Settings.pureDayDurationInSeconds / 2 - Settings.pureNightDurationInSeconds / 2)
                
            -- Check if it is day
            elseif self.seconds < Settings.dayLengthInSeconds / 2 + Settings.pureDayDurationInSeconds / 2 then
                self.factor = 0.001
                
            -- Check if it is day -> night
            elseif self.seconds < Settings.dayLengthInSeconds - Settings.pureNightDurationInSeconds / 2 then
                self.factor = (self.seconds - Settings.dayLengthInSeconds / 2 - Settings.pureDayDurationInSeconds / 2) / (Settings.dayLengthInSeconds - Settings.pureNightDurationInSeconds / 2 - Settings.dayLengthInSeconds / 2 - Settings.pureDayDurationInSeconds / 2)
            
            -- Check if it is night
            else
                self.factor = 1.0
            end
            
            -- Update environment lighting

            ClientTime:UpdateVE()
                
            -- Update hours & days
            
            -- Print Debug info
            if self.hours ~= hours or self.days ~= days then 
                self.hours = hours 
                self.days = days

                Tool:DebugPrint('Datetime : ' .. tostring(days) .. ' days ' .. tostring(hours) .. ' hours' .. ' -> ' .. tostring(self.factor), 'time')

            end

        elseif Settings.useTicketBasedCycle == true then 

            if self.oldFactor ~= self.newfactor then 

                self.t = self.t + (1 / Settings.serverUpdatesFrequency * dt) 
                self.factor = MathUtils:Lerp(self.oldFactor, self.newFactor, self.t)
                print("T: "..self.t)
                print("Factor: "..self.factor)

                if self.t >= 1 then
                    self.t = 0
                end

            end

            ClientTime:UpdateVE()

        end

    end)

end


-- Change visibility
function ClientTime:UpdateVE()
        
        if (self.factor ~= self.previousNightFactor) then

            if states == nil then
                states = Tool:GetVisualEnvironmentStateArray(1, 2, 3, 999999)
            end
            VisualEnvironmentManager:SetDirty(true)
            
            -- Update preset visibility
            for _, state in pairs(states) do

                if state.priority == 1 or state.priority == 2 or state.priority == 3 then 

                    state.outdoorLight.sunColor = Vec3(0.905,0.045,0.045)
                    state.outdoorLight.sunRotationX = 180
                    state.outdoorLight.sunRotationY = 180

                    state.sky.sunSize = 0.1
                    state.sky.sunScale = 2
                    state.sky.panoramicUVMinX = 0.280999988317
                    state.sky.panoramicUVMaxX = 0.298999994993
                    state.sky.panoramicUVMinY = 0.0630000010133
                    state.sky.panoramicUVMaxY = 0.307000011206
                    state.sky.panoramicTileFactor = 1.0
                    state.sky.panoramicRotation = 260
                    state.sky.cloudLayer1Altitude = 2000000.0
                    state.sky.cloudLayer1TileFactor = 0.600000023842
                    state.sky.cloudLayer1Rotation = 237.072998047
                    state.sky.cloudLayer1Speed = 0 --0.0010000000475,
                    state.sky.cloudLayer1SunLightIntensity = 0.05
                    state.sky.cloudLayer1SunLightPower = 0.05
                    state.sky.cloudLayer1AmbientLightIntensity = 0.40
                    state.sky.cloudLayer1Texture = TextureAsset(MoonNightStars)

                    if state.sky.cloudLayer2AlphaMul ~= nil then 
                        state.sky.cloudLayer2AlphaMul = 0.40
                        state.sky.cloudLayer2Altitude = 4000000.0
                        state.sky.cloudLayer2TileFactor = 0.600000023842
                        state.sky.cloudLayer2Rotation = 237.072998047
                        state.sky.cloudLayer2Speed = 0 --0.0010000000475,
                        state.sky.cloudLayer2SunLightIntensity = 0.05
                        state.sky.cloudLayer2SunLightPower = 0.05
                        state.sky.cloudLayer2AmbientLightIntensity = 0.40
                        state.sky.cloudLayer2AlphaMul = 0.40
                    end


                end
                -- Check if night preset
                if state.priority == 999999 then
                    --print("*visibility is: " .. state.visibility)
                    state.visibility = self.factor
                    --print("*visibility changed: " .. state.visibility)
                end

            end


            Tool:DebugPrint('Changing VE: ' .. self.factor)
            
            self.previousNightFactor = self.factor
        end			
end


function ClientTime:Sync()

        -- Listen to sync from server
        NetEvents:Subscribe(NetMessage.S2C_SYNC_DAYTIME, function(serverTime)

            if Settings.useTicketBasedCycle ~= true then 

                self.clientDayLength = serverTime
                
                -- Update hours and days from server
                days, hours = Tool:getDaysHours(serverTime)

                -- Print Debug info
                Tool:DebugPrint('Server Datetime Sync : ' .. tostring(days) .. ' days ' .. tostring(hours) .. ' hours', 'time')

            elseif Settings.useTicketBasedCycle == true then 

                self.oldFactor = self.factor
                self.factor = serverTime 

                if self.factor ~= self.newFactor then 
                self.newFactor = self.factor 
                end 

            end 

        end)

end


function ClientTime:OnLevelDestoyed()

    Events:Unsubscribe('DeltaTime')

end


