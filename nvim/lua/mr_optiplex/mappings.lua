--keymapping for closing editing files and saving files
vim.keymap.set('n','<C-s>',':w<CR>',{noremap=true,silent=true})
vim.keymap.set('n','<C-x>',':x<CR>',{noremap=true,silent=true})

--back to explorer
vim.keymap.set('n','-',':Ex<CR>',{noremap=true,silent=true})

--telescope wordy commands
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
