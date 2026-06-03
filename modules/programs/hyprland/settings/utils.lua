function InspectTable(t)
    if (type(t) ~= "table") then return "" end

    local outStr = ""
    for k, v in pairs(t) do
        outStr = outStr .. tostring(k) .. " = " .. tostring(v) .. "\n"
    end
    return outStr
end