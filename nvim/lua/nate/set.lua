local o = vim.opt

o.guicursor = "n-v-i-c:blinkon10-Cursor"
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.cursorline = true
o.autoindent = true
o.smartindent = true
o.smartcase = true
o.ignorecase = true
o.modeline = true
o.encoding = "utf-8"
o.hlsearch = false
o.history = 10000
o.incsearch = true
o.termguicolors = true
o.ruler = true
o.shiftround = true
o.wrap = true
o.swapfile = false
o.backup = false
o.undofile = true
o.splitright = true

function Statusline()
    local modified = vim.bo.modified and "*" or "-"
    local version = vim.version()
    local enc = vim.o.fenc ~= "" and vim.o.fenc or vim.o.enc
    local status = string.format(
        "-%s NVIM %s.%s.%s: %%t (%s) %%f %%= %s --",
        modified,
        version.major,
        version.minor,
        version.patch,
        enc,
        "%P"
    )
    return status
end
vim.o.statusline = "%!v:lua.Statusline()"
vim.o.fillchars = "stl:-"
