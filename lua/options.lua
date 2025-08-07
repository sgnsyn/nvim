vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true

-- Navigate Vim panes
vim.keymap.set('n', '<c-k>', ':wincmd k <CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j <CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h <CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l <CR>')

-- Copy system clipboard
vim.keymap.set("x", "<Leader>y", '"+y', { desc = "Yank selected to system clipboard" })
vim.keymap.set("n", "<Leader>yy", '"+yy', { desc = "Yank line to system clipboard" })
vim.keymap.set({ "n", "x" }, "<Leader>p", '"+p', { desc = "Paste from system clipboard (after)" })

-- open netrw
vim.keymap.set("n", "<Leader>lf", ":Ex<CR>", { desc = "Open NetRW" })
