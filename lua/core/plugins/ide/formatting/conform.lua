return {
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
}
