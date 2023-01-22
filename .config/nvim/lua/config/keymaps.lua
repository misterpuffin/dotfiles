-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<C-t>", '<CMD>lua require("FTerm").toggle()<CR>', { desc = "Terminal" })
vim.keymap.set("t", "<C-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

vim.keymap.set("n", "<leader>c", require("osc52").copy_operator, { expr = true })
vim.keymap.set("n", "<leader>cc", "<leader>c_", { remap = true })
vim.keymap.set("x", "<leader>c", require("osc52").copy_visual)
