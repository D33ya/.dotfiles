return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<c-\>]],
        persist_mode = false,
        direction = 'float',
        float_opts = {
          border = 'curved',
        },
      }
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }

      function _lazygit_toggle()
        lazygit:toggle()
      end

      vim.api.nvim_set_keymap('n', '<C-g>', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
    end,
  },
}
