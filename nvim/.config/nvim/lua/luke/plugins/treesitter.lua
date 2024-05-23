return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-context' },
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query' },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
