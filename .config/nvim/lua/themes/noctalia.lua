-- Copyright (c) 2021 Ashish Panigrahi
-- MIT license, see LICENSE for more details.
-- stylua: ignore
local colors = {
	primary			 = '#ef9b27',
	secondary 	 = '#3cb371',
	tertiary		 = '#6c82c4',
	eror         = '#d95757',
	brightred    = '#e95678',
  green		     = '#29d398',
	surface			 = '#1a1625',
	surface_variant = '#09111b',
	on_primary   = '#0d1017',
	on_secondary = '#0d1017',
	on_tertiary  = '#0d1017',
	on_eror  		 = '#0d1017',
	on_brightred = '#fadad1',
	on_green		 = '#16161c',
	on_surface 	 = '#aaa2b5',
	on_surface_variant = '#e8e2d9'
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
    a = { bg = colors.green, fg = colors.on_secondary, gui = 'bold' },
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
