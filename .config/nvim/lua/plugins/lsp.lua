return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ "williamboman/mason.nvim" }, -- Optional
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "hrsh7th/cmp-buffer" }, -- Optional
		{ "hrsh7th/cmp-path" }, -- Optional
		{ "saadparwaiz1/cmp_luasnip" }, -- Optional
		{ "hrsh7th/cmp-nvim-lua" }, -- Optional

		-- null ls
		{ "jose-elias-alvarez/null-ls.nvim" },
		{ "jay-babu/mason-null-ls.nvim" },
		-- Snippets
		{ "L3MON4D3/LuaSnip" }, -- Required
		{ "rafamadriz/friendly-snippets" }, -- Optional
	},
	config = function()
		local lsp = require("lsp-zero").preset({})

		lsp.on_attach(function(client, bufnr)
			lsp.default_keymaps({
				buffer = bufnr,
				preserve_mappings = false,
			})
		end)

		lsp.format_mapping("gq", {
			format_opts = {
				async = false,
				timeout_ms = 10000,
			},
			servers = {
				["null-ls"] = { "javascript", "typescript", "lua" },
			},
		})

		lsp.format_on_save({
			format_opts = {
				timeout_ms = 10000,
			},
			servers = {
				["null-ls"] = { "javascript", "typescript", "lua" },
			},
		})

		require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
		lsp.setup()

		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {},
		})

		require("mason-null-ls").setup({
			ensure_installed = nil,
			automatic_installation = true,
			automatic_setup = true,
		})

		-- Required when `automatic_setup` is true
		require("mason-null-ls").setup_handlers()

		local cmp = require("cmp")
		local cmp_action = require("lsp-zero").cmp_action()

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "path" },
				{ name = "buffer", keyword_length = 3 },
			},
			mapping = {
				["<C-f>"] = cmp_action.luasnip_jump_forward(),
				["<C-b>"] = cmp_action.luasnip_jump_backward(),
			},
		})
	end,
}