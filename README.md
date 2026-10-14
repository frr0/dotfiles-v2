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
git clone <your-repo-url> ~/Progetti/dotfiles
cd ~/Progetti/dotfiles
./install.sh
```

---

## Connecting to GitHub

To push this repository to GitHub under your account (`frr0`):

```bash
cd ~/Progetti/dotfiles

# Option 1: Create a new repository via GitHub CLI
gh repo create dotfiles --public --source=. --remote=origin --push

# Option 2: If you prefer private:
# gh repo create dotfiles --private --source=. --remote=origin --push

# Option 3: If you created it on github.com manually:
# git remote add origin git@github.com:frr0/<repo-name>.git
# git branch -M main
# git push -u origin main
```
