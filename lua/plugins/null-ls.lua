return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    -- local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
    -- local event = "BufWritePre" -- or "BufWritePost"
    -- local async = event == "BufWritePost"

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.formatting.sql_formatter,
      },
    })
  end,
}
