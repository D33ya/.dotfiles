return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          change_to_vcs_root = false,
          week_header = {
            enable = true,
          },
          disable_move = true,
          hide = {
            statusline = true,
            tabline = true,
            winbar = true,
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files cwd=',
              key = 'f',
            },
            {
              desc = ' Projects',
              group = 'DiagnosticHint',
              action = 'Telescope project cwd=',
              key = 'p',
            },
            {
              desc = ' Dotfiles',
              group = 'Number',
              action = "lua require('telescope-config').dotfiles()",
              key = 'd',
            },
          },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
}
