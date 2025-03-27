return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim' },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    ensure_installed = { 'python' },
    build = ':TSUpdate',
    opts = {
      highlight = {
        enable = true,
        --use_languagetree = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    },
  },
}
