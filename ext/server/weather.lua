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
    self.last20Seconds = 0
    self.currentWeather = 0
    Weather:Randomizer()

    Events:Subscribe('Player:Authenticated', function(player)
    
        NetEvents:Broadcast(NetMessage.WEATHER_START, self.currentWeather)
    
    end)

end



function Weather:Randomizer()

    Events:Subscribe('ServerDeltaTime', function(dt)

        self.elapsedTime = self.elapsedTime + dt

        if self.elapsedTime >= self.last20Seconds + 20 then

            self.last20Seconds = self.last20Seconds + 20
            self.randomizedNumber = MathUtils:GetRandomInt(0, 3)
            print(self.randomizedNumber)

            if self.randomizedNumber == 1 then

                Tool:DebugPrint('Changing', 'weather')
                Weather:Start()
    
            end

        end

    end)

end

function Weather:Start()

    self.weatherType = MathUtils:GetRandomInt(0,1)

    print('Weather Type: '.. self.weatherType)

    if self.currentWeather == self.weatherType then
        Tool:DebugPrint('Weather Type already active', 'weather')
        return
    end

    self.currentWeather = self.weatherType

    if self.currentWeather == 0 then
        ChatManager:SendMessage('The weather is clearing')
    end

    if self.currentWeather == 1 then
        ChatManager:SendMessage('A sandstorm is brewing')
    end

    NetEvents:Broadcast(NetMessage.WEATHER_START, self.currentWeather)

end

function Weather:Length()


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

