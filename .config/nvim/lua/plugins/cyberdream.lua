return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
    require('cyberdream').setup({
          transparent = true,
    })
    local cyberdream = require("lualine.themes.cyberdream") -- or require("lualine.themes.cyberdream-light") for the light variant
    require("lualine").setup({
        -- ... other config
        options = {
            theme = cyberdream,
        },
        -- ... other config
    })
    end
}
