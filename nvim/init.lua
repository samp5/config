local maps = require('maps')
local files = require('files')
-- Set alias for global options, window options, and remap function
local o = vim.o
local wo = vim.wo
local nnoremap = maps.nnoremap
local map = vim.api.nvim_set_keymap
vim.g.mapleader = " "
-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({

    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{import = "plugins"},
	{import = "plugins.lsp"},
})

-- Global vim settings
o.autoindent = true
o.autoread = true
o.autowrite = true
o.backspace = 'indent,eol,start'
o.expandtab = false
o.joinspaces = true
o.hlsearch = true
o.ignorecase = true
o.incsearch = true
o.shiftwidth = 2
o.shortmess = "Sc"
o.showmatch = true
o.smartindent = true
o.softtabstop = 2
o.tabstop = 2
o.termguicolors = true
o.splitbelow = true
o.splitright = true


-- Window Local
wo.number = true
wo.relativenumber = true
wo.wrap = true
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'

-- persistent undos
o.undofile = true
o.undodir =  vim.fn.stdpath('data') .. "/.nvim/undo-dir"

if files.isdir(o.undodir) then
	os.execute('mkdir -p '..o.undodir)
end

--folding 
vim.api.nvim_create_autocmd({ "BufRead" }, {
	callback = function() o.foldlevel = 99 end
})

-- Get rid of search highlighting
nnoremap('<leader>c', ":nohl<CR>")

-- Remaps
nnoremap("<leader><leader>", "<Esc>")
nnoremap("<C-]>", '<Cmd>vsp <C-R>=expand("%:p:h") . "/" <CR>')
nnoremap("<C-->", '<Cmd>sp <C-R>=expand("%:p:h") . "/" <CR>')
nnoremap("<leader>;", 'a<Enter>{<Enter>}<Esc>O')
nnoremap("<leader>'", 'a{<Enter>}<Esc>O')
nnoremap("<leader>o", 'o<Esc>k')
nnoremap("<leader>O", 'O<Esc>j')
nnoremap("<leader><Enter>", 'i<Enter><Esc>k$')
nnoremap("<leader>we", '<C-w>=')
nnoremap("<leader>ws", '<C-w>x')
nnoremap("<leader>c", 'o/*')
vim.api.nvim_set_keymap('i', "<C-;>", '<Esc>a<Enter>{<Enter>}<Esc>O', {noremap = true})
-- -- Colorscheme
vim.cmd [[colorscheme kanagawa]]
