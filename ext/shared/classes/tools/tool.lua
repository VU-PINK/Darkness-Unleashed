local Settings = require '__shared/settings'

local Tool = class('Tool')
local debugPrintCategory = Settings.Categories

function Tool:__init() 

end


-- Enable/Disable all prints via Settings file
function Tool:DebugPrint(text, category)

    if debugPrintCategory.enable == true then

        print(tostring(text), 'Category: '.. category)

    elseif debugPrintCategory.enable == true and debugPrintCategory.adding == true and debugPrintCategory.all =~ true and debugPrintCategory.adding == category then 

		print(tostring(text), 'Category: '.. category)

    elseif debugPrintCategory.enable == true and debugPrintCategory.removing == true and debugPrintCategory.removing == category and debugPrintCategory.all =~ true then 

		print(tostring(text), 'Category: '.. category)

    elseif debugPrintCategory.enable == true and debugPrintCategory.altering == true and debugPrintCategory.altering == category and debugPrintCategory.all =~ true then 

		print(tostring(text), 'Category: '.. category)

	elseif debugPrintCategory.enable == false 
        
		return

	else 

		print('Debug Print Configuration Error | Line: ')

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