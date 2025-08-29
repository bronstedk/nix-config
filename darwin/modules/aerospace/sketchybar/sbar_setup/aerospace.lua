function GetWorkspaces()
	local workspaces = RunCommand("aerospace list-workspaces --all")
	local strList = Split(workspaces, "\n")
	local spaces = {}

	for i, space in ipairs(strList) do
		spaces[i] = tonumber(space)
	end
	return spaces
end

function GetCurrentSpace()
	local cmd = RunCommand("aerospace list-workspaces --focused")
	local trimmed = string.gsub(cmd, "^%s*(.-)%s*$", "%1")
	return trimmed
end

function GetWindows(workspace)
	local cmd = RunCommand("aerospace list-windows --workspace " .. workspace .. " --format %{app-name}")
	cmd = Split(cmd, "\n")
	cmd = Deduplicate(cmd)

	local name = ""
	for _, app in ipairs(cmd) do
		local icon = icon_map(app)
		name = name .. " " .. icon
	end
	return name
end

function GetSpacesWithApps()
	local cmd = RunCommand("aerospace list-windows --monitor all --format %{workspace}")
	cmd = Split(cmd, "\n")
	cmd = Deduplicate(cmd)

	return cmd
end

function MonitorWithSpace()
	local monitors = Split(RunCommand("aerospace list-monitors --format %{monitor-id}"), "\n")

	local res = ""
	for i, monitor in ipairs(monitors) do
		local cmd = RunCommand("aerospace list-workspaces --monitor " .. monitor .. " --visible")
		local trimmed = string.gsub(cmd, "^%s*(.-)%s*$", "%1")
		local curr = GetCurrentSpace()

		if i ~= 1 then
			res = res .. " | "
		end

		if curr == trimmed then
			res = res .. "*" .. curr
		else
			res = res .. trimmed
		end
	end
	res = res .. " "

	return res
end
