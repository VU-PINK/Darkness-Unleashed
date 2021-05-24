local Weather = class('Weather')
local Tool = require '__shared/darknesstools/tool'
local Settings = require '__shared/settings'
local NetMessage = require '__shared/net'


function Weather:__Init()

    Weather:RegisterVars()
    Weather:RegisterEvents()

end 


function Weather:RegisterVars()

    self.randomizedNumber = 0
    self.elapsedTime = 0
    self.last20Seconds = 0
    self.currentWeather = 0

end 


function Weather:RegisterEvents()

    self.playerAuthEvent = Events:Subscribe('Player:Authenticated', self, self.OnPlayerAuth)
    self.serverDeltaTime = Events:Subscribe('ServerDeltaTime', self, self.deltaTime)
    self.playerChatEvent = Events:Subscribe('Player:Chat', self, self.OnPlayerChat)

end 


function Weather:OnPlayerAuth()

    NetEvents:Broadcast(NetMessage.WEATHER_START, self.currentWeather)

end


function Weather:deltaTime(dt)

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

end 


function Weather:Start()

    local weatherType = MathUtils:GetRandomInt(0,1)

    print('Weather Type: '.. weatherType)

    if self.currentWeather == self.weatherType then

        Tool:DebugPrint('Weather Type already active', 'weather')
        return

    end

    self.currentWeather = weatherType

    if self.currentWeather == 0 then

        ChatManager:SendMessage('The weather is clearing')

    end

    if self.currentWeather == 1 then

        ChatManager:SendMessage('A sandstorm is brewing')

    end

    NetEvents:Broadcast(NetMessage.WEATHER_START, self.currentWeather)

end


-- Testing Only (To be removed or swapped later)
function Weather:OnPlayerChat(player, recipientMask, message)

    if message == '!weather sandstorm' then

        Tool:DebugPrint('Received Command', 'weather')
        Weather:Start()

    elseif message == '!weather reset' then

        Tool:DebugPrint('Received Command', 'weather')
        NetEvents:Broadcast(NetMessage.WEATHER_START, 0)

    end

end


return Weather