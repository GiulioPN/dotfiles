--: General settings
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.autoformat = true
vim.g.trouble_lualine = true

--: Options
local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.number = true -- Print line number
opt.spelllang = { "en" }
opt.list = true -- Show invisible characters
opt.autoindent = true -- Enable auto indentation
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 4 -- Number of spaces for a tab
opt.softtabstop = 4 -- Number of spaces for a tab when editing
opt.shiftwidth = 4 -- Number of spaces for autoindent

--: Load plugin modules
require("plugins.lsp")
require("plugins.treesitter")
require("plugins.formatter")
require("plugins.linter")
require("plugins.theme")
require("plugins.search")
require("plugins.autocomplete")

require("config.diagnostic")
