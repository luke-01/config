return {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
        require('onedark').load({ style = 'darker' })
    end
}
