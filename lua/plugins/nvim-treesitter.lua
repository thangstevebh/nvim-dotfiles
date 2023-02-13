return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    pcall(require('nvim-treesitter.install').update { with_sync = true })
	end,
  config = function()
    require("nvim-treesitter.configs").setup{
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        disable = {},
      },
      ensure_installed = {
        "tsx",
        "fish",
        "json",
        "yaml",
        "css",
        "html",
        "c",
        "rust",
        "vim",
        "lua",
        "json",
        "html",
        "solidity",
        "svelte",
        "vue",
        "regex",
        "javascript"
      },
      autotag = {
        enable = true,
      },
    }

  end
}
