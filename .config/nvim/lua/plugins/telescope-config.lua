return {
	'nvim-telescope/telescope.nvim', version = '*',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- optional but recommended
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	config = function()
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
		}
	end,
	keys = {
		{ "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Open telescope" },
		{ "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Open telescope for finding in files" }
	}
}
