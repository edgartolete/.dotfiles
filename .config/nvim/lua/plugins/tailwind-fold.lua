-- [[
-- Run below commands to enable treesitter for the file types
-- :TSInstall html
-- :TSInstall vue
-- :TSInstall tsx
-- ]]

return {
  'razak17/tailwind-fold.nvim',
  opts= {},
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  ft = { 'svelte', 'astro', 'vue', 'typescriptreact', 'php', 'blade' },
}

