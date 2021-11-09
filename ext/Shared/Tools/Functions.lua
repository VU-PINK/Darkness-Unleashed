class('Functions')

function Functions:has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

if g_Functions == nil then
    g_Functions = Functions()
end

return g_Functions