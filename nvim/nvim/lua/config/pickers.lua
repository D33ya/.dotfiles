MiniPick.registry.config = function()
  local opts = { source = { cwd = vim.fn.stdpath 'config' } }
  local local_opts = { source = { cwd = nil } }
  return MiniPick.builtin.files(local_opts, opts)
end
