return {
  {
    -- Mason for handling LSPs
    -- https://github.com/williamboman/mason
    'williamboman/mason.nvim', --Must be before mason-lspconfig
    'williamboman/mason-lspconfig.nvim', --Assists neovim-lspconfig
  },
  {
    -- lsp provider for nvim
    -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',
  },
}
