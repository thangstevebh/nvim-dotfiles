return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"volar",
				"emmet_ls",
				"yamlls",
				"tsserver",
				"pyright",
				"html",
        "jsonls",
        "ltex"
			},
		})
	end,
}
