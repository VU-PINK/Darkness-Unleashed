local VehicleSettings = {}
-- Airborne Vehicles
VehicleSettings.Airborne = {}
-- AH1Z (VIPER)
VehicleSettings.Airborne.AH1Z = {}
VehicleSettings.Airborne.AH1Z.name = 'AH1Z'
VehicleSettings.Airborne.AH1Z.partitionGUID = '643135EA-6CA7-11DF-B6FA-F715AA601362'
VehicleSettings.Airborne.AH1Z.chassisGUID = 'D959DF11-EA30-D238-A0D5-5687735963E4'
VehicleSettings.Airborne.AH1Z.weaponGUID = 'DF0AEBA7-A3D6-4CCA-9572-E6FBAB9569C5'

VehicleSettings.Airborne.AH1Z.Components = {}

VehicleSettings.Airborne.AH1Z.Components.Spotlight_1 = {}
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.enabled = true
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.description = 'Gunner Searchlight'
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.weaponmounted = false
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.shape = 1
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.frustumFov = 35.6789
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.frustumAspect = 1.0
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.intensity = 0.28245
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.radius = 1000
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.color = Vec3(1, 1, 0)
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.transform = {}
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.AH1Z.Components.Spotlight_1.transform.trans = Vec3(0, 0, 0)

VehicleSettings.Airborne.AH1Z.Components.Pointlight_1 = {}
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.enabled = true
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.description = 'Gunner Searchlight Pointlight'
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.weaponmounted = false
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.radius = 2
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.color = Vec3(1, 1, 1)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.transform = {}
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_1.transform.trans = Vec3(0, 0, 0)

VehicleSettings.Airborne.AH1Z.Components.Pointlight_2 = {}
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.enabled = true
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.description = 'Cockpit Green Light'
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.weaponmounted = false
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.radius = 2
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.color = Vec3(1, 0, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.intensity = 5
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.transform = {}
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_2.transform.trans = Vec3(0, 1, -2.25)

VehicleSettings.Airborne.AH1Z.Components.Pointlight_3 = {}
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.enabled = true
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.description = 'Top Red Blinker'
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.type = 1 -- Pointlight [1] ; Spotlight [3]
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.weaponmounted = false
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.radius = 3
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.color = Vec3(0, 1, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.intensity = 5
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.transform = {}
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.AH1Z.Components.Pointlight_3.transform.trans = Vec3(0, 0.25, 2.5)


--MI28
VehicleSettings.Airborne.Mi28 = {}
VehicleSettings.Airborne.Mi28.name = 'Mi28'
VehicleSettings.Airborne.Mi28.partitionGUID = '89BE53B6-2FF4-11DE-8C23-DAB1D69416DE'
VehicleSettings.Airborne.Mi28.chassisGUID = '89BEA1F6-2FF4-11DE-8C23-DAB1D69416DE'
VehicleSettings.Airborne.Mi28.weaponGUID = '5CE97EF7-28BE-492A-A15E-A3D4FC371AA5'
VehicleSettings.Airborne.Mi28.Components = {}
VehicleSettings.Airborne.Mi28.Components.Spotlight_1 = {}
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.enabled = true
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.description = 'Gunner Searchlight'
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.type = 2 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.weaponmounted = false
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.shape = 1
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.frustumFov = 35.6789
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.frustumAspect = 1.0
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.castShadowsMinLevel = 0
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.castShadowsEnable = true
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.intensity = 0.28245
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.radius = 1000
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.transform = {}
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.Mi28.Components.Spotlight_1.transform.trans = Vec3(0, 0, 0)
            
VehicleSettings.Airborne.Mi28.Components.Pointlight_1 = {}
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.enabled = true
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.description = 'Gunner Searchlight Pointlight'
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.weaponmounted = false
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.radius = 2
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.color = Vec3(1, 1, 1)
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.transform = {}
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.Mi28.Components.Pointlight_1.transform.trans = Vec3(0, 0, 0)

VehicleSettings.Airborne.Mi28.Components.Pointlight_2 = {}
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.enabled = true
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.description = 'Cockpit Green Light'
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.weaponmounted = false
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.radius = 2
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.color = Vec3(0, 1, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.intensity = 5
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.visible = true
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.enlightenEnable = false
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.transform = {}
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.Mi28.Components.Pointlight_2.transform.trans = Vec3(0, 1, -2.25)

VehicleSettings.Airborne.Mi28.Components.Pointlight_3 = {}
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.enabled = true
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.description = "Top Red Blinker"
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.type = 1 -- Pointlight [1] ; Spotlight [2]
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.weaponmounted = false
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.radius = 3
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.color = Vec3(1, 0, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.intensity = 5
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.visible = true
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.transform = {}
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.transform.left = Vec3(-1, 0, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.transform.up = Vec3(0, 1, 0)
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.transform.forward = Vec3(0, 0, 1)
VehicleSettings.Airborne.Mi28.Components.Pointlight_3.transform.trans = Vec3(0, 0.25, 2.5)

return VehicleSettings