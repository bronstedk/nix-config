local colors = require("sbar_setup.colors")

sbar.bar({
    height = 40,
    color = colors.barColor,
    border_color = colors.barColor,
    shadow = true,
    sticky = true,
    padding_right = 10,
    padding_left = 10,
    blur_radius = 20,
    topmost = "window",
})
