vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-x>", "", { noremap = true })
vim.keymap.set("n", "<C-x><C-f>", ":lua FindFile()<CR>", { noremap = true, silent = true })
