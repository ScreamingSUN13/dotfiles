return {
  "mikavilpas/yazi.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("yazi").setup({
      open_for_directories = true,  -- open yazi when nvim is opened on a directory

			-- open in a floating window
      floating_window_scaling_factor = 0.9, -- how much of the screen it takes up

      -- keep nvim and yazi in sync
      sync_buffer_on_close = true,          -- switch to file when yazi closes
      open_multiple_tabs = false,           -- open multiple files as splits instead

      -- keymaps inside yazi
      keymaps = {
        show_help = "~",
			},
    })
  end,
  keys = {
    { "<leader>y", "<cmd>Yazi<cr>",        desc = "Open yazi at current file" },
  },
}
