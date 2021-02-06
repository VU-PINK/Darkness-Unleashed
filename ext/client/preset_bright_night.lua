local bnightPreset = nil

-- Based on Code by Orfeas Zafeiris
-- expanded by IllustrisJack

require '__shared/settings'
require 'functions'
-- require 'preset_bright_night_nightvisiongadget'

local presets = require '__shared/presets'

function Bright_Night(Map)
	if bnightPreset ~= nil then
		return
	end

	local bnightData = VisualEnvironmentEntityData()
	bnightData.enabled = true
	bnightData.visibility = 1.0
	bnightData.priority = 999999

	-- looping through instance types
	for instanceType, values in pairs(presets['Bright_Night']) do
		-- creating new instance
		local newInstance = _G[instanceType]()

		-- patching instance properties
		for key, value in pairs(values) do
			if type(value) == 'string' then
				-- patching texture property
				newInstance[key] = TextureAsset(_G[value])
			else
				-- patching static property
				newInstance[key] = value
			end
		end

		-- adding visual environment components
		bnightData.components:add(newInstance)
		bnightData.runtimeComponentCount = bnightData.runtimeComponentCount + 1
	end

	bnightData.components:add(character)
	bnightData.runtimeComponentCount = bnightData.runtimeComponentCount + 1

	bnightPreset = EntityManager:CreateEntity(bnightData, LinearTransform())

	if bnightPreset ~= nil then
		bnightPreset:Init(Realm.Realm_Client, true)
	end
NVGadgetActivated = nil
end

function removebNight()

	if bnightPreset ~= nil then
		bnightPreset:Destroy()
		bnightPreset = nil
		print('removed VES Bright_Night')
		return true
	end
end

-- Remove the VE state when the mod is unloading.
Events:Subscribe('Extension:Unloading', function()
	removebNight()
end)

-- Night Vision "Gadget"
Events:Subscribe('Player:UpdateInput', function(player, deltaTime)
    if InputManager:WentKeyDown(58) or InputManager:WentKeyDown(8) then

			if NVGadgetActivated == nil then
				NightVisionGadget()
			elseif NVGadgetActivated == true then
				removeNVGadget()
			end

		end
end)
