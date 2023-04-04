return{
	{
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = true,
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "soft", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = true,
        transparent_mode = false,
      })
      -- load the colorscheme here
      vim.opt.background = 'dark'
      vim.cmd([[colorscheme gruvbox]])
      vim.cmd([[hi TitleString guifg=#1c1c19]])
      vim.cmd([[hi SagaBorder guifg=#F49D1A]])
      vim.cmd([[hi LspSagaWinbarFolderName guifg=#1c1919]])
      vim.cmd([[hi LspSagaWinbarWord guifg=#e95676]])
      vim.cmd([[hi LspSagaWinbarSep guifg=#36d0e0]])
      vim.cmd([[hi LspSagaWinbarFile guifg=#36d0e0]])
    end,
  },
}
