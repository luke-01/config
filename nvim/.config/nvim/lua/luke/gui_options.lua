vim.opt.guifont = 'Fira Mono'

if vim.g.neovide then
    vim.g.neovide_transparency = 0.95
    vim.g.neovide_scale_factor = 1.0
    local delta = 1.1
    local change_delta = function(d)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * d
    end
    vim.keymap.set('n', '<C-+>', function() change_delta(delta) end)
    vim.keymap.set('n', '<C-->', function() change_delta(1/delta) end)
end
