-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  optional = true,
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = false,
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*[(:].*]], -- matches TODO: and TODO(...):
    },
    search = {
      pattern = [[\b(KEYWORDS)(\([^)]*\))?:?]], -- matches both formats
    },
  },
  keys = {
    { "<leader>st", function() Snacks.picker.todo_comments() end,                                          desc = "Todo" },
    { "<leader>sT", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
  },
}
--  vim: ts=2 sts=2 sw=2 et
