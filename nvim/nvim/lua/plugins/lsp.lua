return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'mason-org/mason.nvim', opts = {} },
            'mason-org/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            { 'j-hui/fidget.nvim',    opts = {} },
            'saghen/blink.cmp',
        },
        opts = {
            servers = {
                lua_ls = {},
                pyright = {},
            },
        },
        config = function(_, opts)
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            local ensure_installed = vim.tbl_keys(opts.servers or {})
            vim.list_extend(ensure_installed, {
                'stylua',
                'isort',
                'black',
                'prettierd',
                'prettier',
            })
            require('mason-tool-installer').setup { ensure_installed = ensure_installed }

            require('mason-lspconfig').setup {
                automatic_enable = true,
                ensure_installed = {},
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        local server = opts.servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                        require('lspconfig')[server_name].setup(server)
                    end,
                },
            }
        end,
    },
}
