 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#080f17',
    base01 = '#1a1625',
    base02 = '#231e32',
    base03 = '#645a79',
    base04 = '#a79fb3',
    base05 = '#e8e2d9',
    base06 = '#e8e2d9',
    base07 = '#e8e2d9',
    base08 = '#d95757',
    base09 = '#6c82c4',
    base0A = '#3cb371',
    base0B = '#ef9b27',
    base0C = '#96abe9',
    base0D = '#f6c888',
    base0E = '#96e9bb',
    base0F = '#bef4d6',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e8e2d9',          bg = '#080f17' })
  hi('TelescopeBorder',         { fg = '#645a79',             bg = '#080f17' })
  hi('TelescopePromptNormal',   { fg = '#e8e2d9',          bg = '#080f17' })
  hi('TelescopePromptBorder',   { fg = '#645a79',             bg = '#080f17' })
  hi('TelescopePromptPrefix',   { fg = '#ef9b27',             bg = '#080f17' })
  hi('TelescopePromptCounter',  { fg = '#a79fb3',  bg = '#080f17' })
  hi('TelescopePromptTitle',    { fg = '#080f17',             bg = '#ef9b27' })
  hi('TelescopePreviewTitle',   { fg = '#080f17',             bg = '#3cb371' })
  hi('TelescopeResultsTitle',   { fg = '#080f17',             bg = '#6c82c4' })
  hi('TelescopeSelection',      { fg = '#e8e2d9',          bg = '#231e32' })
  hi('TelescopeSelectionCaret', { fg = '#ef9b27',             bg = '#231e32' })
  hi('TelescopeMatching',       { fg = '#ef9b27',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
