local Weather = class('Weather')
local Tool = require '__shared/classes/tools/tool'
local Settings = require '__shared/settings'
local NetMessage = require '__shared/net'


Events:Subscribe('Level:Loaded', function(levelName, gameMode, round, roundsPerMap)

    Weather:__Init()

end)


function Weather:__Init()

    self.randomizedNumber = 0
    self.elapsedTime = 0
    self.last10Seconds = 0

end 

function Weather:Randomizer()

    Events:Subscribe('ServerDeltaTime', function(dt)

        self.elapsedTime = self.elapsedTime + dt

        if self.elapsedTime >= self.last10Seconds + 10 then
            
            self.last10Seconds = self.last10Seconds + 10
            self.randomizedNumber = MathUtils:GetRandomInt(0, 100)
            
        end

        if self.randomizedNumber == 69 then 

            Weather:Start()

        end 

    end) 

end

function Weather:Start()

    self.weatherType = 1--MathUtils:GetRandomInt(0,1)
    NetEvents:Broadcast(NetMessage.WEATHER_START, self.weatherType)

end

Events:Subscribe('Player:Chat', function(player, recipientMask, message)
    
    if message == '!weather sandstorm' then 

        Tool:DebugPrint('Received Command', 'weather')
        Weather:Start()

    elseif message == '!weather reset' then 

        Tool:DebugPrint('Received Command', 'weather')
        NetEvents:Broadcast(NetMessage.WEATHER_START, 0)

    end 

end)