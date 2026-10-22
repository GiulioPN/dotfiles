--: classlayout.nvim (visualize C/C++ class/struct memory layouts)
vim.pack.add({
  { src = "https://github.com/J-Cowsert/classlayout.nvim.git" },
})

require("classlayout").setup({
  keymap = "<leader>cl",
  compiler = "clang",
  args = {},
  compile_commands = true,
})
