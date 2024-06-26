return {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            -- 'hrsh7th/cmp-vsnip',
            -- 'hrsh7th/vim-vsnip',
            -- 'L3MON4D3/LuaSnip',
            "SirVer/ultisnips",
            "luckasRanarison/tailwind-tools.nvim",
            "onsails/lspkind-nvim",
        },
        config = function ()
        local cmp = require('cmp')

        -- Configure nvim-cmp
        cmp.setup({
          -- You can set up mapping with other plugins here.
          -- For example:
          mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
          },
          snippet = {
              expand = function(args)
                require'luasnip'.lsp_expand(args.body)
              end
            },
          sources = {
            { name = 'nvim_lsp' },
            { name = 'buffer' },
            { name = 'path' },
            -- { name = 'luasnip' },
            -- Add more sources as needed.
          }
        })

         -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' }
          }, {
            { name = 'cmdline' }
          }),
          matching = { disallow_symbol_nonprefix_matching = false }
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' }
          }
        })

         -- Set up lspconfig.
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
        require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
          capabilities = capabilities
        }

      end,
    }

