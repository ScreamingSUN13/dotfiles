-- Copyright (c) 2021 Ashish Panigrahi
-- MIT license, see LICENSE for more details.
-- stylua: ignore
local colors = {
  black        = '#202020',
  neon         = '{colors.primary.default.hex}',
  white        = '#FFFFFF',
  green        = '#00D700',
  purple       = '#010E17',
  blue         = '{colors.secondary.default.hex}',
  darkblue     = '#00005F',
  navyblue     = '#091820',
  brightgreen  = '#9CFFD3',
  gray         = '#19483f',
  darkgray     = '#B5522B',
  lightgray    = '#504945',
  inactivegray = '#7c6f64',
  orange       = '#000000',
  red          = '#3C3836',
  brightorange = '#C08A20',
  brightred    = '#AF0000',
  cyan         = '#00DFFF',
  yellow       = '{colors.tertiary.default.hex}',
	surface			 = '{colors.surface_variant.default.hex}',
	on_primary   = '{colors.on_primary.default.hex}',
	on_secondary = '{colors.on_secondary.default.hex}',
	on_tertiary  = '{colors.on_tertiary.default.hex}',
	on_surface_variant = '{colors.on_surface_variant.default.hex}'
}

local M = {
  normal = {
    a = { bg = colors.neon, fg = colors.on_primary, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.white },
    c = { bg = colors.black, fg = colors.brightgreen },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.on_secondary, gui = 'bold' },
    b = { bg = colors.navyblue, fg = colors.white },
    c = { bg = colors.purple, fg = colors.white },
  },
  visual = {
    a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
    b = { bg = colors.darkgray, fg = colors.white },
    c = { bg = colors.red, fg = colors.white },
  },
  replace = {
    a = { bg = colors.brightred, fg = colors.white, gui = 'bold' },
    b = { bg = colors.cyan, fg = colors.darkblue },
    c = { bg = colors.navyblue, fg = colors.white },
  },
  command = {
    a = { bg = colors.green, fg = colors.black, gui = 'bold' },
    b = { bg = colors.black, fg = colors.white },
    c = { bg = colors.orange, fg = colors.brightgreen },
  },
  inactive = {
    a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
    b = { bg = colors.darkgray, fg = colors.gray },
    c = { bg = colors.darkgray, fg = colors.gray },
  },
}

M.terminal = M.insert

return M
