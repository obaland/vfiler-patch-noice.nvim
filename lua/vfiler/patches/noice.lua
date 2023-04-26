local VFiler = require('vfiler/vfiler')

local M = {}

local setup_done = false

local function action_redraw(vfiler, context, view)
  if view:winnr() ~= vim.fn.winnr() then
    return
  end
  local conceallevel = vim.wo.conceallevel
  if view._winoptions.conceallevel ~= conceallevel then
    view:redraw()
    view._winoptions.conceallevel = conceallevel
  end
end

local function event_callback(args)
  local vfiler = VFiler.get(args.buf)
  if not (vfiler and vfiler:visible()) then
    return
  end
  if args.match:match('%l:c') then
    vfiler:do_action(action_redraw)
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
