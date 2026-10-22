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
    "--query-driver=/usr/bin/clang++-22,/usr/bin/clang++",
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
})

vim.keymap.set("n", "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)" })

vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  root_markers = {
    "pyproject.toml",
    "uv.lock",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    ".git",
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
})

vim.lsp.enable("clangd")
vim.lsp.enable("marksman")
vim.lsp.enable("pyright")

require("mason-auto-install").setup({
  packages = { "clang-format", "prettierd", "markdownlint", "stylua" },
})
