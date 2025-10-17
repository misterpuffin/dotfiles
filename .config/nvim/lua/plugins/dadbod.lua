return {
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      vim.g.db_ui_use_nerd_fonts = 1

      local wk = require("which-key")
      wk.add({
        { "<leader>d", group = "Database" },
      })
    end,
    keys = {
      { "<leader>db", "<cmd>DBUI<cr>", desc = "[D]atabase [B]rowser" },
      { "<leader>dt", "<cmd>DBUIToggle<cr>", desc = "[D]atabase [T]oggle" },
      { "<leader>df", "<cmd>DBUIFindBuffer<cr>", desc = "[D]atabase [F]ind" },
      { "<leader>dr", "<cmd>DBUIRenameBuffer<cr>", desc = "[D]atabase [R]ename" },
      { "<leader>dl", "<cmd>DBUILastQueryInfo<cr>", desc = "[D]atabase [L]ast Query" },
    },
  },
}