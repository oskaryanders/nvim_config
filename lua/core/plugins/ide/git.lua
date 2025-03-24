-- gitsigns for showing blame and what has been edited.
-- https://github.com/lewis6991/gitsigns

return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
      signcolumn = true, -- Show signs in the sign column
      numhl = false, -- Disable line number highlighting
      linehl = false, -- Disable full line highlight
      word_diff = false, -- Disable word diff highlighting
    },
  },
}
