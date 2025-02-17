return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      require('mini.ai').setup { n_lines = 500 }
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      require('mini.surround').setup()
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']            -- Normal and Visual modes

      -- Toggle comments
      require('mini.comment').setup()
      -- comment = 'gc',

      -- Toggle comment on current line
      -- comment_line = 'gcc',

      -- Toggle comment on visual selection
      -- comment_visual = 'gc',

      -- Define 'comment' textobject (like `dgc` - delete whole comment block)
      -- Works also in Visual mode if mapping differs from `comment_visual`
      -- textobject = 'gc'
    end,
  },
}
