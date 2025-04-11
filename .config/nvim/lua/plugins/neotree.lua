return {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        cmd = {
            "Neotree",
            "Neotree float",
            "Neotree toggle",
            "Neotree toggle float",
            "Neotree reveal",
            "Neotree close",
        },
        keys = {
            { "<leader>te", "<cmd>Neotree toggle float<CR>", desc = "Neotree Explorer" },
        }
    }
