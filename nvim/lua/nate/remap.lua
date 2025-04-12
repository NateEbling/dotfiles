vim.g.mapleader = " "
vim.keymap.set("n", "<C-x>", "", { noremap = true })
vim.keymap.set("n", "<C-x><C-f>", ":lua FindFile()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-x>e", vim.cmd.Ex)
vim.keymap.set("n", "<C-x><C-s>", ":w<CR>")
vim.keymap.set("n", "<C-x>c", ":q!<CR>", { noremap = true })
