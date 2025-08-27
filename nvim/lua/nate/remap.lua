vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", ":Ex<CR>", { silent = true })

-- Replace all (no confirm)
vim.keymap.set("n", "<leader>rn", 'yiw:%s/\\<<C-r>"\\>//g<left><left>', { noremap = true })

-- Replace all (with confirm)
vim.keymap.set("n", "<leader>r", 'yiw:%s/\\<<C-r>"\\>//gc<left><left><left>', { noremap = true })

-- Build function
local function Build()
  if vim.fn.filereadable("build.bat") == 1 then
    vim.cmd('!cmd /c build.bat')
  elseif vim.bo.filetype == "c" then
    -- Add C build logic here if needed
  else
    vim.cmd('echo "No build rule for this project"')
  end
end

vim.keymap.set("n", "<leader>b", function()
  vim.cmd("write")
  Build()
end, { noremap = true })
