return {
	{ "rmehri01/onenord.nvim", lazy = true },
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
	{ "folke/which-key.nvim",  opts = {} },
	-- indent guides for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			-- char = "▏",
			char = "│",
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
	},
	-- active indent guide and indent text objects
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},
	{ "numToStr/Comment.nvim", opts = {} },
	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	-- auto pairs
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.pairs").setup(opts)
		end,
	},
	-- Navigator with Tmux
	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup()

			vim.keymap.set({'n', 't'}, '<C-h>', '<CMD>NavigatorLeft<CR>')
			vim.keymap.set({'n', 't'}, '<C-l>', '<CMD>NavigatorRight<CR>')
			vim.keymap.set({'n', 't'}, '<C-k>', '<CMD>NavigatorUp<CR>')
			vim.keymap.set({'n', 't'}, '<C-j>', '<CMD>NavigatorDown<CR>')
			vim.keymap.set({'n', 't'}, '<C-\\>', '<CMD>NavigatorPrevious<CR>')
		end
	}
}
