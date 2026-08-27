 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#0b0e14',
    base01 = '#1e222a',
    base02 = '#272c36',
    base03 = '#595f6a',
    base04 = '#8e959e',
    base05 = '#d1d1c7',
    base06 = '#d1d1c7',
    base07 = '#d1d1c7',
    base08 = '#d95757',
    base09 = '#39bae6',
    base0A = '#3cb371',
    base0B = '#ef9b27',
    base0C = '#8ed8f1',
    base0D = '#f6c888',
    base0E = '#96e9bb',
    base0F = '#6a1414',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#d1d1c7',          bg = '#0b0e14' })
  hi('TelescopeBorder',         { fg = '#595f6a',             bg = '#0b0e14' })
  hi('TelescopePromptNormal',   { fg = '#d1d1c7',          bg = '#0b0e14' })
  hi('TelescopePromptBorder',   { fg = '#595f6a',             bg = '#0b0e14' })
  hi('TelescopePromptPrefix',   { fg = '#ef9b27',             bg = '#0b0e14' })
  hi('TelescopePromptCounter',  { fg = '#8e959e',  bg = '#0b0e14' })
  hi('TelescopePromptTitle',    { fg = '#0b0e14',             bg = '#ef9b27' })
  hi('TelescopePreviewTitle',   { fg = '#0b0e14',             bg = '#3cb371' })
  hi('TelescopeResultsTitle',   { fg = '#0b0e14',             bg = '#39bae6' })
  hi('TelescopeSelection',      { fg = '#d1d1c7',          bg = '#272c36' })
  hi('TelescopeSelectionCaret', { fg = '#ef9b27',             bg = '#272c36' })
  hi('TelescopeMatching',       { fg = '#ef9b27',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
