return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      flavour = 'mocha',
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd.colorscheme 'macchiato'
    end,
  },
  {
    'xero/miasma.nvim',
    branch = 'lua',
    dependencies = {
      'rktjmp/lush.nvim',
      'rktjmp/shipwright.nvim',
    },
    lazy = false,
    priority = 1000,
    config = function() end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'savq/melange-nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'melange'
    end,
  },
}
