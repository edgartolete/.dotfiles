-- [[
-- Run below commands to enable treesitter for the file types
-- :TSInstall html css scss javascript typescript tsx vue java go c lua sql
-- ]]

return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'html',
        'css',
        'scss',
        'javascript',
        'typescript',
        'tsx',
        'vue',
        'java',
        'go',
        'gomod',
        'gosum',
        'c',
        'cpp',
        'lua',
        'sql',
        'toml',
        'xml',
        'rust',
        'python',
        'php',
        'json',
        'julia',
        'elixir',
        'csv',
        'zsh',
      },
      auto_install = true,
      highlight = true,
      indent = { enable = true},
    },
 }
