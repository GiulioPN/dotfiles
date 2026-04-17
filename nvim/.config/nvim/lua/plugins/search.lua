--: Telescope + grug-far (search / find & replace)
vim.pack.add({
  { src = "https://github.com/nvim-telescope/telescope.nvim.git", version = "master" }, -- fuzzy finder UI (files, grep, buffers)
  { src = "https://github.com/nvim-lua/plenary.nvim.git", version = "v0.1.4" }, -- telescope dependency (async/fs utilities)
  { src = "https://github.com/MagicDuck/grug-far.nvim.git", version = "1.6.67" }, -- find & replace UI across file or project
})

--: Telescope
local builtin = require("telescope.builtin")
local telescope = require("telescope")

telescope.setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.55 },
    file_ignore_patterns = { "node_modules", ".git/", "build/", "dist/" },
    -- Disable treesitter highlighting in previewer (broken on Neovim 0.12)
    preview = {
      treesitter = false,
    },
  },
})

-- Find files in project
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
-- Find string under cursor in project
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find Word (cursor)" })
-- Find string in project (live)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep (project)" })
-- Find string in current buffer
vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "Find in Buffer" })

--: grug-far (find & replace)
require("grug-far").setup()
-- Find & replace in current file only
vim.keymap.set("n", "<leader>fr", function()
  require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
end, { desc = "Find & Replace (file)" })
-- Find & replace across whole project
vim.keymap.set("n", "<leader>fR", function()
  require("grug-far").open()
end, { desc = "Find & Replace (project)" })
