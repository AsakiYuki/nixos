local function inspectTable(t)
    local outStr = ""
    for k, v in pairs(t) do
        outStr = outStr .. tostring(k) .. " = " .. tostring(v) .. "\n"
    end
    return outStr
end