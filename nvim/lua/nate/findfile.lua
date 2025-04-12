function FindFile()
    local prompt = "Find file: "

    local file = vim.fn.input(prompt, "", "file")

    if file ~= "" then
        vim.cmd("edit " .. file)
    end
end
