local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require('plugins.neoconf'),
  require('plugins.bookmarks'), -- WARNING: Buggy on Debian 12 + Nvim 0.10.0 
  require('plugins.fugitive'), -- another tool to do git
  require('plugins.treesitter'),
  require('plugins.numbertoggle'), -- add number every line for jump
  require('plugins.mason'), -- lsp, management
  require('plugins.comment'), -- easily add comment using gcc and visual mode gc binding
  require('plugins.tailwind'), -- tailwind autosuggest
  require('plugins.which-key'), -- helper what key to press next
  -- require('plugins.tokyonight'), -- theme, colorscheme
  require('plugins.moonfly'),
  require('plugins.telescope'), -- fuzzy finder, search
  require('plugins.neotree'), -- file tree
  require('plugins.cmp'), -- auto completion
  require('plugins.auto-pair'), -- automatically add pair
  require('plugins.prettier'), -- auto align, indent, and format
  require('plugins.go'), -- golang helper
  require('plugins.flutter-tools'), -- flutter helper
  require('plugins.harpoon'), -- file bookmarking
  require('plugins.lualine'), -- add bottom status bar
  require('plugins.neogit'), -- Manage git 
  require('plugins.lorem'), -- Add lorem dummy texts
  require('plugins.spectre'), -- Find and Replace
  require('plugins.lazygit'), -- LazyGit integreation
  require('plugins.treesj'), --Toggle Code blocks
  require('plugins.aerial'), -- Show Code tree structure
  require('plugins.gitsigns'),
  require('plugins.trouble'),
  require('plugins.todo-comments'), -- Allow to add comments like TODO/NOTE/FIX/WARNING/HACK/PERF/ 
  require('plugins.ts-comments'), -- Adds proper comments for ts, jsx
  -- require('plugins.persistence'), -- automatically saves the active session under ~/.local/state/nvim/sessions on exit
  require('plugins.undo-tree'),
  require('plugins.jdtls'),
  require('plugins.lazydocker'),
  require('plugins.tailwind-sorter'),
  require('plugins.tailwind-fold'),
  require('plugins.dap'),
  require('plugins.lspsaga'),
  require('plugins.diffview'),
  require('plugins.nuxt-goto'),
  require('plugins.kiwi'),
  require('plugins.surround'),
  -- require('plugins.nvim-ufo'),
  require('plugins.indent-blankline'),
  require('plugins.debugprint'),
  require('plugins.markdown-preview'),
  require('plugins.copilot'),
})

require('core.options')
require('core.keymaps')
