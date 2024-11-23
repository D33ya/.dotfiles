return {
  {
    'nvim-neorg/neorg',
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = '*', -- Pin Neorg to the latest stable release
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.esupports.metagen'] = {
            config = {
              author = 'Danny',
              type = 'auto',
              timezone = 'implicit-local',
            },
          },
          ['core.concealer'] = {
            config = {
              folds = true,
              icon_preset = 'diamond',
              init_open_folds = 'never',
            },
          },
          ['core.dirman'] = {
            config = {
              workspaces = {
                work_notes = '~/Documents/Notes/Work',
                library_of_norgxandria = 'Documents/Library-of-norgxandria',
                notes = '~/Documents/Notes',
                progaming = '~/Documents/Notes/Programing',
                projects = '~/Documents/Notes/Projects',
              },
              default_workspace = 'notes',
            },
          },
          ['core.summary'] = {
            config = {
              strategy = 'by_path',
            },
          },
          ['core.completion'] = {
            config = {
              engine = 'nvim-cmp',
            },
          },
          ['core.integrations.nvim-cmp'] = {},
          ['core.integrations.telescope'] = {},
        },
        dependencies = { { 'nvim-lua/plenary.nvim' }, { 'nvim-neorg/neorg-telescope' } },
      }
    end,
  },

  -- keymaps
}
