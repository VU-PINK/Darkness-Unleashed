function CinematicTools()



    local states = nil
    local state = nil
    local R = 1.0
    local G = 1.0 
    local B = 1.0
    local BrightnessR = 1.0
    local BrightnessG = 1.0
    local BrightnessB = 1.0
    local ContrastR = 1.0
    local ContrastG = 1.0
    local ContrastB = 1.0
    local SaturationR = 1.0
    local SaturationG = 1.0
    local SaturationB = 1.0
    local BloomR = 1.0 
    local BloomG = 1.0 
    local BloomB = 1.0
    local VignetteScaleX = 1.0
    local VignetteScaleY = 1.0
    local groundR = 1.0 
    local groundG = 1.0 
    local groundB = 1.0
    local skyColorR = 1.0 
    local skyColorG = 1.0 
    local skyColorB = 1.0
    local presetname

    -- Sky
    DebugGUI:Folder("Sky", function ()

        -- Brightness Scale
        DebugGUI:Range('Sky Brightness', {DefValue = 0.5, Min = 0, Max = 1, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.sky.brightnessScale = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        -- Sun Size
        DebugGUI:Range('Sun Size', {DefValue = 0.01, Min = 0, Max = 0.2, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end
            
            state.sky.sunSize = value 
            VisualEnvironmentManager:SetDirty(true)


        end)

        -- Sun Scale
        DebugGUI:Range('Sun Scale', {DefValue = 5, Min = 0, Max = 50, Step = 0.1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end
            
            state.sky.sunScale = value 
            VisualEnvironmentManager:SetDirty(true)


        end)

        -- sunRotationX
        DebugGUI:Range('Sun Rotation X', {DefValue = 90, Min = 0, Max = 359, Step = 1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.outdoorLight.sunRotationX = value 
            VisualEnvironmentManager:SetDirty(true)


        end)

        -- sunRotationX
        DebugGUI:Range('Sun Rotation Y', {DefValue = 0, Min = 0, Max = 359, Step = 1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.outdoorLight.sunRotationY = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        -- Sun Color Red
        DebugGUI:Range('Sun Color Red', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            R = value 

        end)

        -- Sun Color Green
        DebugGUI:Range('Sun Color Green', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            G = value 

        end)

        -- Sun Color Blue
        DebugGUI:Range('Sun Color Blue', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            B = value
        
        end)

        -- Apply Sun Color Changes
        DebugGUI:Button('Apply Sun Color Change', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.outdoorLight.sunColor = Vec3(R, G, B)
            VisualEnvironmentManager:SetDirty(true)

        end)
        
    end)
    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Environment 
    DebugGUI:Folder("Environment", function ()
        -- Ground Color Red
        DebugGUI:Range('Ground Color Red', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            groundR = value 

        end)

        -- Ground Color Green
        DebugGUI:Range('Ground Color Green', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            groundG = value 

        end)

        -- Ground Color Blue
        DebugGUI:Range('Ground Color Blue', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            groundB = value
        
        end)

        -- Apply Ground Color Changes
        DebugGUI:Button('Apply Ground Color Change', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.outdoorLight.groundColor = Vec3(groundR, groundG, groundB)
            VisualEnvironmentManager:SetDirty(true)

        end)

        -- Sky Color Red
        DebugGUI:Range('Sky Color Red', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            skyColorR = value 

        end)

        -- Sky Color Green
        DebugGUI:Range('Sky Color Green', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            skyColorG = value 

        end)

        -- Sky Color Blue
        DebugGUI:Range('Sky Color Blue', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            skyColorB = value
        
        end)

        -- Apply Sky Color Changes
        DebugGUI:Button('Apply Sky Color Change', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.outdoorLight.skyColor = Vec3(skyColorR, skyColorG, skyColorB)
            VisualEnvironmentManager:SetDirty(true)

        end)

        -- Apply Moon Night Skybox
        DebugGUI:Checkbox('Apply Full Moon Skybox', false, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if value == true then 
                state.sky.panoramicTexture = TextureAsset(MoonNightSkybox)
            end

            VisualEnvironmentManager:SetDirty(true)

        end)

        -- Sky Light Angle Factor
        DebugGUI:Range('Sky Light Angle (broken)', {DefValue = 45, Min = 0, Max = 90, Step = 1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.outdoorLight.skyLightAngleFactor = value
        
        end)

    end)

    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Color Correction
    DebugGUI:Folder("Color Correction", function ()
        -- Color Correction Brightness Red
        DebugGUI:Range('Brightness Red', {DefValue = 1.0, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            BrightnessR = value 

        end)

        -- Color Correction Brightness Green
        DebugGUI:Range('Brightness Green', {DefValue = 1.0, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            BrightnessG = value 

        end)

        -- Color Correction Brightness Blue
        DebugGUI:Range('Brightness Blue', {DefValue = 1, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            BrightnessB = value
        
        end)

        --═══════════════════════════════════════════════════════════════════════════════════════════════════--
        -- Color Correction Contrast Red
        DebugGUI:Range('Contrast Red', {DefValue = 1.0, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            ContrastR = value 

        end)

        -- Color Correction Contrast Green
        DebugGUI:Range('Contrast Green', {DefValue = 1.0, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            ContrastG = value 

        end)

        -- Color Correction Contrast Blue
        DebugGUI:Range('Contrast Blue', {DefValue = 1.0, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            ContrastB = value
        
        end)

        --═══════════════════════════════════════════════════════════════════════════════════════════════════--
        -- Color Correction Saturation Red
        DebugGUI:Range('Saturation Red', {DefValue = 1.0, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            SaturationR = value 

        end)

        -- Color Correction Saturation Green
        DebugGUI:Range('Saturation Green', {DefValue = 1.0, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            SaturationG = value 

        end)

        -- Color Correction Saturation Blue
        DebugGUI:Range('Saturation Blue', {DefValue = 1.0, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            SaturationB = value
        
        end)

        -- Apply Color Correction Changes
        DebugGUI:Button('Apply Color Correction Change', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.colorCorrection.enable = true
            state.colorCorrection.brightness = Vec3(BrightnessR, BrightnessG, BrightnessB)
            state.colorCorrection.contrast = Vec3(ContrastR, ContrastG, ContrastB)
            state.colorCorrection.saturation = Vec3(SaturationR, SaturationG, SaturationB)
            VisualEnvironmentManager:SetDirty(true)

        end)
    end)

    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Tonemap
    DebugGUI:Folder("Tonemap", function ()

        DebugGUI:Range('Method', {DefValue = 2.0, Min = 0.0, Max = 3.0, Step = 1.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.tonemap.tonemapMethod = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('Minimum Exposure (broken)', {DefValue = 0.0, Min = 0.0, Max = 10.0, Step = 0.1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.tonemap.minExposure = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('Maximum Exposure (broken)', {DefValue = 1.0, Min = 0.0, Max = 10.0, Step = 0.1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.tonemap.maxExposure = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('Middle Gray (broken)', {DefValue = 1.0, Min = 0.0, Max = 10.0, Step = 0.1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.tonemap.middleGray = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('Exposure Adjust Time (broken)', {DefValue = 1.0, Min = 0.0, Max = 50.0, Step = 0.1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.tonemap.exposureAdjustTime = value 
            VisualEnvironmentManager:SetDirty(true)

        end)
        
        -- Bloom Scale Red
        DebugGUI:Range('Bloom Scale Red', {DefValue = 0.2, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            BloomR = value 

        end)

        -- Bloom Scale Green
        DebugGUI:Range('Bloom Scale Green', {DefValue = 0.2, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            BloomG = value 

        end)

        -- Bloom Scale Blue
        DebugGUI:Range('Bloom Scale Blue', {DefValue = 0.2, Min = 0.0, Max = 5, Step = 0.1}, function(value)

            BloomB = value
        
        end)

        -- Apply Bloom Scale Changes
        DebugGUI:Button('Apply Bloom Change', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.tonemap.bloomScale = Vec3(BloomR, BloomG, BloomB)
            VisualEnvironmentManager:SetDirty(true)

        end)


    end)


    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Fog
    DebugGUI:Folder("Fog", function ()

        
        DebugGUI:Range('Fog Start', {DefValue = 0.0, Min = -100.0, Max = 10000.0, Step = 10.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.fog.start = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('Fog End', {DefValue = 5000.0, Min = 0.0, Max = 15000.0, Step = 10.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.fog.endValue = value           
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('Fog Distance Multiplier (broken)', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.2}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.fog.fogDistanceMultiplier = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('Fog Transparency Fade Start', {DefValue = 25.0, Min = 0.0, Max = 500.0, Step = 1.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.fog.transparencyFadeStart = value
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('Transparency Fade Clamp', {DefValue = 1.0, Min = 0.0, Max = 1.0, Step = 0.1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.fog.transparencyFadeClamp = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('Transparency Fade End', {DefValue = 100.0, Min = 1.0, Max = 1000.0, Step = 1.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.fog.transparencyFadeEnd = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('Fog Color Start', {DefValue = 0.0, Min = 0.0, Max = 5000.0, Step = 10.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.fog.fogColorStart = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('Fog Color End', {DefValue = 10000.0, Min = 0.0, Max = 20000.0, Step = 10.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.fog.fogColorEnd = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        -- Fog Color Red
        DebugGUI:Range('Fog Color Red', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            FogR = value 

        end)

        -- Fog Color Green
        DebugGUI:Range('Fog Color Green', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            FogG = value 

        end)

        -- Fog Color Blue
        DebugGUI:Range('Fog Color Blue', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            FogB = value
        
        end)

        -- Fog Color Scale Changes
        DebugGUI:Button('Apply Fog Color Change', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.fog.fogColor = Vec3(FogR, FogG, FogB)
            VisualEnvironmentManager:SetDirty(true)

        end)

    end)

    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Wind
    DebugGUI:Folder("Wind", function ()    

        DebugGUI:Range('Wind Direction', {DefValue = 0.0, Min = 0.0, Max = 359, Step = 1.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.wind.windDirection = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('Wind Strength', {DefValue = 1.0, Min = 0.0, Max = 20.0, Step = 1.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.wind.windStrength = value 
            VisualEnvironmentManager:SetDirty(true)

        end)
        
    end)

    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Depth of Field
    DebugGUI:Folder("Depth of Field", function ()    

        DebugGUI:Checkbox('DoF Enable', false, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.dof.enable = value 
            state.dof.blurFilter = 6
            VisualEnvironmentManager:SetDirty(true)

        end)

        --[[DebugGUI:Range('Blur Filter', {DefValue = 0, Min = 0, Max = 6, Step = 1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.dof.blurFilter = value 
            VisualEnvironmentManager:SetDirty(true)

        end)]]

        DebugGUI:Range('Scale', {DefValue = 1.0, Min = 0.0, Max = 100.0, Step = 1.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.dof.scale = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('Near Distance Scale', {DefValue = 1.0, Min = 0.0, Max = 1.0, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.dof.nearDistanceScale = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('Far Distance Scale', {DefValue = 1.0, Min = 0.0, Max = 1.0, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.dof.farDistanceScale = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        
        DebugGUI:Range('Focus Distance', {DefValue = 1.0, Min = 0.0, Max = 500.0, Step = 0.2}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.dof.focusDistance = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('Add Blur', {DefValue = 1.0, Min = 0.0, Max = 1.0, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.dof.blurAdd = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Checkbox('DoF Diffusion Enable', false, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.dof.diffusionDofEnable = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('DoF Diffusion Aperture', {DefValue = 1.0, Min = 0.6, Max = 20.0, Step = 0.2}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.dof.diffusionDofAperture = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('DoF Diffusion Focal Length', {DefValue = 1.0, Min = 10.0, Max = 135.0, Step = 1.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.dof.diffusionDofFocalLength = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

    end)

    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Vignette
    DebugGUI:Folder("Vignette (Currently Broken)", function ()    

        DebugGUI:Checkbox('Vignette Enable', false, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.vignette.enable = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Range('Vignette Opacity', {DefValue = 1.0, Min = 0.0, Max = 1.0, Step = 0.1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.vignette.opacity = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        
        DebugGUI:Range('Vignette Exponent', {DefValue = 1.0, Min = 0.0, Max = 1.0, Step = 0.1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.vignette.exponent = value 
            VisualEnvironmentManager:SetDirty(true)

        end)


        -- Vignette Scale X
        DebugGUI:Range('Vignette Scale X', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            VignetteScaleX = value 

        end)

        -- Vignette Scale Y
        DebugGUI:Range('Vignette Scale Y', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            VignetteScaleY = value 

        end)

        -- Apply Vignette Scale Changes
        DebugGUI:Button('Apply Vignette Scale', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.vignette.scale = Vec2(VignetteScaleX, VignetteScaleY)
            VisualEnvironmentManager:SetDirty(true)

        end)

    end)

    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Utilities
    DebugGUI:Folder("Utilities", function ()  

        -- Save Settings As Preset
        DebugGUI:Text('(WIP) Presetname', 'New Preset', function(name)

            presetname = name 

        end)

        DebugGUI:Range('Preset Visibility', {DefValue = 1.0, Min = 0.0, Max = 1.0, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.visibility = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Number('Preset Priority', 999999, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.priority = value 
            VisualEnvironmentManager:SetDirty(true)

        end)

        DebugGUI:Button('(WIP) Save Preset', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            NetEvents:Send('CinetoolsSave', presetname, state)

        end)

        DebugGUI:Button('(WIP) Load Preset', function(value, player)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            NetEvents:Send('CinetoolsLoad', presetname, player)

            NetEvents:Subscribe('CinetoolsSendToClient', function(preset)
                print(tostring(preset))
            end)

        end)

        DebugGUI:Button('(WIP) Sync with other Players', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

        end)

        DebugGUI:Button('(WIP) Reset All', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

        end)

    end)


end
