local colors = require("sbar_setup.colors")

local cal = sbar.add("item", {
    icon = {
        drawing = false,
    },
    label = {
        align = "right",
        font = {
            style = "Regular",
            size = 14.0,
        }
    },
    position = "right",
    update_freq = 15,
    background = {
        color = colors.itemBGColor,
    }
})

local function update()
    local date = os.date("%a. %d %b.")
    local time = os.date("%I:%M %p")
    cal:set({ label = { string = date .. "  " .. time } })
end

cal:subscribe("routine", update)
cal:subscribe("forced", update)
