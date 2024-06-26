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
			vim.keymap.set({ 'n', 'x' }, 'gn', function()
				vim.lsp.buf.rename()
			end)
			vim.keymap.set({ 'n', 'x' }, 'ca', function()
				vim.lsp.buf.code_action()
			end)
			lsp.buffer_autoformat()
		end)

		lsp.setup()

		local cmp = require("cmp")
		cmp.setup({
			mapping = {
				['<CR>'] = cmp.mapping.confirm({ select = false }),
			}
		})

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
