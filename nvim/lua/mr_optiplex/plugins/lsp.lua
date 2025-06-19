return {
{
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",    -- LSP source
    "L3MON4D3/LuaSnip",        -- Snippet engine
    "saadparwaiz1/cmp_luasnip" -- Snippet completion source
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-f>"] = cmp.mapping.complete(),
        ["<C-c>"] = cmp.mapping.confirm({ select = true }),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
      },
    })
  end,
},
  -- Mason: Manage LSP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          border = "none",
          icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
          },
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local servers = {
	"ts_ls",
        "lua_ls",
        "cssls",
        "html",
        "pyright",
        "bashls",
        "jsonls",
        "yamlls",
      }

      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local servers = {
        "lua_ls",
	"ts_ls",
        "cssls",
        "html",
        "pyright",
        "bashls",
        "jsonls",
        "yamlls",
      }

      for _, server in pairs(servers) do
        local opts = {
	on_attach = function(client, bufnr)
  	local bufmap = function(mode, lhs, rhs)
    	vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
  end

  bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
end

        }

        server = vim.split(server, "@")[1]

        local ok, custom_opts = pcall(require, "lsp.settings." .. server)
        if ok then
          opts = vim.tbl_deep_extend("force", custom_opts, opts)
        end

        lspconfig[server].setup(opts)
      end
    end,
  },

  {
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
  },

  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("lspsaga").setup({})
    end,
  },

  

  {
    "onsails/lspkind.nvim",
  },
}


