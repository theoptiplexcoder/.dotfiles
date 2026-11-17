-- ~/.config/nvim/init.lua

-- Leader key
vim.g.mapleader = " "

require('options')
require('keymaps')
require('plugins')
require('lsp')

vim.cmd("syntax enable")
