--: claudecode.nvim (Claude Code CLI integration, uses Claude Pro login)
vim.pack.add({
  { src = "https://github.com/coder/claudecode.nvim", version = "v0.3.0" },
})

require("claudecode").setup({
  terminal = {
    provider = "native", -- built-in terminal, no snacks.nvim needed
    split_side = "right",
    split_width_percentage = 0.35,
  },
})

vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
vim.keymap.set("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })
vim.keymap.set("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude session" })
vim.keymap.set("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer to Claude" })
vim.keymap.set("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send selection to Claude" })
vim.keymap.set("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept Claude diff" })
vim.keymap.set("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny Claude diff" })
-- Hide Claude from inside its terminal without leaving insert mode
vim.keymap.set("t", "<C-q>", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
