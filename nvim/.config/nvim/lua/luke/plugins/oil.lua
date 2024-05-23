return {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('oil').setup({})
        vim.keymap.set('n', '<leader>t', '<cmd>Oil --float<CR>', { desc = 'Toggle File Manager' })
    end
}
