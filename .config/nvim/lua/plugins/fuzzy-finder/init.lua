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
    priority = 1000,
    lazy = false,
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
      projects = {
        enabled = true,
      },
      input = {
        enabled = true,
      },
      notifier = {
        enabled = true,
      },
    },
    keys = {
      -- Find operations
      { "<leader>ff", function() require('plugins.fuzzy-finder.fff').fff() end, desc = "[F]ind [F]iles" },
      { "<leader>fb", function() Snacks.picker.buffers() end,                   desc = "[F]ind [B]uffers" },
      { "<leader>fg", function() Snacks.picker.grep() end,                      desc = "[F]ind [G]rep" },
      { "<leader>fc", function() Snacks.picker.command_history() end,           desc = "[F]ind [C]ommand History" },
      { "<leader>fn", function() Snacks.picker.notifications() end,             desc = "[F]ind [N]otification History" },
      { "<leader>fp", function() Snacks.picker.projects() end,                  desc = "[F]ind [P]rojects" },
      { "<leader>fe", function() require('mini.files').open() end,              desc = "[F]ile [E]xplorer" },
    }
  }
}
