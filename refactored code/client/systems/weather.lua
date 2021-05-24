local Tool = require '__shared/classes/tools/tool'
local Settings = require '__shared/settings'
local NetMessage = require '__shared/net'
local Animation = require 'systems/weather'

local ClientWeather = class('ClientWeather')


function ClientWeather:__Init(weatherType)

    ClientWeather:RegisterVars()

end


function ClientWeather:RegisterVars()

    self.currentWeather = nil 
    
end 


function ClientWeather:Call(weatherType)

    if self.currentWeather == weatherType then 
        return 
    end 

    self.currentWeather = weatherType

    if weatherType == 0 then

        ClientWeather:FadeOut()

    end

    if weatherType == 1 then

        ClientWeather:FadeIn('Sandstorm')

    end

end 


function ClientWeather:FadeIn(weatherType)

    Tool:DebugPrint('Calling Fade In Animation', 'weather')
    Animation:FadeIn('weather', weatherType)

end


function ClientWeather:FadeOut()

    Tool:DebugPrint('Calling Fade Out Animation', 'weather')
    Animation:FadeOut('weather')

end


return ClientWeather