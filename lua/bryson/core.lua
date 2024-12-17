vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.timeoutlen = 1000

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Better tab behavior
vim.opt.backspace = "indent,eol,start"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- round to nearest increment of shiftwidth (in this case, 4)
vim.opt.shiftround = true

-- easier window nav
vim.keymap.set({'n', 't'}, '<C-j>', '<cmd>wincmd j<cr>')
vim.keymap.set({'n', 't'}, '<C-h>', '<cmd>wincmd h<cr>')
vim.keymap.set({'n', 't'}, '<C-k>', '<cmd>wincmd k<cr>')
vim.keymap.set({'n', 't'}, '<C-l>', '<cmd>wincmd l<cr>')

-- clear search highlight with esc
vim.keymap.set('n', '<esc>', '<cmd>nohl<cr>')

function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-\\>', '<cmd>ToggleTerm<cr>')
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
