vim.g.mapleader = " "
--numbering of lines,thats it!
vim.wo.relativenumber=true
vim.wo.number=true

require("mr_optiplex.mappings")
require("mr_optiplex.plugins")


vim.cmd('colorscheme jellybeans')
