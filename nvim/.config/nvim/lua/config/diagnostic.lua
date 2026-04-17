--: Diagnostics
vim.diagnostic.config({
  -- Virtual Text (The text at the end of the line)
  --[[
        virtual_text = {
        spacing = 4,
        prefix = '●',
        -- Only show the start of the message to prevent it going off-screen
        format = function(diagnostic)
            if diagnostic.severity == vim.diagnostic.severity.ERROR then
                return string.format("ERROR: %s", diagnostic.message)
            end
            return diagnostic.message
        end,
    },
    --]]
  -- Floating Window (The "l" or hover window)
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    -- CRITICAL: This solves your "text goes out of screen" issue
    max_width = 80,
    wrap = true,
  },

  -- Signs in the gutter (Your "W" and "E")
  signs = true,
  underline = true,
  update_in_insert = false, -- Don't scream at you while you're typing
  severity_sort = true,
})

-- Change the delay (default is 4000ms / 4 seconds)
vim.opt.updatetime = 300
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})

-- Show line diagnostic
--- vim.keymap.set('n', '<leader>dl', vim.diagnostic.open_float, { desc = "Show full diagnostic" })
vim.keymap.set("n", "<leader>da", vim.diagnostic.setloclist, { desc = "Open diagnostic list" })
