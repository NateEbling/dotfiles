local function git_branch()
  local branch = vim.trim(vim.fn.system("git rev-parse --abbrev-ref HEAD"))
  if string.len(branch) > 0 then
    return branch
  else
    return ":"
  end
end

local function statusline()
  local mod = "%m"
  local file = "%t"
  local line = "Ln " .. vim.fn.line(".")
  local col = "Col " .. vim.fn.col(".")
  local branch = git_branch()

  return string.format("%s%s    %s, %s %%= %s    ", file, mod, line, col, branch)
end

vim.o.statusline = statusline()
