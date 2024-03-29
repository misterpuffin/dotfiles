return {
  -- [[Colorschemes]]
  { "rmehri01/onenord.nvim", lazy = true },
  { "rebelot/kanagawa.nvim" },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    config = function()
      require('nightfox').setup({
	options = {
	  transparent = true,
	}
      })
    end
  },
  -- [[Git integration]]
  { "f-person/git-blame.nvim" }, -- In-line git blame
  {
    "sindrets/diffview.nvim",
    config = {
      view = {
	merge_tool = {
	  layout = "diff3_mixed",
	  winbar_info = true
	}
      }
    }
  },
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
  -- [[Editor plugins]]
  { "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async'},
    config = function()
      require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
	  return {'treesitter', 'indent'}
      end
      })
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
    require("todo-comments").setup {}
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  {
    'iamcco/markdown-preview.nvim',
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" }
  },
  { "folke/which-key.nvim",  opts = {} },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({ mapping = { "jk" } })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- char = "▏",
      char = "│",
      filetype_exclude = { "help", "dashboard", "lazy", "Trouble" },
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
	pattern = { "help", "lazy", "dashboard", "mason", "Trouble" },
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
      vim.keymap.set({ 'n', 't' }, '<C-h>', '<CMD>NavigatorLeft<CR>')
      vim.keymap.set({ 'n', 't' }, '<C-l>', '<CMD>NavigatorRight<CR>')
      vim.keymap.set({ 'n', 't' }, '<C-k>', '<CMD>NavigatorUp<CR>')
      vim.keymap.set({ 'n', 't' }, '<C-j>', '<CMD>NavigatorDown<CR>')
      vim.keymap.set({ 'n', 't' }, '<C-\\>', '<CMD>NavigatorPrevious<CR>')
    end
  },
  -- Edit directories with nvim like buffers
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}
