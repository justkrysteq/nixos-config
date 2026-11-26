 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#000000',
    base01 = '#17131f',
    base02 = '#211c2a',
    base03 = '#7b7291',
    base04 = '#dfd3fb',
    base05 = '#f5f6f9',
    base06 = '#f5f6f9',
    base07 = '#f5f6f9',
    base08 = '#b87a87',
    base09 = '#5d507c',
    base0A = '#7866a3',
    base0B = '#a392cd',
    base0C = '#ae96e9',
    base0D = '#ae96e9',
    base0E = '#ae96e9',
    base0F = '#cebef4',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f5f6f9',          bg = '#000000' })
  hi('TelescopeBorder',         { fg = '#7b7291',             bg = '#000000' })
  hi('TelescopePromptNormal',   { fg = '#f5f6f9',          bg = '#000000' })
  hi('TelescopePromptBorder',   { fg = '#7b7291',             bg = '#000000' })
  hi('TelescopePromptPrefix',   { fg = '#a392cd',             bg = '#000000' })
  hi('TelescopePromptCounter',  { fg = '#dfd3fb',  bg = '#000000' })
  hi('TelescopePromptTitle',    { fg = '#000000',             bg = '#a392cd' })
  hi('TelescopePreviewTitle',   { fg = '#000000',             bg = '#7866a3' })
  hi('TelescopeResultsTitle',   { fg = '#000000',             bg = '#5d507c' })
  hi('TelescopeSelection',      { fg = '#f5f6f9',          bg = '#211c2a' })
  hi('TelescopeSelectionCaret', { fg = '#a392cd',             bg = '#211c2a' })
  hi('TelescopeMatching',       { fg = '#a392cd',             bold = true })
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
