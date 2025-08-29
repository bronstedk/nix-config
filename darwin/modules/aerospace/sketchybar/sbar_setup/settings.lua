local colors = require("sbar_setup.colors")

return {
    icon = {
        font = {
            name = "SF Pro",
            weight = "Semibold",
            size = 15.0,
        },
        color = colors.white,
    },
    label = {
        font = {
            name = "SF Pro",
            weight = "Semibold",
            size = 15.0,
        },
        color = colors.white,
        padding_left = 4,
        padding_right = 10,
    },
    background = {
        color = colors.itemBGColor,
        corner_radius = 5,
        height = 24,
        border_width = 0,
    },
    padding_left = 5,
    padding_right = 5,
}
