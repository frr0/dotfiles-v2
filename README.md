# Dotfiles

Clean, version-controlled dotfiles for personal development environment.

## Managed Configurations

| File | Destination | Description |
| :--- | :--- | :--- |
| [`.zshrc`](file:///home/francesco/Progetti/dotfiles/.zshrc) | `~/.zshrc` | Zsh configuration, aliases, completions, plugins & Starship |
| [`.tmux.conf`](file:///home/francesco/Progetti/dotfiles/.tmux.conf) | `~/.tmux.conf` & `~/.config/tmux/tmux.conf` | Tmux terminal multiplexer keybindings and theme |
| [`.vimrc`](file:///home/francesco/Progetti/dotfiles/.vimrc) | `~/.vimrc` | Vim editor settings, key mappings & auto-pairs |
| [`starship.toml`](file:///home/francesco/Progetti/dotfiles/starship.toml) | `~/.config/starship.toml` | Starship prompt configuration (user, PC name, SSH, Docker/container badges) |

---

## Managed Software

The installation script detects your package manager (`pacman`, `apt`, `dnf`, `brew`) and installs missing packages:

| Category | Tools & Packages |
| :--- | :--- |
| **Editors** | `vim`, `neovim` (`nvim`) |
| **Multiplexer & Shell** | `tmux`, `zsh` |
| **Git UI** | `lazygit` |
| **Prompt** | `starship` |
| **CLI Utilities** | `fzf` (fuzzy finder), `eza` (modern `ls`), `bat` (modern `cat`), `fd` (modern `find`), `ripgrep` / `ugrep` (fast grep), `plocate` (fast locate), `htop` (process viewer), `ranger` (file manager) |
| **Clipboard** | `wl-clipboard` (Wayland) / `xclip` (X11) |
| **Zsh Plugins** | `zsh-autosuggestions`, `zsh-syntax-highlighting`, `zsh-history-substring-search` |

---

## How It Works (Symlinks)

All configuration files in your home directory are **symbolic links** pointing to this repository:

```
~/.zshrc                ───────────► ~/Progetti/dotfiles/.zshrc
~/.tmux.conf            ───────────► ~/Progetti/dotfiles/.tmux.conf
~/.vimrc                ───────────► ~/Progetti/dotfiles/.vimrc
~/.config/starship.toml ───────────► ~/Progetti/dotfiles/starship.toml
```

Because editors follow symlinks when saving, **any modification you make to `~/.zshrc`, `~/.tmux.conf`, `~/.vimrc`, or `~/.config/starship.toml` is immediately saved directly into this repository folder**.

### Daily Workflow

1. Edit your dotfile normally (e.g. `nvim ~/.zshrc` or `zc`).
2. Go to the repository directory using your built-in alias:
   ```bash
   dot
   # (alias for cd ~/Progetti/dotfiles)
   ```
3. Review your changes, commit, and push:
   ```bash
   git status
   git diff
   git commit -am "Update aliases and keybindings"
   git push
   ```

---

## Installation & Setup

### On This Machine (or to refresh links)

Run the installation script:

```bash
cd ~/Progetti/dotfiles
./install.sh
```

- Safe & Idempotent: Can be run multiple times safely.
- Automatic Backups: Any existing non-symlink files are preserved in `~/.dotfiles_backup/<timestamp>/`.

#### Script Options

```bash
./install.sh                  # Interactive: checks/installs software + links dotfiles
./install.sh --dry-run        # Preview actions without modifying anything (-n)
./install.sh --yes            # Auto-confirm package installation non-interactively (-y)
./install.sh --skip-packages  # Only manage symlinks; skip software packages (-s)
./install.sh --packages-only  # Only install software packages; skip symlinks (-p)
./install.sh --help           # Show help message (-h)
```

### On a New Machine

Clone the repository and run `install.sh`:

```bash
git clone git@github.com:frr0/dotfiles-v2.git ~/Progetti/dotfiles
cd ~/Progetti/dotfiles
./install.sh
```

---

## Repository

Hosted on GitHub at [frr0/dotfiles-v2](https://github.com/frr0/dotfiles-v2).

