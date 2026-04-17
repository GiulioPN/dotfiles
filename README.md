# Dotfiles

Personal configurations managed with
[GNU stow](https://www.gnu.org/software/stow/) and
[just](https://github.com/casey/just). Tested on Ubuntu 24.04.

## Requirements

- `just`, `stow`, `curl`, `unzip`, `tar`
- `node` — required by several Neovim LSPs (e.g. pyright)
- `python3-venv` — required by Mason to install clang-format

## Usage

Each top-level directory is a stow package mirroring `$HOME`. Install a package
with:

```bash
stow -t ~ <package>
```

Run `just` to list available recipes (e.g. `just tmux-add-config`,
`just status`).

## Neovim

Requires Neovim 0.12+ (uses the built-in `vim.pack.add()`). Install from the
[official releases](https://github.com/neovim/neovim/releases):

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

Add to `~/.bashrc`:

```bash
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
```

Mason installs LSPs and tools under `~/.local/share/nvim/mason`.

## Tmux

```bash
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Fetch TPM and symlink the config:

```bash
just tmux-tpm-fetch
just tmux-add-config
```

## Clangd

```bash
sudo apt-get install clangd-12
```

Then symlink the config with `just clangd-add-config`.

## Prettier

Symlink the config with `just prettier-add-config`.
