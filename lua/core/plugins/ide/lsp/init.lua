-- Mason is a plugin to easily manage external editor tools
-- Such as LSP/Linters/DAP/formatters
return {
	require("core.plugins.ide.lsp.mason"), -- Must be before other lspservers.
	require("core.plugins.ide.lsp.nvim-lspconfig"),
}
