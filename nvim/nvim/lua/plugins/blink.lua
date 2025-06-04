return {
  {
    'saghen/blink.cmp',
    -- will load snippets found at ~/.config/nvim/snippets/
    -- optional: provides snippets for the snippet source
    dependencies = {
        'rafamadriz/friendly-snippets',
        {'L3MON4D3/LuaSnip', version = 'v2.*'},
    },

    -- use a release tag to download pre-built binaries
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
    },

    opts_extend = { "sources.default" },

    config = function(_, opts)
        require("blink.cmp").setup({
            completion = {
                menu = {
                    draw = {
                        -- We don't need label_description now because label and label_description are already
                        -- combined together in label by colorful-menu.nvim.
                        columns = { { "kind_icon" }, { "label", gap = 1 } },
                        components = {
                            label = {
                                text = function(ctx)
                                    return require("colorful-menu").blink_components_text(ctx)
                                end,
                                highlight = function(ctx)
                                    return require("colorful-menu").blink_components_highlight(ctx)
                                end,
                            },
                        },
                    },
                },
            },
        })
    end
  }
}
