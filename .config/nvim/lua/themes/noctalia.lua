-- Copyright (c) 2021 Ashish Panigrahi
-- MIT license, see LICENSE for more details.
-- stylua: ignore
local colors = {
	primary			 = '#cba6f7',
	secondary 	 = '#b4befe',
	tertiary		 = '#89dceb',
	eror         = '#f38ba8',
	brightred    = '#f38ba8',
  green		     = '#a6e3a1',
	surface			 = '#202031',
	surface_variant = '#313244',
	on_primary   = '#202031',
	on_secondary = '#202031',
	on_tertiary  = '#202031',
	on_eror  		 = '#202031',
	on_brightred = '#bac2de',
	on_green		 = '#47495d',
	on_surface 	 = '#cdd6f4',
	on_surface_variant = '#a6adc8'
}

local M = {
  normal = {
    a = { bg = colors.primary, fg = colors.on_primary, gui = 'bold' },
    b = { bg = colors.surface, fg = colors.on_surface },
    c = { bg = colors.surface_variant, fg = colors.on_surface_variant },
  },
  insert = {
    a = { bg = colors.secondary, fg = colors.on_secondary, gui = 'bold' },
    b = { bg = colors.surface, fg = colors.on_surface },
    c = { bg = colors.surface_variant, fg = colors.on_surface_variant },
	},
  visual = {
    a = { bg = colors.tertiary, fg = colors.on_tertiary, gui = 'bold' },
    b = { bg = colors.surface, fg = colors.on_surface },
    c = { bg = colors.surface_variant, fg = colors.on_surface_variant },
  },
  replace = {
    a = { bg = colors.eror, fg = colors.on_eror, gui = 'bold' },
    b = { bg = colors.surface, fg = colors.on_surface },
    c = { bg = colors.surface_variant, fg = colors.on_surface_variant },
  },
  command = {
    a = { bg = colors.green, fg = colors.on_green, gui = 'bold' },
    b = { bg = colors.surface, fg = colors.on_surface },
    c = { bg = colors.surface_variant, fg = colors.on_surface_variant },
  },
  inactive = {
    a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
    b = { bg = colors.surface, fg = colors.on_surface },
    c = { bg = colors.surface_variant, fg = colors.on_surface_variant },
  },
}

M.terminal = M.insert

return M
