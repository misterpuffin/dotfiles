return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  event = 'VeryLazy',
  opts = {
    provider_selector = function()
      return { 'treesitter', 'indent' }
    end,
  },
  init = function()
    vim.o.foldcolumn = '0'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  keys = {
    { 'zR', function() require('ufo').openAllFolds() end, desc = 'Open all folds' },
    { 'zM', function() require('ufo').closeAllFolds() end, desc = 'Close all folds' },
    { 'zK', function() require('ufo').peekFoldedLinesUnderCursor() end, desc = 'Peek fold' },
    { 'zf', function() require('ufo').createFold() end, mode = 'v', desc = 'Create fold from selection' },
  },
}
