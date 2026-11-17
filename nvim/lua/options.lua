local opt = vim.opt
-- Line numbers
opt.number = true
opt.relativenumber = true

-- Basic editor settings
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true


-- UI
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 8

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Don't show mode twice
opt.showmode = false

-- Faster completion
opt.updatetime = 250

-- Persistent undo
opt.undofile = true
