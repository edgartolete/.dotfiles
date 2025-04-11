return {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        ui = {
          code_action = ""
        }
      })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    },
    cmd = {
      'Lspsaga',
      'Lspsaga peek_definition',
      'Lspsaga peek_type_definition',
    },
    keys = {
      { "<leader>pd", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
      { "<leader>pt", "<cmd>Lspsaga peek_type_definition<CR>", desc = "Peek Type Definition" },
      { "<leader>ph", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover Doc" },
    }
}
