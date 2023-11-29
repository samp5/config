local maps = require("maps")

-- Set alias for global options, window options, and remap function
local o = vim.o
local wo = vim.wo
local nnoremap = maps.nnoremap
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


-- Remaps
vim.keymap.set("n", "<leader>ep", "<Cmd>Ex<CR>", {noremap = true})
vim.keymap.set("i", "<C-[>", "<Esc>", { noremap = true})
vim.keymap.set("n", "$", "0", {noremap = true })
vim.keymap.set("n", "0", "$", {noremap = true })
