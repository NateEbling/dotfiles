vim.opt.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.modeline = true
vim.opt.encoding = "utf-8"
vim.opt.hlsearch = false
vim.opt.history = 10000
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.ruler = true
vim.opt.shiftround = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.splitright = true
vim.opt.colorcolumn = "80"
vim.opt.textwidth = 80
vim.opt.formatoptions = vim.opt.formatoptions + { "t" }

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "h" },
    callback = function()
        vim.opt.tabstop = 8
        vim.opt.softtabstop = 8
        vim.opt.shiftwidth = 8
    end
})
