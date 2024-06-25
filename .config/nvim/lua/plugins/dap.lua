-- Reference: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#javascript-chrome

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "folke/neodev.nvim",
    "nvim-treesitter/nvim-treesitter",
    "leoluz/nvim-dap-go",
  },
  ft = {"go", "java", "vue", "javascript", "javacriptreact", "typescript", "typescriptreact", "python"},
  config = function()
    require("nvim-dap-virtual-text").setup({})
    require("neodev").setup({
      library = { plugins = { "nvim-dap-ui" }, types = true },
    })
    local dap = require("dap")
    local dapui = require("dapui")

    require('dap-go').setup({})
    dapui.setup({})

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
