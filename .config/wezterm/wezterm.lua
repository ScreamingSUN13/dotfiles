local wezterm = require 'wezterm'

return {
	font = wezterm.font("JetBrains Mono"),
	font_size = 13.0,
	color_scheme = "Terafox",
	window_background_opacity = 1,
	hide_tab_bar_if_only_one_tab = true,
	window_background_image = "/Users/stephenkelly/Pictures/Wallpapers/e07ed1f76e8f266b8e12b5a05d2dd15e.jpg",
	window_background_image_hsb = {
		brightness = 0.1,  -- darken the image so text is readable
		saturation = 1.0,
		hue = 1.0,
	},
}
