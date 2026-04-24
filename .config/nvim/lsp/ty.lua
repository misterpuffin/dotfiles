---@type vim.lsp.Config
return {
  cmd = { '/home/haoren/.local/bin/ty', 'server' },
  filetypes = { 'python' },
  root_dir = function(bufnr, on_dir)
    on_dir(vim.fs.root(bufnr, '.git') or vim.fs.root(bufnr, { 'ty.toml', 'pyproject.toml', '.git' }))
  end,
  settings = {
    ty = {
      diagnosticMode = 'openFilesOnly',
    },
  },
}
