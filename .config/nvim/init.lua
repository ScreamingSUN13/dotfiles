-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
  { --Theme
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme terafox")
    end,
  },
  { "hrsh7th/nvim-cmp" },          -- the engine itself
  { "L3MON4D3/LuaSnip" },          -- cmp requires a snippet engine
  { "saadparwaiz1/cmp_luasnip" },  -- links luasnip to cmp
  { "hrsh7th/cmp-nvim-lsp" },  -- completions from LSP (recommended if using LSP)
  { "hrsh7th/cmp-buffer" },    -- completions from words in current file
  { "hrsh7th/cmp-path" },      -- completions for file paths
  { "nvim-treesitter/nvim-treesitter" }, -- better syntax highlighting
})

-- Transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Clipboard support
vim.opt.clipboard = "unnamedplus"
