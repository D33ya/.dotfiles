return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      -- text editing}
      require('mini.ai').setup()
      require('mini.pairs').setup()
      require('mini.move').setup()
      require('mini.comment').setup()
      require('mini.splitjoin').setup()
      require('mini.surround').setup()
      require('mini.splitjoin').setup()
      -- general work flow
      require('mini.bracketed').setup()
      require('mini.jump').setup()
      require('mini.diff').setup()
      require('mini.git').setup()
      require('mini.sessions').setup()
      require('mini.files').setup()
      require('mini.pick').setup()
      require('mini.extra').setup()
      require('mini.misc').setup()
      -- appearance
      require('mini.animate').setup()
      require('mini.icons').setup()
      require('mini.indentscope').setup {
        options = {
          draw = {
            animation = require('mini.indentscope').gen_animation.quadratic { easing = 'in', duration = 750, unit = 'total' },
          },
          border = 'both',
          indent_at_cursor = true,
          try_as_border = true,
        },
        symbol = '╎',
      }
      require('mini.statusline').setup {
        use_icons = true,
        content = {
          function()
            local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
            local git = MiniStatusline.section_git { trunc_width = 40 }
            local diff = MiniStatusline.section_diff { trunc_width = 75 }
            local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
            local lsp = MiniStatusline.section_lsp { trunc_width = 75 }
            local filename = MiniStatusline.section_filename { trunc_width = 140 }
            local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
            local location = MiniStatusline.section_location { trunc_width = 75 }
            local search = MiniStatusline.section_searchcount { trunc_width = 75 }

            return MiniStatusline.combine_groups {
              { hl = mode_hl, strings = { mode } },
              { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
              '%<', -- Mark general truncate point
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=', -- End left alignment
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl, strings = { search, location } },
            }
          end,
        },
      }
    end,
  },
}
