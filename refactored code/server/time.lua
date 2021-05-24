local Time = class('Time')
local Tool = require '__shared/classes/tools/tool'
local Settings = require '__shared/settings'
local NetMessage = require '__shared/net'


function Time:__Init()

    Time:RegisterVars()
    Time:RegisterEvents()

end 


function Time:RegisterVars()

    self.serverDayLength = 0.0 
    self.engineUpdateTimer = 0.0 

    if Settings.resetTimeEachLevel == true then

        self.days = 0
        self.hours = Settings.startHour % 24

        if Settings.startHourRandom == true then
            self.hours = MathUtils:GetRandomInt(0, 23)
        end

        self.serverDayLength = self.hours / 24

    end

end 


function Time:RegisterEvents()

    if Settings.useTicketBasedCycle ~= true then 

        self.serverDeltaTime = Events:Subscribe('ServerDeltaTime', self, self.deltaTime)
        self.syncRequest = NetEvents:Subscribe(NetMessage.REQUEST_SYNC, self, self.PlayerRequest)

    end 

end 


function Time:deltaTime()

        -- Record Ticks
            self.engineUpdateTimer = self.engineUpdateTimer + dt
            self.serverDayLength = self.serverDayLength + dt

            -- Print Debug info
            if Settings.DebugPrints['enable'] == true then

                if Settings.DebugPrints['time'] == true then

                -- Update hours & days-- Update hours & days
                local prevDay = nil
                local prevHour = nil
                self.days, self.hours = Tool:getDaysHours(self.serverDayLength)
                    
                    if prevHour ~= self.hours or prevDay ~= self.days then
                        prevDay = self.days
                        prevHour = self.hours
                        Tool:DebugPrint('Current Time | Day: ' ..tostring(self.days) .. 'Hour: '.. tostring(self.hours), 'time')
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

end 


function Time:Broadcast()

    Tool:DebugPrint("[Broadcast] Date: " .. tostring(self.serverDayLength) .. " sec", 'time')
    NetEvents:Broadcast(NetMessage.S2C_SYNC_DAYTIME, self.serverDayLength)
    --ChatManager:SendMessage('Synchronizing Players')

end


function Time:PlayerRequest(player)

    Tool:DebugPrint("[Broadcast] Date: " .. tostring(self.serverDayLength) .. " sec", 'time')
    NetEvents:SendTo(NetMessage.S2C_SYNC_DAYTIME, player, self.serverDayLength)

end


return Time









