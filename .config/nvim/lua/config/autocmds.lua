-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
local function copy()
  if vim.v.event.operator == "y" and vim.v.event.regname == "c" then
    require("osc52").copy_register("c")
  end
end

vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
