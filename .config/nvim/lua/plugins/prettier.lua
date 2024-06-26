return {
      'MunifTanjim/prettier.nvim', --Prettier plugin for Neovim's built-in LSP client.
      dependencies = { 'neovim/nvim-lspconfig', 'jose-elias-alvarez/null-ls.nvim' },
      opts = {},
      config = function ()
        local null_ls = require("null-ls")

        local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
        local event = "BufWritePre" -- or "BufWritePost"
        local async = event == "BufWritePost"

        null_ls.setup({
          on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
              vim.keymap.set("n", "<Leader>t", function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
              end, { buffer = bufnr, desc = "[lsp] format" })

              -- FORMAT ON SAVE
              -- vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
              -- vim.api.nvim_create_autocmd(event, {
              --   buffer = bufnr,
              --   group = group,
              --   callback = function()
              --     vim.lsp.buf.format({ bufnr = bufnr, async = async })
              --   end,
              --   desc = "[lsp] format on save",
              -- })
            end

            if client.supports_method("textDocument/rangeFormatting") then
              vim.keymap.set("x", "<Leader>t", function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
              end, { buffer = bufnr, desc = "[lsp] format" })
            end
          end,
        })

        local prettier = require("prettier")

        prettier.setup({
          bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
          filetypes = {
            "lua",
            "go",
            "gomod",
            "css",
            "graphql",
            "html",
            "javascript",
            "javascriptreact",
            "json",
            "less",
            "markdown",
            "scss",
            "typescript",
            "typescriptreact",
            "yaml",
          },
        })

        prettier.setup({
          cli_options = {
            arrow_parens = "always",
            bracket_spacing = true,
            bracket_same_line = false,
            embedded_language_formatting = "auto",
            end_of_line = "lf",
            html_whitespace_sensitivity = "css",
            jsx_bracket_same_line = false,
            jsx_single_quote = false,
            print_width = 250,
            prose_wrap = "preserve",
            quote_props = "as-needed",
            semi = true,
            single_attribute_per_line = false,
            single_quote = false,
            tab_width = 2,
            trailing_comma = "es5",
            use_tabs = false,
            vue_indent_script_and_style = false,
          },
        })
      end,
    }
