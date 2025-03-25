-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action
-- This is where you actually apply your config choices
local mods = "CTRL | ALT"
config = {

	window_background_opacity = 1,
	enable_tab_bar = false,
	inactive_pane_hsb = {
		saturation = 0.75,
		brightness = 0.45,
	},
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	background = {
		{
			source = {
				Color = "#02051F",
			},
			width = "100%",
			height = "100%",
			opacity = 0.75,
		},
	},
	-- For example, changing the color scheme:
	color_scheme = "Tokio Night",
	font = wezterm.font("RecMonoLinear Nerd Font Mono"),
	font_size = 16.0,
	line_height = 1.25,

	-- leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		-- Pane config
		{ key = "v", mods = mods, action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "z", mods = mods, action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = mods, action = act.ActivatePaneDirection("Left") },
		{ key = "t", mods = mods, action = act.ActivatePaneDirection("Down") },
		{ key = "n", mods = mods, action = act.ActivatePaneDirection("Up") },
		{ key = "s", mods = mods, action = act.ActivatePaneDirection("Right") },
		{ key = "w", mods = mods, action = act.CloseCurrentPane({ confirm = true }) },
	},
}
-- and finally, return the configuration to wezterm
return config
