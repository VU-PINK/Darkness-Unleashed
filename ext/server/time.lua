local Time = class('Time')
local Tool = require '__shared/classes/tools/tool'
local Settings = require '__shared/settings'
local NetMessage = require '__shared/net'


Events:Subscribe('Level:Loaded', function(levelName, gameMode, round, roundsPerMap)

    Time:__Init()

    -- Broadcast to sync already joined players
    Time:Broadcast()

end)

Events:Subscribe('Level:Destroy', function()

    Events:Unsubscribe('ServerDeltaTime')

end)


function Time:__Init()


    self.serverDayLength = 0.0 
    self.engineUpdateTimer = 0.0
    Time:Ticks()
    Time:Requests()

    
    if Settings.resetTimeEachLevel == true then 

        days = 0 
        hours = Settings.startHour % 24 

        if Settings.startHourRandom == true then 
            hours = math.random(0, 23)
        end
        
        self.serverDayLength = hours / 24 

    end 


end


function Time:Ticks()

    if Settings.useTicketBasedCycle ~= true then 

        -- Record Ticks
        Events:Subscribe('ServerDeltaTime', function(dt)

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

    end

end 

function Time:Broadcast()

    Tool:DebugPrint("[Broadcast] Date: " .. tostring(self.serverDayLength) .. " sec", 'time')
    NetEvents:Broadcast(NetMessage.S2C_SYNC_DAYTIME, self.serverDayLength)
    --ChatManager:SendMessage('Synchronizing Players')

end


function Time:Requests()

    NetEvents:Subscribe(NetMessage.REQUEST_SYNC, function(player)

        Tool:DebugPrint("[Broadcast] Date: " .. tostring(self.serverDayLength) .. " sec", 'time')
        NetEvents:SendTo(NetMessage.S2C_SYNC_DAYTIME, player, self.serverDayLength)

    end)

end


return Time

















