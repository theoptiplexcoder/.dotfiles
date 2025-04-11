--keymapping for closing editing files and saving files
vim.keymap.set('n','<C-s>',':w<CR>',{noremap=true,silent=true})
vim.keymap.set('n','<C-x>',':x<CR>',{noremap=true,silent=true})

--back to explorer
vim.keymap.set('n','-',':Ex<CR>',{noremap=true})


--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
