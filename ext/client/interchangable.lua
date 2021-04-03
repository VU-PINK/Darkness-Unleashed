--- Skyboxes
--- Globals to call
-- Death Valley Skybox
MoonNightSkybox = nil
MoonNightAlpha = nil
MoonNightGradient = nil
MoonNightEnvmap = nil
MoonNightStars = nil
-- Bandar Desert Skybox
EveningSkybox = nil
EveningAlpha = nil
EveningGradient = nil
EveningEnvmap = nil

--[[ Load Resources
Events:Subscribe('Level:LoadResources', function()

	-- Mount Superbundles
	ResourceManager:MountSuperBundle('levels/xp3_valley/xp3_valley') -- Death Valley Bright Night Skybox & Star Clouds

	-- Night Vision
	FLIRData = 'FLIRData'

	ResourceManager:RegisterInstanceLoadHandler(Guid("0FF47F8B-423F-4EC3-A8D5-B56E55A01225"), Guid('E79F27A1-7B97-4A63-8ED8-372FE5012A31'), function(loadedInstance)
		nv_colorgrade = loadedInstance
	end)

end)]]

--[[ Inject Bundles
Hooks:Install('ResourceManager:LoadBundles', 100, function(hook, bundles, compartment)
	if #bundles == 1 and bundles[1] == SharedUtils:GetLevelName() then
		--print('Injecting bundles.')

		bundles = {
			'levels/xp3_valley/xp3_valley',  -- Death Valley Sky
			bundles[1],
		}

		hook:Pass(bundles, compartment)


		--- Register
		local partitionID1 = Guid('43BC0BBB-4EC0-4A2A-876A-7EB3660054D3')                         -- Panoramic Texture
		local partitionID2 = Guid('4B2FC2C5-E4E3-4204-AE95-A2A0725F2475')                         -- Panoramic Alpha Texture
		local partitionID3 = Guid('586D1156-30FE-44D7-84C6-B1A93402A9ED')                         -- Sky Gradient
		local partitionID4 = Guid('C69886A8-3674-4D03-A10C-BE712EF0EB34')                         -- Static Envmap Texture
		local partitionIDStars = Guid('E7A1C8F3-ABDD-11E1-A309-B3881526995C')                     -- Star Clouds
		local PanoramicinstanceID1 = Guid('99A3B37E-9A20-4374-8076-938F98BB5FAC')                 -- [1]Instance
		local AlphainstanceID2 = Guid('8908D473-2BA4-4797-9809-A8BB18762F49')                     -- [2]Instance
		local SkyGradientID3 = Guid('1D3B8920-15B3-4DEF-995A-A9E694FCC23C')                       -- [3]Instance
		local sEnvMapID4 = Guid('87B8E087-92C5-4243-BC3C-E26B74BACA7D')                           -- [4]Instance
		local Stars = Guid('5472209E-0DA1-60A7-ACA2-D42ECACD4975')                                -- Star Instance

		ResourceManager:RegisterInstanceLoadHandler(partitionID1, PanoramicinstanceID1, function(panoramicTextureInstance)        -- Register Instance
			MoonNightSkybox = panoramicTextureInstance                                                                                -- Make Global For Easy Access
		end)

		ResourceManager:RegisterInstanceLoadHandler(partitionID2, AlphainstanceID2, function(panoramicAlphaTextureInstance)       -- Register Instance
			MoonNightAlpha = panoramicAlphaTextureInstance                                                                            -- Make Global For Easy Access
		end)

		ResourceManager:RegisterInstanceLoadHandler(partitionID3, SkyGradientID3, function(SkyGradientInstance)                   -- Register Instance
			MoonNightGradient = SkyGradientInstance                                                                                   -- Make Global For Easy Access
		end)

		ResourceManager:RegisterInstanceLoadHandler(partitionID4, sEnvMapID4, function(sEnvmapTextureInstance)                    -- Register Instance
			MoonNightEnvmap = sEnvmapTextureInstance                                                                                  -- Make Global For Easy Access
		end)

		ResourceManager:RegisterInstanceLoadHandler(partitionIDStars, Stars, function(StarsInstance)                              -- Register Instance
			MoonNightStars = StarsInstance                                                                                            -- Make Global For Easy Access
		end)

	end
end)]]

-- Load Resources
Events:Subscribe('Level:LoadResources', function()

	-- Mount Superbundles
	ResourceManager:MountSuperBundle('levels/sp_villa/sp_villa') -- Death Valley Bright Night Skybox & Star Clouds

	-- Night Vision
	FLIRData = 'FLIRData'

	ResourceManager:RegisterInstanceLoadHandler(Guid("0FF47F8B-423F-4EC3-A8D5-B56E55A01225"), Guid('E79F27A1-7B97-4A63-8ED8-372FE5012A31'), function(loadedInstance)
		nv_colorgrade = loadedInstance
	end)

end)

-- Inject Bundles
Hooks:Install('ResourceManager:LoadBundles', 100, function(hook, bundles, compartment)
	if #bundles == 1 and bundles[1] == SharedUtils:GetLevelName() then
		--print('Injecting bundles.')

		bundles = {
			'levels/sp_villa/sp_villa',  -- Coop 2 Sky
			bundles[1],
		}

		hook:Pass(bundles, compartment)


		--- Register
		local partitionID1 = Guid('24864B53-BEBB-11E0-8C93-8332B08A244E')                         -- Panoramic Texture
		local partitionID2 = Guid('BCDE7881-BEBB-11E0-8C93-8332B08A244E')                         -- Panoramic Alpha Texture
		local partitionID3 = Guid('8D9783D3-BEBB-11E0-8C93-8332B08A244E')                         -- Sky Gradient
		--local partitionID4 = Guid('C69886A8-3674-4D03-A10C-BE712EF0EB34')                         -- Static Envmap Texture
		local partitionIDStars = Guid('809759B6-1E6D-11E0-8C7A-BFEC682B49A4')                     -- Star Clouds
		local PanoramicinstanceID1 = Guid('6CFB9BF4-4E3D-166E-F5B7-313AFD43EBB2')                 -- [1]Instance
		local AlphainstanceID2 = Guid('E491E843-3E31-4AC3-5C6E-3ED43DA08C0C')                     -- [2]Instance
		local SkyGradientID3 = Guid('D0E0BA75-0DAC-D4CE-1BCE-60F2D4A92AF7')                       -- [3]Instance
		--local sEnvMapID4 = Guid('87B8E087-92C5-4243-BC3C-E26B74BACA7D')                           -- [4]Instance
		local Stars = Guid('1DFD719E-809C-72A1-4116-2F217141CE7A')                                -- Star Instance

		ResourceManager:RegisterInstanceLoadHandler(partitionID1, PanoramicinstanceID1, function(panoramicTextureInstance)        -- Register Instance
			MoonNightSkybox = panoramicTextureInstance                                                                                -- Make Global For Easy Access
		end)

		ResourceManager:RegisterInstanceLoadHandler(partitionID2, AlphainstanceID2, function(panoramicAlphaTextureInstance)       -- Register Instance
			MoonNightAlpha = panoramicAlphaTextureInstance                                                                            -- Make Global For Easy Access
		end)

		ResourceManager:RegisterInstanceLoadHandler(partitionID3, SkyGradientID3, function(SkyGradientInstance)                   -- Register Instance
			MoonNightGradient = SkyGradientInstance                                                                                   -- Make Global For Easy Access
		end)

		--ResourceManager:RegisterInstanceLoadHandler(partitionID4, sEnvMapID4, function(sEnvmapTextureInstance)                    -- Register Instance
		--	MoonNightEnvmap = sEnvmapTextureInstance                                                                                  -- Make Global For Easy Access
		--end)

		ResourceManager:RegisterInstanceLoadHandler(partitionIDStars, Stars, function(StarsInstance)                              -- Register Instance
			MoonNightStars = StarsInstance                                                                                            -- Make Global For Easy Access
		end)

	end
end)