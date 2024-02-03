-- basic setup --

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.signcolumn = 'yes'
vim.wo.wrap = true
vim.wo.colorcolumn = '79'

vim.o.syntax = true
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.errorbells = false
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.linespace = 8
vim.opt.clipboard = "unnamedplus"

-- tabs and shifts

vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.o.writebackup = false
vim.o.backup = false

vim.o.undodir = vim.fn.stdpath("config") .. "/undodir"
vim.o.undofile = true
vim.o.incsearch = true
vim.o.hidden = true
vim.o.completeopt = "menuone,noinsert,noselect"

vim.bo.swapfile = false
vim.bo.autoindent = true
vim.bo.smartindent = true

-- COLOR SCHEME
-- vim.cmd("colorscheme gruvbox")
vim.cmd.colorscheme "catppuccin"
vim.o.background = "dark"
vim.cmd("set splitright")

