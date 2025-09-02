{ ... }: {
	programs.wezterm = {
		enable = true;
		enableBashIntegration = true;
		enableZshIntegration = true;

		extraConfig = ''
-- Pull in the wezterm API
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

-- This is where you actually apply your config choices
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 19

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.keys = {
	{
		key = "n",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "n",
		mods = "SHIFT|CMD",
		action = wezterm.action.SpawnWindow,
	},
	{
		key = "w",
		mods = "CMD",
		action = act.CloseCurrentPane({ confirm = true }),
	},
}

-- and finally, return the configuration to wezterm
return config
'';
	};
}
