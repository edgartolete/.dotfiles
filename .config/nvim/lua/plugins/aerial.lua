return {
  'stevearc/aerial.nvim',
  tag = "stable",
  opts = {},
  ft = { "vue", "java", "dart" },
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  keys = {
    { "<leader>ts", "<cmd>AerialToggle!<CR>", desc = "Aerial" },
  },
}
