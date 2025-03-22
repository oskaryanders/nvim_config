-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- 1. Load settings
require('core.settings')
-- 2. Load keymaps 
require('core.keymaps')
-- 2. Load custom commands
require('core.commands')
-- 3. Install `lazy.nvim` plugin manager
require('lazy-bootstrap')
-- 4. Load plugins
require('core.plugins')
-- 5. Load UI configuration (theme and statusline).
require('ui')
-- Setup LSP
require('lsp-configuration')


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
