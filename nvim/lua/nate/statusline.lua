function Statusline()
    local bufnr = vim.api.nvim_get_current_buf()
    local full_name = vim.api.nvim_buf_get_name(bufnr)
    local name = vim.fn.fnamemodify(full_name, ":t")

    local status = vim.bo.modified and "**" or (vim.bo.readonly and "%%%%" or "--")

    local line = vim.fn.line('.')

    if name == "" then
        name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    end

    local function get_git_branch()
        local dir = vim.fn.fnamemodify(full_name, ":h")
        -- Ensure git is only run if inside a git repository
        local branch = vim.fn.system("git -C " .. dir .. " rev-parse --abbrev-ref HEAD 2>/dev/null")
        branch = vim.trim(branch)

        -- Return branch with "Git-" prefix if a branch is found
        return (branch ~= "" and branch ~= "HEAD") and "Git-" .. branch or ""
    end

    local git_branch = get_git_branch() or ""

    local time = os.date("%H:%M")

    local filetype = vim.bo.filetype

    if filetype == "cpp" or filetype == "c" then 
        filetype_disp = "C/C++"
    elseif filetype == "zig" then
        filetype_disp = "Zig"
    else
        filetype_disp = filetype:upper()
    end

    local status = string.format(
        " --\\%s-   %s          %s   L%s   %s   (%s)--%s",
        status,
        name,
        "%P",
        line,
        git_branch,
        filetype_disp,
        time
    )

    return status
end

vim.fn.timer_start(1000, function()
    vim.schedule(function()
        vim.cmd("redrawstatus")
    end)
end, { ["repeat"] = -1 })

vim.o.fillchars ='stl:-,stlnc:-,eob: '
vim.o.statusline = "%!v:lua.Statusline()"
