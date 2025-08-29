local icons = require("sbar_setup.icons")
local colors = require("sbar_setup.colors")

local battery = sbar.add("item", {
    position = "right",
    icon = {
        font = {
            style = "Regular",
            size = 14.0,
        }
    },
    label = {
        font = {
            style = "Regular",
            size = 14.0,
        }
    },
    background = {
        color = colors.itemBGColor,
    },
    update_freq = 120,
})

local function batteryUpdate()
    sbar.exec("pmset -g batt", function(battInfo)
        local icon
        local label = ""

        local found, _, charge = battInfo:find("(%d+)%%")
        if found then
            charge = tonumber(charge)
            label = charge .. "%"
        end

        if not found then
            icon = icons.battery._9
            battery:set({
                icon = icon,
                label = {
                    string = "Unknown"
                }
            })
            return
        end

        if (string.find(battInfo, 'AC Power')) then
            icon = icons.battery.charging
        else
            if charge > 89 then
                icon = icons.battery._100
            elseif charge > 59 then
                icon = icons.battery._89
            elseif charge > 29 then
                icon = icons.battery._59
            elseif charge > 9 then
                icon = icons.battery._29
            else
                icon = icons.battery._9
            end
        end

        battery:set({
            icon = icon,
            label = {
                string = label
            }
        })
    end)
end

battery:subscribe({ "routine", "power_source_change", "system_woke" }, batteryUpdate)
