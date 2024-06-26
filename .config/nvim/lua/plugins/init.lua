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
  -- [[Latex]]
  {
    'lervag/vimtex',
    config = function() 
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_latexmk = {
	build_dir = 'output',
	options = {
	  '-auxdir=aux',
	  '-verbose',
	  '-file-line-error',
	  '-synctex=1',
	  '-interaction=nonstopmode',
	},
      }
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
  -- search and replace
  { 
    "nvim-pack/nvim-spectre",
    config = function()
      vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre"
      })
      vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word"
      })
      vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word"
      })
      vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file"
      })
    end
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
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- char = "▏",
      indent = {
	char = "│"
      },
      exclude = {
	filetypes = { "help", "dashboard", "lazy", "Trouble" }
      },
      scope = { enabled = true }
    },
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
    config = function()
     require("oil").setup()
      vim.keymap.set("n", "<leader>fe", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
  }
}
