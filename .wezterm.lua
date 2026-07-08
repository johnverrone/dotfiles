-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

config.font = wezterm.font("Maple Mono NF", { weight = "Regular" })
-- config.color_scheme = "rose-pine"
-- config.color_scheme = "Catppuccin Latte"
-- config.color_scheme = "Vs Code Light+ (Gogh)"
config.color_scheme = "Vs Code Dark+ (Gogh)"
-- config.enable_tab_bar = false
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

-- Treat both Option keys as a plain modifier (not macOS dead-key
-- composition) so the OPT bindings below match deterministically.
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

config.keys = {
	-- OPT-Left / OPT-Right jump by word in the shell (readline ALT-b / ALT-f).
	{
		key = "LeftArrow",
		mods = "OPT",
		action = act.SendKey({ key = "b", mods = "ALT" }),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = act.SendKey({ key = "f", mods = "ALT" }),
	},
	-- OPT-[ / OPT-] switch tmux windows (prev/next). Send CSI-u sequences that
	-- tmux maps via user-keys; a raw ALT-[ (ESC-[) collides with escape seqs.
	{
		key = "[",
		mods = "OPT",
		action = act.SendString("\x1b[91;3u"),
	},
	{
		key = "]",
		mods = "OPT",
		action = act.SendString("\x1b[93;3u"),
	},
}

-- window appearance
config.window_padding = {
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
