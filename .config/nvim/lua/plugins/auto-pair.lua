return {
      'windwp/nvim-autopairs', --A super powerful autopair plugin for Neovim that supports multiple characters.
      event = "InsertEnter",
      config = function ()
        require('nvim-autopairs').setup({
          enable_check_bracket_line = true,  -- Check bracket in same line
          ignored_next_char = "[%w%.]"        -- Ignore alphanumeric and dot
        })
      end,
      -- use opts = {} for passing setup options
      -- this is equalent to setup({}) function
    }
