local Time = class('Time')
local Tool = require '__shared/classes/tools/tool'
local Settings = require '__shared/settings'
local NetMessage = require '__shared/net'

local levelLoaded = false


Events:Subscribe('Level:Loaded', function(levelName, gameMode, round, roundsPerMap)

    Time:__Init()
    levelLoaded = true 

    -- Broadcast to sync already joined players
    Time:Broadcast()

end)

Events:Subscribe('Level:Destroy', function()

    levelLoaded = false 

end)


function Time:__Init()


    self.serverDayLength = 0.0 
    self.engineUpdateTimer = 0.0
    Time:Ticks()
    Time:PlayerJoin()

    
    if Settings.resetTimeEachLevel == true then 

        days = 0 
        hours = Settings.startHour % 24 

        if Settings.startHourRandom == true then 
            hours = math.random(0, 23)
        end
        
        self.serverDayLength = hours / 24 * self.serverDayLength

    end 


end


function Time:Ticks()

    if Settings.useTicketBasedCycle ~= true then 

        -- Record Ticks
        Events:Subscribe('Engine:Update', function(dt)

            self.engineUpdateTimer = self.engineUpdateTimer + dt
            self.serverDayLength = self.serverDayLength + dt
            
            -- Print Debug info
            if Settings.DebugPrints['enable'] == true then

                if Settings.DebugPrints['time'] == true then

                -- Update hours & days-- Update hours & days
                self.days = nil
                self.hours = nil
                self.days, self.hours = Tool:getDaysHours(self.serverDayLength)
                    
                    if hours ~= self.hours or days ~= self.days then
                        days = self.days
                        hours = self.hours
                        Tool:DebugPrint('Current Time | Day: ' ..tostring(days) .. 'Hour: '.. tostring(hours), 'time')
                    end

                end

            end
            
            -- Check if it is time to send a client update (to ensure client sync)
            if self.engineUpdateTimer < Settings.serverUpdatesFrequency then
                return
            end
            self.engineUpdateTimer = 0.0
            
            -- Sync players
            Time:Broadcast()
            
        end)

    elseif Settings.useTicketBasedCycle == true then 

        self.maxtickets = nil
        self.totaltickets = nil

        Events:Subscribe('Engine:Update', function(dt)

            -- Get Game Tickets
            self.ticketsUS = TicketManager:GetTicketCount(1)
            self.ticketsRU = TicketManager:GetTicketCount(2)

            if self.ticketsUS <= 0 or self.ticketsUS <= 0 then 
                return 
            end

            self.totaltickets = self.ticketsUS + self.ticketsRU 

            if self.maxtickets == nil and self.totaltickets ~= 0 then 
                self.maxtickets = self.totaltickets 
            end

            self.engineUpdateTimer = self.engineUpdateTimer + dt
            self.serverDayLength = self.totaltickets / self.maxtickets

            -- Check if it is time to send a client update (to ensure client sync)
            if self.engineUpdateTimer < Settings.serverUpdatesFrequency then
                return
            end

            self.engineUpdateTimer = 0.0
            
            -- Sync players
            if (self.maxtickets - self.totaltickets) > 0 then 
                Time:Broadcast()
            end
            
        end)
    end

end 

function Time:Broadcast()

    Tool:DebugPrint("[Broadcast] Date: " .. tostring(self.serverDayLength) .. " sec", 'time')
    NetEvents:Broadcast(NetMessage.S2C_SYNC_DAYTIME, self.serverDayLength)
    ChatManager:SendMessage('Synchronizing Players')

end

function Time:PlayerJoin()

    Events:Subscribe('Player:Authenticated', function(name, playerGuid, ipAddress, accountGuid)

        Tool:DebugPrint("[Authenticated Broadcast] Date: " .. tostring(self.serverDayLength) .. " sec", 'time')
        NetEvents:Broadcast(NetMessage.S2C_SYNC_DAYTIME, self.serverDayLength)
    
    end)

end




return Time


















--[[Events:Subscribe('TimeSecond', function(lastSecond, deltaTime)

    Time:Advance(lastSecond, simulationDeltaTime)

end)]]

--[[function Time:Check()

    if self.currentTime == nil or self.factor == nil then 
        Time:Init__()
    end 

    if self.currentTime > 0 and self.currentTime < (self.wholeDay * (self.nightPercentage / 2)) then 

        Tool:DebugPrint('Time until Transition to Day: ' .. (self.wholeDay * (self.nightPercentage / 2)) - self.currentTime, 'time')
        --Tool:DebugPrint('Calculation 1: '.. (self.wholeDay * (self.nightPercentage / 2)), 'time')

    end 

    if self.currentTime > (self.wholeDay * (self.nightPercentage / 2)) and self.currentTime < (self.wholeDay * (self.nightPercentage / 2)) + (self.wholeDay * (self.transitions / 2)) then 

        self.t = self.t + self.changePerSecond
        self.factor = MathUtils:Lerp(1, 0.0001, self.t)
        Tool:DebugPrint('Transitioning: ' .. (self.wholeDay * (self.nightPercentage / 2)) + (self.wholeDay * (self.transitions / 2)) - self.currentTime, 'time')
        --Tool:DebugPrint('Calculation 2: '.. (self.wholeDay * (self.nightPercentage / 2)) + (self.wholeDay * (self.transitions / 2)), 'time')

    end

    if self.currentTime > (self.wholeDay * (self.nightPercentage / 2)) + (self.wholeDay * (self.transitions / 2)) and self.currentTime < self.wholeDay - (self.wholeDay * (self.nightPercentage / 2)) - (self.wholeDay * (self.transitions / 2)) then
      
        self.factor = 0.00001
        Tool:DebugPrint('Time until Transition to Night: ' .. (self.wholeDay - (self.wholeDay * (self.nightPercentage / 2)) - (self.wholeDay * (self.transitions / 2)) - self.currentTime), 'time')
        --Tool:DebugPrint('Calculation 3: '.. (self.wholeDay - (self.wholeDay * (self.nightPercentage / 2)) - (self.wholeDay * (self.transitions / 2))), 'time')
        self.t = 0

    end
    
    if self.currentTime > self.wholeDay - (self.wholeDay * (self.nightPercentage / 2)) - (self.wholeDay * (self.transitions / 2)) and self.currentTime < (self.wholeDay - (self.wholeDay * (self.nightPercentage / 2))) then
        
        self.t = self.t + self.changePerSecond
        self.factor = MathUtils:Lerp(0.0001, 1, self.t)
        Tool:DebugPrint('Transitioning: ' .. (self.wholeDay - (self.wholeDay * (self.nightPercentage / 2))) - self.currentTime, 'time')
        --Tool:DebugPrint('Calculation 4: '.. (self.wholeDay - (self.wholeDay * (self.nightPercentage / 2))), 'time')

    end 
    
    if self.currentTime > (self.wholeDay - (self.wholeDay * (self.nightPercentage / 2))) then 

        self.factor = 1
        Tool:DebugPrint('Time until Transition to Day: ' .. (self.wholeDay - self.currentTime + (self.wholeDay * self.nightPercentage)), 'time')
        --Tool:DebugPrint('Calculation 5: '.. (self.wholeDay * (self.nightPercentage / 2)), 'time')
        self.t = 0

    end 


end]]

--[[function Time:Advance(lastSecond, deltaTime)

    if self.currentTime == nil then 
        return
    end 

    if self.wholeDay == nil then 
        return
    end

    Time:Check()

    if self.currentTime < self.wholeDay and self.factor ~= nil then
        
        self.currentTime = self.currentTime + 1

        if self.currentTime == self.currentTime + 30 then 
            NetEvents:Broadcast('Time', self.currentTime, self.factor)
        end 

        Tool:DebugPrint('Current Time: ' .. self.currentTime, 'time')
        --ChatManager:SendMessage('Current Time: ' .. self.currentTime)

    end 

    if self.currentTime >= self.wholeDay and self.factor ~= nil then 

        self.dayCount = self.dayCount + 1
        self.currentTime = 0 
        NetEvents:Broadcast('Time', self.currentTime, self.factor)
        Tool:DebugPrint('Beginning a new Day', 'time')
        ChatManager:SendMessage('Beginning a new day!  |  Day: ' .. self.dayCount )

    end

end]]




