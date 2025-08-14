-- lazy.nvim
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      enabled = true
      -- your picker configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }, 
  keys = {
    -- Top Pickers & Explorer
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "[F]ind [B]uffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
    -- TODO: discover if I like the explorer
    -- { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
  }
}
