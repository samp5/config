-- for remap functions
local maps = require('maps')
local files = require('files')

-- Set alias for global options, window options, and remap function
local o = vim.o
local wo = vim.wo
local nnoremap = maps.nnoremap
local inoremap = maps.inoremap

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
  { import = 'plugins' },
  { import = 'plugins.lsp' },
  { import = 'plugins.dap' },

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
wo.linebreak = true
o.foldmethod = 'expr'

-- Use treesitter for fold expressions
o.foldexpr = 'nvim_treesitter#foldexpr()'

-- persistent undos
o.undofile = true
o.undodir = vim.fn.stdpath('data') .. '/.nvim/undo-dir'

if files.isdir(o.undodir) then
  os.execute('mkdir -p ' .. o.undodir)
end

--folding
vim.api.nvim_create_autocmd({ 'BufRead' }, {
  callback = function() o.foldlevel = 99 end
})

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Get rid of search highlighting
nnoremap('<leader>cl', ':nohl<CR>', 'clear search highlighting')

-- Remaps
nnoremap('<M-\\>', '<C-w>v', 'Split Window Vertically')
nnoremap('<M-->', '<C-w>s', 'Split Window horizontally')
inoremap('<C-\\>', '<Esc>dBi', 'Ctrl Backspace')
inoremap("<M-'>", '<Esc>A{<Enter>}<Esc>O', 'Brackets (the right way)')
nnoremap("<M-'>", 'A{<Enter>}<Esc>O', 'Brackets (the right way)')
nnoremap('<leader>o', 'o<Esc>k', 'Open line below (no insert)')
nnoremap('<leader>O', 'O<Esc>j', 'Open line below (no insert)')
nnoremap('<leader>we', '<C-w>=', 'Equalize Windows')
nnoremap('<leader>wl', '5<C-w>>', 'Increase current window size')
nnoremap('<leader>wh', '5<C-w><', 'Decrease current window size')
nnoremap('<leader>ws', '<C-w>x', 'Swap windows')

-- quits
nnoremap('<M-q>', '<cmd>wqa<CR>', 'Write quit all')
nnoremap('<M-w>', '<cmd>wa<CR>', 'Write all')
nnoremap('<C-M-q>', '<cmd>wq<CR>', 'Write quit')
nnoremap('<leader>ec', '<cmd>q<CR>', 'Quit')

-- -- Colorscheme
vim.cmd [[colorscheme kanagawa]]
