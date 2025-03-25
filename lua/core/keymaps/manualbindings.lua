-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- Documentation means: vim.keymap.set(<mode>, keystroke, <cmd>asdf<CR>)
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- DAP
local dap = require 'dap'
vim.keymap.set('n', '<space>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<space>gb', dap.run_to_cursor)
-- Eval var under cursor
vim.keymap.set('n', '<space>?', function()
  require('dapui').eval(nil, { enter = true })
end)
-- Debug movement
vim.keymap.set('n', '<F1>', dap.step_over)
vim.keymap.set('n', '<F2>', dap.step_into)
vim.keymap.set('n', '<F3>', dap.step_out)
vim.keymap.set('n', '<F4>', dap.step_back)
vim.keymap.set('n', '<F11>', dap.continue)
vim.keymap.set('n', '<F12>', dap.restart)

-- Disable arrow movement
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Enables navigating in insert mode
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-l>', '<Right>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>') --TODO fix this
