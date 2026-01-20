vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.timeoutlen = 1000

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Sync clipboard with system
vim.opt.clipboard = "unnamedplus"

-- Confirm save when exiting with changes
vim.opt.confirm = true

-- Better tab behavior
vim.opt.backspace = "indent,eol,start"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
-- round to nearest increment of shiftwidth (in this case, 2)
vim.opt.shiftround = true
vim.opt.smartindent = true
vim.opt.list = true

vim.opt.signcolumn = "yes"

-- How many lines are kept at the bottom/top when scrolling
vim.opt.sidescrolloff = 4

-- Better search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.winminwidth = 5
-- easier window nav
vim.keymap.set({'n', 't'}, '<C-j>', '<cmd>wincmd j<cr>')
vim.keymap.set({'n', 't'}, '<C-h>', '<cmd>wincmd h<cr>')
vim.keymap.set({'n', 't'}, '<C-k>', '<cmd>wincmd k<cr>')
vim.keymap.set({'n', 't'}, '<C-l>', '<cmd>wincmd l<cr>')

-- clear search highlight with esc
vim.keymap.set('n', '<esc>', '<cmd>nohl<cr>')

