-- Diagnostics
local map = vim.keymap.set

map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostic list" })


-- File explorer
map("n", "<leader>e", "<cmd>Ex<CR>", {
    desc = "File Explorer",
})

-- Save
map("n", "<leader>w", "<cmd>w<CR>", {
    desc = "Save",
})

-- Quit
map("n", "<leader>q", "<cmd>q<CR>", {
    desc = "Quit",
})

-- Save and quit
map("n", "<leader>x", "<cmd>wq<CR>", {
    desc = "Save and Quit",
})

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>", {
    desc = "Clear Search Highlight",
})

-- Window navigation
map("n", "<C-h>", "<C-w>h", {
    desc = "Move to Left Window",
})

map("n", "<C-j>", "<C-w>j", {
    desc = "Move to Bottom Window",
})

map("n", "<C-k>", "<C-w>k", {
    desc = "Move to Top Window",
})

map("n", "<C-l>", "<C-w>l", {
    desc = "Move to Right Window",
})

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<CR>")
map("n", "<C-Down>", "<cmd>resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize +2<CR>")

-- Move selected lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")


-- ============================================================================
-- SPLITS
-- ============================================================================

-- Vertical split
map("n", "<leader>sv", "<cmd>vsplit<CR>", {
    desc = "Vertical Split",
})

-- Horizontal split
map("n", "<leader>sh", "<cmd>split<CR>", {
    desc = "Horizontal Split",
})

-- Close current split
map("n", "<leader>sc", "<cmd>close<CR>", {
    desc = "Close Split",
})

-- Equalize split sizes
map("n", "<leader>se", "<C-w>=" , {
    desc = "Equalize Splits",
})


--- pi agent
-- ============================================================================
-- PI AI
-- ============================================================================

-- Ask Pi about the current buffer
map("n", "<leader>ai", "<cmd>PiAsk<CR>", {
    desc = "Ask Pi",
})

-- Ask Pi about visual selection
map("v", "<leader>ai", "<cmd>PiAskSelection<CR>", {
    desc = "Ask Pi about Selection",
})

-- Cancel Pi request
map("n", "<leader>ac", "<cmd>PiCancel<CR>", {
    desc = "Cancel Pi",
})

-- Open Pi session log
map("n", "<leader>al", "<cmd>PiLog<CR>", {
    desc = "Pi Log",
})
