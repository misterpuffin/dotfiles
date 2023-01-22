-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then return {
  {"EdenEast/nightfox.nvim"},
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "terafox",
    }
  },
  {"numToStr/FTerm.nvim"},
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    opts = {
      autotag = { enable = true },
    },
  },
  {'ojroques/nvim-osc52'},
} end
