local wezterm = require 'wezterm'

return {
	-- Font
	font_size = 11.0,

	-- Theming
	color_scheme = "Terafox",
	window_background_opacity = 1,
	hide_tab_bar_if_only_one_tab = true,
	window_background_image = "/home/stephenk/Pictures/Wallpapers/blue.jpg",
	window_background_image_hsb = {
		brightness = 0.8,  -- darken the image so text is readable
		saturation = 0.9,
		hue = 1.0,
	},
	cursor_blink_ease_in = 'Constant',
	cursor_blink_ease_out = 'Constant',
	animation_fps = 30,

	-- Sizing
	initial_rows = 35,
	initial_cols = 120,

	-- Defaults
	default_prog = { '/bin/fish', '-l' },

	-- Key bindings
	keys = {
		{
			key = 'w',
			mods = 'CTRL',
			action = wezterm.action.CloseCurrentPane { confirm = true },
		},
		{
			key = 'd',
			mods = 'CTRL',
			action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
		},
		{
			key = 'd',
			mods = 'CTRL|SHIFT',
			action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
		},
	}
}
