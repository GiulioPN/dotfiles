--: Supermaven (inline AI completion, free tier)
vim.pack.add({
  { src = "https://github.com/supermaven-inc/supermaven-nvim", version = "07d20fce48a5629686aefb0a7cd4b25e33947d50" },
})

require("supermaven-nvim").setup({
  keymaps = {
    accept_suggestion = "<M-l>", -- blink.cmp uses <CR>, so no clash
    clear_suggestion = "<C-]>",
    accept_word = "<M-j>",
  },
})

vim.keymap.set("n", "<leader>ts", function()
  local api = require("supermaven-nvim.api")
  api.toggle()
  vim.notify("Supermaven " .. (api.is_running() and "enabled" or "disabled"))
end, { desc = "Toggle Supermaven" })
