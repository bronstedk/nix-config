local colors = require("sbar_setup.colors")

local function mouseClick(env)
	if env.BUTTON == "right" then
		sbar.exec("aerospace move-workspace-to-monitor --workspace " .. env.NAME .. "--wrap-around next")
	else
		sbar.exec("aerospace workspace " .. env.NAME)
	end
end

local function updateSpace(spaceChosen, isOld)
	local colorsChosen
	if isOld then
		colorsChosen = {
			text = colors.accentColor,
			background = colors.itemBGColor,
		}
	else
		colorsChosen = {
			text = colors.barColor,
			background = colors.accentColor,
		}
	end

	local windows = GetWindows(spaceChosen)

	sbar.set(spaceChosen .. " ", {
		icon = {
			color = colorsChosen.text,
		},
		label = {
			string = windows,
			color = colorsChosen.text,
		},
		background = {
			color = colorsChosen.background,
		},
	})
end

local function spaceSelection(env)
	if env.SENDER == "workspace_move" then
		env.FOCUSED_WORKSPACE = GetCurrentSpace()
	end
	updateSpace(env.PREV_WORKSPACE, true)
	updateSpace(env.FOCUSED_WORKSPACE, false)
end

local function updateWindows(_)
	local spacesWithNames = GetSpacesWithApps()
	local currSpace = GetCurrentSpace()

	for _, space in ipairs(spacesWithNames) do
		if space == currSpace then
			updateSpace(space, false)
		else
			updateSpace(space, true)
		end
	end
end

local tempSpaces = GetWorkspaces()
local spaces = {}

for i, spaceID in ipairs(tempSpaces) do
	local space = sbar.add("space", spaceID .. " ", {
		ignore_association = "on",
		space = 0,
		icon = {
			string = spaceID .. " ",
			padding_left = 10,
			padding_right = 10,
			color = colors.white,
			highlight = colors.barColor,
		},
		padding_left = 2,
		padding_right = 2,
		label = {
			padding_right = 20,
			color = colors.white,
			highlight_color = colors.barColor,
			font = "sketchybar-app-font:Regular:16.0",
			y_offset = -1,
		},
		background = {
			color = colors.itemBGColor,
		},
	})
	space:subscribe("mouse.clicked", mouseClick)
	space:set({
		label = {
			string = GetWindows(spaceID),
		},
	})

	space[i] = space.name
end

local sep = sbar.add("bracket", spaces, {
	background = {
		color = colors.accentColor,
		border_color = colors.accentColor,
	},
})
sep:subscribe("aerospace_workspace_change", spaceSelection)
sep:subscribe("space_windows_change", updateWindows)

local something = sbar.add("item", {
	padding_left = 10,
	padding_right = 8,
	icon = {
		string = "􀆊",
		font = {
			style = "Heavy",
			size = 16.0,
		},
	},
	label = { drawing = false },
	associated_display = "active",
})
something:subscribe("workspace_move", spaceSelection)
