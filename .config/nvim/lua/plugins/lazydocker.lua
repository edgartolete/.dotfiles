return {
    "mgierada/lazydocker.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    config = true,
    cmd = { "Lazydocker" },
    keys = {
        { "<leader>od", "<cmd>Lazydocker<CR>", desc = "Lazydocker" },
    },
  }
