-- Copyright (c) 2021 Ashish Panigrahi
-- MIT license, see LICENSE for more details.
-- stylua: ignore
local colors = {
	primary			 = '{{colors.primary.default.hex}}',
	secondary 	 = '{{colors.secondary.default.hex}}',
	tertiary		 = '{{colors.tertiary.default.hex}}',
	eror         = '{{colors.error.default.hex}}',
	brightred    = '{{colors.terminal_normal_red.default.hex}}',
  green		     = '{{colors.terminal_normal_green.default.hex}}',
	surface			 = '{{colors.surface_variant.default.hex}}',
	surface_variant = '{{colors.surface.default.hex | lighten 1}}',
	on_primary   = '{{colors.on_primary.default.hex | lighten 1}}',
	on_secondary = '{{colors.on_secondary.default.hex | lighten 1}}',
	on_tertiary  = '{{colors.on_tertiary.default.hex | lighten 1}}',
	on_eror  		 = '{{colors.on_error.default.hex | lighten 1}}',
	on_brightred = '{{colors.terminal_normal_white.default.hex}}',
	on_green		 = '{{colors.terminal_normal_black.default.hex}}',
	on_surface 	 = '{{colors.on_surface_variant.default.hex | lighten 1}}',
	on_surface_variant = '{{colors.on_surface.default.hex}}'
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
