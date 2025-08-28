local colors = require("sbar_setup.colors")

local whitelist = {
    ["Spotify"] = true,
    ["Music"] = true
};

local media = sbar.add("item", {
    icon = {
        drawing = false,
        color = colors.accentColor
    },
    background = {
        color = colors.itemBGColor,
        drawing = false,
    },
    drawing = false,
    position = "q",
    updates = true,
})

media:subscribe("media_change", function(env)
    if not whitelist[env.INFO.app] then
        return
    end

    local drw = false
    if env.INFO.state == "playing" then
        drw = true
    end

    media:set({
        icon = {
            string = icon_map(env.INFO.app),
            drawing = drw,
        },
        drawing = drw,
        label = { string = env.INFO.artist .. ": " .. env.INFO.title },
        background = {
            drawing = drw,
        },
    })
end)
