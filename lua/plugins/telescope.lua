return {
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
      local telescope = require("telescope")
      local actions = require('telescope.actions')
      local builtin = require("telescope.builtin")
      local fb_actions = require("telescope").extensions.file_browser.actions
      require('telescope').load_extension('media_files')

      telescope.setup({
        defaults = {
          sorting_strategy = 'ascending',
          layout_config = {
              prompt_position = 'top'
          },
          mappings = {
            n = {
              ["q"] = actions.close
            }
          }
        },
        extensions = {
          fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
          },
          media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg" },
            find_cmd = "rg"
          },
          file_browser = {
            theme = "dropdown",
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                ["<C-w>"] = function() vim.cmd('normal vbd') end,
              },
              ["n"] = {
                ["N"] = fb_actions.create,
                ["h"] = fb_actions.goto_parent_dir,
                ["/"] = function()
                  vim.cmd('startinsert')
                end
              }
            }
          },
          
        }
      })
      
      function telescope_buffer_dir()
        return vim.fn.expand("%:p:h")
      end

      telescope.load_extension('fzy_native')
      telescope.load_extension('file_browser')
      telescope.load_extension('project')
      telescope.load_extension('aerial')
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', ';f', '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true})<cr>', opts)
      vim.keymap.set('n', ';r', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
      vim.keymap.set('n', '\\\\', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
      vim.keymap.set('n', ';t', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
      vim.keymap.set('n', ';;', '<cmd>lua require("telescope.builtin").resume()<cr>', opts)
      vim.keymap.set('n', ';e', '<cmd>lua require("telescope.builtin").diagnostics()<cr>', opts)
      vim.keymap.set('n', 'sf', '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, all_previewers = true, initial_mode = "normal", layout_config = { height = 40 }})<cr>', opts)
      vim.keymap.set('n', 'sm', '<cmd>lua require("telescope").extensions.media_files.media_files({ path = "%:p:h", cwd = telescope_buffer_dir() })<cr>', opts)
      vim.keymap.set('n', ';p', '<cmd>lua require("telescope").extensions.project.project{ display_type = "full"}<CR>', opts)

    end
}

