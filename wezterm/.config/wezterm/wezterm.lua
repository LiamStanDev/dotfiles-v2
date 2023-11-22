local wezterm = require("wezterm")
local config = {}

config.enable_wayland = true
config.enable_tab_bar = false
config.automatically_reload_config = true
config.window_background_opacity = 0.5
config.text_background_opacity = 1.0

config.font = wezterm.font_with_fallback({
	"Comic Mono",
	"CaskaydiaCove Nerd Font",
	"Yozai",
})

config.colors = {
	foreground = "#98b0d3",
	background = "#14151e",

	cursor_bg = "#abb2bf",
	cursor_fg = "black",
	cursor_border = "#abb2bf",

	selection_fg = "black",
	selection_bg = "#fffacd",

	-- The color of the scrollbar "thumb"; the portion that represents the current viewport
	scrollbar_thumb = "#222222",

	-- The color of the split lines between panes
	split = "#444444",

	ansi = {
		"#282c34",
		"#e06c75",
		"#98c379",
		"#e5c07b",
		"#61afef",
		"#c678dd",
		"#56b6c2",
		"#abb2bf",
	},
	brights = {
		"#5c6370",
		"#e9969d",
		"#b3d39c",
		"#edd4a6",
		"#8fc6f4",
		"#d7a1e7",
		"#7bc6d0",
		"#d0d3d8",
	},
}

return config
