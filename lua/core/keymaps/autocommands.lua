-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- Save and restore cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    local last_pos = vim.fn.line '\'"'
    if last_pos > 0 and last_pos <= vim.fn.line '$' then
      vim.api.nvim_feedkeys('g`"', 'n', false)
    end
  end,
})
-- Automatic formatting at write
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})

-- Dap Automatic behavior to show ui
local dap = require 'dap'
local dapui = require 'dapui'
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- vim: ts=2 sts=2 sw=2 et
