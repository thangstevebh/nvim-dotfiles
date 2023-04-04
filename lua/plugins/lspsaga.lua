return {
  "glepnir/lspsaga.nvim",
  dependencies = {
    { "kyazdani42/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  event = "BufRead",
  config = function()
    require("lspsaga").setup({
      ui = {
        --   -- Currently, only the round theme exists
        theme = "round",
        --   -- This option only works in Neovim 0.9
        title = true,
        --   -- Border type can be single, double, rounded, solid, shadow.
        border = "double",
        winblend = 1,
        expand = "",
        collapse = "",
        preview = " ",
        code_action = "💡",
        diagnostic = "🐞",
        incoming = " ",
        outgoing = " ",
        hover = " ",
        kind = {
        }
      },
      definition = {
        edit = "<C-t>o",
        vsplit = "<C-t>v",
        split = "<C-t>i",
        tabe = "<C-t>t",
        quit = "q",
        close = "<C-w>",
      },
      lightbulb = {
        enable = true,
        enable_in_insert = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
      },
      rename = {
        quit = "<C-w>",
        exec = "<CR>",
        mark = "x",
        confirm = "<CR>",
        in_select = true,
      },
      beacon = {
        enable = true,
        frequency = 7,
      },
    })
    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    vim.keymap.set("n", "<C-k>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
    vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", opts)
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>", opts)
    vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
    vim.keymap.set("n", "gr", "<cmd>Lspsaga rename ++project<CR>", opts)
    vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts)
    vim.keymap.set("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    vim.keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
    vim.keymap.set("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)
    vim.keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", opts)
    vim.keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", opts)
    vim.keymap.set("n", "<Leader>o", "<cmd>Lspsaga outline<CR>", opts)
  end,
}
