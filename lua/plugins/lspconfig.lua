return {
	"neovim/nvim-lspconfig",
	dependenies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
		"folke/neodev.nvim",
		"nvim-lua/lsp-status.nvim",
	},

	config = function()
		local nvim_lsp = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local on_attach = function(client, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			vim.api.nvim_command([[autocmd BufRead,BufNewFile */node_modules/* lua vim.diagnostic.disable()]])
			vim.api.nvim_command([[autocmd BufRead,BufNewFile */dist/* lua vim.diagnostic.disable()]])
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
		end
		local lsp_flags = {
			debounce_text_changes = 150,
		}
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local config = {
			virtual_text = true,
			-- enables lsp_lines but we want to start disabled
			virtual_lines = false,
			-- show signs
			signs = {
				active = signs,
			},
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focus = false,
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}

		vim.diagnostic.config(config)

		local capabilities = cmp_nvim_lsp.default_capabilities()

		require("lspconfig")["pyright"].setup({
			on_attach = on_attach,
			flags = lsp_flags,
		})

		require("lspconfig").tailwindcss.setup({
			root_dir = function(...)
				return require("lspconfig.util").root_pattern(".git")(...)
			end,
		})

		require("lspconfig").tsserver.setup({
			on_attach = on_attach,
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			flags = lsp_flags,
			cmd = { "typescript-language-server", "--stdio" },
			init_options = {
				hostInfo = "neovim",
			},
			single_file_support = true,
			settings = {},
			root_pattern = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
			root_dir = function(...)
				return require("lspconfig.util").root_pattern(".git")(...)
			end,
		})

		nvim_lsp.lua_ls.setup({
			settings = {
				Lua = {
					workspace = {
						checkThirdParty = false,
					},
					completion = {
						workspaceWord = true,
						callSnippet = "Both",
					},
					misc = {
						parameters = {
							-- "--log-level=trace",
						},
					},
					hint = {
						enable = true,
						setType = false,
						paramType = true,
						paramName = "Disable",
						semicolon = "Disable",
						arrayIndex = "Disable",
					},
					doc = {
						privateName = { "^_" },
					},
					type = {
						castNumberToInteger = true,
					},
					diagnostics = {
						disable = { "incomplete-signature-doc", "trailing-space" },
						-- enable = false,
						groupSeverity = {
							strong = "Warning",
							strict = "Warning",
						},
						groupFileStatus = {
							["ambiguity"] = "Opened",
							["await"] = "Opened",
							["codestyle"] = "None",
							["duplicate"] = "Opened",
							["global"] = "Opened",
							["luadoc"] = "Opened",
							["redefined"] = "Opened",
							["strict"] = "Opened",
							["strong"] = "Opened",
							["type-check"] = "Opened",
							["unbalanced"] = "Opened",
							["unused"] = "Opened",
						},
						unusedLocalExclude = { "_*" },
					},
					format = {
						enable = false,
						defaultConfig = {
							indent_style = "space",
							indent_size = "2",
							continuation_indent_size = "2",
						},
					},
				},
			},
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			log_level = 2,
			root_dir = nvim_lsp.util.root_pattern(
				".luarc.json",
				".luarc.jsonc",
				".luacheckrc",
				".stylua.toml",
				"stylua.toml",
				"selene.toml",
				"selene.yml",
				".git"
			),
			single_file_support = true,
		})

		nvim_lsp.rust_analyzer.setup({
			cmd = { "rust-analyzer", "rustup", "run", "stable" },
			filetypes = { "rust" },
			root_dir = nvim_lsp.util.root_pattern("Cargo.toml", "rust-project.json"),
			flags = lsp_flags,
			single_file_support = true,
			setting = {
				{
					["rust_analyzer"] = {
						check = {
							command = "clippy",
						},
						diagnostics = {
							enable = true,
						},
					},
				},
			},
		})

		nvim_lsp.graphql.setup({
			cmd = { "graphql-lsp", "server", "-m", "stream" },
			filetypes = { "graphql", "typescriptreact", "javascriptreact" },
			root_dir = nvim_lsp.util.root_pattern(".git", ".graphqlrc*", ".graphql.config.*", "graphql.config.*"),
		})

		nvim_lsp.yamlls.setup({
			settings = {
				yaml = {
					keyOrdering = false,
				},
			},
		})

		-- configure svelte server
		nvim_lsp["svelte"].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end
					end,
				})
			end,
		})
		-- configure prisma orm server
		nvim_lsp["prismals"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure emmet language server
		nvim_lsp["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		-- CSS Server
		nvim_lsp.cssls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				css = {
					lint = {
						unknownAtRules = "ignore",
					},
				},
			},
		})

		nvim_lsp.html.setup({})
		nvim_lsp.ltex.setup({})

		nvim_lsp.volar.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			init_options = {
				typescript = {
					tsdk = "/home/thangbui/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib",
				},
			},
			filetypes = { "vue" },
			cmd = { "vue-language-server", "--stdio" },
			root_pattern = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
		})
	end,
}
