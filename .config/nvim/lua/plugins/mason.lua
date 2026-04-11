return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "pyright", "ts_ls" },
			automatic_installation = true,
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
			globals = { "vim" },	-- tell lua_ls that vim is a valid global
					},
				},
			},
		})
		vim.lsp.enable("lua_ls")

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local servers = { "lua_ls", "pyright", "ts_ls" }

		for _, server in ipairs(servers) do
			vim.lsp.config(server, {
	capabilities = capabilities,
			})
			vim.lsp.enable(server)
		end
	end,
}
