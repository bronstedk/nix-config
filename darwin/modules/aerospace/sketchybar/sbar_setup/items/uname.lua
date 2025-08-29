local settings = require("sbar_setup.settings")
local colors = require("sbar_setup.colors")

local uname = sbar.add("item", {
    position = "right",
    icon = { drawing = false },
    label = {
        string = os.getenv("USER"),
        font = {
            style = "Regular",
            size = 14.0,
        },
        padding_left = 10,
        align = "center",
    },
    background = {
        color = colors.itemBGColor,
    }
})
