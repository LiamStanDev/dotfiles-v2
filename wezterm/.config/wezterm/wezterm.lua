local wezterm = require("wezterm")
local config = {}

--config.color_scheme = "Batman"
config.color_scheme = "OneDark (base16)"

config.enable_wayland = true
config.enable_tab_bar = false
config.automatically_reload_config = false
config.window_background_opacity = 0.5
config.font = wezterm.font_with_fallback({
	"Comic Mono",
	"CaskaydiaCove Nerd Font",
	"Yozai",
})

return config
