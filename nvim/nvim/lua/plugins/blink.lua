return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },

      snippets = { preset = 'luasnip' },

      signature = { enabled = true, window = { show_documentation = false } },

      appearance = {
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = 'prefer_rust' },
    },
    config = function()
      require('blink.cmp').setup {
        completion = {
          accept = { auto_brackets = { enabled = true } },
          documentation = { auto_show = true, auto_show_delay_ms = 1500 },
          ghost_text = { enabled = false },
          menu = {
            winblend = 10,
            border = 'single',
            draw = {
              -- We don't need label_description now because label and label_description are already
              -- combined together in label by colorful-menu.nvim.
              columns = { { 'kind_icon' }, { 'label', gap = 1 } },
              components = {
                label = {
                  text = function(ctx)
                    return require('colorful-menu').blink_components_text(ctx)
                  end,
                  highlight = function(ctx)
                    return require('colorful-menu').blink_components_highlight(ctx)
                  end,
                },
                -- label = {
                --   width = { fill = true, max = 60 },
                --   text = function(ctx)
                --     local highlights_info = require('colorful-menu').blink_highlights(ctx)
                --     if highlights_info ~= nil then
                --       -- Or you want to add more item to label
                --       return highlights_info.label
                --     else
                --       return ctx.label
                --     end
                --   end,
                --   highlight = function(ctx)
                --     local highlights = {}
                --     local highlights_info = require('colorful-menu').blink_highlights(ctx)
                --     if highlights_info ~= nil then
                --       highlights = highlights_info.highlights
                --     end
                --     for _, idx in ipairs(ctx.label_matched_indices) do
                --       table.insert(highlights, { idx, idx + 1, group = 'BlinkCmpLabelMatch' })
                --     end
                --     -- Do something else
                --     return highlights
                --   end,
                --   kind_icon = {
                --     text = function(ctx)
                --       local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                --       return kind_icon
                --     end,
                --     highlight = function(ctx)
                --       return require('colorful-menu').blink_highlights(ctx)
                --     end,
                --   },
                --   kind = {
                --     highlight = function(ctx)
                --       return require('colorful-menu').blink_highlights(ctx)
                --     end,
                --   },
                -- },
              },
            },
          },
        },
      }
    end,
  },
}
