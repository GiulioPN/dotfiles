# Nvim config

Minimal setup for Neovim 0.12+ using the built-in `vim.pack` — no external
plugin manager.

## Requirements

- Neovim ≥ 0.12
- `node`, `pnpm`, `python3-venv` (for mason-installed tools)

## Install

From the dotfiles root:

```bash
stow -t ~ nvim
```

Plugin versions are pinned in `nvim-pack-lock.json`.

## Plugins

- **mason** + **mason-lspconfig** + **mason-auto-install** — LSP/tool installer
- **nvim-lspconfig** — LSP setup (clangd, marksman)
- **nvim-treesitter** — syntax (lua, python, c, cpp)
- **conform.nvim** — formatter (clang-format, stylua, prettierd)
- **nvim-lint** — linter (markdownlint)
- **telescope.nvim** — fuzzy finder
- **grug-far.nvim** — find & replace
- **blink.cmp** — completion (lazy-loaded on insert)
- **catppuccin** — colorscheme

## Keymaps

Leader: `<Space>`

| Keys         | Action                       |
| ------------ | ---------------------------- |
| `<leader>ff` | Find files                   |
| `<leader>fg` | Live grep (project)          |
| `<leader>fw` | Grep word under cursor       |
| `<leader>fb` | Fuzzy find in buffer         |
| `<leader>fr` | Find & replace (file)        |
| `<leader>fR` | Find & replace (project)     |
| `<leader>ch` | Switch C/C++ source ↔ header |
| `<leader>da` | Open diagnostic list         |

## Default useful nvim commands

- `gv` — re-select last visual selection
- `t` / `f` — till / find next char
- `A` — append at end of line
- `:sp` / `<C-w>s` — horizontal split (`:sp filename`)
- `:vsp` / `<C-w>v` — vertical split
- `<C-w>h` / `<C-w>l` — move to left/right window
- `<C-w>o` — keep current window, close others
- `:close` — close current window
- `:checkhealth lsp` — LSP status (replaces `:LspInfo`)
