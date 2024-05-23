return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup({})
        telescope.load_extension('fzf')

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search Files' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Find Regex' })
        vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Search Open Buffers' })
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search Help Tags' })
    end
}
