local Settings = require '__shared/settings'

local Tool = class('Tool')
local debugPrintsEnabled = Settings.DebugPrintsEnabled



function Tool:__init() 

end


-- Enable/Disable all prints via Settings file
function Tool:DebugPrint(text)
    if debugPrintsEnabled == true then
        print(tostring(text))
    else
        --print('Debug messages are disabled!')
    end
end

function Tool:FindInArray(array, value)
	for index,item in pairs(array) do
		if(item == value) then
			print('Found '..item..' in '..index)
			return true
		else 
			print(array)
		end
	end
	return false
end

return Tool