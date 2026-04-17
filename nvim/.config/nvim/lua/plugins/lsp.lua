--: Mason + LSP
vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim.git", version = "v2.2.1" }, -- mason pkg manager
  { src = "https://github.com/mason-org/mason-lspconfig.nvim.git", version = "v2.1.0" }, -- for lsp plugins
  { src = "https://github.com/neovim/nvim-lspconfig.git", version = "v2.7.0" },
  { src = "https://github.com/owallb/mason-auto-install.nvim.git", version = "main" }, -- for tools plugins
})

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "marksman",
  },
  automatic_installation = true,
})

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--log=verbose",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  root_markers = {
    "compile_commands.json",
    "compile_flags.txt",
    "Makefile",
    "configure.ac",
    "configure.in",
    "config.h.in",
    "meson.build",
    "meson_options.txt",
    "build.ninja",
    ".git",
  },
  keys = {
    { "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
  },
})

vim.lsp.enable("clangd")
vim.lsp.enable("marksman")

require("mason-auto-install").setup({
  packages = { "clang-format", "prettierd", "markdownlint", "stylua" },
})
