# Dotfiles

Clean, version-controlled dotfiles for personal development environment.

## Managed Configurations

| File | Destination | Description |
| :--- | :--- | :--- |
| [`.zshrc`](file:///home/francesco/Progetti/dotfiles/.zshrc) | `~/.zshrc` | Zsh configuration, aliases, completions, plugins & Starship |
| [`.tmux.conf`](file:///home/francesco/Progetti/dotfiles/.tmux.conf) | `~/.tmux.conf` & `~/.config/tmux/tmux.conf` | Tmux terminal multiplexer keybindings and theme |
| [`.vimrc`](file:///home/francesco/Progetti/dotfiles/.vimrc) | `~/.vimrc` | Vim editor settings, key mappings & auto-pairs |

---

## How It Works (Symlinks)

All configuration files in your home directory are **symbolic links** pointing to this repository:

```
~/.zshrc      ───────────► ~/Progetti/dotfiles/.zshrc
~/.tmux.conf  ───────────► ~/Progetti/dotfiles/.tmux.conf
~/.vimrc      ───────────► ~/Progetti/dotfiles/.vimrc
```

Because editors follow symlinks when saving, **any modification you make to `~/.zshrc`, `~/.tmux.conf`, or `~/.vimrc` is immediately saved directly into this repository folder**.

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
./install.sh --dry-run   # Preview changes without modifying files (-n)
./install.sh --help      # Show help message (-h)
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

