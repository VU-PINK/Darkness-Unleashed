local ClientTime = class('ClientTime')
local Tool = require '__shared/classes/tools/tool'
local Settings = require '__shared/settings'
local NetMessage = require '__shared/net'

local ClientWeather = class('ClientWeather')


function ClientWeather:__Init(weatherType)

    if weatherType == 0 then 
        ClientWeather:FadeOut()
    end 

    if weatherType == 1 then 
        ClientWeather:FadeIn('Sandstorm')
    end 

end 



function ClientWeather:FadeIn(weatherType)

    Tool:DebugPrint('Calling Fade In Animation', 'weather')
    weatherRunner = true
    weatherFadeIn = true
    weatherFadeOut = false
    Animation:Weather(weatherType)

end 

function ClientWeather:FadeOut()

    Tool:DebugPrint('Calling Fade Out Animation', 'weather')
    weatherRunner = true
    weatherFadeIn = false 
    weatherFadeOut = true 

end 



return ClientWeather