function CinematicTools()

    local states = nil
    local state = nil
    local R = 1.0
    local G = 1.0 
    local B = 1.0
    local brightnessR = 1.0
    local brightnessG = 1.0
    local brightnessB = 1.0
    local contrastR = 1.0
    local contrastG = 1.0
    local contrastB = 1.0
    local saturationR = 1.0
    local saturationG = 1.0
    local saturationB = 1.0
    local bloomR = 1.0 
    local bloomG = 1.0 
    local bloomB = 1.0
    local vignetteScaleX = 1.0
    local vignetteScaleY = 1.0
    local groundR = 1.0 
    local groundG = 1.0 
    local groundB = 1.0
    local skyColorR = 1.0 
    local skyColorG = 1.0 
    local skyColorB = 1.0
    local presetname = nil
    local playerObject = nil
    local topCLR = 1.0 
    local topCLG = 1.0 
    local topCLB = 1.0
    local botCLR = 1.0
    local botCLG = 1.0
    local botCLB = 1.0

    local pendingDirty = false

    Events:Subscribe('VE:StateAdded', function(foundstate)
        
        if foundstate.priority == 999999 then 

            state = foundstate 
            Tool:DebugPrint('DU VE State has been added to the VEM', 'cinetools')

        end
        
    end)
    
    -- Reduce Load on Engine
    Events:Subscribe('100msElapsed', function()

        if pendingDirty == true then

            VisualEnvironmentManager:SetDirty(true)
            pendingDirty = false

        end

    end)
    

    -- Sky
    DebugGUI:Folder("Sky", function ()

        -- Brightness Scale

        DebugGUI:Range('Sky Brightness', {DefValue = 1, Min = 0, Max = 5, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.sky.brightnessScale == value then 
                return 
            end 

            state.sky.brightnessScale = value 
            pendingDirty = true

        end)

        -- Sun Size
        DebugGUI:Range('Sun Size', {DefValue = 0.01, Min = 0, Max = 0.2, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.sky.sunSize == value then 
                return 
            end 
            
            state.sky.sunSize = value 
            pendingDirty = true


        end)

        -- Sun Scale
        DebugGUI:Range('Sun Scale', {DefValue = 5, Min = 0, Max = 50, Step = 0.1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.sky.sunScale == value then 
                return 
            end 
            
            state.sky.sunScale = value 
            pendingDirty = true


        end)

        -- sunRotationX
        DebugGUI:Range('Sun Rotation X', {DefValue = 90, Min = 0, Max = 359, Step = 1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.outdoorLight.sunRotationX == value then 
                return 
            end 

            state.outdoorLight.sunRotationX = value 
            pendingDirty = true


        end)

        -- sunRotationX
        DebugGUI:Range('Sun Rotation Y', {DefValue = 0, Min = 0, Max = 359, Step = 1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.outdoorLight.sunRotationY == value then 
                return 
            end

            state.outdoorLight.sunRotationY = value 
            pendingDirty = true

        end)

        -- Sun Color Red
        DebugGUI:Range('Sun Color Red', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            R = value 
            
            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.outdoorLight.sunColor == Vec3(R, G, B) then 
                return 
            end

            state.outdoorLight.sunColor = Vec3(R, G, B)
            pendingDirty = true

        end)

        -- Sun Color Green
        DebugGUI:Range('Sun Color Green', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            G = value 

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.outdoorLight.sunColor == Vec3(R, G, B) then 
                return 
            end

            state.outdoorLight.sunColor = Vec3(R, G, B)
            pendingDirty = true

        end)

        -- Sun Color Blue
        DebugGUI:Range('Sun Color Blue', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            B = value

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.outdoorLight.sunColor == Vec3(R, G, B) then 
                return 
            end

            state.outdoorLight.sunColor = Vec3(R, G, B)
            pendingDirty = true
        
        end)

        --[[ Apply Sun Color Changes
        DebugGUI:Button('Apply Sun Color Change', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.outdoorLight.sunColor == Vec3(R, G, B) then 
                return 
            end

            state.outdoorLight.sunColor = Vec3(R, G, B)
            pendingDirty = true

        end)]]

        --[[DebugGUI:Checkbox('Sun Flare Enable', false, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.sunFlare.enable == value then 
                return 
            end

            state.sunFlare.enable = value 
            pendingDirty = true

        end)

        DebugGUI:Checkbox('Element 1 Enable', false, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.sunFlare.element1Enable == value then 
                return 
            end

            state.sunFlare.element1Enable = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Element 1 Ray Distance', {DefValue = 0.0, Min = 0.0, Max = 359, Step = 1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.sunFlare.element1RayDistance == value then 
                return 
            end

            state.sunFlare.element1RayDistance = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Element 1 Size', {DefValue = 0.0, Min = 0.0, Max = 10.0, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.sunFlare.element1Size == state.sunFlare.element1Size * value then 
                return 
            end

            state.sunFlare.element1Size = state.sunFlare.element1Size * value
            pendingDirty = true

        end)

        DebugGUI:Range('Element 1 Size Occluder Curve', {DefValue = 0.0, Min = 0.0, Max = 10.0, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.sunFlare.element1SizeOccluderCurve == state.sunFlare.element1SizeOccluderCurve * value then 
                return 
            end

            state.sunFlare.element1SizeOccluderCurve = state.sunFlare.element1SizeOccluderCurve * value 
            pendingDirty = true

        end)

        
        DebugGUI:Range('Element 1 Size Screen Position Curve', {DefValue = 0.0, Min = 0.0, Max = 10.0, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.sunFlare.element1SizeScreenPosCurve == state.sunFlare.element1SizeScreenPosCurve * value then 
                return 
            end

            state.sunFlare.element1SizeScreenPosCurve = state.sunFlare.element1SizeScreenPosCurve * value 
            pendingDirty = true

        end)

        DebugGUI:Range('Element 1 Alpha Occluder Curve', {DefValue = 0.0, Min = 0.0, Max = 10.0, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.sunFlare.element1AlphaOccluderCurve == state.sunFlare.element1AlphaOccluderCurve * value then 
                return 
            end

            state.sunFlare.element1AlphaOccluderCurve = state.sunFlare.element1AlphaOccluderCurve * value 
            pendingDirty = true

        end)

        
        DebugGUI:Range('Element 1 Alpha Screen Position Curve', {DefValue = 0.0, Min = 0.0, Max = 10.0, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.sunFlare.element1AlphaScreenPosCurve == state.sunFlare.element1AlphaScreenPosCurve * value then 
                return 
            end

            state.sunFlare.element1AlphaScreenPosCurve = state.sunFlare.element1AlphaScreenPosCurve * value 
            pendingDirty = true

        end)]]




        
    end)
    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Environment 
    DebugGUI:Folder("Environment", function ()
        -- Ground Color Red
        DebugGUI:Range('Ground Color Red', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            groundR = value 

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.outdoorLight.groundColor == Vec3(groundR, groundG, groundB) then 
                return 
            end

            state.outdoorLight.groundColor = Vec3(groundR, groundG, groundB)
            pendingDirty = true

        end)

        -- Ground Color Green
        DebugGUI:Range('Ground Color Green', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            groundG = value 

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.outdoorLight.groundColor == Vec3(groundR, groundG, groundB) then 
                return 
            end

            state.outdoorLight.groundColor = Vec3(groundR, groundG, groundB)
            pendingDirty = true

        end)

        -- Ground Color Blue
        DebugGUI:Range('Ground Color Blue', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            groundB = value

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.outdoorLight.groundColor == Vec3(groundR, groundG, groundB) then 
                return 
            end

            state.outdoorLight.groundColor = Vec3(groundR, groundG, groundB)
            pendingDirty = true
        
        end)

        --[[ Apply Ground Color Changes
        DebugGUI:Button('Apply Ground Color Change', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.outdoorLight.groundColor == Vec3(groundR, groundG, groundB) then 
                return 
            end

            state.outdoorLight.groundColor = Vec3(groundR, groundG, groundB)
            pendingDirty = true

        end)]]

        -- Sky Color Red
        DebugGUI:Range('Sky Color Red', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            skyColorR = value 

            if state.outdoorLight.skyColor == Vec3(skyColorR, skyColorG, skyColorB) then 
                return 
            end

            state.outdoorLight.skyColor = Vec3(skyColorR, skyColorG, skyColorB)
            pendingDirty = true

        end)

        -- Sky Color Green
        DebugGUI:Range('Sky Color Green', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            skyColorG = value 

            if state.outdoorLight.skyColor == Vec3(skyColorR, skyColorG, skyColorB) then 
                return 
            end

            state.outdoorLight.skyColor = Vec3(skyColorR, skyColorG, skyColorB)
            pendingDirty = true

        end)

        -- Sky Color Blue
        DebugGUI:Range('Sky Color Blue', {DefValue = 1, Min = 0, Max = 1, Step = 0.01}, function(value)

            skyColorB = value

            if state.outdoorLight.skyColor == Vec3(skyColorR, skyColorG, skyColorB) then 
                return 
            end

            state.outdoorLight.skyColor = Vec3(skyColorR, skyColorG, skyColorB)
            pendingDirty = true
        
        end)

        --[[ Apply Sky Color Changes
        DebugGUI:Button('Apply Sky Color Change', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.outdoorLight.skyColor == Vec3(skyColorR, skyColorG, skyColorB) then 
                return 
            end

            state.outdoorLight.skyColor = Vec3(skyColorR, skyColorG, skyColorB)
            pendingDirty = true

        end)]]

        -- Apply Moon Night Skybox
        DebugGUI:Checkbox('Apply Full Moon Skybox', false, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if value == true then 
                state.sky.panoramicTexture = TextureAsset(MoonNightSkybox)
            end

            pendingDirty = true

        end)

        -- Sky Light Angle Factor
        DebugGUI:Range('Sky Light Angle (broken)', {DefValue = 45, Min = 0, Max = 90, Step = 1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.outdoorLight.skyLightAngleFactor == value then 
                return 
            end

            state.outdoorLight.skyLightAngleFactor = value
        
        end)

    end)

    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Color Correction
    DebugGUI:Folder("Color Correction", function ()

        -- Apply Moon Night Skybox
        DebugGUI:Checkbox('Color Correction Enable', true, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if value == true then 
                state.colorCorrection.enable = value
            end

            pendingDirty = true

        end)

        -- Color Correction Brightness Red
        DebugGUI:Range('Brightness Red', {DefValue = 1.0, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            brightnessR = value 

            if state.colorCorrection.brightness == Vec3(brightnessR, brightnessG, brightnessB) then
                return 
            end

            state.colorCorrection.brightness = Vec3(brightnessR, brightnessG, brightnessB)
            pendingDirty = true

        end)

        -- Color Correction Brightness Green
        DebugGUI:Range('Brightness Green', {DefValue = 1.0, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            brightnessG = value 

            if state.colorCorrection.brightness == Vec3(brightnessR, brightnessG, brightnessB) then
                return 
            end

            state.colorCorrection.brightness = Vec3(brightnessR, brightnessG, brightnessB)
            pendingDirty = true

        end)

        -- Color Correction Brightness Blue
        DebugGUI:Range('Brightness Blue', {DefValue = 1, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            brightnessB = value

            if state.colorCorrection.brightness == Vec3(brightnessR, brightnessG, brightnessB) then
                return 
            end

            state.colorCorrection.brightness = Vec3(brightnessR, brightnessG, brightnessB)
            pendingDirty = true
        
        end)

        --═══════════════════════════════════════════════════════════════════════════════════════════════════--
        -- Color Correction Contrast Red
        DebugGUI:Range('Contrast Red', {DefValue = 1.0, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            contrastR = value 

            if state.colorCorrection.contrast == Vec3(contrastR, contrastG, contrastB) then
                return 
            end

            state.colorCorrection.contrast = Vec3(contrastR, contrastG, contrastB)
            pendingDirty = true

        end)

        -- Color Correction Contrast Green
        DebugGUI:Range('Contrast Green', {DefValue = 1.0, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            contrastG = value 

            if state.colorCorrection.contrast == Vec3(contrastR, contrastG, contrastB) then
                return 
            end

            state.colorCorrection.contrast = Vec3(contrastR, contrastG, contrastB)
            pendingDirty = true

        end)

        -- Color Correction Contrast Blue
        DebugGUI:Range('Contrast Blue', {DefValue = 1.0, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            contrastB = value

            if state.colorCorrection.contrast == Vec3(contrastR, contrastG, contrastB) then
                return 
            end

            state.colorCorrection.contrast = Vec3(contrastR, contrastG, contrastB)
            pendingDirty = true
        
        end)

        --═══════════════════════════════════════════════════════════════════════════════════════════════════--
        -- Color Correction Saturation Red
        DebugGUI:Range('Saturation Red', {DefValue = 1.0, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            saturationR = value 

            if state.colorCorrection.saturation == Vec3(saturationR, saturationG, saturationB) then
                return 
            end

            state.colorCorrection.saturation = Vec3(saturationR, saturationG, saturationB)
            pendingDirty = true

        end)

        -- Color Correction Saturation Green
        DebugGUI:Range('Saturation Green', {DefValue = 1.0, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            saturationG = value 

            if state.colorCorrection.saturation == Vec3(saturationR, saturationG, saturationB) then
                return 
            end

            state.colorCorrection.saturation = Vec3(saturationR, saturationG, saturationB)
            pendingDirty = true

        end)

        -- Color Correction Saturation Blue
        DebugGUI:Range('Saturation Blue', {DefValue = 1.0, Min = 0.0, Max = 1.5, Step = 0.01}, function(value)

            saturationB = value

            if state.colorCorrection.saturation == Vec3(saturationR, saturationG, saturationB) then
                return 
            end

            state.colorCorrection.saturation = Vec3(saturationR, saturationG, saturationB)
            pendingDirty = true

        end)

        --[[ Apply Color Correction Changes
        DebugGUI:Button('Apply Color Correction Change', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end
            
            state.colorCorrection.brightness = Vec3(brightnessR, brightnessG, brightnessB)
            state.colorCorrection.contrast = Vec3(contrastR, contrastG, contrastB)
            state.colorCorrection.saturation = Vec3(saturationR, saturationG, saturationB)
            state.colorCorrection.enable = true
            pendingDirty = true

        end)]]
    end)

    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Tonemap
    DebugGUI:Folder("Tonemap", function ()

        DebugGUI:Range('Method', {DefValue = 2.0, Min = 0.0, Max = 3.0, Step = 1.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.tonemap.tonemapMethod == value then 
                return 
            end

            state.tonemap.tonemapMethod = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Minimum Exposure (broken)', {DefValue = 0.0, Min = 0.0, Max = 10.0, Step = 0.1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.tonemap.minExposure == value then 
                return 
            end

            state.tonemap.minExposure = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Maximum Exposure (broken)', {DefValue = 1.0, Min = 0.0, Max = 10.0, Step = 0.1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.tonemap.maxExposure == value then 
                return 
            end

            state.tonemap.maxExposure = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Middle Gray (broken)', {DefValue = 1.0, Min = 0.0, Max = 10.0, Step = 0.1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.tonemap.middleGray == value then 
                return 
            end

            state.tonemap.middleGray = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Exposure Adjust Time (broken)', {DefValue = 1.0, Min = 0.0, Max = 50.0, Step = 0.1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.tonemap.exposureAdjustTime == value then 
                return 
            end

            state.tonemap.exposureAdjustTime = value 
            pendingDirty = true

        end)
        
        -- Bloom Scale Red
        DebugGUI:Range('Bloom Scale Red', {DefValue = 0.2, Min = 0.0, Max = 5.0, Step = 0.05}, function(value)

            bloomR = value 

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.tonemap.bloomScale == Vec3(bloomR, bloomG, bloomB) then 
                return 
            end

            state.tonemap.bloomScale = Vec3(bloomR, bloomG, bloomB)
            pendingDirty = true

        end)

        -- Bloom Scale Green
        DebugGUI:Range('Bloom Scale Green', {DefValue = 0.2, Min = 0.0, Max = 5.0, Step = 0.05}, function(value)

            bloomG = value 

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.tonemap.bloomScale == Vec3(bloomR, bloomG, bloomB) then 
                return 
            end

            state.tonemap.bloomScale = Vec3(bloomR, bloomG, bloomB)
            pendingDirty = true

        end)

        -- Bloom Scale Blue
        DebugGUI:Range('Bloom Scale Blue', {DefValue = 0.2, Min = 0.0, Max = 5, Step = 0.05}, function(value)

            bloomB = value

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.tonemap.bloomScale == Vec3(bloomR, bloomG, bloomB) then 
                return 
            end

            state.tonemap.bloomScale = Vec3(bloomR, bloomG, bloomB)
            pendingDirty = true
        
        end)

        --[[ Apply Bloom Scale Changes
        DebugGUI:Button('Apply Bloom Change', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.tonemap.bloomScale == Vec3(bloomR, bloomG, bloomB) then 
                return 
            end

            state.tonemap.bloomScale = Vec3(bloomR, bloomG, bloomB)
            pendingDirty = true

        end)]]


    end)


    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Fog
    DebugGUI:Folder("Fog", function ()

        
        DebugGUI:Range('Fog Start', {DefValue = 0.0, Min = -100.0, Max = 10000.0, Step = 10.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.fog.start == value then 
                return 
            end

            state.fog.start = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Fog End', {DefValue = 5000.0, Min = 0.0, Max = 15000.0, Step = 10.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.fog.endValue == value then 
                return 
            end

            state.fog.endValue = value           
            pendingDirty = true

        end)

        DebugGUI:Range('Fog Distance Multiplier (broken)', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.2}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.fog.fogDistanceMultiplier == value then 
                return 
            end

            state.fog.fogDistanceMultiplier = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Fog Transparency Fade Start', {DefValue = 25.0, Min = 0.0, Max = 1000.0, Step = 1.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.fog.transparencyFadeStart == value then 
                return 
            end

            state.fog.transparencyFadeStart = value
            pendingDirty = true

        end)

        DebugGUI:Range('Transparency Fade Clamp', {DefValue = 1.0, Min = 0.0, Max = 1.0, Step = 0.1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.fog.transparencyFadeClamp == value then 
                return 
            end

            state.fog.transparencyFadeClamp = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Transparency Fade End', {DefValue = 100.0, Min = 1.0, Max = 5000.0, Step = 1.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.fog.transparencyFadeEnd == value then 
                return 
            end

            state.fog.transparencyFadeEnd = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Fog Color Start', {DefValue = 0.0, Min = 0.0, Max = 5000.0, Step = 10.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.fog.fogColorStart == value then 
                return 
            end

            state.fog.fogColorStart = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Fog Color End', {DefValue = 10000.0, Min = 0.0, Max = 20000.0, Step = 10.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.fog.fogColorEnd == value then 
                return 
            end

            state.fog.fogColorEnd = value 
            pendingDirty = true

        end)

        -- Fog Color Red
        DebugGUI:Range('Fog Color Red', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            FogR = value 

            if state.fog.fogColor == Vec3(FogR, FogG, FogB) then 
                return 
            end

            state.fog.fogColor = Vec3(FogR, FogG, FogB)
            pendingDirty = true

        end)

        -- Fog Color Green
        DebugGUI:Range('Fog Color Green', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            FogG = value 

            if state.fog.fogColor == Vec3(FogR, FogG, FogB) then 
                return 
            end

            state.fog.fogColor = Vec3(FogR, FogG, FogB)
            pendingDirty = true

        end)

        -- Fog Color Blue
        DebugGUI:Range('Fog Color Blue', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            FogB = value

            if state.fog.fogColor == Vec3(FogR, FogG, FogB) then 
                return 
            end

            state.fog.fogColor = Vec3(FogR, FogG, FogB)
            pendingDirty = true
        
        end)

        --[[ Fog Color Scale Changes
        DebugGUI:Button('Apply Fog Color Change', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.fog.fogColor == Vec3(FogR, FogG, FogB) then 
                return 
            end

            state.fog.fogColor = Vec3(FogR, FogG, FogB)
            pendingDirty = true

        end)]]

    end)

    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Wind
    DebugGUI:Folder("Wind", function ()    

        DebugGUI:Range('Wind Direction', {DefValue = 0.0, Min = 0.0, Max = 359, Step = 1.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.wind.windDirection == value then 
                return 
            end

            state.wind.windDirection = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Wind Strength', {DefValue = 1.0, Min = 0.0, Max = 10.0, Step = 0.5}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.wind.windStrength == value then 
                return 
            end

            state.wind.windStrength = value 
            pendingDirty = true

        end)
        
    end)

    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Depth of Field
    DebugGUI:Folder("Depth of Field", function ()    

        DebugGUI:Checkbox('DoF Enable', false, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.dof.enable == value then 
                return 
            end

            state.dof.enable = value 
            state.dof.blurFilter = 6
            pendingDirty = true

        end)

        --[[DebugGUI:Range('Blur Filter', {DefValue = 0, Min = 0, Max = 6, Step = 1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.dof.blurFilter = value 
            pendingDirty = true

        end)]]

        DebugGUI:Range('Scale', {DefValue = 100.0, Min = 0.0, Max = 500.0, Step = 1.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.dof.scale == value then 
                return 
            end

            state.dof.scale = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Near Distance Scale', {DefValue = 0.0, Min = 0.0, Max = 1.0, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end
       
            if state.dof.nearDistanceScale == value then 
                return 
            end

            state.dof.nearDistanceScale = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Far Distance Scale', {DefValue = 0.1, Min = 0.0, Max = 1.0, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.dof.farDistanceScale == value then 
                return 
            end

            state.dof.farDistanceScale = value 
            pendingDirty = true

        end)

        
        DebugGUI:Range('Focus Distance', {DefValue = 50.0, Min = 0.0, Max = 1000.0, Step = 1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.dof.focusDistance == value then 
                return 
            end

            Tool:DebugPrint(value)
            Tool:DebugPrint(state.dof.focusDistance)

            state.dof.focusDistance = value
            pendingDirty = true

        end)

        DebugGUI:Range('Add Blur', {DefValue = 0.0, Min = 0.0, Max = 1.0, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.dof.blurAdd == value then 
                return 
            end

            state.dof.blurAdd = value 
            pendingDirty = true

        end)

        DebugGUI:Checkbox('DoF Diffusion Enable', false, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            state.dof.diffusionDofEnable = value 
            pendingDirty = true

        end)

        DebugGUI:Range('DoF Diffusion Aperture (broken)', {DefValue = 1.0, Min = 0.6, Max = 20.0, Step = 0.2}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.dof.diffusionDofAperture == value then 
                return 
            end

            state.dof.diffusionDofAperture = value 
            pendingDirty = true

        end)

        DebugGUI:Range('DoF Diffusion Focal Length (broken)', {DefValue = 1.0, Min = 10.0, Max = 135.0, Step = 1.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.dof.diffusionDofFocalLength == value then 
                return 
            end

            state.dof.diffusionDofFocalLength = value 
            pendingDirty = true

        end)

    end)

    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Vignette
    DebugGUI:Folder("Vignette", function ()    

        DebugGUI:Checkbox('Vignette Enable', false, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.vignette.enable == value then 
                return 
            end

            state.vignette.enable = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Vignette Opacity', {DefValue = 1.0, Min = 0.0, Max = 1.0, Step = 0.1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.vignette.opacity == value then 
                return 
            end

            state.vignette.opacity = value 
            pendingDirty = true

        end)

        
        DebugGUI:Range('Vignette Exponent', {DefValue = 1.0, Min = 0.0, Max = 1.0, Step = 0.1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.vignette.exponent == value then 
                return 
            end

            state.vignette.exponent = value 
            pendingDirty = true

        end)


        -- Vignette Scale X
        DebugGUI:Range('Vignette Scale X', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            vignetteScaleX = value
            
            if state.vignette.scale == Vec2(vignetteScaleX, vignetteScaleY) then 
                return 
            end

            state.vignette.scale = Vec2(vignetteScaleX, vignetteScaleY)
            pendingDirty = true

        end)

        -- Vignette Scale Y
        DebugGUI:Range('Vignette Scale Y', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            vignetteScaleY = value 

            if state.vignette.scale == Vec2(vignetteScaleX, vignetteScaleY) then 
                return 
            end

            state.vignette.scale = Vec2(vignetteScaleX, vignetteScaleY)
            pendingDirty = true

        end)

        --[[ Apply Vignette Scale Changes
        DebugGUI:Button('Apply Vignette Scale', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.vignette.scale == Vec2(vignetteScaleX, vignetteScaleY) then 
                return 
            end

            state.vignette.scale = Vec2(vignetteScaleX, vignetteScaleY)
            pendingDirty = true

        end)]]

    end)
    
    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Character Lighting
    DebugGUI:Folder('Character Lighting (currently broken)', function ()

        DebugGUI:Checkbox('Character Lighting Enable', false, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.characterLighting.characterLightEnable == value then 
                return 
            end

            state.characterLighting.characterLightEnable = value 
            pendingDirty = true

        end)

        DebugGUI:Checkbox('First Person Enable', true, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.characterLighting.firstPersonEnable == value then 
                return 
            end

            state.characterLighting.firstPersonEnable = value
            pendingDirty = true

        end)

        DebugGUI:Range('Character Lighting Mode', {DefValue = 0.0, Min = 0.0, Max = 1.0, Step = 1.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.characterLighting.characterLightingMode == value then 
                return 
            end

            state.characterLighting.characterLightingMode = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Blend Factor [In Mode 1]', {DefValue = 0.0, Min = 0.0, Max = 1.0, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.characterLighting.blendFactor == value then 
                return 
            end

            state.characterLighting.blendFactor = value 
            pendingDirty = true

        end)

        DebugGUI:Checkbox('Lock to Camera Direction', true, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.characterLighting.lockToCameraDirection == value then 
                return 
            end

            state.characterLighting.lockToCameraDirection = value 
            pendingDirty = true

        end)

        
        DebugGUI:Range('Camera Up Rotation', {DefValue = 90.0, Min = 0.0, Max = 180.0, Step = 1.0}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.characterLighting.cameraUpRotation == value then 
                return 
            end

            state.characterLighting.cameraUpRotation = value 
            pendingDirty = true

        end)

        -- Top Character Light Red
        DebugGUI:Range('Top Character Lighting Red', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            topCLR = value 

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.characterLighting.topLight == value then 
                return 
            end

            state.characterLighting.topLight = Vec3(topCLR, topCLG, topCLB)
            pendingDirty = true
            

        end)

        -- Top Character Light Green
        DebugGUI:Range('Top Character Lighting Green', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            topCLG = value 

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.characterLighting.topLight == value then 
                return 
            end

            state.characterLighting.topLight = Vec3(topCLR, topCLG, topCLB)
            pendingDirty = true

        end)

        -- Top Character Light Blue
        DebugGUI:Range('Top Character Lighting Blue', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            topCLB = value

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.characterLighting.topLight == value then 
                return 
            end

            state.characterLighting.topLight = Vec3(topCLR, topCLG, topCLB)
            pendingDirty = true
        
        end)

        --[[ Apply Top Character Light
        DebugGUI:Button('Apply Top Character Lighting', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.characterLighting.topLight == value then 
                return 
            end

            state.characterLighting.topLight = Vec3(topCLR, topCLG, topCLB)
            pendingDirty = true

        end)]]

        DebugGUI:Range('Top Light Direction X', {DefValue = 0.0, Min = 0.0, Max = 360.0, Step = 1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.characterLighting.topLightDirX == value then 
                return 
            end

            state.characterLighting.topLightDirX = value 
            pendingDirty = true

        end)

        DebugGUI:Range('Top Light Direction Y', {DefValue = 50.0, Min = 0.0, Max = 180.0, Step = 1}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.characterLighting.topLightDirY == value then 
                return 
            end

            state.characterLighting.topLightDirY = value 
            pendingDirty = true

        end)

        -- Bottom Character Light Red
        DebugGUI:Range('Bottom Character Lighting Red', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            botCLR = value 

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.characterLighting.bottomLight == value then 
                return 
            end

            state.characterLighting.bottomLight = Vec3(botCLR, botCLG, botCLB)
            pendingDirty = true

        end)

        -- Bottom Character Light Green
        DebugGUI:Range('Bottom Character Lighting Green', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            botCLG = value 

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.characterLighting.bottomLight == value then 
                return 
            end

            state.characterLighting.bottomLight = Vec3(botCLR, botCLG, botCLB)
            pendingDirty = true

        end)

        -- Bottom Character Light Blue
        DebugGUI:Range('Bottom Character Lighting Blue', {DefValue = 1.0, Min = 0.0, Max = 5.0, Step = 0.1}, function(value)

            botCLB = value

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.characterLighting.bottomLight == value then 
                return 
            end

            state.characterLighting.bottomLight = Vec3(botCLR, botCLG, botCLB)
            pendingDirty = true
        
        end)

        --[[ Apply Bottom Character Light
        DebugGUI:Button('Apply Bottom Character Lighting', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.characterLighting.bottomLight == value then 
                return 
            end

            state.characterLighting.bottomLight = Vec3(botCLR, botCLG, botCLB)
            pendingDirty = true

        end)]]

    end)

    --══════════════════════════════════════════════════════════════════════════════════════════════════════--
    -- Utilities
    DebugGUI:Folder("Utilities", function ()  

        -- Save Settings As Preset
        DebugGUI:Text('(WIP) Presetname', 'New Preset', function(PresetName)

            presetname = PresetName 

        end)

        DebugGUI:Range('Preset Visibility', {DefValue = 1.0, Min = 0.0, Max = 1.0, Step = 0.01}, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.visibility == value then 
                return 
            end 

            state.visibility = value 
            pendingDirty = true

        end)

        DebugGUI:Number('Preset Priority', 999999, function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            if state.priority == value then 
                return 
            end 

            state.priority = value 
            pendingDirty = true

        end)

        DebugGUI:Button('(WIP) Save Preset', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            NetEvents:Send('Cinetools:Save', presetname, state)

        end)

        DebugGUI:Button('(WIP) Load Preset', function(value)

            playerObject = PlayerManager:GetLocalPlayer()

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

            NetEvents:Send('Cinetools:Load', presetname, player)

        end)

        DebugGUI:Button('(WIP) Sync with other Players', function(value)

            --playerObject = PlayerManager:GetLocalPlayer()


            local preset = Tool:GetVisualEnvironmentState(999999)

            local stateTable = {}
            local blacklist = { "TextureAsset", "SurfaceShaderBaseAsset", "BlurFilter"} 

            for _, type in preset do 

                    if(type(type) == "table") then
                        for index,component in pairs(type) do
                            for k,variable in pairs(component) do
                                if not Tool:FindInArray(blacklist, type(variable)) then
                                    table.insert(stateTable, variable)
                                end
                            end
                        end
                    else
                        if(not Tool:FindInArray(blacklist, type(type))) then
                            table.insert(stateTable, variable)
                        end
                    end

            end

            print(stateTable)

            --NetEvents:Send('Cinetools:Sync', stateTable)

        end)

        DebugGUI:Button('(WIP) Reset All', function(value)

            if state == nil then
                state = Tool:GetVisualEnvironmentState(999999)
            end

        end)

    end)


end



NetEvents:Subscribe('Cinetools:SyncServer', function(clientState)

    if state == nil then
        state = Tool:GetVisualEnvironmentState(999999)
    end

    if clientState == nil then
        Tool:DebugPrint("[ERROR] Received clientState is nil!", "error")
    end

    if state == clientState[1] then 
        return 
    end

    Tool:DebugPrint('Got State from Server:' .. clientState[1], 'cinetools')

    state = clientState[1]

end)


NetEvents:Subscribe('Cinetools:LoadClient', function(loadedPreset)

    if state == nil then 
        state = Tool:GetVisualEnvironmentState(999999)
    end

    if state == loadedPreset then 
        return 
    end

    state = loadedPreset 

end)
