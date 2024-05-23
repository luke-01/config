return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',

        { 'folke/neodev.nvim', opts = {} },
        { 'j-hui/fidget.nvim', opts = {} },
    },

    config = function()
        local lspconfig = require('lspconfig')

        -- setup keymaps
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('luke_lsp_attach', { clear = true }),
            callback = function(event)
                local nmap = function(lhs, rhs, desc)
                    vim.keymap.set('n', lhs, rhs, { buffer = event.buf, desc = desc })
                end

                nmap('gd', vim.lsp.buf.definition, 'Go to defintion')
                nmap('gD', vim.lsp.buf.declaration, 'Go to declaration')
                nmap('gr', vim.lsp.buf.references, 'Get references')
                nmap('<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
                nmap('<leader>ca', vim.lsp.buf.code_action, 'Code action')
            end
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls' },
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({ capabilities = capabilities })
                end
            }
        })
    end
}
