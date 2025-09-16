-- lazy.nvim
return {
  {
    "dmtrKovalenko/fff.nvim",
    build = "cargo build --release",
    -- scan for faster first load
    event = "VeryLazy",
    opts = {
      prompt = "",
      keymaps = {
        move_up = { "<Up>", "<C-p>", "<C-k>" },
        move_down = { "<Down>", "<C-n>", "<C-j>" },
      },
      layout = {
        prompt_position = "top",
      },
    },
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
        enabled = true,
        ui_select = true,
        formatters = {
          file = {
            filename_first = true,
            truncate = 40,
            filename_only = false,
            icon_width = 2,
            git_status_hl = true
          }
        }
      },
    },
    keys = {
      -- Top Pickers & Explorer
      { "<leader>ff", function() require('plugins.fuzzy-finder.fff').fff() end, desc = "[P]ick Files" },
      { "<leader>fb", function() Snacks.picker.buffers() end,                   desc = "[P]ick [B]uffers" },
      { "<leader>fg", function() Snacks.picker.grep() end,                      desc = "[P]ick [G]rep" },
      { "<leader>fc", function() Snacks.picker.command_history() end,           desc = "[P]ick [C]ommand History" },
      { "<leader>fn", function() Snacks.picker.notifications() end,             desc = "[N]otification History" },
      -- { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    }
  }
}
