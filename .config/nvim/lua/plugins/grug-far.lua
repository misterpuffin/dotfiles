return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  keys = {
    { "<leader>fr", function() require("grug-far").open() end, desc = "[F]ind and [R]eplace" },
    { "<leader>fr", function() require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } }) end, mode = "v", desc = "[F]ind and [R]eplace (selection)" },
  },
  opts = {},
}
