local colors = require("sbar_setup.colors")

local frontApp = sbar.add("item", {
	icon = {
		font = "sketchybar-app-font:Regular:16.0",
	},
	label = {
		font = {
			style = "Black",
			size = 12.0,
		},
	},
	display = "active",
	background = {
		color = colors.itemBGColor,
	},
})

frontApp:subscribe("front_app_switched", function(env)
	frontApp:set({
		icon = {
			string = icon_map(env.INFO),
		},
		label = {
			string = env.INFO,
		},
	})
end)

local spacePerMonitor = sbar.add("item", {
	icon = {
		string = "*1 | 3",
	},
	label = {
		drawing = false,
	},
	background = {
		color = colors.itemBGColor,
	},
})

Item = sbar.add("item", {
	label = {
		drawing = true,
	},
})

local function monitorSpaces(env)
	local res = MonitorWithSpace()

	spacePerMonitor:set({
		icon = {
			string = res,
		},
	})
end

spacePerMonitor:subscribe("aerospace_workspace_change", monitorSpaces)
spacePerMonitor:subscribe("forced", monitorSpaces)
