return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { 
				"lua_ls",           -- Lua
				"pyright",           -- Python
				"ts_ls",              -- JS/TS
				"rust_analyzer",     -- Rust
				"gopls",              -- Go
				"clangd",             -- C/C++
				"bashls",              -- Bash/fish scripts
				"jsonls",              -- JSON
				"yamlls",              -- YAML
				"taplo",                -- TOML
				"html",                  -- HTML
				"cssls",                 -- CSS
				"marksman",           -- Markdown
				"dockerls",            -- Dockerfile
			},
      automatic_installation = true,
    })

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
