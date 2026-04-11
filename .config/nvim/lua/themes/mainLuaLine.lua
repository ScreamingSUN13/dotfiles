-- Copyright (c) 2021 Ashish Panigrahi
-- MIT license, see LICENSE for more details.
-- stylua: ignore
local colors = {
  black        = '#202020',
  neon         = '#19ad84',
  white        = '#FFFFFF',
  green        = '#00D700',
  purple       = '#010E17',
  blue         = '#1793D1',
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
  yellow       = '#FFAF00',
}

local M = {
  normal = {
    a = { bg = colors.neon, fg = colors.black, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.white },
    c = { bg = colors.black, fg = colors.brightgreen },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.darkblue, gui = 'bold' },
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
