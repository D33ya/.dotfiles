return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts_extend = { 'spec' },
    opts = {
      preset = 'helix',
      defaults = {},
      spec = {
        {
          mode = { 'n', 'v' },
          { '<leader>c', group = 'Code' },
          { '<leader>d', group = 'Diagnostics' },
          {
            '<leader>e',
            function()
              MiniFiles.open()
            end,
            desc = 'Explore Files',
          },
          { '<leader>f', group = 'Find' },
          { '<leader>g', group = 'Git' },
          { '<leader>q', group = 'Quit' },
          { '<leader>s', group = 'Search' },
          { '<leader>u', group = 'ui', icon = { icon = '󰙵 ', color = 'cyan' } },
          { '[', group = 'prev' },
          { ']', group = 'next' },
          { 'g', group = 'goto' },
          { 'gs', group = 'surround' },
          { 'z', group = 'fold' },
          {
            '<leader>b',
            group = 'buffer',
            expand = function()
              return require('which-key.extras').expand.buf()
            end,
          },
          {
            '<leader>w',
            group = 'windows',
            proxy = '<c-w>',
            expand = function()
              return require('which-key.extras').expand.win()
            end,
          },
        },
        {
          '<leader>ff',
          function()
            MiniPick.builtin.files()
          end,
          desc = 'Files',
        },
        {
          '<leader>gb',
          function()
            MiniExtra.pickers.git_branches { scope = 'local' }
          end,
          desc = 'Branches',
        },
        {
          '<leader>gc',
          function()
            MiniExtra.pickers.git_commits()
          end,
          desc = 'Commits',
        },
        {
          '<leader>gh',
          function()
            MiniExtra.pickers.git_hunks { scope = 'staged' }
          end,
          desc = 'Hunks',
        },
      },
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer Keymaps (which-key)',
      },
    },
  },
}
