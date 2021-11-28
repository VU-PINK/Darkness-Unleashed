class('Lights')

-- Hooks:Install('EntityFactory:Create', 100, function(hookCtx, entityData, transform)
-- 	local createdEntity = hookCtx:Call()
	
-- 	if createdEntity == nil then
-- 	  return
-- 	elseif createdEntity.data.partition == nil then
-- 		return
-- 	end

-- 	if string.find(createdEntity.data.partition.name, "props/streetprops/streetlight_01/streetlight_01")  then
-- 	print("FOUND STREETLIGHT_01 AT: " .. createdEntity.data.partition.name)
-- 	end
-- end)

function Lights:OnEntityRegister(p_LevelData)
	local s_Instance = ResourceManager:FindInstanceByGuid(Guid("2BCB693F-397A-11DE-85CC-E25C96C69024"), Guid("1A2AEDAC-44C6-4299-9674-4F97D8307A8A"))
	if s_Instance == nil then
		return
	end

	s_Instance = SpotLightEntityData(s_Instance)
	s_Instance:MakeWritable()
	s_Instance.visible = true
	s_Instance.castShadowsEnable = true
	print("Added Spotlight to Streetlight_01")
end
-- Singleton
if g_Lights == nil then
	g_Lights = Lights()
end

return g_Lights