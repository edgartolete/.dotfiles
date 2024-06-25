return  {
        'nvim-telescope/telescope.nvim', --highly extendable fuzzy finder over lists.
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config  = function ()
            -- require("telescope").load_extension("flutter")
            require("telescope").load_extension("bookmarks")
            require("telescope").setup({
              pickers = {
                -- find_files = { theme = "ivy" },
                -- oldfiles = { theme = "ivy" },
                -- buffers = { theme = "ivy" },
                live_grep = { theme = "ivy" },
              }
            })
        end,
    }
