local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ";"

function tolight()
	vim.opt.background = 'light'
	-- vim.cmd('colorscheme ')
end

function todark()
	vim.opt.background = 'dark'
	-- vim.cmd('colorscheme ')
end

function togglelightdark()
	if vim.opt.background:get() == 'dark' then
		tolight()
	else
		todark()
	end
end

function togglerelativenumber()
	if vim.opt.relativenumber:get() == true then
		vim.opt.relativenumber = false
	else
		vim.opt.relativenumber = true
	end
end

function replacequotes()
	vim.cmd('silent %s/“/"/g')
	vim.cmd('silent %s/”/"/g')
	vim.cmd("silent %s/’/'/g")
	vim.cmd("silent %s/‘/'/g")
end

function fixwhitespace()
	vim.cmd('%s/ / /g')
end

function deletewhitespace()
	vim.cmd[[%s/^\s*//g]]
	vim.cmd[[%s/\s\+$//g]]
end

vim.keymap.set('n','<Leader><space>', 'za')

vim.keymap.set('n','<Leader>\\','<cmd>vsplit<cr>')
vim.keymap.set('n','<Leader>-', '<cmd>split<cr>')

vim.keymap.set('n', '<Leader>p','<cmd>Lazy<cr>')

vim.keymap.set('n', '<Leader>tc', togglelightdark, {desc = 'Toggle light/dark theme'})
vim.keymap.set('n', '<Leader>tr', togglerelativenumber, {desc = 'Toggle relative numbering'})

vim.keymap.set('n', '<Leader>cs', '<cmd>let @/ = ""<cr>', {desc = 'Clear search buffer'})
vim.keymap.set('n', '<Leader>cw', deletewhitespace, {desc = 'Trim all leading and trailing whitespace'})
vim.keymap.set('n', '<Leader>cq', replacequotes, {desc = 'Change angled quotation marks to standard'})

vim.keymap.set('n', '<Leader>wq', '<cmd>wqa<cr>')
vim.keymap.set('n', '<Leader>qq', '<cmd>qa!<cr>')

vim.keymap.set('n', '<Leader>rp', '<cmd>!python3 %:p<cr>')

vim.keymap.set('n', ']p', 'o<esc>p')
vim.keymap.set('n', '[p', 'O<esc>p')

--random stuff to open config files
vim.keymap.set('n','<Leader>eq','<cmd>ed ~/txt/quotes.txt<cr>')
vim.keymap.set('n','<Leader>ew','<cmd>ed ~/.config/wezterm/wezterm.lua<cr>')
vim.keymap.set('n','<Leader>et','<cmd>ed ~/.tmux.conf<cr>')
vim.keymap.set('n','<Leader>eg','<cmd>ed ~/.gitconfig<cr>')
vim.keymap.set('n','<Leader>ez','<cmd>ed ~/.zshrc<cr>')
vim.keymap.set('n','<Leader>ev', '<cmd>ed $MYVIMRC<cr>', {silent = true})

--vim options
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.wildmenu = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.ai = true
vim.opt.ruler = true
vim.opt.history = 50
vim.opt.wrap = true
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.laststatus = 3
-- vim.opt.showtabline = 2
-- Restore deafult vim mouse behaviour
vim.opt.mousemodel="extend"

require ("lazy").setup({
	{
		'jiangmiao/auto-pairs',
	},
	{
		'tpope/vim-surround',
	},
	{
		'tpope/vim-commentary',
	},
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		config = function()
			require('rose-pine').setup{
				dark_variant = 'moon'
			}
			vim.cmd('colo rose-pine')
		end,
	},
	{
		'NvChad/nvim-colorizer.lua',
		-- ft = {"html", "css", "js"}, -- was too useful outside of these filetypes
		config = function()
			require('colorizer').setup()
		end
	},
	{
		'907th/vim-auto-save',
		config = function()
			vim.g.auto_save = 1
		end
	},
	{
		'fracturedprism/skyline',
	},
	{
		'toppair/reach.nvim',
		lazy = true,
		config = function()
			require('reach').setup({
				notifications = true
			})
		end,
		keys = {
			{
				'<Leader>l', '<cmd>ReachOpen buffers<cr>'
			},
		},
	},
	{
		'folke/which-key.nvim',
		config = function()
			require("which-key").setup({})
		end
	},
	{
		"gbprod/cutlass.nvim",
		config = function()
			require('cutlass').setup({
				cut_key = 'm'
			})
		end
	},
},
{
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"zipPlugin",
			},
		},
	},
})

