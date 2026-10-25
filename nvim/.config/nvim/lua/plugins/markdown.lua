--: markdown-preview.nvim (live browser preview)
-- Install the node app on first install / update
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local d = ev.data
    if d.spec.name == "markdown-preview.nvim" and (d.kind == "install" or d.kind == "update") then
      vim.system({ "npm", "install" }, { cwd = d.path .. "/app" }):wait()
    end
  end,
})

vim.pack.add({
  { src = "https://github.com/iamcco/markdown-preview.nvim.git", version = "a923f5fc5ba36a3b17e289dc35dc17f66d0548ee" },
})

vim.keymap.set("n", "<leader>tm", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle markdown preview" })
