return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.3
        end
      end,

      open_mapping = [[<C-\>]],

      persist_mode = false,

      direction = 'vertical',
    },
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]]),
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]]),
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]]),
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]]),
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]]),
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]]),
  },
}
