-- return {
--   {
--     "ellisonleao/gruvbox.nvim",
--     lazy = false,  -- make sure we load this during startup if it is your main colorscheme
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--       require("gruvbox").setup({
--         undercurl = true,
--         underline = true,
--         bold = true,
--         italic = {
--           strings = true,
--           comments = true,
--           operators = false,
--           folds = true,
--         },
--         strikethrough = true,
--         invert_selection = false,
--         invert_signs = false,
--         invert_tabline = false,
--         invert_intend_guides = false,
--         inverse = true, -- invert background for search, diffs, statuslines and errors
--         contrast = "soft", -- can be "hard", "soft" or empty string
--         palette_overrides = {
--           SignColumn = {bg = "#ff9900"}
--         },
--         overrides = {},
--         dim_inactive = true,
--         transparent_mode = false,
--       })
--       -- load the colorscheme here
--       -- vim.opt.background = "light"
--       vim.opt.background = "dark"
--       vim.cmd([[colorscheme gruvbox]])
--       vim.cmd([[hi TitleString guifg=#1c1c19]])
--       vim.cmd([[hi SagaBorder guifg=#F49D1A]])
--       vim.cmd([[hi LspSagaWinbarFolderName guifg=#1c1919]])
--       vim.cmd([[hi LspSagaWinbarWord guifg=#e95676]])
--       vim.cmd([[hi LspSagaWinbarSep guifg=#36d0e0]])
--       vim.cmd([[hi LspSagaWinbarFile guifg=#36d0e0]])
--     end,
--   },
-- }
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "latte", -- latte, frappe, macchiato, mocha
        background = {
          -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false, -- show the '~' characters after the end of buffers
        term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false, -- Force no italic
        no_bold = false,  -- Force no bold
        no_underline = false, -- Force no underline
        styles = {
          comments = { "italic" },
          conditionals = { "bold" },
          loops = {},
          functions = {},
          keywords = { "italic" },
          strings = {},
          variables = {},
          numbers = {},
          booleans = { "italic" },
          properties = {"bold"},
          types = { "bold" },
          operators = { "bold" },
        },
        color_overrides = {

        },
        custom_highlights = {},
        integrations = {
          aerial = false,
          barbar = false,
          beacon = false,
          cmp = true,
          coc_nvim = false,
          dashboard = true,
          fern = false,
          fidget = false,
          gitgutter = false,
          gitsigns = true,
          harpoon = false,
          headlines = false,
          hop = false,
          illuminate = false,
          leap = false,
          lightspeed = false,
          lsp_saga = false,
          lsp_trouble = false,
          markdown = true,
          mason = true,
          mini = false,
          neogit = false,
          neotest = false,
          neotree = false,
          noice = false,
          notify = false,
          nvimtree = true,
          octo = false,
          overseer = false,
          pounce = false,
          sandwich = false,
          semantic_tokens = false,
          symbols_outline = false,
          telekasten = false,
          telescope = true,
          treesitter = true,
          treesitter_context = false,
          ts_rainbow = false,
          ts_rainbow2 = false,
          vim_sneak = false,
          vimwiki = false,
          which_key = false,
          -- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
          barbecue = {
            dim_dirname = true,
            bold_basename = true,
            dim_context = false,
            alt_background = false,
          },
          dap = {
            enabled = false,
            enable_ui = false,
          },
          indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
          },
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
          navic = {
            enabled = false,
            custom_bg = "NONE",
          },
          bufferline = true,
        }
      })

      vim.cmd([[colorscheme catppuccin]])
    end,
  },
}
