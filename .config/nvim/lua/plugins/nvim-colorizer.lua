return {
  'NvChad/nvim-colorizer.lua',
  event = 'BufReadPre',
  config = function()
    require('colorizer').setup({
      filetypes = { '*' },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        css = true,
      },
    })
  end,
}
