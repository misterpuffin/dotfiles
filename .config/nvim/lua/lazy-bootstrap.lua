-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup {
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically
  {
    "max397574/better-escape.nvim",
    opts = {}
  },
  { 
    'folke/todo-comments.nvim',
    event = 'VimEnter', 
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false }
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup({})
      vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc= "Open Parent Directory in Oil"})
    end,
    dependencies = { { "echasnovski/mini.icons", opts = {}}},
    lazy = false
  },
  require 'kickstart.plugins.mini',

  -- require 'kickstart.plugins.gitsigns',
  --
  -- require 'kickstart.plugins.which-key',
  --
  -- require 'kickstart.plugins.telescope',
  --
  -- require 'kickstart.plugins.lspconfig',
  --
  -- require 'kickstart.plugins.conform',
  --
  -- require 'kickstart.plugins.blink-cmp',
  --
  -- require 'kickstart.plugins.todo-comments',
  --
  --
  -- require 'kickstart.plugins.treesitter',
  --
  -- Auto import all plugins in .config/nvim/lua/plugins/*.lua
  -- { import = 'plugins' },
  -- I prefer to manually import the plugins so that it's easier to track what's in my config
  require("plugins.colorscheme"),
  require("plugins.which-key"),
  require("plugins.treesitter"),
  require("plugins.picker"),
  require("plugins.blink-cmp"),
  require("plugins.lspconfig")
}
