local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set('n', '<leader>ca', function()
  vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr, desc = 'Action' })
vim.keymap.set(
  'n',
  'K', -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp { 'hover', 'actions' }
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set('n', '<leader>cr', function()
  vim.cmd.RustLsp 'runnables'
end, { silent = true, buffer = bufnr, desc = 'Run' })

local wk = require 'which-key'
wk.add {
  mode = { 'n' },
  {
    '<leader>cd',
    function()
      vim.cmd.RustLsp 'openDocs'
    end,
    desc = 'Open Docs',
    silent = true,
    buffer = bufnr,
  },
}
