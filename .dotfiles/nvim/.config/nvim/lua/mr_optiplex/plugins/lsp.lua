return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'neovim/nvim-lspconfig',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Set up cmp (you can customize this further)
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true}),
	   ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
	   ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
	   ['<C-j>'] = cmp.mapping.select_next_item(),
           ['<C-k>'] = cmp.mapping.select_prev_item(),
        }),
	
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      })

      -- Configure LSP servers
      local servers = { "lua_ls","vimls" }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          capabilities = capabilities,
        }
      end
    end,
  },
	{
		"williamboman/mason.nvim",
  		dependencies = {
  		  "williamboman/mason-lspconfig.nvim",
  		  "neovim/nvim-lspconfig",
  		},
  		config = function()
  		  require("mason").setup()
  		  require("mason-lspconfig").setup({
  		    ensure_installed = { "lua_ls", "typescript_language_server" }, -- auto-installs these
  		  })
  		end,
	}
}

