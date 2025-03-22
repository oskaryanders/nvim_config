-- Mason for handling lsps
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"pyright", -- .py,
		"luau_lsp", -- .lua
		"bashls", -- .sh
		"clangd", -- .cpp/.c/.h/.hh
		"html", -- .html
		"jsonls", -- .json
		"remark_ls", -- .md/.txt
		"yamlls", -- .yaml
	},
})

-- Setup python configuration
require("lsp-configuration.pyright")
-- Setup lua configuration
require("lsp-configuration.lua")
-- Setup shell configuration
require("lsp-configuration.bashls")
-- Setup c/c++ configuration
require("lsp-configuration.clangd")
-- Setup json configuration
require("lsp-configuration.jsonls")
-- Setup yaml configuration
require("lsp-configuration.yamlls")
-- Setup readme/txt configuration
require("lsp-configuration.marksman")
return {
	config = function()
		local capabilites = require("blink.cmp").get_lsp_capabilites(config.capabilites)
		require("lspconfig").lua_ls.setup({ capabilites = capabilites })
	end,
}
-- vim.api.nvim_buf_set_lines(
