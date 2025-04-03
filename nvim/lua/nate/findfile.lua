function FindFile()
    local cwd = vim.fn.getcwd()
    local default = cwd .. "/"

    local prompt = "Find file: "

    local file = vim.fn.input(prompt, default, "file")

    if file ~= "" then
        vim.cmd("edit " .. file)
    end
end
