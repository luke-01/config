-- vim behavior
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.updatetime = 10
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = { 'menu', 'menuone', 'preview', 'noinsert', 'noselect' }

-- set tab size
local tab_size = 4
vim.opt.expandtab = true -- tabs as spaces
vim.opt.tabstop = tab_size
vim.opt.softtabstop = tab_size
vim.opt.shiftwidth = tab_size

-- visual stuff
vim.opt.cmdheight = 2
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.colorcolumn = '100'
vim.opt.inccommand = 'split'
vim.opt.signcolumn = 'yes'

-- line wrapping behavior
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true
