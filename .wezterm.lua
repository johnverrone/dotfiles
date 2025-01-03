-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Vs Code Dark+ (Gogh)"
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.font_size = 14
config.use_cap_height_to_scale_fallback_fonts = true

-- disabled ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CMD",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

-- and finally, return the configuration to wezterm
return config
