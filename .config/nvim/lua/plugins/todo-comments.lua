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
    { "<leader>ft", function() Snacks.picker.todo_comments() end,                                          desc = "[F]ind [T]odo" },
    { "<leader>fT", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "[F]ind [T]odo/Fix/Fixme" },
  },
}
--  vim: ts=2 sts=2 sw=2 et
