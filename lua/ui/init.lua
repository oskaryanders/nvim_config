-- Loads the catppuccin configuration
require 'ui.catppuccin_config'
-- Load argument highlighter
require 'ui.hlargs_config'
-- Load colorizer
require 'ui.colorizer_config'
-- Sets the theme
vim.cmd 'colorscheme catppuccin'
-- Set color of constants
vim.api.nvim_set_hl(0, 'Constant', { fg = '#8B0000' }) -- Dark red color
