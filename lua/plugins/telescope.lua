return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-node-modules.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		-- local builtin = require("telescope.builtin")
		local fb_actions = require("telescope").extensions.file_browser.actions
		local project_actions = require("telescope._extensions.project.actions")

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},
				mappings = {
					n = {
						["q"] = actions.close,
					},
				},
			},
			extensions = {
				fzy_native = {
					override_generic_sorter = false,
					override_file_sorter = true,
				},
				media_files = {
					filetypes = { "png", "webp", "jpg", "jpeg" },
					find_cmd = "rg",
				},
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
					mappings = {
						["i"] = {
							["<C-w>"] = function()
								vim.cmd("normal vbd")
							end,
						},
						["n"] = {
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
						},
					},
				},
				project = {
					base_dirs = {},
					hidden_files = true, -- default: false
					theme = "dropdown",
					order_by = "asc",
					search_by = "title",
					sync_with_nvim_tree = true, -- default false
					-- default for on_project_selected = find project files
					on_project_selected = function(prompt_bufnr)
						-- Do anything you want in here. For example:
						project_actions.change_working_directory(prompt_bufnr, false)
						-- require("harpoon.ui").nav_file(1)
					end,
				},
			},
		})

		function telescope_buffer_dir()
			return vim.fn.expand("%:p:h")
		end

		telescope.load_extension("fzy_native")
		telescope.load_extension("file_browser")
		telescope.load_extension("project")
		telescope.load_extension("aerial")
		telescope.load_extension("media_files")
		telescope.load_extension("node_modules")

		local opts = { noremap = true, silent = true }
		vim.keymap.set(
			"n",
			";f",
			'<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true})<cr>',
			opts
		)
		vim.keymap.set("n", ";r", '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
		vim.keymap.set("n", "\\\\", '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
		vim.keymap.set("n", ";t", '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
		vim.keymap.set("n", ";;", '<cmd>lua require("telescope.builtin").resume()<cr>', opts)
		vim.keymap.set("n", ";e", '<cmd>lua require("telescope.builtin").diagnostics()<cr>', opts)
		vim.keymap.set(
			"n",
			"sf",
			'<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, all_previewers = true, initial_mode = "normal", layout_config = { height = 40 }})<cr>',
			opts
		)
		vim.keymap.set(
			"n",
			"mf",
			'<cmd>lua require("telescope").extensions.media_files.media_files({ path = "%:p:h", cwd = telescope_buffer_dir() })<cr>',
			opts
		)
		vim.keymap.set("n", ";p", '<cmd>lua require("telescope").extensions.project.project{}<CR>', opts)
	end,
}
