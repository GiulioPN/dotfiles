--: Treesitter
vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter.git", version = "main" }, -- for syntax
})

require("nvim-treesitter").setup({
  -- A list of parser names, or "all"
  ensure_installed = { "lua", "python", "cpp", "c" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
