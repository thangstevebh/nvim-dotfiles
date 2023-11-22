return {
  "stevearc/aerial.nvim",
  config = function()
    require("aerial").setup({
      attach_mode = "global",
      backends = { "treesitter", "lsp", "markdown", "man" },
      layout = {
        max_width = { 40, 0.2 },
        width = nil,
        min_width = 28,
        win_opts = {},
        default_direction = "prefer_right",
        placement = "window",
        preserve_equality = false,
      },
      lazy_load = true,
      -- Disable aerial on files with this many lines
      disable_max_lines = 10000,
      -- Disable aerial on files this size or larger (in bytes)
      disable_max_size = 2000000, -- Default 2MB
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
      },
      highlight_mode = "split_width",
      -- Highlight the closest symbol if the cursor is not exactly on one.
      highlight_closest = true,
      -- Highlight the symbol in the source buffer when cursor is in the aerial win
      highlight_on_hover = false,
      -- When jumping to a symbol, highlight the line for this many ms.
      -- Set to false to disable
      highlight_on_jump = 300,
      post_add_all_symbols = function(bufnr, items, ctx)
        return items
      end,
      close_on_select = true,
      -- The autocmds that trigger symbols update (not used for LSP backend)
      update_events = "TextChanged,InsertLeave",
      -- Show box drawing characters for the tree hierarchy
      show_guides = true,
      -- Customize the characters used when show_guides = true
      guides = {
        -- When the child item has a sibling below it
        mid_item = "├─",
        -- When the child item is the last in the list
        last_item = "└─",
        -- When there are nested child guides to the right
        nested_top = "│ ",
        -- Raw indentation
        whitespace = "  ",
      },
      -- Set this function to override the highlight groups for certain symbols
      get_highlight = function(symbol, is_icon)
        -- return "MyHighlight" .. symbol.kind
      end,
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
      lsp = {
        -- Fetch document symbols when LSP diagnostics update.
        -- If false, will update on buffer changes.
        diagnostics_trigger_update = true,
        -- Set to false to not update the symbols when there are LSP errors
        update_when_errors = true,
        -- How long to wait (in ms) after a buffer change before updating
        -- Only used when diagnostics_trigger_update = false
        update_delay = 300,
        -- Map of LSP client name to priority. Default value is 10.
        -- Clients with higher (larger) priority will be used before those with lower priority.
        -- Set to -1 to never use the client.
        priority = {
          -- pyright = 10,
        },
      },
      treesitter = {
        -- How long to wait (in ms) after a buffer change before updating
        update_delay = 300,
      },
      markdown = {
        -- How long to wait (in ms) after a buffer change before updating
        update_delay = 300,
      },
      man = {
        -- How long to wait (in ms) after a buffer change before updating
        update_delay = 300,
      }
    })
  end,
}
