return {
  'edgartolete/nvim-java',
  tag = "v1.5.1",
  dependencies = {
    'nvim-java/lua-async-await',
    'nvim-java/nvim-java-core',
    'nvim-java/nvim-java-test',
    'nvim-java/nvim-java-dap',
    'MunifTanjim/nui.nvim',
    'neovim/nvim-lspconfig',
    'nvim-java/nvim-java-refactor',
    'mfussenegger/nvim-dap',
    {
      'williamboman/mason.nvim',
      opts = {
        registries = {
          'github:nvim-java/mason-registry',
          'github:mason-org/mason-registry',
        },
      },
      -- config = function()
      --           local registry = require("mason-registry")
      --           registry.refresh()
      --           registry.get_all_packages()
      -- end,
    }
  },
  config = function()
    require('java').setup({})
    require('lspconfig').jdtls.setup({})
  end,
}
