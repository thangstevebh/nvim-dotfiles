return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		-- local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
		-- local event = "BufWritePre" -- or "BufWritePost"
		-- local async = event == "BufWritePost"

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls_utils = require("null-ls.utils")

		null_ls.setup({
			-- add package.json as identifier for root (for typescript monorepos)
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),

			sources = {
				-- null_ls.builtins.diagnostics.eslint_d.with({
				--   condition = function(utils)
				--     return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
				--   end,
				-- }),
				-- null_ls.builtins.diagnostics.eslint,
				-- null_ls.builtins.diagnostics.stylint,
				-- null_ls.builtins.diagnostics.dotenv_linter,
				-- null_ls.builtins.diagnostics.sqlfluff.with({
				--   extra_args = { "--dialect", "postgres" }, -- change to your dialect
				-- }),
				-- null_ls.builtins.diagnostics.xo,

				-- null_ls.builtins.code_actions.eslint_d,

				-- null_ls.builtins.completion.vsnip,
				-- null_ls.builtins.diagnostics.cspell,

				null_ls.builtins.formatting.lua_format,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier.with({
					extra_filetypes = { "svelte" },
				}),
				-- null_ls.builtins.formatting.black,
			},
		})
	end,
}
