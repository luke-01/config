vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.diagnostic.config({ update_in_insert = true })

-- options
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.undofile = true
vim.opt.updatetime = 10
vim.opt.swapfile = false

vim.opt.completeopt = 'menu,menuone,preview,noinsert,noselect'

vim.opt.wrap = false
-- vim.opt.linebreak = true
-- vim.opt.breakindent = true

local tab_size = 4
vim.opt.expandtab = true -- tabs as spaces
vim.opt.tabstop = tab_size
vim.opt.softtabstop = tab_size
vim.opt.shiftwidth = tab_size

vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.colorcolumn = '100'

vim.opt.termguicolors = true

-- Neovide
if vim.g.neovide then
    vim.g.neovide_transparency = 0.95
    vim.g.neovide_scale_factor = 1.0
    local change_scale_factor = function(delta)
      vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-+>", function()
      change_scale_factor(1.1)
    end)
    vim.keymap.set("n", "<C-->", function()
      change_scale_factor(1/1.1)
    end)
end

-- keymaps

vim.keymap.set('n', '<leader><leader>', '<cmd>nohl<CR>')

vim.keymap.set('n', '}d', vim.diagnostic.goto_next)
vim.keymap.set('n', '{d', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist)

-- plugins

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{
		'navarasu/onedark.nvim',
		priority = 1000,
		config = function()
			vim.cmd('colorscheme onedark')
		end
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'hrsh7th/cmp-nvim-lsp',

			{ 'folke/neodev.nvim', opts = {} },
			{ 'j-hui/fidget.nvim', opts = {} },
		},
		config = function()
			-- only set these keymaps when they're relevant
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('luke_lsp_attach', { clear = true }),
				callback = function(event)
					local nmap = function(lhs, rhs)
						vim.keymap.set('n', lhs, rhs, { buffer = event.buf })
					end

					nmap('gd', vim.lsp.buf.definition)
					nmap('gD', vim.lsp.buf.declaration)
					nmap('gr', vim.lsp.buf.references)
					nmap('K', vim.lsp.buf.hover)
					nmap('<leader>rn', vim.lsp.buf.rename)
					nmap('<leader>ca', vim.lsp.buf.code_action)
				end
			})

			require('mason').setup({})
			local lspconfig = require('lspconfig')
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			require('mason-lspconfig').setup({
				ensure_installed = { 'lua_ls' },
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({ capabilities = capabilities })
					end
				}
			})
		end
	},
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = { 'nvim-treesitter/nvim-treesitter-context' },
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = {
					'c',
					'lua',
					'vim',
					'vimdoc',
					'query',
					'markdown',
					'markdown_inline',
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies =  {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		},
		config = function()
			local luasnip = require('luasnip')
			local cmp = require('cmp')

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end
				},
				mapping = cmp.mapping.preset.insert({
					['<C-n>'] = cmp.mapping.select_next_item(),
					['<C-p>'] = cmp.mapping.select_prev_item(),
					['<C-y>'] = cmp.mapping.confirm({ select = true }),
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
      				['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-l>'] = cmp.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<C-h>'] = cmp.mapping(function(fallback)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { 'i', 's' }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'path' }
				})
			})
		end
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		dependencies = { 'hrsh7th/nvim-cmp' },
		config = function()
			require('nvim-autopairs').setup({})

			local cmp = require('cmp')
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
		end
	},
	{ 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
	{ 'lewis6991/gitsigns.nvim', opts = {} },
	{ 'folke/todo-comments.nvim', opts = {} },
})
