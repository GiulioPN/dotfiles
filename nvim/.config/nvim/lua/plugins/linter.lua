--: nvim-lint (linter)
vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-lint.git", version = "master" }, -- linter
})

require("lint").linters_by_ft = {
  markdown = { "markdownlint" },
}
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "FileType" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
