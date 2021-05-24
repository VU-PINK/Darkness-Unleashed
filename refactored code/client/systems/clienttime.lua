local ClientTime = class('ClientTime')
local Tool = require '__shared/classes/tools/tool'
local Settings = require '__shared/settings'
local NetMessage = require '__shared/net'


function ClientTime:__Init()

    ClientTime:RegisterVars()
    ClientTime:RegisterEvents()
    ClientTime:GetVE()
    ClientTime:FindSkyGradientTexture()

end 


function ClientTime:RegisterVars()

    self.transitionFactor = 1 
    self.clientDayLength = 0 
    self.previousFactor = nil 
    self.lerpFactor = 0

end 


function ClientTime:RegisterEvents()

    if Settings.dayNightEnabled == true and Settings.useTicketBasedCycle ~= true then 

        self.serverSyncEvent = NetEvents:Subscribe(NetMessage.S2C_SYNC_DAYTIME, self, self.ServerSync)

    end 

end 


function ClientTime:GetVE()

    self.VES = VisualEnvironmentManager:GetStates()

end


function ClientTime:FindSkyGradientTexture()
	-- Find the sky gradient texture of the lowest priority (basic) VE
	self.s_VEPriority = -1
	
    if self.VES == nil then
        self.VES = VisualEnvironmentManager:GetStates()
    end
	
	for _, VEState in pairs(self.VES) do
		
		if VEState.sky ~= nil then
			
			if VEState.sky.skyGradientTexture ~= nil or VEState.sky.panoramicTexture ~= nil then

				if self.s_VEPriority < 0 or VEState.priority < self.s_VEPriority then
                    
					self.s_VEPriority = VEState.priority
                    mapPanoramicTexture = VEState.sky.panoramicTexture
                    mapPanoramicAlphaTexture = VEState.sky.panoramicAlphaTexture
                    mapSkyGradientTexture = VEState.sky.skyGradientTexture
                    mapCloudLayer1Texture = VEState.sky.cloudLayer1Texture
                    mapPanoramicXmin = VEState.sky.panoramicUVMinX
                    mapPanoramicXmax = VEState.sky.panoramicUVMaxX 
                    mapPanoramicYmin = VEState.sky.panoramicUVMinY
                    mapPanoramicYmax = VEState.sky.panoramicUVMaxY
                    mapPanoramicRotation = VEState.sky.panoramicRotation
                    mapPanoramicTileFactor = VEState.sky.panoramicTileFactor
                    mapStaticEnvmapScale = VEState.sky.staticEnvmapScale
                    print('Saved Panoramic Factors')

				end

			end

		end

	end

end


function ClientTime:Ticks(dt)

        if Settings.useTicketBasedCycle ~= true then 

            self.clientDayLength = self.clientDayLength + dt
            
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
                

        elseif Settings.useTicketBasedCycle == true then 

            -- Get Team Tickets
            self.ticketsUS, self.ticketsRU = ClientTime:GetTicketCounterTickets()

            if self.ticketsUS == nil or self.ticketsRU == nil or type(self.ticketsUS) == 'string' or type(self.ticketsRU) == 'string' then
                return 
            end

            -- Get Total Tickets
            self.totaltickets = self.ticketsUS + self.ticketsRU 

            -- Set Maximum Tickets
            if self.maxtickets == nil and self.totaltickets ~= 0 then 
                self.maxtickets = self.totaltickets - (self.totaltickets * 0.05) -- 5% of match will always be full night
            end

            if self.maxtickets == nil then 
                return
            end

            self.clientDayLength = self.clientDayLength + dt

            if Settings.day2Night == true then 
                self.factor = 1 - (self.totaltickets / self.maxtickets)
            else
                self.factor = self.totaltickets / self.maxtickets
            end 

            ClientTime:UpdateVE()

        end

end


-- Change visibility
function ClientTime:UpdateVE()
        
    if self.factor ~= self.previousNightFactor then

        self.VES = VisualEnvironmentManager:GetStates()

        VisualEnvironmentManager:SetDirty(true)
        
        -- Update preset visibility
        for _, state in pairs(self.VES) do

            if state.priority == self.s_VEPriority then 

                state.priority = 900000
                state.outdoorLight.sunColor = Vec3(1, 0.6, 0.21) 
                state.outdoorLight.groundColor = Vec3(0.34, 0.24, 0.18) 
                state.outdoorLight.skyColor = Vec3(0.38, 0.34, 0.21)
                state.outdoorLight.sunRotationX = 0
                state.outdoorLight.sunRotationY = 90
                state.sky.sunSize = 0.00700000021607
                state.sky.sunScale = 20.0
                state.sky.panoramicUVMinX = 0
                state.sky.panoramicUVMaxX = 1
                state.sky.panoramicUVMinY = 0
                state.sky.panoramicUVMaxY = 0.5
                state.sky.panoramicTileFactor = 1.0
                state.sky.panoramicRotation = 260
                state.colorCorrection.saturation = Vec3(0.8, 0.75, 0.75)


            end
            -- Check if night preset
            if state.priority == 999999 then
                --print("*visibility is: " .. state.visibility)
                state.visibility = self.factor
                --print("*visibility changed: " .. state.visibility)
            end


        end


        Tool:DebugPrint('Changing VE: ' .. self.factor, 'time')
        self.previousNightFactor = self.factor

    end			

end


function ClientTime:ServerSync(serverTime)

    -- Listen to sync from server
    self.clientDayLength = serverTime
    
    -- Update hours and days from server
    self.days, self.hours = Tool:getDaysHours(serverTime)

    -- Print Debug info
    Tool:DebugPrint('Server Datetime Sync : ' .. tostring(self.days) .. ' days ' .. tostring(self.hours) .. ' hours', 'time')

end


function ClientTime:GetTicketCounterTickets()
    
    -- Function Code credit BreeArnold
    local clientTicketCounterIterator = EntityManager:GetIterator('ClientTicketCounterEntity')
    local ticketCounterEntity = clientTicketCounterIterator:Next()
    local usTickets = " "
    local ruTickets = " "

    while ticketCounterEntity ~= nil do

        if TicketCounterEntity(ticketCounterEntity).team == TeamId.Team1 then

            usTickets = TicketCounterEntity(ticketCounterEntity).ticketCount

        else

            ruTickets = TicketCounterEntity(ticketCounterEntity).ticketCount

        end

        ticketCounterEntity = clientTicketCounterIterator:Next()

    end

    return usTickets, ruTickets

end
