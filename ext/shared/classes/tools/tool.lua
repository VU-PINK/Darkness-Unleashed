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

			--print('Not a valid category')
		
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

	return  false
end


function Tool:getDaysHours(seconds)

		-- Update hours & days
		days = nil
		hours = nil
		days, hours = Tool:getFloatDaysHours(seconds)
		hours = math.floor(hours)
		
		return days, hours
end 

function Tool:getFloatDaysHours(seconds)

		-- Update hours & days
		days = math.floor(seconds / Settings.dayLengthInSeconds)
		hours = seconds % Settings.dayLengthInSeconds / (Settings.dayLengthInSeconds / 24)
		
		return days, hours

end

function Tool:GetVisualEnvironmentState(...)
	--Get all visual environment states
	local args = { ... }
	local states = VisualEnvironmentManager:GetStates()
	--Loop through all states
	for _, state in pairs(states) do
		--Tool:DebugPrint('Searching through states', 'VE')
		
		for i,priority in pairs(args) do
			if state.priority == priority then
				Tool:DebugPrint('Found VisualEnvironmentState with priority: ' .. priority, 'VE')
				return state
			end
		end
	end
	Tool:DebugPrint('[ERROR] No visual environment state could be found with priority: ' .. priority, 'error')
	return nil
end

function Tool:GetVisualEnvironmentStateArray(...)
	--Get all visual environment states
	local args = { ... }
	local states = VisualEnvironmentManager:GetStates()
	local foundStates = {  }
	--Loop through all states
	for _, state in pairs(states) do
		--Tool:DebugPrint('Searching through states', 'VE')
		
		for i,priority in pairs(args) do
			if state.priority == priority then
				Tool:DebugPrint('Found VisualEnvironmentState with priority: ' .. priority, 'VE')
				table.insert(foundStates, state)
			end
		end
	end
	--Tool:DebugPrint('[ERROR] No visual environment state could be found with priority: ' .. priority, 'error')
	return foundStates
end












return Tool

