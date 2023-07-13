return {
	"akinsho/bufferline.nvim",
	version = "v3.*",
	dependencies = "kyazdani42/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				themable = false,
				separator_style = "slant",
				always_show_bufferline = true,
				show_buffer_close_icons = false,
				show_tab_indicators = true,
				show_close_icon = false,
				color_icons = true,
				indicator = {
					icon = "▌",
					style = "underline",
				},
				offsets = {
					{
						filetype = "Outline",
						text = "Symbols Outline",
						highlight = "Directory",
						text_align = "center",
					},
					{
						filetype = "neo-tree",
						text = "Neo Tree",
						highlight = "Directory",
						text_align = "center",
					},
				},
				max_name_length = 18,
				max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
				truncate_names = true, -- whether or not tab names should be truncated
				tab_size = 18,
			},
			highlights = {
				indicator_selected = {
					fg = "#b16286",
				},
			},
		})
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
		vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)
		vim.keymap.set("n", "<leader><Tab>", "<Cmd>BufferLineMoveNext<CR>", opts)
		vim.keymap.set("n", "<leader><S-Tab>", "<Cmd>BufferLineMovePrev<CR>", opts)
	end,
}
