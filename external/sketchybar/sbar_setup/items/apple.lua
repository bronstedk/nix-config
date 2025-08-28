local icons = require("sbar_setup.icons")
local colors = require("sbar_setup.colors")

local popup_toggle = "sketchybar --set $NAME popup.drawing=toggle"

local apple_logo = sbar.add("item", {
    padding_right = 15,
    click_script = popup_toggle,
    icon = {
        string = icons.apple,
        font = {
            style = "Black",
            size = 16.0,
        },
        color = colors.accentColor,
    },
    label = {
        drawing = false,
    },
    popup = {
        height = 35,
    }
})

apple_logo:subscribe("change_mode", function(env)
    local icon = icons.apple
    if env.MODE == "service" then
        icon = icons.service
    elseif env.MODE == "resize" then
        icon = icons.resize
    end

    apple_logo:set({
        icon = {
            string = icon
        }
    })
end)

local apple_prefs = sbar.add("item", {
    position = "popup." .. apple_logo.name,
    icon = icons.preferences,
    label = "Preferences",
})

apple_prefs:subscribe("mouse.clicked", function(_)
    sbar.exec("open -a 'System Preferences'")
    apple_logo:set({ popup = { drawing = false } })
end)
