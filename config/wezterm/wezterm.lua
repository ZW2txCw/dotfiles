-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Font
config.dpi = 96
config.font_size = 11
config.freetype_load_target = "HorizontalLcd"

config.term = "wezterm"
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.enable_scroll_bar = false
config.force_reverse_video_cursor = true
config.hide_mouse_cursor_when_typing = false
config.automatically_reload_config = false
config.window_padding = { left = 4, right = 4, top = 4, bottom = 4 }

config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

-- miasma
config.colors = {
	foreground = "#d7c483",
	background = "#222222",
	ansi = {
		"#222222",
		"#685742",
		"#5f875f",
		"#b36d43",
		"#78824b",
		"#bb7744",
		"#c9a554",
		"#d7c483",
	},
	brights = {
		"#666666",
		"#685742",
		"#5f875f",
		"#b36d43",
		"#78824b",
		"#bb7744",
		"#c9a554",
		"#d7c483",
	},
}

-- and finally, return the configuration to wezterm
return config

-- vim: ts=2 sts=2 sw=2 et
