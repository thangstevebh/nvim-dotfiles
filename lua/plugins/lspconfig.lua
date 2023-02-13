return {
  "neovim/nvim-lspconfig",
  dependenies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    'j-hui/fidget.nvim',

    -- Additional lua configuration, makes nvim stuff amazing
    'folke/neodev.nvim',
  },
  config = function()
    local nvim_lsp = require("lspconfig")
    nvim_lsp.pyright.setup{}
    local protocol = require("vim.lsp.protocol")


    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
        vim.api.nvim_command [[augroup END]]
      end
    end

    local lsp_flags = {
      -- This is the default in Nvim 0.7+
      debounce_text_changes = 150,
    }
    require('lspconfig')['pyright'].setup{
        on_attach = on_attach,
        flags = lsp_flags,
    }
    require('lspconfig')['tsserver'].setup{
        on_attach = on_attach,
        flags = lsp_flags,
    }
    require('lspconfig')['rust_analyzer'].setup{
        on_attach = on_attach,
        flags = lsp_flags,
        -- Server-specific settings...
        settings = {
          ["rust-analyzer"] = {}
        }
    }

    nvim_lsp.tsserver.setup {
      on_attach = on_attach,
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"  },
      cmd = { "typescript-language-server", "--stdio" }
    }

    nvim_lsp.lua_ls.setup{
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
      cmd = {"lua-language-server"},
      filetypes = { "lua" },
      log_level = 2,
      root_dir = nvim_lsp.util.root_pattern(".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git"),
      single_file_support = false
    }

    nvim_lsp.eslint.setup{
      on_attach = on_attach,
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "vuex" },
      cmd = { "vscode-eslint-language-server", "--stdio" },
      settings = {
        codeAction = {
          disableRuleComment = {
            enable = true,
            location = "separateLine"
          },
          showDocumentation = {
            enable = true
          }
        },
        codeActionOnSave = {
          enable = false,
          mode = "all"
        },
        format = true,
        nodePath = "",
        onIgnoredFiles = "off",
        packageManager = "npm",
        quiet = false,
        rulesCustomizations = {},
        run = "onType",
        useESLintClass = false,
        validate = "on",
        workingDirectory = {
          mode = "location"
        }
      }
    }
    nvim_lsp.r_language_server.setup{
      cmd = { "R", "--slave", "-e", "languageserver::run()"},
      filetypes = {"r", "rmd"},
      log_level = 2,
      root_dir = nvim_lsp.util.root_pattern(".git")
    }
    nvim_lsp.rust_analyzer.setup{
      cmd = {"rust-analyzer"},
      filetypes = {"rust"},
      root_dir = nvim_lsp.util.root_pattern("Cargo.toml", "rust-project.json"),
      setting = {
        { ["rust_analyzer"] = {}}
      }
    }
  end
}

