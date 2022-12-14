require("haoren.plugins-setup")
require("haoren.core.options")
require("haoren.core.keymaps")
require("haoren.core.colorscheme")
require("haoren.plugins.comment")
require("haoren.plugins.nvim-tree")
require("haoren.plugins.lualine")
require("haoren.plugins.telescope")
require("haoren.plugins.nvim-cmp")
require("haoren.plugins.lsp.mason")
require("haoren.plugins.lsp.lspsaga")
require("haoren.plugins.lsp.lspconfig")
require("haoren.plugins.lsp.null-ls")
require("haoren.plugins.autopairs")
require("haoren.plugins.treesitter")
require("haoren.plugins.gitsigns")
require("haoren.plugins.bufferline")
require("haoren.plugins.blankline")

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "tsconfig.json",
  command = "setlocal filetype=jsonc",
})
