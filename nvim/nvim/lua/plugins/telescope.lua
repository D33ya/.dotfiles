return {

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      -- { 'nvim-telescope/telescope-project.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        pickers = {
          find_files = {
            hidden = false,
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          project = {
            base_dirs = {
              '~/Projects/',
            },
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'project')
      pcall(require('telescope').load_extension 'file_browser')
      pcall(require('telescope').load_extension 'neoclip')
      -- pcall(require('telescope').load_extension 'neorg')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })

      vim.keymap.set('n', '<leader>sd', function()
        require('telescope-config').dotfiles()
      end, { desc = '[S]earch [D]otfiles' })

      vim.keymap.set('n', '<leader>sp', function()
        require('telescope').extensions.project.project { hide_workspace = true }
      end, { desc = '[S]earch [P]rojects' })
    end,
  },
  { 'nvim-telescope/telescope-project.nvim', dependencies = { 'nvim-telescope/telescope.nvim' } },
  { 'nvim-neorg/neorg-telescope' },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  },
  {
    'AckslD/nvim-neoclip.lua',
    dependencies = {
      -- you'll need at least one of these
      { 'nvim-telescope/telescope.nvim' },
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require('neoclip').setup()
    end,
  },
  {
    'doctorfree/cheatsheet.nvim',
    event = 'VeryLazy',
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      local ctactions = require 'cheatsheet.telescope.actions'
      require('cheatsheet').setup {
        bundled_cheetsheets = {
          enabled = { 'default', 'lua', 'markdown', 'regex', 'netrw', 'unicode', 'nerd-font' },
        },
        bundled_plugin_cheatsheets = {
          enabled = {
            'auto-session',
            'goto-preview',
            'octo.nvim',
            'telescope.nvim',
            'vim-easy-align',
            'vim-sandwich',
            'git-signs',
          },
        },
        include_only_installed_plugins = true,
        telescope_mappings = {
          ['<CR>'] = ctactions.select_or_fill_commandline,
          ['<A-CR>'] = ctactions.select_or_execute,
          ['<C-Y>'] = ctactions.copy_cheat_value,
          ['<C-E>'] = ctactions.edit_user_cheatsheet,
        },
      }
    end,
  },
}
