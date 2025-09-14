-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require("config.options")

-- [[ Basic Keymaps ]]
require("config.keymaps")

require("config.lsp")

-- [[ Install `lazy.nvim` plugin manager ]]
require("config.lazy-bootstrap")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
