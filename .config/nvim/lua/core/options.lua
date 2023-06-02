local opt = vim.opt

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- line numbers
-- opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true

-- undo history
opt.undofile = true

-- decrease update time
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 300

-- better completion
opt.completeopt = 'menuone,noselect'

-- options from kickstart that i'm not sure about
vim.wo.signcolumn = 'yes'

-- search settings
opt.ignorecase = true
opt.smartcase = true

--cursor line
-- opt.cursorline = true

-- appearance
opt.cmdheight = 0
opt.termguicolors = true

opt.backspace = '2'
opt.showcmd = true
opt.laststatus = 2
opt.autowrite = true
opt.autoread = true

-- needed for nvim-ufo
opt.foldcolumn = '1' -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
