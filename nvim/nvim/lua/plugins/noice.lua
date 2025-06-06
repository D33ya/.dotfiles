return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      cmdline = {
        view = 'cmdline',
      },
      views = {
        cmdline = {
          backend = 'popup',
          relative = 'editor',
          position = {
            row = '0%',
            col = 0,
          },
          size = {
            height = 'auto',
            width = '100%',
          },
          border = {
            style = 'none',
          },
          win_options = {
            winhighlight = {
              Normal = 'NoiceCmdline',
              IncSearch = '',
              CurSearch = '',
              Search = '',
            },
          },
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
    },
  },
}
