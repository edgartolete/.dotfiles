-- Do not use this, use harpoon is better

return {
  'tomasky/bookmarks.nvim',
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  event = "VimEnter",
  config = function()
    require('bookmarks').setup()
  end
}
