return {
  "neovim/nvim-lspconfig",
  dependenies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Useful status updates for LSP
    "j-hui/fidget.nvim",

    -- Additional lua configuration, makes nvim stuff amazing
    "folke/neodev.nvim",
  },
  config = function()
    local nvim_lsp = require("lspconfig")
    local on_attach = function(client, bufnr)
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      vim.api.nvim_command([[autocmd BufRead,BufNewFile */node_modules/* lua vim.diagnostic.disable()]])
      vim.api.nvim_command([[autocmd BufRead,BufNewFile */dist/* lua vim.diagnostic.disable()]])

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions

      -- if client.server_capabilities.documentFormattingProvider then
      -- 	vim.api.nvim_command([[augroup Format]])
      -- 	vim.api.nvim_command([[autocmd! * <buffer>]])
      -- 	vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
      -- 	vim.api.nvim_command([[augroup END]])
      -- end
      -- vim.cmd([[
      --     augroup document_highlight
      --       autocmd! * <buffer>
      --       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      --       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      --     augroup END
      --   ]])
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
    end
    local lsp_flags = {
      -- This is the default in Nvim 0.7+
      debounce_text_changes = 150,
    }

    -- local capabilities = vim.lsp.protocol.make_client_capabilites()
    -- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    require("lspconfig")["pyright"].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      -- capabilities = capabilities
    })

    require("lspconfig").tsserver.setup({
      on_attach = on_attach,
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      flags = lsp_flags,
      cmd = { "typescript-language-server", "--stdio" },
      init_options = {
        hostInfo = "neovim",
      },
      single_file_support = true,
      root_pattern = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    })

    nvim_lsp.lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
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
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      log_level = 2,
      root_dir = nvim_lsp.util.root_pattern(
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        "stylua.toml",
        "selene.toml",
        "selene.yml",
        ".git"
      ),
      single_file_support = false,
    })
--
    -- nvim_lsp.eslint.setup({
    --   on_attach = function(client, bufnr)
    --     vim.api.nvim_create_autocmd("BufWritePre", {
    --       buffer = bufnr,
    --       command = "EslintFixAll",
    --     })
    --   end,
    --   cmd = { "vscode-eslint-language-server", "--stdio" },
    --   filetypes = {
    --     "javascript",
    --     "javascriptreact",
    --     "javascript.jsx",
    --     "typescript",
    --     "typescriptreact",
    --     "typescript.tsx",
    --     "vue",
    --     "svelte",
    --     "astro",
    --   },
    --   root_dir = function(filename, bufnr)
    --     if string.find(filename, "node_modules/") then
    --       return nil
    --     end
    --     if string.find(filename, "dist/") then
    --       return nil
    --     end
    --     return require("lspconfig.server_configurations.eslint").default_config.root_dir(filename, bufnr)
    --   end,
    --   settings = {
    --     codeAction = {
    --       disableRuleComment = {
    --         enable = true,
    --         location = "separateLine",
    --       },
    --       showDocumentation = {
    --         enable = true,
    --       },
    --     },
    --     codeActionOnSave = {
    --       enable = false,
    --       mode = "all",
    --     },
    --     experimental = {
    --       useFlatConfig = false,
    --     },
    --     format = true,
    --     nodePath = "",
    --     onIgnoredFiles = "off",
    --     packageManager = "npm",
    --     problems = {
    --       shortenToSingleLine = false,
    --     },
    --     quiet = false,
    --     rulesCustomizations = {},
    --     run = "onType",
    --     useESLintClass = false,
    --     validate = "on",
    --     workingDirectory = {
    --       mode = "location",
    --     },
    --   },
    -- })
    --
--     -- nvim_lsp.r_language_server.setup{
--     --   cmd = { "R", "--slave", "-e", "languageserver::run()"},
--     --   filetypes = {"r", "rmd"},
--     --   log_level = 2,
--     --   root_dir = nvim_lsp.util.root_pattern(".git")
--     -- }
    nvim_lsp.rust_analyzer.setup({
      cmd = { "rust-analyzer" },
      filetypes = { "rust" },
      root_dir = nvim_lsp.util.root_pattern("Cargo.toml", "rust-project.json"),
      flags = lsp_flags,
      setting = {
        { ["rust_analyzer"] = {} },
      },
    })

    nvim_lsp.graphql.setup({
      cmd = { "graphql-lsp", "server", "-m", "stream" },
      filetypes = { "graphql", "typescriptreact", "javascriptreact" },
      root_dir = nvim_lsp.util.root_pattern('.git', '.graphqlrc*', '.graphql.config.*', 'graphql.config.*')
    })
  end,
}
