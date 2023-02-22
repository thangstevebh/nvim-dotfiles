return {
	"kyazdani42/nvim-tree.lua",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				width = 50,
				mappings = {
					list = {
						{ key = "u", action = "dir_up" },
					},
				},
        side = "right"
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		})
		vim.keymap.set("n", "<leader>b", "<Cmd>NvimTreeToggle<CR>", {})
		vim.keymap.set("n", "<leader>v", "<Cmd>NvimTreeFocus<CR>", {})
		vim.keymap.set("n", "<leader>a", "<Cmd>NvimTreeResize +20<CR>", {})
		vim.keymap.set("n", "<leader>d", "<Cmd>NvimTreeResize -20<CR>", {})
		vim.keymap.set("n", "<leader>r", "<Cmd>NvimTreeRefresh<CR>", {})
	end,
}
