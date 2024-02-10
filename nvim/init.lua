-- for remap functions
local maps = require('maps')
local files = require('files')

-- Set alias for global options, window options, and remap function
local o = vim.o
local wo = vim.wo
local nnoremap = maps.nnoremap

vim.g.mapleader = ' '

-- Lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({

    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{import = 'plugins'},
	{import = 'plugins.lsp'},
})

-- Global vim settings
o.autoindent = true
o.autoread = true
o.autowrite = true
o.backspace = 'indent,eol,start'
o.expandtab = true
o.joinspaces = true
o.hlsearch = true
o.ignorecase = true
o.incsearch = true
o.shiftwidth = 2
o.shortmess = 'Sc'
o.showmatch = true
o.smartindent = true
o.softtabstop = 2
o.tabstop = 2
o.termguicolors = true
o.splitbelow = true
o.splitright = true
o.fileencoding = 'UTF-8'

-- Window Local
wo.number = true
wo.relativenumber = true
wo.wrap = true
o.foldmethod='expr'

-- Use treesitter for fold expressions
o.foldexpr = 'nvim_treesitter#foldexpr()'

-- persistent undos
o.undofile = true
o.undodir =  vim.fn.stdpath('data') .. '/.nvim/undo-dir'

if files.isdir(o.undodir) then
	os.execute('mkdir -p '..o.undodir)
end

--folding 
vim.api.nvim_create_autocmd({ 'BufRead' }, {
	callback = function() o.foldlevel = 99 end
})

-- Get rid of search highlighting
nnoremap('<leader>c', ':nohl<CR>')

-- Remaps
nnoremap('<C-]>', '<C-w>v', 'Split Window Vertically')
nnoremap('<C-=>', '<C-w>s', 'Split Window horizontally')
nnoremap("<leader>'", 'a{<Enter>}<Esc>O', 'Brackets (the right way)')
nnoremap('<leader>o', 'o<Esc>k', 'Open line below (no insert)')
nnoremap('<leader>O', 'O<Esc>j', 'Open line below (no insert)')
nnoremap('<leader>we', '<C-w>=', 'Equalize Windows')
nnoremap('<leader>wl', '5<C-w>>', 'Increase current window size')
nnoremap('<leader>wh', '5<C-w><', 'Decrease current window size')
nnoremap('<leader>ws', '<C-w>x', 'Swap windows')
nnoremap( '<leader>i', '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature help')
nnoremap('<leader>tD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type definition')
nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Go to declaration')
nnoremap('gi', '<cmd>Telescope lsp_implementations()<CR>', 'Telescope implementation')
nnoremap('<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', 'See code actions')
nnoremap('<space>sn', '<cmd>lua vim.lsp.buf.rename()<CR>', 'Smart Rename')
nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover')
nnoremap('<leader>D', '<cmd>Telescope diagnostics bufnr=1<CR>', 'Telescope Diagnostics') -- show  diagnostics for file
nnoremap('<leader>d', '<cmd>vim.diagnostic.open_float<CR>', 'Show diagnostics for line') -- show diagnostics for line

-- -- Colorscheme
vim.cmd [[colorscheme kanagawa]]
