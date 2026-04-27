return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()				
				local currentLuaLineTheme = require("themes.mainLuaLine")
				require('lualine').setup {
						options = { theme = currentLuaLineTheme }
				}
		end
}
