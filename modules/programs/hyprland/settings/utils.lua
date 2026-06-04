function InspectTable(t)
    if (type(t) ~= "table") then return "" end

    local outStr = ""
    for k, v in pairs(t) do
        outStr = outStr .. tostring(k) .. " = " .. tostring(v) .. "\n"
    end
    return outStr
end

function TouchpadToggle(value)
    if (TouchpadName == nil) then return hl.notification.create({
        text = "No touchpad input defined for this device",
        timeout = 5000,
    }) end

    hl.device({
        name = TouchpadName,
        enabled = value,
    })
end