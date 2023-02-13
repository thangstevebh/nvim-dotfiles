return {
  "akinsho/toggleterm.nvim",
  config = function ()
    require("toggleterm").setup{
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      size = 20,
      shade_filetypes = {},
      direction = 'float',
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      terminal_mappings = true,
      persist_size = true,
      close_on_exit = true,
      shel = vim.o.shell,
      auto_scroll = true,
      float_otps = {
        border = 'curved',
        winblend = 2,
        width = 1,
        height = 1,
      },
      winbar = {
        enable = false,
        name_formatter = function(term)
          return term.name
        end
      },
    }
  end
}
