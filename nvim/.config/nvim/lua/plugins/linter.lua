--: nvim-lint (linter)
vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-lint.git", version = "master" }, -- linter
})

local lint = require("lint")

--: Custom cmake-lint (from cheshirekow/cmakelang) linter definition.
-- nvim-lint's built-in `cmakelint` targets a different tool (richq/cmakelint).
local severity_map = {
  E = vim.diagnostic.severity.ERROR,
  W = vim.diagnostic.severity.WARN,
  C = vim.diagnostic.severity.INFO,
  R = vim.diagnostic.severity.HINT,
}

lint.linters.cmakelang_lint = {
  cmd = "cmake-lint",
  stdin = false,
  args = {},
  stream = "stdout",
  ignore_exitcode = true,
  parser = function(output)
    local diagnostics = {}
    for line in output:gmatch("[^\r\n]+") do
      local lnum, col, code, msg = line:match("[^:]+:(%d+),(%d+): %[(%w+)%] (.+)")
      if lnum then
        table.insert(diagnostics, {
          lnum = tonumber(lnum) - 1,
          col = tonumber(col) - 1,
          severity = severity_map[code:sub(1, 1)] or vim.diagnostic.severity.INFO,
          message = msg,
          code = code,
          source = "cmake-lint",
        })
      end
    end
    return diagnostics
  end,
}

lint.linters_by_ft = {
  markdown = { "markdownlint" },
  python = { "ruff" },
  cmake = { "cmakelang_lint" },
}
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "FileType" }, {
  callback = function()
    lint.try_lint()
  end,
})
