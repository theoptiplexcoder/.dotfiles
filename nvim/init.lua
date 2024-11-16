--numbering of lines,thats it!
vim.wo.relativenumber=true
vim.wo.number=true

--keymapping for closing editing files and saving files
vim.keymap.set('n','<C-s>',':w<CR>',{noremap=true,silent=true})
vim.keymap.set('n','<C-x>',':x<CR>',{noremap=true,silent=true})

--back to explorer
vim.keymap.set('n','-',':Ex<CR>',{noremap=true,silent=true})

require("config.lazy")

--applying colorscheme
vim.cmd.colorscheme "catppuccin-mocha"
