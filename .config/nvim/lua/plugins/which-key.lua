return {
      "folke/which-key.nvim", --WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible key bindings of the command you started typing.
      event = "VeryLazy",
      init = function()
        vim.opt.timeout = true
        vim.opt.timeoutlen = 300
      end,
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        }
}
