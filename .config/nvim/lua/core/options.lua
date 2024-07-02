vim.g.mapleader = ' '
vim.opt.number = true
vim.opt.hidden = true --Show hidden files
vim.opt.tabstop = 2 -- Set the number of spaces a tab character is visually represented with
vim.opt.shiftwidth = 2 -- Set the number of spaces used for each step of (auto)indent
vim.opt.expandtab = true -- Insert spaces instead of tabs when you press the tab key

-- vim.cmd([[colorscheme tokyonight-night]])

-- vim.cmd([[colorscheme cyberdream]])

vim.cmd([[colorscheme moonfly]])
vim.g.moonflyNormalFloat = true
vim.g.moonflyVirtualTextColor = true

vim.cmd('set grepprg=grep\\ -nH\\ --nogroup\\ --color=never')
vim.cmd('set grepformat=%f:%l:%c:%m')


