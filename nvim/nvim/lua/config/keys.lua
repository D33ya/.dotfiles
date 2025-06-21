local wk = require 'which-key'
wk.add {
  {
    mode = { 'n', 'v' },

    {
      '<leader>/',
      function()
        MiniPick.builtin.grep_live()
      end,
      desc = 'Grep',
    },
    {
      '<leader>:',
      function()
        MiniExtra.pickers.history()
      end,
      desc = 'Command History',
    },

    -- Quit
    { '<leader>q', group = 'Quit' },
    { '<leader>qq', '<cmd>wqall<cr>', desc = 'Quit and Save' },
    { '<leader>qx', '<cmd>qall<cr>', desc = 'Quit Without Saving' },

    -- Files
    { '<leader>f', group = 'Files' },
    {
      '<leader>ff',
      function()
        MiniPick.builtin.files()
      end,
      desc = 'Files',
    },
    {
      '<leader>fc',
      function()
        MiniPick.registry.config()
      end,
      desc = 'Config',
    },
    {
      '<leader>fr',
      function()
        MiniExtra.pickers.oldfiles()
      end,
      desc = 'Old Files',
    },
    {
      '<leader>fe',
      function()
        MiniFiles.open()
      end,
      desc = 'Explore',
    },

    -- Git
    { '<leader>g', group = 'Git' },
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

    -- Search
    { '<leader>s', group = 'Search' },
    {
      '<leader>sh',
      function()
        MiniPick.builtin.help()
      end,
      desc = 'Help',
    },
    {
      '<leader>sn',
      function()
        Snacks.picker.notifications()
      end,
      desc = 'Search Notifications',
    },
    {
      '<leader>sd',
      function()
        MiniExtra.pickers.lsp { scope = 'document_symbol' }
      end,
      desc = 'Document Symbols',
    },
    {
      '<leader>sw',
      function()
        MiniExtra.pickers.lsp { scope = 'workspace_symbol' }
      end,
      desc = 'Workspace Symbols',
    },

    -- Diagnostics
    { '<leader>d', group = 'Diagnostics' },
    {
      '<leader>d',
      function()
        MiniExtra.pickers.diagnostic()
      end,
    },

    -- Buffer
    {
      '<leader>b',
      group = 'buffer',
      expand = function()
        return require('which-key.extras').expand.buf()
      end,
    },

    -- Window
    {
      '<leader>w',
      group = 'windows',
      proxy = '<c-w>',
      expand = function()
        return require('which-key.extras').expand.win()
      end,
    },

    -- Ui
    { '<leader>u', group = 'ui', icon = { icon = '󰙵 ', color = 'cyan' } },
  },
}
