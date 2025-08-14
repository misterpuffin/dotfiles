return {
  {
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'rebelot/kanagawa.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('kanagawa').setup({
        compile = true,
        transparent = true,
      })

      -- Load the colorscheme here.
      vim.cmd.colorscheme("kanagawa")
      vim.cmd("hi LineNr guibg=NONE")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    end,
    build = function()
      vim.cmd("KanagawaCompile");
    end
  },
}

-- vim: ts=2 sts=2 sw=2 et
