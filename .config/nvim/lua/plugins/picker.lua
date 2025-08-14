-- lazy.nvim
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      enabled = true,
      -- your picker configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  keys = {
    -- Top Pickers & Explorer
    {
      "<leader>pf",
      function()
        Snacks.picker.smart()
      end,
      desc = "[P]ick Files",
    },
    {
      "<leader>pb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "[P]ick [B]uffers",
    },
    {
      "<leader>pg",
      function()
        Snacks.picker.grep()
      end,
      desc = "[P]ick [G]rep",
    },
    {
      "<leader>pc",
      function()
        Snacks.picker.command_history()
      end,
      desc = "[P]ick [C]ommand History",
    },
    {
      "<leader>pn",
      function()
        Snacks.picker.notifications()
      end,
      desc = "[N]otification History",
    },
    -- { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
  },
}
