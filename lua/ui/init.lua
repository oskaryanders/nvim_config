-- Sets the theme
-- CATPPUCCIN
-- require 'ui.catppuccin_config'
-- vim.cmd 'colorscheme catppuccin'
-- JELLYBEANS
--vim.cmd 'colorscheme jellybeans-nvim'
-- TOKYONIGHT
vim.cmd 'colorscheme tokyonight-night'
-- Load argument highlighter
require 'ui.hlargs_config'
-- Load colorizer
require 'ui.colorizer_config'
-- Set color of constants
vim.api.nvim_set_hl(0, '@constant.python', { fg = '#008000', bold = true }) -- Dark Green
-- Configure status bar.
require 'ui.lualine_config'
