vim.pack.add({
    {
        src = "https://github.com/mason-org/mason.nvim",
    },

    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
    },
    {
        src="https://github.com/thekylehuang/cole.nvim",
    },
        -- Pi AI coding agent
    {
        src = "https://github.com/pablopunk/pi.nvim",
    },
})

-- Mason
require("mason").setup({
    ui = {
        border = "rounded",
    },
})

-- Treesitter
require("nvim-treesitter").setup({
    highlight = {
        enable = true,
    },

    indent = {
        enable = true,
    },
})

require("pi").setup({
    thinking = "off",

    context = {
        max_bytes = 24000,

        ask = {
            surrounding_lines = 80,
        },

        selection = {
            surrounding_lines = 40,
        },

        diagnostics = {
            enabled = true,
        },
    },

    skills = true,
    extensions = true,
})






vim.cmd.colorscheme("cole")
