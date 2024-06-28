return {
    "williamboman/mason.nvim",
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim",
        "mfussenegger/nvim-dap",
        "jay-babu/mason-nvim-dap.nvim",
      }
    },
    opts = {
      registries = {
        'github:nvim-java/mason-registry',
        "github:mason-org/mason-registry",
      },
    },
    config = function()
      require("neoconf").setup({})
      require("neodev").setup({})
      require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = ""
                }
            }
        })
      local lspconfig = require('lspconfig')
      require("mason-lspconfig").setup({
        ensure_installed = {
          "typos_lsp", -- correct typographical errors
          "html",
          "cssls", --CSS
          "tailwindcss", -- TailwinCSS
          "somesass_ls", -- Sass
          "tsserver", -- JavaScript/TypeScript
          "volar", -- vue
          "eslint", --ESlint
          -- "gopls", --Golang
          -- "golangci_lint_ls", --Golang
          "jdtls", -- Java
          "lua_ls", --Lua
          "dockerls", -- Docker
          "docker_compose_language_service", -- Docker compose file
          -- "sqls",
          -- "pylsp", -- Python lsp
          -- "pyre", -- Python type checker
          -- "ruff", -- Python code linter and formatter
          -- "clangd", -- C/C++
          -- "elixirls", -- Elixir
          -- "intelephense", -- PHP
          -- "rust_analyzer", -- Rust
        },
      })
      require('mason-lspconfig').setup_handlers({
        function(server_name)
          local server_config = {}
          if require("neoconf").get(server_name .. "disable") then
            return
          end
          if server_name == "volar" then
            server_config.filetypes = {"vue", "typescript", "javascript"}
          end
          lspconfig[server_name].setup(server_config)
        end,
      })

     lspconfig.volar.setup{
        filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
        init_options = {
          vue = {
            hybridMode = false,
          },
          typescript = {
            tsdk = vim.fn.getcwd() .. "/npm/lib/node_modules/typescript/lib",
          },
        },
        
      }
      lspconfig.tsserver.setup {
        on_attach = function(client, bufnr)
          -- Enable completion triggered by <c-x><c-o>
          vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
          -- Customize key mappings if needed
          -- Example: 
          -- local opts = { noremap=true, silent=true }
          -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
          -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        end,
        filetypes = {"javascript", "typescript", "javascriptreact", "typescriptreact"},
      }
      -- lspconfig.gopls.setup {
      --   filetypes = {"go", "gomod"}
      -- }
      -- lspconfig.lua_ls.setup()
      lspconfig.gopls.setup{
        filetypes = {"go", "gomod"}
      }
      lspconfig.tailwindcss.setup {}
      lspconfig.prismals.setup{}
      lspconfig.jdtls.setup{
        filetypes = {"java"}
      }
      require("mason-nvim-dap").setup({
        ensure_installed = {
          -- "js",
          -- "node2",
          -- "chrome",
          -- "php",
          -- "dart",
          -- "cppdg",
          -- "python",
          -- "elixir",
        }
      })

    end,
  }

