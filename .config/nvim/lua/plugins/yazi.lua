return {
  "mikavilpas/yazi.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("yazi").setup({
      open_for_directories = true,  -- open yazi when nvim is opened on a directory
    })
  end,
  keys = {
    { "<leader>y", "<cmd>Yazi<cr>",        desc = "Open yazi at current file" },
    { "<leader>Y", "<cmd>Yazi cwd<cr>",    desc = "Open yazi at working directory" },
  },
}
