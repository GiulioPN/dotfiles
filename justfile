# --- Configuration Variables ---
TMUX_TPM_ARCHIVE      := "https://github.com/tmux-plugins/tpm/archive/master.tar.gz"
HOME_DIR     := env_var("HOME")
# --- Configuration Variables ---

default:
    @just --list

tmux-tpm-fetch:
    @echo "Fetching TPM archive..."
    mkdir -p {{HOME_DIR}}/.tmux/plugins/tpm
    curl -L {{TMUX_TPM_ARCHIVE}} | tar -xz -C {{HOME_DIR}}/.tmux/plugins/tpm --strip-components=1

tmux-add-config:
    stow -t ~ tmux

clangd-add-config:
    stow -t ~ clangd

prettier-add-config:
    stow -t ~ prettier

status:
    @ls -la {{HOME_DIR}} | grep "\->"
