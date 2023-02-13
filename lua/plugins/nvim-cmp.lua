return {
  'hrsh7th/nvim-cmp',
  dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  config = function ()
    local cmp = require("cmp")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("lspconfig").clangd.setup{
      capabilities = capabilites
    }

    cmp.setup({
      source = {
        {
          name = 'buffer',
          option = {
            keyword_pattern = [[\k\+]],
          }
        }
      },
      sorting = {
        comparators = {
          function(...) return cmp_buffer:compare_locality(...) end,
          -- The rest of your comparators...
        }
      }
    })
  end
}
