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
                neorg = '~/Documents/neorg/',
                work = '~/Documents/neorg/work/',
                code = '~/Documents/neorg/code/',
                projects = '~/Documents/neorg/projects/',
                todo = '~/Documents/neorg/todo/',
                linux = '~/Documents/neorg/linux/',
                misc = '~/Documents/neorg/misc/',
              },
              default_workspace = 'neorg',
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
          ['core.export'] = {},
          ['core.export.markdown'] = {},
          ['core.latex.renderer'] = {},
          -- ['core.presenter'] = {},
          ['core.text-objects'] = {},
          ['core.integrations.nvim-cmp'] = {},
          ['core.integrations.telescope'] = {},
        },
        dependencies = { { 'nvim-lua/plenary.nvim' }, { 'nvim-neorg/neorg-telescope' } },
      }
    end,
  },

  -- keymaps
  vim.keymap.set('n', '<leader>nw', '<Plug>(neorg.telescope.switch_workspace)', {}),
  vim.keymap.set('n', '<leader>nf', '<Plug>(neorg.telescope.find_norg_files)', {}),
  vim.keymap.set('n', '<up>', '<Plug>(neorg.text-objects.item-up)', {}),
  vim.keymap.set('n', '<down>', '<Plug>(neorg.text-objects.item-down)', {}),
  vim.keymap.set({ 'o', 'x' }, 'iH', '<Plug>(neorg.text-objects.textobject.heading.inner)', {}),
  vim.keymap.set({ 'o', 'x' }, 'aH', '<Plug>(neorg.text-objects.textobject.heading.outer)', {}),
}
