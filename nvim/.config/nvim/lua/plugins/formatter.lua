--: Conform (formatter)
vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim.git", version = "v9.1.0" }, -- formatter
})

require("conform").setup({
  formatters_by_ft = {
    c = { "clang-format" },
    cpp = { "clang-format" },
    lua = { "stylua" },
    markdown = { "prettierd" },
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
})
