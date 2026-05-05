return {
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			filetypes = { "*" },
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				names = true,
				hsl_fn = true,
				rgb_fn = true,
				mode = "background",
			},
		},
	}
}
