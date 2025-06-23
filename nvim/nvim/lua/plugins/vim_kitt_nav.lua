return {
  {
    'knubie/vim-kitty-navigator',
    build = 'cp ./*.py ~/.config/kitty/',
  },
  -- {
  --   'mrjones2014/smart-splits.nvim',
  --   build = './kitty/install-kittens.bash',
  --   opts = {},
  --   config = function(_, opts)
  --           local wk = require('which-key')
  --           local smart_splits = require('smart-splits')
  --           wk.add({
  --               {
  --                   mode = {'n', 'v'},
  --                   {'<C-h>', smart_splits.move_cursor_left },
  --               },
  --           }
  --   end,
  -- },
}
