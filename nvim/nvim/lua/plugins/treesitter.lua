return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc', 'python', 'markdown_inline', 'rust', 'norg' },
      -- Autoinstall languages that are not installed
      auto_install = true,

      highlight = {
        { enable = true },
      },

      indent = false,
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        opts,

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<leader>gnn', -- set to `false` to disable one of the mappings
            node_incremental = '<leader>grn',
            scope_incremental = '<leader>grc',
            node_decremental = '<leader>grm',
          },
        },
      }

      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    end,
  },
  --  { 'nvim-treesitter/nvim-treesitter-textobjects' },
}
