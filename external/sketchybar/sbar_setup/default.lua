local settings = require("sbar_setup.settings")
local colors = require("sbar_setup.colors")

sbar.default({
    updates = "when_shown",
    icon = {
        font = {
            family = settings.icon.font.name,
            style = settings.icon.font.weight,
            size = settings.icon.font.size,
        },
        color = settings.icon.color,
        padding_left = settings.padding_left,
        padding_right = settings.padding_right,
    },
    label = {
        font = {
            family = settings.label.font.name,
            style = settings.label.font.weight,
            size = settings.label.font.size,
        },
        color = settings.label.color,
        padding_left = settings.label.padding_left,
        padding_right = settings.label.padding_right,
    },
    background = {
        height = settings.background.height,
        corner_radius = settings.background.corner_radius,
        border_width = settings.background.border_width,
    },
    popup = {
        background = {
            border_width = 0,
            corner_radius = 9,
            border_color = colors.accentColor,
            color = colors.itemBGColor,
            shadow = { drawing = true },
        },
        blur_radius = 20,
    },
    padding_left = settings.padding_left,
    padding_right = settings.padding_right,
})
