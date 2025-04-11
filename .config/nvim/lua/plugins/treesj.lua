return {
  'Wansmer/treesj',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('treesj').setup({
    })
  end,
  cmd = {
    "TSJToggle",
    "TSJJoin",
    "TSJSplit",
  },
  keymaps = {
    { "<leader>Fc", "<cmd>TSJToggle<cr>", desc = "Code block [t]oggle" },
    { "<leader>Fj", "<cmd>TSJJoin<cr>", desc = "Code block [j]oin" },
    { "<leader>Fs", "<cmd>TSJSplit<cr>", desc = "Code block [s]plit" },
  },
}
