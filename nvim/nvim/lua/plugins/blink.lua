return {
  {
    'saghen/blink.cmp',
    dependencies = {
        'rafamadriz/friendly-snippets',
        {'L3MON4D3/LuaSnip', version = 'v2.*'},
    },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'default' },

      snippets = { preset = 'default'},

      signature = { enabled = true },

      appearance = {
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      completion = {},
      fuzzy = { implementation = 'prefer_rust'},
    },
    opts_extend = { "sources.default" },
    -- config = function(_, opts)
    --     require("blink.cmp").setup({opts, {
    --         completion = {
    --             menu = {
    --                 draw = {
    --                     -- We don't need label_description now because label and label_description are already
    --                     -- combined together in label by colorful-menu.nvim.
    --                     columns = { { "kind_icon" }, { "label", gap = 1 } },
    --                     components = {
    --                         label = {
    --                             text = return require("colorful-menu").blink_components_text(),
    --                             highlight = require("colorful-menu").blink_components_highlight()
    --                         },
    --                     },
    --                 },
    --             },
    --         },
    --     }})
    -- end
  }
}
