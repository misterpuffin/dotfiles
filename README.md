# dotfiles

Personal dotfiles for a Linux workstation running Kitty + tmux + Neovim.

## What's here

| Config | Path | Description |
|--------|------|-------------|
| [Neovim](.config/nvim/) | `.config/nvim/` | Custom config built from kickstart.nvim — see [nvim README](.config/nvim/README.md) |
| [tmux](.tmux.conf) | `.tmux.conf` | `C-a` prefix, vi keys, gruvbox theme, TPM plugins |
| [Kitty](.config/kitty/) | `.config/kitty/` | JetBrainsMono Nerd Font, transparent background, auto-attaches tmux |
| [Zsh](.zshrc) | `.zshrc` | oh-my-zsh + Starship prompt |
| [Git](.gitconfig) | `.gitconfig` | Aliases and identity |

## Fresh install

```bash
# 1. Neovim (via bob)
cargo install bob-nvim   # or: https://github.com/MordechaiHadad/bob
bob install stable
bob use stable

# 2. tmux + TPM
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# then press prefix + I inside tmux to install plugins

# 3. Kitty
sudo apt install kitty

# 4. Fonts
# Install JetBrainsMono Nerd Font from https://www.nerdfonts.com/

# 5. Zsh + Starship
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh
```

## Repo structure

The `.gitignore` uses an inverted pattern (ignore everything, then allowlist specific files) to keep the home directory clean as a git worktree.
