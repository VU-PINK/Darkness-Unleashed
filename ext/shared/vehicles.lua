local VehicleSettings = {}
local SpotlightMultiplicator = 2
-- Airborne Vehicles
VehicleSettings.Airborne = {}
-- AH1Z (VIPER)
-- https://github.com/EmulatorNexus/Venice-EBX/blob/ead5472e20bbcfed9a4dbd677bc31547f2607a3d/Vehicles/AH1Z/AH1Z.txt
VehicleSettings.Airborne.AH1Z = {}
VehicleSettings.Airborne.AH1Z.name = 'AH1Z'
VehicleSettings.Airborne.AH1Z.partitionGUID = '643135EA-6CA7-11DF-B6FA-F715AA601362'
VehicleSettings.Airborne.AH1Z.chassisGUID = 'D959DF11-EA30-D238-A0D5-5687735963E4'
VehicleSettings.Airborne.AH1Z.weaponGUID = 'DF0AEBA7-A3D6-4CCA-9572-E6FBAB9569C5'
VehicleSettings.Airborne.AH1Z.vehicleDataGUID = '81D83886-888B-3962-61B1-4A1FC1AD49DB'

VehicleSettings.Airborne.AH1Z.Components = {}

VehicleSettings.Airborne.AH1Z.Components.Spotlight_1 = {}
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.enabled = true
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.description = 'Gunner Searchlight'
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.weaponmounted = true
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.shape = 1
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.frustumFov = 35.6789
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.frustumAspect = 1.0
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.intensity = 5*SpotlightMultiplicator
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.radius = 200
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.color = Vec3(1, 0.9, 0.8)
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.transform = {}
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.transform.trans = Vec3(0, 0, 0)

VehicleSettings.Airborne.AH1Z.Components.Pointlight_1 = {}
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.enabled = true
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.description = 'Gunner Searchlight Pointlight'
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.weaponmounted = true
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.radius = 2
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.width = 1
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.intensity = 10
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.color = Vec3(1, 0.9, 0.9)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.visible = true
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.enlightenEnable = false
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.transform = {}
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.transform.trans = Vec3(0, 0.35, 0)

VehicleSettings.Airborne.AH1Z.Components.Pointlight_2 = {}
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.enabled = true
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.description = 'Top Red Blinker' 
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.weaponmounted = false
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.radius = 2
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.width = 2
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.intensity = 1
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.color = Vec3(1, 0, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.intensity = 5
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.visible = true
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.enlightenEnable = false
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.transform = {}
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.transform.trans = Vec3(0, 1, -2.25)

VehicleSettings.Airborne.AH1Z.Components.Pointlight_3 = {}
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.enabled = true
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.description = 'Cockpit Green Light'
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.weaponmounted = false
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.radius = 3
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.width = 2
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.color = Vec3(0, 1, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.intensity = 5
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.visible = true
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.enlightenEnable = false
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.transform = {}
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.transform.trans = Vec3(0, 0.25, 2.5)

VehicleSettings.Airborne.AH1Z.Components.Pointlight_4 = {}
VehicleSettings.Airborne.AH1Z.Components.Pointlight_4.enabled = true
VehicleSettings.Airborne.AH1Z.Components.Pointlight_4.description = 'Bottom Red Blinker'
VehicleSettings.Airborne.AH1Z.Components.Pointlight_4.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.AH1Z.Components.Pointlight_4.weaponmounted = false
VehicleSettings.Airborne.AH1Z.Components.Pointlight_4.radius = 100
VehicleSettings.Airborne.AH1Z.Components.Pointlight_4.width = 1
VehicleSettings.Airborne.AH1Z.Components.Pointlight_4.color = Vec3(1, 0, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_4.intensity = 0.01
VehicleSettings.Airborne.AH1Z.Components.Pointlight_4.visible = true
VehicleSettings.Airborne.AH1Z.Components.Pointlight_4.enlightenEnable = true
VehicleSettings.Airborne.AH1Z.Components.Pointlight_4.transform = {}
VehicleSettings.Airborne.AH1Z.Components.Pointlight_4.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_4.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_4.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_4.transform.trans = Vec3(0, -1.45, -2.0)


--MI28
-- https://github.com/EmulatorNexus/Venice-EBX/blob/ead5472e20bbcfed9a4dbd677bc31547f2607a3d/Vehicles/Mi28/Mi28.txt
VehicleSettings.Airborne.Mi28 = {}
VehicleSettings.Airborne.Mi28.name = 'Mi28'
VehicleSettings.Airborne.Mi28.partitionGUID = '89BE53B6-2FF4-11DE-8C23-DAB1D69416DE'
VehicleSettings.Airborne.Mi28.chassisGUID = '89BEA1F6-2FF4-11DE-8C23-DAB1D69416DE'
VehicleSettings.Airborne.Mi28.weaponGUID = '89BEA24B-2FF4-11DE-8C23-DAB1D69416DE'
VehicleSettings.Airborne.Mi28.vehicleDataGUID = '89BEA1D7-2FF4-11DE-8C23-DAB1D69416DE'

VehicleSettings.Airborne.Mi28.Components = {}

VehicleSettings.Airborne.Mi28.Components.Spotlight_1 = {}
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.enabled = true
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.description = 'Gunner Searchlight'
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.weaponmounted = true
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.shape = 1
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.frustumFov = 35.6789
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.frustumAspect = 1.0
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.intensity = 5*SpotlightMultiplicator
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.radius = 200
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.color = Vec3(1, 0.9, 0.9)
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.transform = {}
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.transform.trans = Vec3(0, 0, 0)

VehicleSettings.Airborne.Mi28.Components.Pointlight_1 = {}
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.enabled = true
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.description = 'Gunner Searchlight Pointlight'
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.weaponmounted = true
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.radius = 2
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.width = 1
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.intensity = 10
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.color = Vec3(1, 0.9, 0.9)
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.visible = true
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.enlightenEnable = false
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.transform = {}
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.transform.trans = Vec3(0, 0.35, 0)

VehicleSettings.Airborne.Mi28.Components.Pointlight_2 = {}
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.enabled = true
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.description = 'Top Red Blinker' 
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.weaponmounted = false
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.radius = 6
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.width = 6
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.intensity = 1
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.color = Vec3(1, 0, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.intensity = 6
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.visible = true
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.enlightenEnable = false
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.transform = {}
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.transform.trans = Vec3(0, 1.2, -2.25)

VehicleSettings.Airborne.Mi28.Components.Pointlight_3 = {}
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.enabled = true
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.description = 'Cockpit Green Light Lower'
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.weaponmounted = false
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.radius = 4
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.width = 3
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.color = Vec3(0, 1, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.intensity = 1
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.visible = true
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.enlightenEnable = false
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.transform = {}
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.transform.trans = Vec3(0, 0.20, 2.85)

VehicleSettings.Airborne.Mi28.Components.Pointlight_4 = {}
VehicleSettings.Airborne.Mi28.Components.Pointlight_4.enabled = true
VehicleSettings.Airborne.Mi28.Components.Pointlight_4.description = 'Cockpit Green Light 2'
VehicleSettings.Airborne.Mi28.Components.Pointlight_4.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.Mi28.Components.Pointlight_4.weaponmounted = false
VehicleSettings.Airborne.Mi28.Components.Pointlight_4.radius = 4
VehicleSettings.Airborne.Mi28.Components.Pointlight_4.width = 3
VehicleSettings.Airborne.Mi28.Components.Pointlight_4.color = Vec3(0, 1, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_4.intensity = 1
VehicleSettings.Airborne.Mi28.Components.Pointlight_4.visible = true
VehicleSettings.Airborne.Mi28.Components.Pointlight_4.enlightenEnable = false
VehicleSettings.Airborne.Mi28.Components.Pointlight_4.transform = {}
VehicleSettings.Airborne.Mi28.Components.Pointlight_4.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_4.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_4.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.Mi28.Components.Pointlight_4.transform.trans = Vec3(0, 0.55, 1.55)

VehicleSettings.Airborne.Mi28.Components.Pointlight_5 = {}
VehicleSettings.Airborne.Mi28.Components.Pointlight_5.enabled = true
VehicleSettings.Airborne.Mi28.Components.Pointlight_5.description = 'Bottom Red Blinker'
VehicleSettings.Airborne.Mi28.Components.Pointlight_5.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.Mi28.Components.Pointlight_5.weaponmounted = false
VehicleSettings.Airborne.Mi28.Components.Pointlight_5.radius = 100
VehicleSettings.Airborne.Mi28.Components.Pointlight_5.width = 1
VehicleSettings.Airborne.Mi28.Components.Pointlight_5.color = Vec3(1, 0, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_5.intensity = 0.01
VehicleSettings.Airborne.Mi28.Components.Pointlight_5.visible = true
VehicleSettings.Airborne.Mi28.Components.Pointlight_5.enlightenEnable = false
VehicleSettings.Airborne.Mi28.Components.Pointlight_5.transform = {}
VehicleSettings.Airborne.Mi28.Components.Pointlight_5.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_5.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_5.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.Mi28.Components.Pointlight_5.transform.trans = Vec3(0, -1.90, -1.70)

-- Venom 
-- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/Venom/Venom.txt
VehicleSettings.Airborne.Venom = {}
VehicleSettings.Airborne.Venom.name = 'Venom'
VehicleSettings.Airborne.Venom.partitionGUID = '97945D87-011D-11E0-B97C-FC495C335A52'
VehicleSettings.Airborne.Venom.chassisGUID = '6C62B15D-848D-BDF3-BD66-218AD0554C14'
VehicleSettings.Airborne.Venom.weaponGUID = '39663C49-6C7F-429B-A00F-4885D0BBEDB8'
VehicleSettings.Airborne.Venom.weaponGUID2 = 'C0F6F51D-0F12-41DE-8003-6252C78BE9E2'
VehicleSettings.Airborne.Venom.vehicleDataGUID = '88F274DD-7C84-1EE5-6EE7-DD1D980148B3'

VehicleSettings.Airborne.Venom.Components = {}

VehicleSettings.Airborne.Venom.Components.Spotlight_1 = {}
VehicleSettings.Airborne.Venom.Components.Spotlight_1.enabled = true
VehicleSettings.Airborne.Venom.Components.Spotlight_1.description = 'Gunner 1 Searchlight'
VehicleSettings.Airborne.Venom.Components.Spotlight_1.weapon2 = false
VehicleSettings.Airborne.Venom.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.Venom.Components.Spotlight_1.weaponmounted = true
VehicleSettings.Airborne.Venom.Components.Spotlight_1.shape = 1
VehicleSettings.Airborne.Venom.Components.Spotlight_1.frustumFov = 35.6789
VehicleSettings.Airborne.Venom.Components.Spotlight_1.frustumAspect = 1.0
VehicleSettings.Airborne.Venom.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Airborne.Venom.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Airborne.Venom.Components.Spotlight_1.intensity = 5*SpotlightMultiplicator
VehicleSettings.Airborne.Venom.Components.Spotlight_1.radius = 200
VehicleSettings.Airborne.Venom.Components.Spotlight_1.color = Vec3(1, 0.9, 0.8)
VehicleSettings.Airborne.Venom.Components.Spotlight_1.transform = {}
VehicleSettings.Airborne.Venom.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.Venom.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.Venom.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.Venom.Components.Spotlight_1.transform.trans = Vec3(0, -0.025, 0.0)

VehicleSettings.Airborne.Venom.Components.Spotlight_2 = {}
VehicleSettings.Airborne.Venom.Components.Spotlight_2.enabled = true
VehicleSettings.Airborne.Venom.Components.Spotlight_2.description = 'Gunner 2 Searchlight'
VehicleSettings.Airborne.Venom.Components.Spotlight_2.weapon2 = true
VehicleSettings.Airborne.Venom.Components.Spotlight_2.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.Venom.Components.Spotlight_2.weaponmounted = true
VehicleSettings.Airborne.Venom.Components.Spotlight_2.shape = 1
VehicleSettings.Airborne.Venom.Components.Spotlight_2.frustumFov = 35.6789
VehicleSettings.Airborne.Venom.Components.Spotlight_2.frustumAspect = 1.0
VehicleSettings.Airborne.Venom.Components.Spotlight_2.castShadowsMinLevel = 0
VehicleSettings.Airborne.Venom.Components.Spotlight_2.castShadowsEnable = true
VehicleSettings.Airborne.Venom.Components.Spotlight_2.intensity = 2.5*SpotlightMultiplicator
VehicleSettings.Airborne.Venom.Components.Spotlight_2.radius = 200
VehicleSettings.Airborne.Venom.Components.Spotlight_2.color = Vec3(1, 0.9, 0.8)
VehicleSettings.Airborne.Venom.Components.Spotlight_2.transform = {}
VehicleSettings.Airborne.Venom.Components.Spotlight_2.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.Venom.Components.Spotlight_2.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.Venom.Components.Spotlight_2.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.Venom.Components.Spotlight_2.transform.trans = Vec3(0, -0.025, 0.0)

VehicleSettings.Airborne.Venom.Components.Pointlight_1 = {}
VehicleSettings.Airborne.Venom.Components.Pointlight_1.enabled = true
VehicleSettings.Airborne.Venom.Components.Pointlight_1.description = 'Top Red Blinker' 
VehicleSettings.Airborne.Venom.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.Venom.Components.Pointlight_1.weaponmounted = false
VehicleSettings.Airborne.Venom.Components.Pointlight_1.radius = 5
VehicleSettings.Airborne.Venom.Components.Pointlight_1.width = 2
VehicleSettings.Airborne.Venom.Components.Pointlight_1.color = Vec3(1, 0, 0)
VehicleSettings.Airborne.Venom.Components.Pointlight_1.intensity = 5
VehicleSettings.Airborne.Venom.Components.Pointlight_1.visible = true
VehicleSettings.Airborne.Venom.Components.Pointlight_1.enlightenEnable = false
VehicleSettings.Airborne.Venom.Components.Pointlight_1.transform = {}
VehicleSettings.Airborne.Venom.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.Venom.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.Venom.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.Venom.Components.Pointlight_1.transform.trans = Vec3(0, 1, -2.25)

VehicleSettings.Airborne.Venom.Components.Pointlight_2 = {}
VehicleSettings.Airborne.Venom.Components.Pointlight_2.enabled = true
VehicleSettings.Airborne.Venom.Components.Pointlight_2.description = 'Cockpit Green Light'
VehicleSettings.Airborne.Venom.Components.Pointlight_2.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.Venom.Components.Pointlight_2.weaponmounted = false
VehicleSettings.Airborne.Venom.Components.Pointlight_2.radius = 5.5
VehicleSettings.Airborne.Venom.Components.Pointlight_2.width = 1
VehicleSettings.Airborne.Venom.Components.Pointlight_2.color = Vec3(0, 1, 0)
VehicleSettings.Airborne.Venom.Components.Pointlight_2.intensity = 1
VehicleSettings.Airborne.Venom.Components.Pointlight_2.visible = true
VehicleSettings.Airborne.Venom.Components.Pointlight_2.enlightenEnable = true
VehicleSettings.Airborne.Venom.Components.Pointlight_2.transform = {}
VehicleSettings.Airborne.Venom.Components.Pointlight_2.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.Venom.Components.Pointlight_2.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.Venom.Components.Pointlight_2.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.Venom.Components.Pointlight_2.transform.trans = Vec3(0, -0.6, 1.07)

VehicleSettings.Airborne.Venom.Components.Pointlight_3 = {}
VehicleSettings.Airborne.Venom.Components.Pointlight_3.enabled = true
VehicleSettings.Airborne.Venom.Components.Pointlight_3.description = 'Bottom Red Blinker'
VehicleSettings.Airborne.Venom.Components.Pointlight_3.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.Venom.Components.Pointlight_3.weaponmounted = false
VehicleSettings.Airborne.Venom.Components.Pointlight_3.radius = 100
VehicleSettings.Airborne.Venom.Components.Pointlight_3.width = 1
VehicleSettings.Airborne.Venom.Components.Pointlight_3.color = Vec3(1, 0, 0)
VehicleSettings.Airborne.Venom.Components.Pointlight_3.intensity = 0.01
VehicleSettings.Airborne.Venom.Components.Pointlight_3.visible = true
VehicleSettings.Airborne.Venom.Components.Pointlight_3.enlightenEnable = true
VehicleSettings.Airborne.Venom.Components.Pointlight_3.transform = {}
VehicleSettings.Airborne.Venom.Components.Pointlight_3.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.Venom.Components.Pointlight_3.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.Venom.Components.Pointlight_3.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.Venom.Components.Pointlight_3.transform.trans = Vec3(0, -1.45, -2.0)

-- SU-35BM-E RUS 
-- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/SU-35BM-E/SU-35BM-E.txt
VehicleSettings.Airborne.SU35BM = {}
VehicleSettings.Airborne.SU35BM.name = 'SU35BM'
VehicleSettings.Airborne.SU35BM.partitionGUID = '76806015-4BE2-11E0-B502-9B84AFF94A89'
VehicleSettings.Airborne.SU35BM.chassisGUID = 'AE6C201B-88CD-EAC2-D25B-8DA23A16B4A0'
VehicleSettings.Airborne.SU35BM.vehicleDataGUID = 'F2CD2BE1-4B72-59F0-A715-AA8E73F71751'

VehicleSettings.Airborne.SU35BM.Components = {}

VehicleSettings.Airborne.SU35BM.Components.Spotlight_1 = {}
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.enabled = true
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.description = 'Front Spotlight'
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.weapon2 = false
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.weaponmounted = false
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.shape = 1
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.frustumFov = 40
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.frustumAspect = 1.0
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.intensity = 35*SpotlightMultiplicator
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.radius = 120
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.color = Vec3(1, 0.9, 0.8)
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.transform = {}
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.SU35BM.Components.Spotlight_1.transform.trans = Vec3(0, 0.5, 10)

VehicleSettings.Airborne.SU35BM.Components.Pointlight_1 = {}
VehicleSettings.Airborne.SU35BM.Components.Pointlight_1.enabled = true
VehicleSettings.Airborne.SU35BM.Components.Pointlight_1.description = 'Top Red Blinker' 
VehicleSettings.Airborne.SU35BM.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.SU35BM.Components.Pointlight_1.weaponmounted = false
VehicleSettings.Airborne.SU35BM.Components.Pointlight_1.radius = 100
VehicleSettings.Airborne.SU35BM.Components.Pointlight_1.width = 1
VehicleSettings.Airborne.SU35BM.Components.Pointlight_1.intensity = 1.25
VehicleSettings.Airborne.SU35BM.Components.Pointlight_1.color = Vec3(1, 0, 0)
VehicleSettings.Airborne.SU35BM.Components.Pointlight_1.intensity = 0.01
VehicleSettings.Airborne.SU35BM.Components.Pointlight_1.visible = true
VehicleSettings.Airborne.SU35BM.Components.Pointlight_1.enlightenEnable = false
VehicleSettings.Airborne.SU35BM.Components.Pointlight_1.transform = {}
VehicleSettings.Airborne.SU35BM.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.SU35BM.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.SU35BM.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.SU35BM.Components.Pointlight_1.transform.trans = Vec3(0, 1.75, -2.25)

VehicleSettings.Airborne.SU35BM.Components.Pointlight_2 = {}
VehicleSettings.Airborne.SU35BM.Components.Pointlight_2.enabled = true
VehicleSettings.Airborne.SU35BM.Components.Pointlight_2.description = 'Cockpit Green Light'
VehicleSettings.Airborne.SU35BM.Components.Pointlight_2.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.SU35BM.Components.Pointlight_2.weaponmounted = false
VehicleSettings.Airborne.SU35BM.Components.Pointlight_2.radius = 5.5
VehicleSettings.Airborne.SU35BM.Components.Pointlight_2.width = 1
VehicleSettings.Airborne.SU35BM.Components.Pointlight_2.color = Vec3(0, 1, 0)
VehicleSettings.Airborne.SU35BM.Components.Pointlight_2.intensity = 4
VehicleSettings.Airborne.SU35BM.Components.Pointlight_2.visible = true
VehicleSettings.Airborne.SU35BM.Components.Pointlight_2.enlightenEnable = true
VehicleSettings.Airborne.SU35BM.Components.Pointlight_2.transform = {}
VehicleSettings.Airborne.SU35BM.Components.Pointlight_2.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.SU35BM.Components.Pointlight_2.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.SU35BM.Components.Pointlight_2.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.SU35BM.Components.Pointlight_2.transform.trans = Vec3(0, 2, 8)

VehicleSettings.Airborne.SU35BM.Components.Pointlight_3 = {}
VehicleSettings.Airborne.SU35BM.Components.Pointlight_3.enabled = true
VehicleSettings.Airborne.SU35BM.Components.Pointlight_3.description = 'Bottom Red Blinker'
VehicleSettings.Airborne.SU35BM.Components.Pointlight_3.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.SU35BM.Components.Pointlight_3.weaponmounted = false
VehicleSettings.Airborne.SU35BM.Components.Pointlight_3.radius = 100
VehicleSettings.Airborne.SU35BM.Components.Pointlight_3.width = 1
VehicleSettings.Airborne.SU35BM.Components.Pointlight_3.color = Vec3(1, 0, 0)
VehicleSettings.Airborne.SU35BM.Components.Pointlight_3.intensity = 0.01
VehicleSettings.Airborne.SU35BM.Components.Pointlight_3.visible = true
VehicleSettings.Airborne.SU35BM.Components.Pointlight_3.enlightenEnable = true
VehicleSettings.Airborne.SU35BM.Components.Pointlight_3.transform = {}
VehicleSettings.Airborne.SU35BM.Components.Pointlight_3.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.SU35BM.Components.Pointlight_3.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.SU35BM.Components.Pointlight_3.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.SU35BM.Components.Pointlight_3.transform.trans = Vec3(0, -1, -2.0)

-- F35B US
-- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/XPack01/F35/F35B.txt
VehicleSettings.Airborne.F35 = {}
VehicleSettings.Airborne.F35.name = 'F35'
VehicleSettings.Airborne.F35.partitionGUID = 'EB06DA1E-4B21-11E0-AC22-92ED36F00269'
VehicleSettings.Airborne.F35.chassisGUID = '73EB0373-2F17-6305-05BF-952BED53A0E7'
VehicleSettings.Airborne.F35.vehicleDataGUID = '922E0FF3-5BEA-78C1-4FD1-EDAE142D2289'

VehicleSettings.Airborne.F35.Components = {}

VehicleSettings.Airborne.F35.Components.Spotlight_1 = {}
VehicleSettings.Airborne.F35.Components.Spotlight_1.enabled = true
VehicleSettings.Airborne.F35.Components.Spotlight_1.description = 'Front Spotlight'
VehicleSettings.Airborne.F35.Components.Spotlight_1.weapon2 = false
VehicleSettings.Airborne.F35.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.F35.Components.Spotlight_1.weaponmounted = false
VehicleSettings.Airborne.F35.Components.Spotlight_1.shape = 1
VehicleSettings.Airborne.F35.Components.Spotlight_1.frustumFov = 40
VehicleSettings.Airborne.F35.Components.Spotlight_1.frustumAspect = 1.0
VehicleSettings.Airborne.F35.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Airborne.F35.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Airborne.F35.Components.Spotlight_1.intensity = 35*SpotlightMultiplicator
VehicleSettings.Airborne.F35.Components.Spotlight_1.radius = 120
VehicleSettings.Airborne.F35.Components.Spotlight_1.color = Vec3(1, 0.9, 0.8)
VehicleSettings.Airborne.F35.Components.Spotlight_1.transform = {}
VehicleSettings.Airborne.F35.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.F35.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.F35.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.F35.Components.Spotlight_1.transform.trans = Vec3(0, 0.1, 9.425)

VehicleSettings.Airborne.F35.Components.Pointlight_1 = {}
VehicleSettings.Airborne.F35.Components.Pointlight_1.enabled = true
VehicleSettings.Airborne.F35.Components.Pointlight_1.description = 'Top Red Blinker' 
VehicleSettings.Airborne.F35.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.F35.Components.Pointlight_1.weaponmounted = false
VehicleSettings.Airborne.F35.Components.Pointlight_1.radius = 6.25
VehicleSettings.Airborne.F35.Components.Pointlight_1.width = 1
VehicleSettings.Airborne.F35.Components.Pointlight_1.intensity = 5
VehicleSettings.Airborne.F35.Components.Pointlight_1.color = Vec3(1, 0, 0)
VehicleSettings.Airborne.F35.Components.Pointlight_1.visible = true
VehicleSettings.Airborne.F35.Components.Pointlight_1.enlightenEnable = false
VehicleSettings.Airborne.F35.Components.Pointlight_1.transform = {}
VehicleSettings.Airborne.F35.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.F35.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.F35.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.F35.Components.Pointlight_1.transform.trans = Vec3(0, 1.5, -2.25)

VehicleSettings.Airborne.F35.Components.Pointlight_2 = {}
VehicleSettings.Airborne.F35.Components.Pointlight_2.enabled = true
VehicleSettings.Airborne.F35.Components.Pointlight_2.description = 'Cockpit Green Light'
VehicleSettings.Airborne.F35.Components.Pointlight_2.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.F35.Components.Pointlight_2.weaponmounted = false
VehicleSettings.Airborne.F35.Components.Pointlight_2.radius = 4.5
VehicleSettings.Airborne.F35.Components.Pointlight_2.width = 1
VehicleSettings.Airborne.F35.Components.Pointlight_2.color = Vec3(0, 1, 0)
VehicleSettings.Airborne.F35.Components.Pointlight_2.intensity = 4.25
VehicleSettings.Airborne.F35.Components.Pointlight_2.visible = true
VehicleSettings.Airborne.F35.Components.Pointlight_2.enlightenEnable = true
VehicleSettings.Airborne.F35.Components.Pointlight_2.transform = {}
VehicleSettings.Airborne.F35.Components.Pointlight_2.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.F35.Components.Pointlight_2.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.F35.Components.Pointlight_2.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.F35.Components.Pointlight_2.transform.trans = Vec3(0, 1.8, 6.5)

VehicleSettings.Airborne.F35.Components.Pointlight_3 = {}
VehicleSettings.Airborne.F35.Components.Pointlight_3.enabled = true
VehicleSettings.Airborne.F35.Components.Pointlight_3.description = 'Bottom Red Blinker'
VehicleSettings.Airborne.F35.Components.Pointlight_3.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.F35.Components.Pointlight_3.weaponmounted = false
VehicleSettings.Airborne.F35.Components.Pointlight_3.radius = 6.75
VehicleSettings.Airborne.F35.Components.Pointlight_3.width = 1
VehicleSettings.Airborne.F35.Components.Pointlight_3.color = Vec3(1, 0, 0)
VehicleSettings.Airborne.F35.Components.Pointlight_3.intensity = 5
VehicleSettings.Airborne.F35.Components.Pointlight_3.visible = true
VehicleSettings.Airborne.F35.Components.Pointlight_3.enlightenEnable = true
VehicleSettings.Airborne.F35.Components.Pointlight_3.transform = {}
VehicleSettings.Airborne.F35.Components.Pointlight_3.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.F35.Components.Pointlight_3.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.F35.Components.Pointlight_3.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.F35.Components.Pointlight_3.transform.trans = Vec3(0, -1, -2.0)

-- Humvee Armored
-- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/HumveeArmored/HumveeArmored.txt

VehicleSettings.Ground = {}

VehicleSettings.Ground.HMMVWV = {}
VehicleSettings.Ground.HMMVWV.name = 'HMMVWV Standard'
VehicleSettings.Ground.HMMVWV.partitionGUID = '611F48A3-0919-11E0-985D-C512734E48AF'
VehicleSettings.Ground.HMMVWV.chassisGUID = 'DA89EB6C-A824-A813-A6C5-E2DEF9D4F4FF'
VehicleSettings.Ground.HMMVWV.vehicleDataGUID = '34ADD228-7E03-C4A4-665F-E0F0955098EE'

VehicleSettings.Ground.HMMVWV.Components = {}

VehicleSettings.Ground.HMMVWV.Components.Spotlight_1 = {}
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.enabled = true
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.description = 'Left Main Light'
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.weaponmounted = false
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.shape = 1
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.frustumFov = 100
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.frustumAspect = 1.25
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.intensity = 5*SpotlightMultiplicator
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.radius = 50
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.color = Vec3(1, 0.9, 0.8)
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.transform = {}
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.transform.trans = Vec3(-0.525, 0.65, 3)
VehicleSettings.Ground.HMMVWV.Components.Spotlight_1.transform.mirrored = true

VehicleSettings.Ground.HMMVWV.Components.Spotlight_2 = {}
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.enabled = true
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.description = 'Left Main Light Far'
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.weaponmounted = false
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.shape = 1
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.frustumFov = 55
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.frustumAspect = 1
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.castShadowsMinLevel = 0
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.castShadowsEnable = true
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.intensity = 1.5*SpotlightMultiplicator
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.radius = 70
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.color = Vec3(1, 0.9, 0.8)
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.transform = {}
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.transform.trans = Vec3(-0.525, 0.65, 3)
VehicleSettings.Ground.HMMVWV.Components.Spotlight_2.transform.mirrored = true

VehicleSettings.Ground.HMMVWV.Components.Pointlight_1 = {}
VehicleSettings.Ground.HMMVWV.Components.Pointlight_1.enabled = true
VehicleSettings.Ground.HMMVWV.Components.Pointlight_1.description = 'Main Light Pointlight'
VehicleSettings.Ground.HMMVWV.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.HMMVWV.Components.Pointlight_1.weaponmounted = false
VehicleSettings.Ground.HMMVWV.Components.Pointlight_1.radius = 2
VehicleSettings.Ground.HMMVWV.Components.Pointlight_1.width = 1
VehicleSettings.Ground.HMMVWV.Components.Pointlight_1.intensity = 10*SpotlightMultiplicator
VehicleSettings.Ground.HMMVWV.Components.Pointlight_1.color = Vec3(1, 0.9, 0.9)
VehicleSettings.Ground.HMMVWV.Components.Pointlight_1.visible = true
VehicleSettings.Ground.HMMVWV.Components.Pointlight_1.enlightenEnable = false
VehicleSettings.Ground.HMMVWV.Components.Pointlight_1.transform = {}
VehicleSettings.Ground.HMMVWV.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.HMMVWV.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.HMMVWV.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.HMMVWV.Components.Pointlight_1.transform.trans = Vec3(0, 1, 5)


-- HMMVMV Asrad 
-- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/XP5/Humvee_ASRAD/Humvee_ASRAD.txt

VehicleSettings.Ground.HMMVWV_A = {}
VehicleSettings.Ground.HMMVWV_A.name = 'HMMVWV ASRAD'
VehicleSettings.Ground.HMMVWV_A.partitionGUID = 'F7C250D2-ECEB-481F-A130-D91FE8B693E0'
VehicleSettings.Ground.HMMVWV_A.chassisGUID = '5D10A701-196F-4DA9-8D83-610ABF56124B'
VehicleSettings.Ground.HMMVWV_A.vehicleDataGUID = '1DE37416-42D8-461E-B727-2159DB141204'

VehicleSettings.Ground.HMMVWV_A.Components = {}

VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1 = {}
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.enabled = true
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.description = 'Left Main Light'
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.weaponmounted = false
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.shape = 1
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.frustumFov = 100
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.frustumAspect = 1.25
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.intensity = 5*SpotlightMultiplicator
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.radius = 50
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.color = Vec3(1, 0.9, 0.8)
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.transform = {}
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.transform.trans = Vec3(-0.525, 0.65, 3)
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_1.transform.mirrored = true

VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2 = {}
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.enabled = true
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.description = 'Left Main Light Far'
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.weaponmounted = false
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.shape = 1
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.frustumFov = 55
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.frustumAspect = 1
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.castShadowsMinLevel = 0
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.castShadowsEnable = true
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.intensity = 5*SpotlightMultiplicator
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.radius = 70
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.color = Vec3(1, 0.9, 0.8)
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.transform = {}
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.transform.trans = Vec3(-0.525, 0.65, 3)
VehicleSettings.Ground.HMMVWV_A.Components.Spotlight_2.transform.mirrored = true

VehicleSettings.Ground.HMMVWV_A.Components.Pointlight_1 = {}
VehicleSettings.Ground.HMMVWV_A.Components.Pointlight_1.enabled = true
VehicleSettings.Ground.HMMVWV_A.Components.Pointlight_1.description = 'Main Light Pointlight'
VehicleSettings.Ground.HMMVWV_A.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.HMMVWV_A.Components.Pointlight_1.weaponmounted = false
VehicleSettings.Ground.HMMVWV_A.Components.Pointlight_1.radius = 2
VehicleSettings.Ground.HMMVWV_A.Components.Pointlight_1.width = 1
VehicleSettings.Ground.HMMVWV_A.Components.Pointlight_1.intensity = 10
VehicleSettings.Ground.HMMVWV_A.Components.Pointlight_1.color = Vec3(1, 0.9, 0.9)
VehicleSettings.Ground.HMMVWV_A.Components.Pointlight_1.visible = true
VehicleSettings.Ground.HMMVWV_A.Components.Pointlight_1.enlightenEnable = false
VehicleSettings.Ground.HMMVWV_A.Components.Pointlight_1.transform = {}
VehicleSettings.Ground.HMMVWV_A.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.HMMVWV_A.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.HMMVWV_A.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.HMMVWV_A.Components.Pointlight_1.transform.trans = Vec3(0, 1, 5)


-- M1 Tank US
-- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/M1A2/M1Abrams.txt
VehicleSettings.Ground.M1 = {}
VehicleSettings.Ground.M1.name = 'M1'
VehicleSettings.Ground.M1.partitionGUID = 'B069BA89-EECF-11DD-8117-9421284A74E5'
VehicleSettings.Ground.M1.chassisGUID = 'B06A08AD-EECF-11DD-8117-9421284A74E5'
VehicleSettings.Ground.M1.vehicleDataGUID = 'B06A08AC-EECF-11DD-8117-9421284A74E5'

VehicleSettings.Ground.M1.Components = {}

VehicleSettings.Ground.M1.Components.Spotlight_1 = {}
VehicleSettings.Ground.M1.Components.Spotlight_1.enabled = true
VehicleSettings.Ground.M1.Components.Spotlight_1.description = 'Left Main Light'
VehicleSettings.Ground.M1.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.M1.Components.Spotlight_1.weaponmounted = false
VehicleSettings.Ground.M1.Components.Spotlight_1.shape = 1
VehicleSettings.Ground.M1.Components.Spotlight_1.frustumFov = 80
VehicleSettings.Ground.M1.Components.Spotlight_1.frustumAspect = 1.25
VehicleSettings.Ground.M1.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Ground.M1.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Ground.M1.Components.Spotlight_1.intensity = 5*SpotlightMultiplicator
VehicleSettings.Ground.M1.Components.Spotlight_1.radius = 50
VehicleSettings.Ground.M1.Components.Spotlight_1.color = Vec3(1, 0.9, 0.8)
VehicleSettings.Ground.M1.Components.Spotlight_1.transform = {}
VehicleSettings.Ground.M1.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.M1.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.M1.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.M1.Components.Spotlight_1.transform.trans = Vec3(-0.845, 1.265, 3.675)
VehicleSettings.Ground.M1.Components.Spotlight_1.transform.mirrored = true

VehicleSettings.Ground.M1.Components.Pointlight_1 = {}
VehicleSettings.Ground.M1.Components.Pointlight_1.enabled = true
VehicleSettings.Ground.M1.Components.Pointlight_1.description = 'Left Main Light Pointlight'
VehicleSettings.Ground.M1.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.M1.Components.Pointlight_1.weaponmounted = false
VehicleSettings.Ground.M1.Components.Pointlight_1.radius = 8
VehicleSettings.Ground.M1.Components.Pointlight_1.width = 1
VehicleSettings.Ground.M1.Components.Pointlight_1.intensity = 5
VehicleSettings.Ground.M1.Components.Pointlight_1.color = Vec3(1, 0.9, 0.9)
VehicleSettings.Ground.M1.Components.Pointlight_1.visible = true
VehicleSettings.Ground.M1.Components.Pointlight_1.enlightenEnable = false
VehicleSettings.Ground.M1.Components.Pointlight_1.transform = {}
VehicleSettings.Ground.M1.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.M1.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.M1.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.M1.Components.Pointlight_1.transform.trans = Vec3(0, 1, 6.75)


-- Tank T90 RUS
-- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/T90/T90.txt

VehicleSettings.Ground.T90 = {}
VehicleSettings.Ground.T90.name = 'T90'
VehicleSettings.Ground.T90.partitionGUID = '60106974-DD7D-11DD-A030-B04E425BA11E'
VehicleSettings.Ground.T90.chassisGUID = '7A858CD2-DD7D-11DD-A030-B04E425BA11E'
VehicleSettings.Ground.T90.vehicleDataGUID = '60106976-DD7D-11DD-A030-B04E425BA11E'

VehicleSettings.Ground.T90.Components = {}

VehicleSettings.Ground.T90.Components.Spotlight_1 = {}
VehicleSettings.Ground.T90.Components.Spotlight_1.enabled = true
VehicleSettings.Ground.T90.Components.Spotlight_1.description = 'Main Light'
VehicleSettings.Ground.T90.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.T90.Components.Spotlight_1.weaponmounted = false
VehicleSettings.Ground.T90.Components.Spotlight_1.shape = 1
VehicleSettings.Ground.T90.Components.Spotlight_1.frustumFov = 80
VehicleSettings.Ground.T90.Components.Spotlight_1.frustumAspect = 1.25
VehicleSettings.Ground.T90.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Ground.T90.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Ground.T90.Components.Spotlight_1.intensity = 5*SpotlightMultiplicator
VehicleSettings.Ground.T90.Components.Spotlight_1.radius = 50
VehicleSettings.Ground.T90.Components.Spotlight_1.color = Vec3(1, 0.9, 0.8)
VehicleSettings.Ground.T90.Components.Spotlight_1.transform = {}
VehicleSettings.Ground.T90.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.T90.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.T90.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.T90.Components.Spotlight_1.transform.trans = Vec3(-0.75, 1.2, 3.15)
VehicleSettings.Ground.T90.Components.Spotlight_1.transform.mirrored = true

VehicleSettings.Ground.T90.Components.Pointlight_1 = {}
VehicleSettings.Ground.T90.Components.Pointlight_1.enabled = true
VehicleSettings.Ground.T90.Components.Pointlight_1.description = 'Main Light Pointlight'
VehicleSettings.Ground.T90.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.T90.Components.Pointlight_1.weaponmounted = false
VehicleSettings.Ground.T90.Components.Pointlight_1.radius = 2
VehicleSettings.Ground.T90.Components.Pointlight_1.width = 1
VehicleSettings.Ground.T90.Components.Pointlight_1.intensity = 10
VehicleSettings.Ground.T90.Components.Pointlight_1.color = Vec3(1, 0.9, 0.9)
VehicleSettings.Ground.T90.Components.Pointlight_1.visible = true
VehicleSettings.Ground.T90.Components.Pointlight_1.enlightenEnable = false
VehicleSettings.Ground.T90.Components.Pointlight_1.transform = {}
VehicleSettings.Ground.T90.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.T90.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.T90.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.T90.Components.Pointlight_1.transform.trans = Vec3(0, 1, 6)

-- Growler Jeep US
-- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/GrowlerITV/GrowlerITV.txt
VehicleSettings.Ground.Growler = {}
VehicleSettings.Ground.Growler.name = 'Growler'
VehicleSettings.Ground.Growler.partitionGUID = 'CF5166FD-6B60-11E0-8ACE-C75FA07B1C42'
VehicleSettings.Ground.Growler.chassisGUID = '50505716-343D-B27D-26DE-BF914B9A05A0'
VehicleSettings.Ground.Growler.vehicleDataGUID = '02158D2F-08AC-EC79-EE0D-15F41D9D59A2'

VehicleSettings.Ground.Growler.Components = {}

VehicleSettings.Ground.Growler.Components.Spotlight_1 = {}
VehicleSettings.Ground.Growler.Components.Spotlight_1.enabled = true
VehicleSettings.Ground.Growler.Components.Spotlight_1.description = 'Left Main Light'
VehicleSettings.Ground.Growler.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.Growler.Components.Spotlight_1.weaponmounted = false
VehicleSettings.Ground.Growler.Components.Spotlight_1.shape = 1
VehicleSettings.Ground.Growler.Components.Spotlight_1.frustumFov = 80
VehicleSettings.Ground.Growler.Components.Spotlight_1.frustumAspect = 1.25
VehicleSettings.Ground.Growler.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Ground.Growler.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Ground.Growler.Components.Spotlight_1.intensity = 5*SpotlightMultiplicator
VehicleSettings.Ground.Growler.Components.Spotlight_1.radius = 50
VehicleSettings.Ground.Growler.Components.Spotlight_1.color = Vec3(1, 0.9, 0.8)
VehicleSettings.Ground.Growler.Components.Spotlight_1.transform = {}
VehicleSettings.Ground.Growler.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.Growler.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.Growler.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.Growler.Components.Spotlight_1.transform.trans = Vec3(-0.6375, 1.10, 2.265)
VehicleSettings.Ground.Growler.Components.Spotlight_1.transform.mirrored = true

VehicleSettings.Ground.Growler.Components.Pointlight_1 = {}
VehicleSettings.Ground.Growler.Components.Pointlight_1.enabled = true
VehicleSettings.Ground.Growler.Components.Pointlight_1.description = 'Main Light Pointlight'
VehicleSettings.Ground.Growler.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.Growler.Components.Pointlight_1.weaponmounted = false
VehicleSettings.Ground.Growler.Components.Pointlight_1.radius = 5
VehicleSettings.Ground.Growler.Components.Pointlight_1.width = 2
VehicleSettings.Ground.Growler.Components.Pointlight_1.intensity = 10
VehicleSettings.Ground.Growler.Components.Pointlight_1.color = Vec3(1, 0.9, 0.9)
VehicleSettings.Ground.Growler.Components.Pointlight_1.visible = true
VehicleSettings.Ground.Growler.Components.Pointlight_1.enlightenEnable = false
VehicleSettings.Ground.Growler.Components.Pointlight_1.transform = {}
VehicleSettings.Ground.Growler.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.Growler.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.Growler.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.Growler.Components.Pointlight_1.transform.trans = Vec3(0, 1.15, 6)

-- VDV Jeep RUS
-- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/VDV_Buggy/VDV_Buggy.txt
VehicleSettings.Ground.VDV = {}
VehicleSettings.Ground.VDV.name = 'VDV'
VehicleSettings.Ground.VDV.partitionGUID = '2EA804A7-8232-11E0-823A-BD52CA6DC6B3'
VehicleSettings.Ground.VDV.chassisGUID = '3EEBB2A5-3097-F378-A32D-2E4447D0C9E1'
VehicleSettings.Ground.VDV.vehicleDataGUID = '21987A58-FF12-90E7-3B02-5122E534A06B'

VehicleSettings.Ground.VDV.Components = {}

VehicleSettings.Ground.VDV.Components.Spotlight_1 = {}
VehicleSettings.Ground.VDV.Components.Spotlight_1.enabled = true
VehicleSettings.Ground.VDV.Components.Spotlight_1.description = 'Left Main Light'
VehicleSettings.Ground.VDV.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.VDV.Components.Spotlight_1.weaponmounted = false
VehicleSettings.Ground.VDV.Components.Spotlight_1.shape = 1
VehicleSettings.Ground.VDV.Components.Spotlight_1.frustumFov = 80
VehicleSettings.Ground.VDV.Components.Spotlight_1.frustumAspect = 1.25
VehicleSettings.Ground.VDV.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Ground.VDV.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Ground.VDV.Components.Spotlight_1.intensity = 5*SpotlightMultiplicator
VehicleSettings.Ground.VDV.Components.Spotlight_1.radius = 50
VehicleSettings.Ground.VDV.Components.Spotlight_1.color = Vec3(1, 0.9, 0.8)
VehicleSettings.Ground.VDV.Components.Spotlight_1.transform = {}
VehicleSettings.Ground.VDV.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.VDV.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.VDV.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.VDV.Components.Spotlight_1.transform.trans = Vec3(-0.44, 0.85, 1.58)
VehicleSettings.Ground.VDV.Components.Spotlight_1.transform.mirrored = true

VehicleSettings.Ground.VDV.Components.Pointlight_1 = {}
VehicleSettings.Ground.VDV.Components.Pointlight_1.enabled = true
VehicleSettings.Ground.VDV.Components.Pointlight_1.description = 'Main Light Pointlight'
VehicleSettings.Ground.VDV.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.VDV.Components.Pointlight_1.weaponmounted = false
VehicleSettings.Ground.VDV.Components.Pointlight_1.radius = 5.75
VehicleSettings.Ground.VDV.Components.Pointlight_1.width = 2
VehicleSettings.Ground.VDV.Components.Pointlight_1.intensity = 8*SpotlightMultiplicator
VehicleSettings.Ground.VDV.Components.Pointlight_1.color = Vec3(1, 0.9, 0.9)
VehicleSettings.Ground.VDV.Components.Pointlight_1.visible = true
VehicleSettings.Ground.VDV.Components.Pointlight_1.enlightenEnable = false
VehicleSettings.Ground.VDV.Components.Pointlight_1.transform = {}
VehicleSettings.Ground.VDV.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.VDV.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.VDV.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.VDV.Components.Pointlight_1.transform.trans = Vec3(0, 1, 6)

-- PDV Jeep RUS
-- https://github.com/EmulatorNexus/Venice-EBX/tree/master/Vehicles/XPack01/DPV

VehicleSettings.Ground.PDV = {}
VehicleSettings.Ground.PDV.name = 'PDV'
VehicleSettings.Ground.PDV.partitionGUID = '6F91A4CF-344D-11E0-930F-E8BE623140CB'
VehicleSettings.Ground.PDV.chassisGUID = 'B0563CD8-5A05-A9AF-CB92-5BB127EBF60C'
VehicleSettings.Ground.PDV.vehicleDataGUID = 'E5D5D798-E452-0E56-1132-D7C85AB29402'

VehicleSettings.Ground.PDV.Components = {}

VehicleSettings.Ground.PDV.Components.Spotlight_1 = {}
VehicleSettings.Ground.PDV.Components.Spotlight_1.enabled = true
VehicleSettings.Ground.PDV.Components.Spotlight_1.description = 'Left Main Light'
VehicleSettings.Ground.PDV.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.PDV.Components.Spotlight_1.weaponmounted = false
VehicleSettings.Ground.PDV.Components.Spotlight_1.shape = 1
VehicleSettings.Ground.PDV.Components.Spotlight_1.frustumFov = 80
VehicleSettings.Ground.PDV.Components.Spotlight_1.frustumAspect = 1.25
VehicleSettings.Ground.PDV.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Ground.PDV.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Ground.PDV.Components.Spotlight_1.intensity = 5*SpotlightMultiplicator
VehicleSettings.Ground.PDV.Components.Spotlight_1.radius = 50
VehicleSettings.Ground.PDV.Components.Spotlight_1.color = Vec3(1, 0.9, 0.8)
VehicleSettings.Ground.PDV.Components.Spotlight_1.transform = {}
VehicleSettings.Ground.PDV.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.PDV.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.PDV.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.PDV.Components.Spotlight_1.transform.trans = Vec3(-0.3225, 0.765, 2.075)
VehicleSettings.Ground.PDV.Components.Spotlight_1.transform.mirrored = true

VehicleSettings.Ground.PDV.Components.Pointlight_1 = {}
VehicleSettings.Ground.PDV.Components.Pointlight_1.enabled = true
VehicleSettings.Ground.PDV.Components.Pointlight_1.description = 'Left Main Light Pointlight'
VehicleSettings.Ground.PDV.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.PDV.Components.Pointlight_1.weaponmounted = false
VehicleSettings.Ground.PDV.Components.Pointlight_1.radius = 4
VehicleSettings.Ground.PDV.Components.Pointlight_1.width = 2
VehicleSettings.Ground.PDV.Components.Pointlight_1.intensity = 10
VehicleSettings.Ground.PDV.Components.Pointlight_1.color = Vec3(1, 0.9, 0.9)
VehicleSettings.Ground.PDV.Components.Pointlight_1.visible = true
VehicleSettings.Ground.PDV.Components.Pointlight_1.enlightenEnable = false
VehicleSettings.Ground.PDV.Components.Pointlight_1.transform = {}
VehicleSettings.Ground.PDV.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.PDV.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.PDV.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.PDV.Components.Pointlight_1.transform.trans = Vec3(0, 1, 6)

-- ATV BTR
-- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/XPack01/BTR-90/BTR90.txt

VehicleSettings.Ground.BTR = {}
VehicleSettings.Ground.BTR.name = 'BTR'
VehicleSettings.Ground.BTR.partitionGUID = '22CFC313-4DD1-49E6-B45F-A8B1194105C5'
VehicleSettings.Ground.BTR.chassisGUID = '9B10AC62-36E3-4DDA-A43B-D24CC384C907'
VehicleSettings.Ground.BTR.weaponGUID = 'E392AE5A-9733-4A3E-AC58-258275E4BDBE'
VehicleSettings.Ground.BTR.vehicleDataGUID = '687DB918-EBC5-4445-9CEF-911981203EB1'

VehicleSettings.Ground.BTR.Components = {}

VehicleSettings.Ground.BTR.Components.Spotlight_1 = {}
VehicleSettings.Ground.BTR.Components.Spotlight_1.enabled = true
VehicleSettings.Ground.BTR.Components.Spotlight_1.description = 'Left Main Light'
VehicleSettings.Ground.BTR.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.BTR.Components.Spotlight_1.weaponmounted = false
VehicleSettings.Ground.BTR.Components.Spotlight_1.shape = 1
VehicleSettings.Ground.BTR.Components.Spotlight_1.frustumFov = 80
VehicleSettings.Ground.BTR.Components.Spotlight_1.frustumAspect = 1.25
VehicleSettings.Ground.BTR.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Ground.BTR.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Ground.BTR.Components.Spotlight_1.intensity = 17.5*SpotlightMultiplicator
VehicleSettings.Ground.BTR.Components.Spotlight_1.radius = 50
VehicleSettings.Ground.BTR.Components.Spotlight_1.color = Vec3(1, 0.9, 0.7)
VehicleSettings.Ground.BTR.Components.Spotlight_1.transform = {}
VehicleSettings.Ground.BTR.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.BTR.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.BTR.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.BTR.Components.Spotlight_1.transform.trans = Vec3(-0.8, 1.75, 3.54)
VehicleSettings.Ground.BTR.Components.Spotlight_1.transform.mirrored = true

VehicleSettings.Ground.BTR.Components.Spotlight_2 = {}
VehicleSettings.Ground.BTR.Components.Spotlight_2.enabled = true
VehicleSettings.Ground.BTR.Components.Spotlight_2.description = 'Main Weapon Light'
VehicleSettings.Ground.BTR.Components.Spotlight_2.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.BTR.Components.Spotlight_2.weaponmounted = true
VehicleSettings.Ground.BTR.Components.Spotlight_2.shape = 1
VehicleSettings.Ground.BTR.Components.Spotlight_2.frustumFov = 35
VehicleSettings.Ground.BTR.Components.Spotlight_2.frustumAspect = 1.25
VehicleSettings.Ground.BTR.Components.Spotlight_2.castShadowsMinLevel = 0
VehicleSettings.Ground.BTR.Components.Spotlight_2.castShadowsEnable = true
VehicleSettings.Ground.BTR.Components.Spotlight_2.intensity = 20*SpotlightMultiplicator
VehicleSettings.Ground.BTR.Components.Spotlight_2.radius = 25
VehicleSettings.Ground.BTR.Components.Spotlight_2.color = Vec3(1, 0.9, 0.7)
VehicleSettings.Ground.BTR.Components.Spotlight_2.transform = {}
VehicleSettings.Ground.BTR.Components.Spotlight_2.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.BTR.Components.Spotlight_2.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.BTR.Components.Spotlight_2.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.BTR.Components.Spotlight_2.transform.trans = Vec3(-0.50, 0.09, -1.20)

VehicleSettings.Ground.BTR.Components.Pointlight_1 = {}
VehicleSettings.Ground.BTR.Components.Pointlight_1.enabled = true
VehicleSettings.Ground.BTR.Components.Pointlight_1.description = 'Left Main Light Pointlight'
VehicleSettings.Ground.BTR.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.BTR.Components.Pointlight_1.weaponmounted = false
VehicleSettings.Ground.BTR.Components.Pointlight_1.radius = 5
VehicleSettings.Ground.BTR.Components.Pointlight_1.width = 5
VehicleSettings.Ground.BTR.Components.Pointlight_1.intensity = 10
VehicleSettings.Ground.BTR.Components.Pointlight_1.color = Vec3(1, 0.9, 0.7)
VehicleSettings.Ground.BTR.Components.Pointlight_1.visible = true
VehicleSettings.Ground.BTR.Components.Pointlight_1.enlightenEnable = false
VehicleSettings.Ground.BTR.Components.Pointlight_1.transform = {}
VehicleSettings.Ground.BTR.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.BTR.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.BTR.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.BTR.Components.Pointlight_1.transform.trans = Vec3(0, 2.5, 9.5)

-- LAV 25 US
-- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/LAV25/LAV25.txt

VehicleSettings.Ground.LAV = {}
VehicleSettings.Ground.LAV.name = 'LAV25'
VehicleSettings.Ground.LAV.partitionGUID = 'D124CDD4-FE2A-11DF-BB74-FD1A26B74EE5'
VehicleSettings.Ground.LAV.chassisGUID = '4F0DD4BF-A2B3-3980-AB37-2B7A3642F1BE'
VehicleSettings.Ground.LAV.weaponGUID = 'BC13D6E6-DE0A-46A4-B969-3EF2E1968A59'
VehicleSettings.Ground.LAV.vehicleDataGUID = '0AA2C0B7-6B2C-76F5-B7CE-50276A615E3A'

VehicleSettings.Ground.LAV.Components = {}

VehicleSettings.Ground.LAV.Components.Spotlight_1 = {}
VehicleSettings.Ground.LAV.Components.Spotlight_1.enabled = true
VehicleSettings.Ground.LAV.Components.Spotlight_1.description = 'Left Main Light'
VehicleSettings.Ground.LAV.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.LAV.Components.Spotlight_1.weaponmounted = false
VehicleSettings.Ground.LAV.Components.Spotlight_1.shape = 1
VehicleSettings.Ground.LAV.Components.Spotlight_1.frustumFov = 80
VehicleSettings.Ground.LAV.Components.Spotlight_1.frustumAspect = 1.25
VehicleSettings.Ground.LAV.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Ground.LAV.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Ground.LAV.Components.Spotlight_1.intensity = 17.5*SpotlightMultiplicator
VehicleSettings.Ground.LAV.Components.Spotlight_1.radius = 50
VehicleSettings.Ground.LAV.Components.Spotlight_1.color = Vec3(1, 0.9, 0.7)
VehicleSettings.Ground.LAV.Components.Spotlight_1.transform = {}
VehicleSettings.Ground.LAV.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.LAV.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.LAV.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.LAV.Components.Spotlight_1.transform.trans = Vec3(-0.875, 1.75, 3.50)
VehicleSettings.Ground.LAV.Components.Spotlight_1.transform.mirrored = true

VehicleSettings.Ground.LAV.Components.Spotlight_3 = {}
VehicleSettings.Ground.LAV.Components.Spotlight_3.enabled = true
VehicleSettings.Ground.LAV.Components.Spotlight_3.description = 'Main Weapon Light'
VehicleSettings.Ground.LAV.Components.Spotlight_3.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.LAV.Components.Spotlight_3.weaponmounted = true
VehicleSettings.Ground.LAV.Components.Spotlight_3.shape = 1
VehicleSettings.Ground.LAV.Components.Spotlight_3.frustumFov = 60
VehicleSettings.Ground.LAV.Components.Spotlight_3.frustumAspect = 1.25
VehicleSettings.Ground.LAV.Components.Spotlight_3.castShadowsMinLevel = 0
VehicleSettings.Ground.LAV.Components.Spotlight_3.castShadowsEnable = true
VehicleSettings.Ground.LAV.Components.Spotlight_3.intensity = 0.25*SpotlightMultiplicator
VehicleSettings.Ground.LAV.Components.Spotlight_3.radius = 50
VehicleSettings.Ground.LAV.Components.Spotlight_3.color = Vec3(1, 0.9, 0.7)
VehicleSettings.Ground.LAV.Components.Spotlight_3.transform = {}
VehicleSettings.Ground.LAV.Components.Spotlight_3.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.LAV.Components.Spotlight_3.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.LAV.Components.Spotlight_3.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.LAV.Components.Spotlight_3.transform.trans = Vec3(-0.4, 0.50, -1.5)

VehicleSettings.Ground.LAV.Components.Pointlight_1 = {}
VehicleSettings.Ground.LAV.Components.Pointlight_1.enabled = true
VehicleSettings.Ground.LAV.Components.Pointlight_1.description = 'Left Main Light Pointlight'
VehicleSettings.Ground.LAV.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.LAV.Components.Pointlight_1.weaponmounted = false
VehicleSettings.Ground.LAV.Components.Pointlight_1.radius = 5
VehicleSettings.Ground.LAV.Components.Pointlight_1.width = 5
VehicleSettings.Ground.LAV.Components.Pointlight_1.intensity = 10
VehicleSettings.Ground.LAV.Components.Pointlight_1.color = Vec3(1, 0.9, 0.7)
VehicleSettings.Ground.LAV.Components.Pointlight_1.visible = true
VehicleSettings.Ground.LAV.Components.Pointlight_1.enlightenEnable = false
VehicleSettings.Ground.LAV.Components.Pointlight_1.transform = {}
VehicleSettings.Ground.LAV.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.LAV.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.LAV.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.LAV.Components.Pointlight_1.transform.trans = Vec3(0, 2.5, 9.5)   -- left/right x, height y, front/back z  

-- Skidloader
-- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/XPack01/SkidLoader/SkidLoader.txt

VehicleSettings.Ground.Skidloader = {}
VehicleSettings.Ground.Skidloader.name = 'Skidloader'
VehicleSettings.Ground.Skidloader.partitionGUID = 'EB384F9B-929B-11E0-8E2E-9D80798C8C1C'
VehicleSettings.Ground.Skidloader.chassisGUID = '6EBD292A-078C-046D-167B-D6B9BF557111'
VehicleSettings.Ground.Skidloader.vehicleDataGUID = 'D531D9AC-6FB4-DF6E-26DE-32D3E2471779'

VehicleSettings.Ground.Skidloader.Components = {}

VehicleSettings.Ground.Skidloader.Components.Spotlight_1 = {}
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.enabled = true
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.description = 'Left Main Light'
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.weaponmounted = false
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.shape = 1
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.frustumFov = 120
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.frustumAspect = 1.0
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.intensity = 1*SpotlightMultiplicator
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.radius = 30
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.color = Vec3(1, 0.9, 0.7)
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.transform = {}
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.transform.trans = Vec3(-0.40, 2, 0.66)
VehicleSettings.Ground.Skidloader.Components.Spotlight_1.transform.mirrored = true

VehicleSettings.Ground.Skidloader.Components.Pointlight_1 = {}
VehicleSettings.Ground.Skidloader.Components.Pointlight_1.enabled = true
VehicleSettings.Ground.Skidloader.Components.Pointlight_1.description = 'God sent'
VehicleSettings.Ground.Skidloader.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.Skidloader.Components.Pointlight_1.weaponmounted = false
VehicleSettings.Ground.Skidloader.Components.Pointlight_1.radius = 3
VehicleSettings.Ground.Skidloader.Components.Pointlight_1.width = 1
VehicleSettings.Ground.Skidloader.Components.Pointlight_1.intensity = 5000
VehicleSettings.Ground.Skidloader.Components.Pointlight_1.color = Vec3(1, 0.8, 0.4)
VehicleSettings.Ground.Skidloader.Components.Pointlight_1.visible = true
VehicleSettings.Ground.Skidloader.Components.Pointlight_1.enlightenEnable = false
VehicleSettings.Ground.Skidloader.Components.Pointlight_1.transform = {}
VehicleSettings.Ground.Skidloader.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.Skidloader.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.Skidloader.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.Skidloader.Components.Pointlight_1.transform.trans = Vec3(0, 2.5, 4.75)

-- KLR650 Dirtbike
-- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/XPack01/SkidLoader/SkidLoader.txt

VehicleSettings.Ground.KLR650 = {}
VehicleSettings.Ground.KLR650.name = 'KLR650'
VehicleSettings.Ground.KLR650.partitionGUID = '38FA36CC-22C8-4624-89BF-1D95C7CE7815'
VehicleSettings.Ground.KLR650.chassisGUID = '74DB41C3-A464-4AFF-B60F-C7B460F3D1E2'
VehicleSettings.Ground.KLR650.vehicleDataGUID = '33960E31-BB2A-4CAD-80B9-FBDA32E36745'

VehicleSettings.Ground.KLR650.Components = {}

VehicleSettings.Ground.KLR650.Components.Spotlight_1 = {}
VehicleSettings.Ground.KLR650.Components.Spotlight_1.enabled = true
VehicleSettings.Ground.KLR650.Components.Spotlight_1.description = 'Main Light'
VehicleSettings.Ground.KLR650.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Ground.KLR650.Components.Spotlight_1.weaponmounted = false
VehicleSettings.Ground.KLR650.Components.Spotlight_1.shape = 1
VehicleSettings.Ground.KLR650.Components.Spotlight_1.frustumFov = 50
VehicleSettings.Ground.KLR650.Components.Spotlight_1.frustumAspect = 1.0
VehicleSettings.Ground.KLR650.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Ground.KLR650.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Ground.KLR650.Components.Spotlight_1.intensity = 1*SpotlightMultiplicator
VehicleSettings.Ground.KLR650.Components.Spotlight_1.radius = 140
VehicleSettings.Ground.KLR650.Components.Spotlight_1.color = Vec3(1, 0.9, 0.7)
VehicleSettings.Ground.KLR650.Components.Spotlight_1.transform = {}
VehicleSettings.Ground.KLR650.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Ground.KLR650.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Ground.KLR650.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Ground.KLR650.Components.Spotlight_1.transform.trans = Vec3(0, 0.85, 1)


return VehicleSettings