# Dotfiles

Clean, version-controlled dotfiles for personal development environment, desktop shell, and window management.

## Managed Configurations

| File / Directory | Destination | Description |
| :--- | :--- | :--- |
| [`.zshrc`](file:///home/francesco/Progetti/dotfiles/.zshrc) | `~/.zshrc` | Zsh configuration, aliases, completions, plugins & Starship |
| [`.zshenv`](file:///home/francesco/Progetti/dotfiles/.zshenv) | `~/.zshenv` | Zsh environment initialization (Cargo/Rust environment) |
| [`.bashrc`](file:///home/francesco/Progetti/dotfiles/.bashrc) | `~/.bashrc` | Bash fallback configuration, modern CLI aliases & Starship |
| [`starship.toml`](file:///home/francesco/Progetti/dotfiles/starship.toml) | `~/.config/starship.toml` | Starship prompt configuration (user, PC name, SSH, Docker/container badges) |
| [`.tmux.conf`](file:///home/francesco/Progetti/dotfiles/.tmux.conf) | `~/.tmux.conf` & `~/.config/tmux/tmux.conf` | Tmux terminal multiplexer keybindings (`C-Space` / `Alt` navigation) and theme |
| [`alacritty/alacritty.toml`](file:///home/francesco/Progetti/dotfiles/alacritty/alacritty.toml) | `~/.config/alacritty/alacritty.toml` | Alacritty GPU-accelerated terminal configuration & TokyoNight palette |
| [`.vimrc`](file:///home/francesco/Progetti/dotfiles/.vimrc) | `~/.vimrc` | Vim editor settings, key mappings & auto-pairs (also loaded by VSCodeVim) |
| [`nvim/`](file:///home/francesco/Progetti/dotfiles/nvim) | `~/.config/nvim/` | Neovim (LazyVim) configuration, keymaps, options & plugin lockfile |
| [`vscode/settings.json`](file:///home/francesco/Progetti/dotfiles/vscode/settings.json) | `~/.config/Code/User/settings.json` | VS Code settings, VSCodeVim bindings, and complete WhichKey LazyVim menus |
| [`vscode/keybindings.json`](file:///home/francesco/Progetti/dotfiles/vscode/keybindings.json) | `~/.config/Code/User/keybindings.json` | VS Code LazyVim (`Alt` leader) + WhichKey + Neo-tree Explorer keybindings |
| [`vscode/vscode-keybindings.md`](file:///home/francesco/Progetti/dotfiles/vscode/vscode-keybindings.md) | `~/vscode-keybindings.md` | Complete reference guide for all VS Code LazyVim + WhichKey keybindings |
| [`vscode/extensions.txt`](file:///home/francesco/Progetti/dotfiles/vscode/extensions.txt) | *(Managed via `install.sh -e`)* | List of all installed VS Code extensions |
| [`intellij/.ideavimrc`](file:///home/francesco/Progetti/dotfiles/intellij/.ideavimrc) | `~/.ideavimrc` | IdeaVim configuration with Which-Key, NERDTree, and full LazyVim keybindings |
| [`intellij/VSCode _Migrated_.xml`](file:///home/francesco/Progetti/dotfiles/intellij/VSCode%20_Migrated_.xml) | `~/.config/JetBrains/IdeaIC2026.2/keymaps/VSCode _Migrated_.xml` | IntelliJ IDEA native keymap matching VS Code LazyVim shortcuts |
| [`intellij/`](file:///home/francesco/Progetti/dotfiles/intellij) (`keymap.xml`, `ui.lnf.xml`, `vim_settings.xml`, `editor-font.xml`) | `~/.config/JetBrains/IdeaIC2026.2/options/` | IntelliJ active keymap selector, UI mnemonics disable, IdeaVim conflicts, and font settings |
| [`intellij/intellij-keybindings.md`](file:///home/francesco/Progetti/dotfiles/intellij/intellij-keybindings.md) | `~/intellij-keybindings.md` | Complete reference guide for all IntelliJ IDEA LazyVim + Which-Key keybindings |
| [`niri/config.kdl`](file:///home/francesco/Progetti/dotfiles/niri/config.kdl) & [`niri/cfg/`](file:///home/francesco/Progetti/dotfiles/niri/cfg) | `~/.config/niri/` | Niri scrollable-tiling Wayland compositor config (dual-monitor, borders, keybinds, startup) |
| [`noctalia/config.toml`](file:///home/francesco/Progetti/dotfiles/noctalia/config.toml) | `~/.config/noctalia/config.toml` | Noctalia shell core config (polkit agent & lockscreen wallpaper) |
| [`noctalia/settings.toml`](file:///home/francesco/Progetti/dotfiles/noctalia/settings.toml) | `~/.local/state/noctalia/settings.toml` | Noctalia UI state/settings (bar, dock, Gruvbox/Ayu Blue theme, lockscreen widgets, monitors) |
| [`swayidle/config`](file:///home/francesco/Progetti/dotfiles/swayidle/config) | `~/.config/swayidle/config` | Screensaver / idle daemon config (300s monitor power-off, 600s suspend) |
| [`wallpapers/`](file:///home/francesco/Progetti/dotfiles/wallpapers) | `~/Scaricati/photo_2025-10-09_13-14-36.jpg` | Backup of desktop wallpaper image |

---

## Managed Software

The installation script detects your package manager (`pacman`, `apt`, `dnf`, `brew`) and installs missing packages:

| Category | Tools & Packages |
| :--- | :--- |
| **Editors & IDE** | `vim`, `neovim` (`nvim`), `visual-studio-code-bin` (`code`) |
| **Multiplexer, Terminal & Shell** | `tmux`, `alacritty`, `zsh` |
| **Wayland Desktop & Screensaver** | `niri`, `noctalia`, `swayidle` |
| **Git & Container Tools** | `lazygit`, `lazydocker`, `podman` |
| **AI & Agent CLI** | `agy` (Google Antigravity CLI) |
| **Prompt** | `starship` |
| **CLI Utilities** | `zoxide` (smart `z`/`zi` directory jumper), `fzf` (fuzzy finder), `eza` (modern `ls`), `bat` (modern `cat`), `fd` (modern `find`), `ripgrep` / `ugrep` (fast grep), `plocate` (fast locate), `htop` (process viewer), `ranger` (file manager), `yt-dlp` (`ytdl` media downloader) |
| **Network & Security** | `tailscale` (mesh VPN), `bitwarden` (password manager) |
| **Clipboard** | `wl-clipboard` (Wayland) / `xclip` (X11) |
| **Zsh Plugins** | `zsh-autosuggestions`, `zsh-syntax-highlighting`, `zsh-history-substring-search` |

---

## How It Works (Symlinks)

All configuration files in your home directory are **symbolic links** pointing to this repository:

```
~/.zshrc                             ───────────► ~/Progetti/dotfiles/.zshrc
~/.zshenv                            ───────────► ~/Progetti/dotfiles/.zshenv
~/.bashrc                            ───────────► ~/Progetti/dotfiles/.bashrc
~/.tmux.conf                         ───────────► ~/Progetti/dotfiles/.tmux.conf
~/.vimrc                             ───────────► ~/Progetti/dotfiles/.vimrc
~/.config/nvim/*                     ───────────► ~/Progetti/dotfiles/nvim/*
~/.config/starship.toml              ───────────► ~/Progetti/dotfiles/starship.toml
~/.config/alacritty/alacritty.toml   ───────────► ~/Progetti/dotfiles/alacritty/alacritty.toml
~/.config/Code/User/settings.json    ───────────► ~/Progetti/dotfiles/vscode/settings.json
~/.config/Code/User/keybindings.json ───────────► ~/Progetti/dotfiles/vscode/keybindings.json
~/vscode-keybindings.md              ───────────► ~/Progetti/dotfiles/vscode/vscode-keybindings.md
~/.ideavimrc                         ───────────► ~/Progetti/dotfiles/intellij/.ideavimrc
~/intellij-keybindings.md            ───────────► ~/Progetti/dotfiles/intellij/intellij-keybindings.md
~/.config/JetBrains/IdeaIC2026.2/*   ───────────► ~/Progetti/dotfiles/intellij/*.xml
~/.config/niri/config.kdl            ───────────► ~/Progetti/dotfiles/niri/config.kdl
~/.config/niri/cfg/*.kdl             ───────────► ~/Progetti/dotfiles/niri/cfg/*.kdl
~/.config/noctalia/config.toml       ───────────► ~/Progetti/dotfiles/noctalia/config.toml
~/.local/state/noctalia/settings.toml───────────► ~/Progetti/dotfiles/noctalia/settings.toml
~/.config/swayidle/config            ───────────► ~/Progetti/dotfiles/swayidle/config
```

Because editors follow symlinks when saving, **any modification you make to your active config files is immediately saved directly into this repository folder**.

### Daily Workflow

1. Edit your dotfile normally (e.g. `zc`, `tc`, `vc`, `niric`, `nocc`, `idlec`, `vsc`, `vsk`).
2. Go to the repository directory using your built-in alias:
   ```bash
   dot
   # (alias for cd ~/Progetti/dotfiles)
   ```
3. Review your changes, commit, and push:
   ```bash
   git status
   git diff
   git commit -am "Update configurations"
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
./install.sh                      # Interactive: checks/installs software + links dotfiles
./install.sh --dry-run            # Preview actions without modifying anything (-n)
./install.sh --yes                # Auto-confirm package installation non-interactively (-y)
./install.sh --skip-packages      # Only manage symlinks; skip software packages (-s)
./install.sh --packages-only      # Only install software packages; skip symlinks (-p)
./install.sh --vscode-extensions  # Also install missing VS Code extensions from vscode/extensions.txt (-e)
./install.sh --help               # Show help message (-h)
```

### On a New Machine

Clone the repository and run `install.sh`:

```bash
git clone git@github.com:frr0/dotfiles-v2.git ~/Progetti/dotfiles
cd ~/Progetti/dotfiles
./install.sh --vscode-extensions
```

---

## Repository

Hosted on GitHub at [frr0/dotfiles-v2](https://github.com/frr0/dotfiles-v2).
