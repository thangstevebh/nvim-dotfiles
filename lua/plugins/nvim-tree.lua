return {
  "kyazdani42/nvim-tree.lua",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function ()
    require("nvim-tree").setup{
      sort_by = "case_sensitive",
      view = {
        width = 30,
        mappings = {
          list = {
            { key = "u", action = "dir_up" },
          },
        },
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    }
    vim.keymap.set('n', '<leader>b', '<Cmd>NvimTreeToggle<CR>', {})
    vim.keymap.set('n', '<leader>v', '<Cmd>NvimTreeFocus<CR>', {})
  end
}
