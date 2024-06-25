-- [[
-- Run below commands to enable treesitter for the file types
-- :TSInstall html
-- :TSInstall vue
-- :TSInstall tsx
-- :TSInstall go
-- ]]

return {
  {
    'laytan/tailwind-sorter.nvim',
    dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim'},
    build = 'cd formatter && npm ci && npm run build',
    config = true,
    ft = { "typescriptreact"}
  },
}
