return {
  "akinsho/bufferline.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup{
        options = {
          mode = "tabs",
          separator_style = 'slant',
          always_show_bufferline = true,
          show_buffer_close_icons = false,
          show_close_icon = false,
          color_icons = true
        }
      }
      local opts = {noremap = true, silent = true}
      vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', otps)
      vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', otps)
		end,
}
