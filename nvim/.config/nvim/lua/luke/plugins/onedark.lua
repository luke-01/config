return {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
        local opts = {
            style = 'darker',
            transparent = true,
        }
        if vim.g.neovide then
            opts.transparent = false
        end
        local onedark = require('onedark')
        onedark.setup(opts)

        onedark.load()
    end
}
