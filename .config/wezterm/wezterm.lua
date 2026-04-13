local wezterm = require 'wezterm'

return {
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 13.0,
	color_scheme = "Terafox",
	window_background_opacity = 1,
	hide_tab_bar_if_only_one_tab = true,
	window_background_image = "/Users/stephenkelly/Pictures/Wallpapers/blueOuterWilds.jpg",
	window_background_image_hsb = {
		brightness = 0.8,  -- darken the image so text is readable
		saturation = 0.9,
		hue = 1.0,
	},
}
