-- Copyright (c) 2021 Ashish Panigrahi
-- MIT license, see LICENSE for more details.
-- stylua: ignore
local colors = {
	primary			 = '#ef9b27',
	secondary 	 = '#3cb371',
	tertiary		 = '#39bae6',
	eror         = '#d95757',
	brightred    = '#d95757',
  green		     = '#47cc68',
	surface			 = '#1e222a',
	surface_variant = '#0d1017',
	on_primary   = '#0d1017',
	on_secondary = '#0d1017',
	on_tertiary  = '#0d1017',
	on_eror  		 = '#0d1017',
	on_brightred = '#d1d1c7',
	on_green		 = '#0b0e14',
	on_surface 	 = '#9198a0',
	on_surface_variant = '#d1d1c7'
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
