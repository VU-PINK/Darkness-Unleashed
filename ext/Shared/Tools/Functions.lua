---@param p_Table table
---@param p_Value any
local function hasValue(p_Table, p_Value)
    for _, l_Value in ipairs(p_Table) do
        if l_Value == p_Value then
            return true
        end
    end

    return false
end

return hasValue