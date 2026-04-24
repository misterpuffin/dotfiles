return {
  'gbprod/substitute.nvim',
  keys = {
    { 'x', function() require('substitute').operator() end, mode = 'n', desc = 'Substitute operator' },
    { 'xx', function() require('substitute').line() end, mode = 'n', desc = 'Substitute line' },
    { 'X', function() require('substitute').eol() end, mode = 'n', desc = 'Substitute to end of line' },
    { 'x', function() require('substitute').visual() end, mode = 'x', desc = 'Substitute visual' },
  },
  opts = {},
}
-- vim: ts=2 sts=2 sw=2 et
