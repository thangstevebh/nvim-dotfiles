return {
	{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
	"nvim-treesitter/nvim-treesitter",
	build = function()
		pcall(require("nvim-treesitter.install").update({ with_sync = true }))
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				disable = { "c" },
			},
			indent = {
				enable = true,
				disable = {},
			},
			ensure_installed = {
				"tsx",
				"fish",
				"json",
				"yaml",
				"css",
				"html",
				"c",
				"rust",
				"toml",
				"vim",
				"lua",
				"json",
				"html",
				"solidity",
				"svelte",
				"vue",
				"regex",
				"javascript",
				"markdown",
				"markdown_inline",
				"regex",
				"http",
				"typescript",
				"latex",
				"javascript",
				"sql",
			},
			autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = true,
			},
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
			refactor = {
				-- highlight_current_scope = {
				--   enable = true,
				-- },
				highlight_definitions = {
					enable = true,
					updatetime = 100,
					clear_on_cursor_move = true,
				},
			},
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			},
			playground = {
				enable = true,
				disable = {},
				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				persist_queries = true, -- Whether the query persists across vim sessions
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			},
		})
	end,
}
