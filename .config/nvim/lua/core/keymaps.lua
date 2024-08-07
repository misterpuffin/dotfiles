vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local keymap = vim.keymap

-- clear search highlights
keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- delete single character without copying into register
keymap.set("n", "x", "\"_x")

-- stay in indent mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- remap for dealing with word wrap
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- copy/paste to clipboard
keymap.set({ "n", "v" }, "<leader>y", "\"+y")
keymap.set({ "n", "v" }, "<leader>d", "\"+d")
keymap.set({ "n", "v" }, "<leader>p", "\"+p")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
