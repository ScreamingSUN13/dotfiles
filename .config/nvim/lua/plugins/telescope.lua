return {
	'nvim-telescope/telescope.nvim', version = '*',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- optional but recommended
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	require('telescope').setup {
    highlights = {
      TelescopeNormal = { bg = 'NONE' },
      TelescopePreviewNormal = { bg = 'NONE' },
			TelescopeBorder = { bg = 'NONE' },
      TelescopePromptNormal = { bg = 'NONE' },
      TelescopePromptBorder = { bg = 'NONE' },
      TelescopeResultsNormal = { bg = 'NONE' },
      TelescopeResultsBorder = { bg = 'NONE' },
    }
	},
	keys = {
		{ "<leader>t", "<cmd>Telescope<cr>", desc = "Open telescope" }
	}
}
