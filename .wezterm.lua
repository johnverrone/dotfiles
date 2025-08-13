-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

config.font = wezterm.font("Maple Mono NF", { weight = "Regular" })
config.color_scheme = "Vs Code Dark+ (Gogh)"
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.font_size = 14
config.use_cap_height_to_scale_fallback_fonts = true

-- disabled ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	-- this doesn't work in tmux
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CMD",
		action = act.OpenLinkAtMouseCursor,
	},
}

config.keys = {
	-- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to jump by word
	{
		key = "LeftArrow",
		mods = "OPT",
		action = act.SendKey({
			key = "b",
			mods = "ALT",
		}),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = act.SendKey({
			key = "f",
			mods = "ALT",
		}),
	},
}

-- window appearance
config.window_padding = {
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
