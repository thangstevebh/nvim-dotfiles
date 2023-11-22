return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				max_name_length = 18,
				max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
				truncate_names = true, -- whether or not tab names should be truncated
				tab_size = 18,
			},
		})
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
		vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)
		vim.keymap.set("n", "<leader><Tab>", "<Cmd>BufferLineMoveNext<CR>", opts)
		vim.keymap.set("n", "<leader><S-Tab>", "<Cmd>BufferLineMovePrev<CR>", opts)
	end,
}
