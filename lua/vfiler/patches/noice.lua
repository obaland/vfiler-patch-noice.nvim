local VFiler = require('vfiler/vfiler')

local M = {}

local setup_done = false

local function event_callback(args)
  local vfiler = VFiler.exists(args.buf)
  if not vfiler then
    return
  end
end

function M.setup()
  -- Only Neovim is supported.
  if setup_done or vim.fn.has('nvim') ~= 1 then
    return
  end

  -- When I do a search in noice.nvim, the 'conceallevel' is set to '0',
  -- which causes the conceal character in 'vfiler.vim' to show up.
  -- To make it less unsightly when this happens,
  -- redraw 'vfiler.vim' at the nearest event.
  local group_id = vim.api.nvim_create_augroup('vfiler_patch_noice', {
    clear = true,
  })
  vim.api.nvim_create_autocmd('ModeChanged', {
    group = group_id,
    callback = event_callback,
  })

  setup_done = true
end

return M
