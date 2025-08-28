local colors = require("sbar_setup.colors")
local icons = require("sbar_setup.icons")

local volumeSlider = sbar.add("slider", 100, {
    position = "right",
    updates = true,
    padding_right = 0,
    padding_left = 0,
    label = { drawing = false },
    icon = { drawing = false },
    slider = {
        highlight_color = colors.accentColor,
        width = 0,
        background = {
            height = 6,
            corner_radius = 3,
            color = colors.itemBGColor,
        },
        knob = {
            string = " ",
            drawing = false,
        }
    }
})

local volumeIcon = sbar.add("item", {
    position = "right",
    icon = {
        string = icons.volume._100,
        align = "left",
        color = colors.accentColor,
        font = {
            style = "Regular",
            size = 14.0,
        }
    },
    label = {
        align = "left",
        font = {
            style = "Regular",
            size = 14.0,
        }
    },
    background = {
        color = colors.itemBGColor,
    }
})

volumeSlider:subscribe("mouse.clicked", function(env)
    sbar.exec("osascript -e 'set volume output volume " .. env["PERCENTAGE"] .. "'")
end)

volumeSlider:subscribe("volume_change", function(env)
    local volume = tonumber(env.INFO)
    local icon = icons.volume._0

    if volume > 59 then
        icon = icons.volume._100
    elseif volume > 29 then
        icon = icons.volume._59
    elseif volume > 0 then
        icon = icons.volume._29
    end

    volumeIcon:set({
        icon = { string = icon },
        label = { string = volume .. "%" }
    })
    volumeSlider:set({ slider = { percentage = volume } })
end)

local function animateSliderWidth(width)
    sbar.animate("tanh", 30.0, function()
        volumeSlider:set({ slider = { width = width } })
    end)
end

volumeIcon:subscribe("mouse.clicked", function()
    if tonumber(volumeSlider:query().slider.width) > 0 then
        animateSliderWidth(0)
    else
        animateSliderWidth(100)
    end
end)
