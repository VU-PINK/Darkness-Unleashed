local Settings = require '__shared/settings'

local Tool = class('Tool')


function Tool:__init() 
	--
end


-- Enable/Disable all prints via Settings file
function Tool:DebugPrint(text, category)

    if Settings.DebugPrints['enable'] == true then

		if Settings.DebugPrints[category] == true then

        	print(tostring(text), 'Category: '.. category)

		else 

			print('Not a valid category')
		
		end

	elseif Settings.DebugPrints['enable'] == false then
        
		return

	else 

		print('Debug Print Configuration Error')

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