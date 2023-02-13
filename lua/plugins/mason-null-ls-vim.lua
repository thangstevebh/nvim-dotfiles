return {
  "jay-babu/mason-null-ls.nvim",
  config = function ()
    require("mason-null-ls").setup({
      ensure_installed = { "stylua", "prettier", "eslint", "eslint_d" },
    })
  end
}
