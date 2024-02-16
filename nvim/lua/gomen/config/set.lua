vim.g.mapleader = " "
vim.g.snippets = "luasnip"

local set = vim.opt

set.number = true
set.relativenumber = true
set.ruler = true --
set.ignorecase = true
set.cursorline = true
vim.opt.clipboard = "unnamedplus"
set.mouse = "a"
set.tw = 79
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 4
set.smartindent = true
set.colorcolumn = "80"
set.termguicolors = true -- True color support
set.wrap = true
set.scrolloff = 7
set.conceallevel = 0
set.showmode = false -- Dont show mode since we have a statusline
set.expandtab = true -- Use spaces instead of tabs
set.autoindent = true -- so in order to do something we need to try to wrap asasasasas asas
--set.nocompatible = true -- so in order to do something we need to try to wrap asasasasas asas
-- vim.cmd("syntax on")
-- vim.cmd("filetype plugin indent on")
--vim.opt.shortmess:append {c = true}
