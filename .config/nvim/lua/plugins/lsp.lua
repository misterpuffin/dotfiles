return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },           -- Required
		{ "williamboman/mason.nvim" },         -- Optional
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },       -- Required
		{ "hrsh7th/cmp-nvim-lsp" },   -- Required
		{ "hrsh7th/cmp-buffer" },     -- Optional
		{ "hrsh7th/cmp-path" },       -- Optional
		{ "saadparwaiz1/cmp_luasnip" }, -- Optional
		{ "hrsh7th/cmp-nvim-lua" },   -- Optional

		-- Snippets
		{ "L3MON4D3/LuaSnip" },           -- Required
		{ "rafamadriz/friendly-snippets" }, -- Optional
	},
	config = function()
		local lsp = require("lsp-zero").preset({})

		lsp.on_attach(function(client, bufnr)
			lsp.default_keymaps({
				buffer = bufnr,
				preserve_mappings = false,
			})
			vim.keymap.set({ 'n', 'x' }, 'gq', function()
				vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
			end)
		end)

		require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
		lsp.setup()

		local cmp = require("cmp")
		local cmp_action = require("lsp-zero").cmp_action()

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "path" },
				{ name = "buffer",  keyword_length = 3 },
			},
			mapping = {
				["<C-f>"] = cmp_action.luasnip_jump_forward(),
				["<C-b>"] = cmp_action.luasnip_jump_backward(),
			},
		})
	end,
}
