return {
  -- Formatting using conform. This is also used for
  -- the automatic formatting when writing to file.
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        rust = { 'rustfmt' }, -- ✅ Fixed issue
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
      },
    },
  },
  -- Documentation generation through neogen,
  -- call :Neogen to generate appropriate documentation
  -- template
  {
    'danymat/neogen',
    opts = {
      config = true,
      languages = {
        lua = {
          template = {
            annotation_convention = 'emmylua',
          },
        },
        python = {
          template = {
            --annotation_convention = 'google_docstrings',
            -- annotation_convention = 'numpydoc',
            annotation_convention = 'reST',
            reST = {
              { nil, '#TODO' },
              { nil, '"""Method which ...:' },
              { nil, '' },
              { 'parameters', ':param %s: ...' },
              { nil, ':return: ...' },
              { nil, '"""' },
            },
          },
        },
      },
    },
  },
  -- Highlights todo-comments and makes navigation easier.
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
  },
}
