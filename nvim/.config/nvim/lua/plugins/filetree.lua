--: Neo-tree (file explorer)
vim.pack.add({
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim.git", version = "v3.x" },
  { src = "https://github.com/MunifTanjim/nui.nvim.git" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons.git" },
})

require("neo-tree").setup({
  close_if_last_window = true,
  filesystem = {
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
  },
  window = {
    width = 35,
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })
