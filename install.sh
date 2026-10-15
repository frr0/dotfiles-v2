#!/usr/bin/env bash
# ==============================================================================
# Dotfiles Installation, Package Setup & Symlinking Script
# ==============================================================================
set -euo pipefail

# Determine repository directory dynamically
DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
BACKUP_BASE_DIR="${HOME}/.dotfiles_backup"
TIMESTAMP="$(date +'%Y%m%d_%H%M%S')"
BACKUP_DIR="${BACKUP_BASE_DIR}/${TIMESTAMP}"

# Color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m' # No Color

DRY_RUN=false
ASSUME_YES=false
SKIP_PACKAGES=false
PACKAGES_ONLY=false

# Usage information
usage() {
    cat <<EOF
Usage: ./install.sh [OPTIONS]

Options:
  -n, --dry-run        Show actions that would be taken without modifying anything
  -y, --yes            Automatically confirm package installation (non-interactive)
  -s, --skip-packages  Skip package installation; only create dotfile symlinks
  -p, --packages-only  Only install software packages; skip creating symlinks
  -h, --help           Display this help message

Managed Software:
  • vim, neovim (nvim)  - Text editors
  • tmux                - Terminal multiplexer
  • lazygit             - Terminal UI for git
  • starship            - Cross-shell prompt
  • zsh                 - Z shell
  • fzf                 - Fuzzy finder
  • eza                 - Modern replacement for 'ls'
  • htop                - Interactive process viewer
  • ranger              - Console file manager
  • wl-clipboard/xclip  - System clipboard utilities
  • zsh plugins         - autosuggestions, syntax-highlighting, substring-search

Managed Dotfiles:
  • .zshrc        -> ~/.zshrc
  • .tmux.conf    -> ~/.tmux.conf (and ~/.config/tmux/tmux.conf)
  • .vimrc        -> ~/.vimrc
  • starship.toml -> ~/.config/starship.toml

Any existing files are safely backed up to ~/.dotfiles_backup/<timestamp>/
before symlinks are created.
EOF
    exit 0
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -n|--dry-run)
            DRY_RUN=true
            shift
            ;;
        -y|--yes)
            ASSUME_YES=true
            shift
            ;;
        -s|--skip-packages)
            SKIP_PACKAGES=true
            shift
            ;;
        -p|--packages-only)
            PACKAGES_ONLY=true
            shift
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            usage
            ;;
    esac
done

echo -e "${BLUE}====================================================${NC}"
echo -e "${BLUE}     Dotfiles Installer & Package Manager           ${NC}"
echo -e "${BLUE}====================================================${NC}"
echo -e "Repository location: ${CYAN}${DOTFILES_DIR}${NC}"
if [ "$DRY_RUN" = true ]; then
    echo -e "${YELLOW}[DRY RUN MODE] No changes will be made.${NC}"
fi
echo ""

# Helper to run commands with or without sudo
SUDO=""
if [ "$(id -u)" -ne 0 ]; then
    if command -v sudo >/dev/null 2>&1; then
        SUDO="sudo"
    fi
fi

# Detect Package Manager
detect_pm() {
    if command -v pacman >/dev/null 2>&1; then
        echo "pacman"
    elif command -v apt-get >/dev/null 2>&1; then
        echo "apt"
    elif command -v dnf >/dev/null 2>&1; then
        echo "dnf"
    elif command -v brew >/dev/null 2>&1; then
        echo "brew"
    elif command -v zypper >/dev/null 2>&1; then
        echo "zypper"
    else
        echo "unknown"
    fi
}

install_pacman() {
    local all_pkgs=(
        vim
        neovim
        tmux
        lazygit
        starship
        zsh
        fzf
        eza
        htop
        ranger
        wl-clipboard
        zsh-autosuggestions
        zsh-syntax-highlighting
        zsh-history-substring-search
        bat
        fd
        ripgrep
        plocate
        ugrep
    )

    local missing=()
    for pkg in "${all_pkgs[@]}"; do
        if ! pacman -Q "$pkg" >/dev/null 2>&1; then
            missing+=("$pkg")
        fi
    done

    if [ ${#missing[@]} -eq 0 ]; then
        echo -e "  ${GREEN}✓ All software packages are already installed (pacman).${NC}"
        return 0
    fi

    echo -e "  ${YELLOW}Missing packages (${#missing[@]}):${NC} ${missing[*]}"
    if [ "$DRY_RUN" = true ]; then
        echo -e "  ${CYAN}[DRY-RUN] Would run:${NC} ${SUDO} pacman -S --needed ${missing[*]}"
        return 0
    fi

    if [ "$ASSUME_YES" = false ]; then
        if [ -t 0 ]; then
            read -r -p "Install missing packages with pacman? [Y/n] " answer
            case "$answer" in
                [nN][oO]|[nN])
                    echo -e "  ${YELLOW}Skipping package installation.${NC}"
                    return 0
                    ;;
            esac
        else
            echo -e "  ${YELLOW}Non-interactive shell; use -y/--yes to install automatically.${NC}"
            return 0
        fi
    fi

    local noconfirm_flag=""
    if [ "$ASSUME_YES" = true ]; then
        noconfirm_flag="--noconfirm"
    fi

    echo -e "  ${BLUE}Installing missing packages via pacman...${NC}"
    ${SUDO} pacman -S --needed $noconfirm_flag "${missing[@]}"
    echo -e "  ${GREEN}✓ Package installation complete!${NC}"
}

install_apt() {
    local apt_pkgs=(
        vim
        neovim
        tmux
        zsh
        fzf
        htop
        ranger
        curl
        git
        wl-clipboard
        xclip
        zsh-autosuggestions
        zsh-syntax-highlighting
    )

    local missing=()
    for pkg in "${apt_pkgs[@]}"; do
        if ! dpkg -s "$pkg" >/dev/null 2>&1; then
            missing+=("$pkg")
        fi
    done

    local need_starship=false
    local need_lazygit=false
    local need_eza=false

    if ! command -v starship >/dev/null 2>&1; then
        need_starship=true
        missing+=("starship")
    fi
    if ! command -v lazygit >/dev/null 2>&1; then
        need_lazygit=true
        missing+=("lazygit")
    fi
    if ! command -v eza >/dev/null 2>&1; then
        need_eza=true
        missing+=("eza")
    fi

    if [ ${#missing[@]} -eq 0 ]; then
        echo -e "  ${GREEN}✓ All software packages are already installed (apt).${NC}"
        return 0
    fi

    echo -e "  ${YELLOW}Missing packages/tools (${#missing[@]}):${NC} ${missing[*]}"
    if [ "$DRY_RUN" = true ]; then
        echo -e "  ${CYAN}[DRY-RUN] Would install missing apt packages and tools: ${missing[*]}${NC}"
        return 0
    fi

    if [ "$ASSUME_YES" = false ]; then
        if [ -t 0 ]; then
            read -r -p "Install missing packages with apt? [Y/n] " answer
            case "$answer" in
                [nN][oO]|[nN])
                    echo -e "  ${YELLOW}Skipping package installation.${NC}"
                    return 0
                    ;;
            esac
        else
            echo -e "  ${YELLOW}Non-interactive shell; use -y/--yes to install automatically.${NC}"
            return 0
        fi
    fi

    echo -e "  ${BLUE}Updating package lists...${NC}"
    ${SUDO} apt-get update -y

    local install_apt_pkgs=()
    for p in "${apt_pkgs[@]}"; do
        if ! dpkg -s "$p" >/dev/null 2>&1; then
            install_apt_pkgs+=("$p")
        fi
    done
    if [ ${#install_apt_pkgs[@]} -gt 0 ]; then
        ${SUDO} apt-get install -y "${install_apt_pkgs[@]}"
    fi

    if [ "$need_starship" = true ]; then
        echo -e "  ${BLUE}Installing Starship prompt...${NC}"
        curl -sS https://starship.rs/install.sh | sh -s -- -y
    fi

    if [ "$need_lazygit" = true ]; then
        echo -e "  ${BLUE}Installing Lazygit...${NC}"
        local lazygit_ver
        lazygit_ver=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*' || echo "0.48.0")
        curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${lazygit_ver}_Linux_x86_64.tar.gz"
        tar -xf /tmp/lazygit.tar.gz -C /tmp lazygit
        ${SUDO} install /tmp/lazygit /usr/local/bin
        rm -f /tmp/lazygit /tmp/lazygit.tar.gz
    fi

    if [ "$need_eza" = true ]; then
        echo -e "  ${BLUE}Installing eza...${NC}"
        ${SUDO} mkdir -p /etc/apt/keyrings
        wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | ${SUDO} gpg --dearmor -o /etc/apt/keyrings/gierens.gpg 2>/dev/null || true
        echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | ${SUDO} tee /etc/apt/sources.list.d/gierens.list >/dev/null
        ${SUDO} chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list 2>/dev/null || true
        ${SUDO} apt-get update -y && ${SUDO} apt-get install -y eza || true
    fi

    echo -e "  ${GREEN}✓ Package installation complete!${NC}"
}

install_dnf() {
    local dnf_pkgs=(
        vim
        neovim
        tmux
        zsh
        fzf
        eza
        htop
        ranger
        wl-clipboard
        xclip
        curl
        git
        zsh-autosuggestions
        zsh-syntax-highlighting
    )

    local missing=()
    for pkg in "${dnf_pkgs[@]}"; do
        if ! rpm -q "$pkg" >/dev/null 2>&1; then
            missing+=("$pkg")
        fi
    done

    local need_lazygit=false
    local need_starship=false
    if ! command -v lazygit >/dev/null 2>&1; then
        need_lazygit=true
        missing+=("lazygit")
    fi
    if ! command -v starship >/dev/null 2>&1; then
        need_starship=true
        missing+=("starship")
    fi

    if [ ${#missing[@]} -eq 0 ]; then
        echo -e "  ${GREEN}✓ All software packages are already installed (dnf).${NC}"
        return 0
    fi

    echo -e "  ${YELLOW}Missing packages (${#missing[@]}):${NC} ${missing[*]}"
    if [ "$DRY_RUN" = true ]; then
        echo -e "  ${CYAN}[DRY-RUN] Would install missing dnf packages: ${missing[*]}${NC}"
        return 0
    fi

    if [ "$ASSUME_YES" = false ]; then
        if [ -t 0 ]; then
            read -r -p "Install missing packages with dnf? [Y/n] " answer
            case "$answer" in
                [nN][oO]|[nN])
                    echo -e "  ${YELLOW}Skipping package installation.${NC}"
                    return 0
                    ;;
            esac
        else
            echo -e "  ${YELLOW}Non-interactive shell; use -y/--yes to install automatically.${NC}"
            return 0
        fi
    fi

    local install_dnf_pkgs=()
    for p in "${dnf_pkgs[@]}"; do
        if ! rpm -q "$p" >/dev/null 2>&1; then
            install_dnf_pkgs+=("$p")
        fi
    done

    if [ ${#install_dnf_pkgs[@]} -gt 0 ]; then
        echo -e "  ${BLUE}Installing dnf packages...${NC}"
        ${SUDO} dnf install -y "${install_dnf_pkgs[@]}"
    fi

    if [ "$need_lazygit" = true ]; then
        echo -e "  ${BLUE}Enabling lazygit Copr and installing...${NC}"
        ${SUDO} dnf copr enable atim/lazygit -y || true
        ${SUDO} dnf install -y lazygit || true
    fi

    if [ "$need_starship" = true ]; then
        echo -e "  ${BLUE}Enabling starship Copr and installing...${NC}"
        ${SUDO} dnf copr enable atim/starship -y || true
        ${SUDO} dnf install -y starship || curl -sS https://starship.rs/install.sh | sh -s -- -y
    fi

    echo -e "  ${GREEN}✓ Package installation complete!${NC}"
}

install_brew() {
    local brew_pkgs=(
        vim
        neovim
        tmux
        lazygit
        starship
        zsh
        fzf
        eza
        htop
        ranger
        zsh-autosuggestions
        zsh-syntax-highlighting
    )

    local missing=()
    for pkg in "${brew_pkgs[@]}"; do
        if ! brew list "$pkg" >/dev/null 2>&1; then
            missing+=("$pkg")
        fi
    done

    if [ ${#missing[@]} -eq 0 ]; then
        echo -e "  ${GREEN}✓ All software packages are already installed (brew).${NC}"
        return 0
    fi

    echo -e "  ${YELLOW}Missing packages (${#missing[@]}):${NC} ${missing[*]}"
    if [ "$DRY_RUN" = true ]; then
        echo -e "  ${CYAN}[DRY-RUN] Would run:${NC} brew install ${missing[*]}"
        return 0
    fi

    if [ "$ASSUME_YES" = false ]; then
        if [ -t 0 ]; then
            read -r -p "Install missing packages with Homebrew? [Y/n] " answer
            case "$answer" in
                [nN][oO]|[nN])
                    echo -e "  ${YELLOW}Skipping package installation.${NC}"
                    return 0
                    ;;
            esac
        else
            echo -e "  ${YELLOW}Non-interactive shell; use -y/--yes to install automatically.${NC}"
            return 0
        fi
    fi

    echo -e "  ${BLUE}Installing Homebrew packages...${NC}"
    brew install "${missing[@]}"
    echo -e "  ${GREEN}✓ Package installation complete!${NC}"
}

install_generic() {
    echo -e "  ${YELLOW}Could not determine supported package manager (pacman, apt, dnf, brew).${NC}"
    echo -e "  Please ensure the following tools are installed manually:"
    echo -e "    vim, neovim, tmux, lazygit, starship, zsh, fzf, eza, htop, ranger, wl-clipboard"
}

install_packages() {
    echo -e "${BOLD}[1/2] Checking Software Packages${NC}"
    local pm
    pm="$(detect_pm)"
    echo -e "Detected package manager: ${CYAN}${pm}${NC}"

    case "$pm" in
        pacman)
            install_pacman
            ;;
        apt)
            install_apt
            ;;
        dnf)
            install_dnf
            ;;
        brew)
            install_brew
            ;;
        *)
            install_generic
            ;;
    esac
    echo ""
}

# List of files to link: "source_file_rel_path:destination_path"
LINKS=(
    ".zshrc:${HOME}/.zshrc"
    ".tmux.conf:${HOME}/.tmux.conf"
    ".tmux.conf:${HOME}/.config/tmux/tmux.conf"
    ".vimrc:${HOME}/.vimrc"
    "starship.toml:${HOME}/.config/starship.toml"
)

backup_made=false

link_file() {
    local src="$1"
    local dest="$2"

    local dest_dir
    dest_dir="$(dirname "$dest")"

    # Ensure parent destination directory exists
    if [ ! -d "$dest_dir" ]; then
        if [ "$DRY_RUN" = true ]; then
            echo -e "  ${CYAN}[DRY-RUN] Would create directory: ${dest_dir}${NC}"
        else
            mkdir -p "$dest_dir"
        fi
    fi

    # Check if destination already points to the correct target
    if [ -L "$dest" ]; then
        local current_target
        current_target="$(readlink -f "$dest" 2>/dev/null || true)"
        local canonical_src
        canonical_src="$(readlink -f "$src" 2>/dev/null || true)"

        if [ "$current_target" = "$canonical_src" ]; then
            echo -e "  ${GREEN}✓ Already linked:${NC} ${dest} -> ${src}"
            return 0
        fi
    fi

    # Destination exists (file, directory, or broken/other symlink)
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        if [ "$DRY_RUN" = true ]; then
            echo -e "  ${YELLOW}[DRY-RUN] Would back up: ${dest} -> ${BACKUP_DIR}/$(basename "$dest")${NC}"
            echo -e "  ${CYAN}[DRY-RUN] Would link: ${dest} -> ${src}${NC}"
            return 0
        fi

        # Create backup directory if not created yet
        if [ "$backup_made" = false ]; then
            mkdir -p "$BACKUP_DIR"
            backup_made=true
        fi

        local backup_target="${BACKUP_DIR}/$(basename "$dest")"
        if [ -e "$backup_target" ]; then
            backup_target="${BACKUP_DIR}/$(basename "$dest")_$(date +%s)"
        fi

        mv "$dest" "$backup_target"
        echo -e "  ${YELLOW}↺ Backed up:${NC} ${dest} -> ${backup_target}"
    fi

    if [ "$DRY_RUN" = true ]; then
        echo -e "  ${CYAN}[DRY-RUN] Would link: ${dest} -> ${src}${NC}"
    else
        ln -snf "$src" "$dest"
        echo -e "  ${GREEN}✓ Linked:${NC} ${dest} -> ${src}"
    fi
}

create_symlinks() {
    echo -e "${BOLD}[2/2] Linking Configuration Files${NC}"
    for item in "${LINKS[@]}"; do
        src_rel="${item%%:*}"
        dest="${item##*:}"
        src="${DOTFILES_DIR}/${src_rel}"

        if [ ! -f "$src" ]; then
            echo -e "  ${RED}✗ Source file not found: ${src}${NC}"
            continue
        fi

        link_file "$src" "$dest"
    done
    echo ""
}

check_default_shell() {
    if command -v zsh >/dev/null 2>&1; then
        local current_shell="${SHELL:-}"
        if [[ "$current_shell" != *"zsh"* ]]; then
            echo -e "${YELLOW}Notice:${NC} Your current default shell is ${CYAN}${current_shell}${NC}."
            echo -e "        To set zsh as your default shell, run: ${GREEN}chsh -s $(command -v zsh)${NC}"
            echo ""
        fi
    fi
}

# Main Execution Flow
if [ "$PACKAGES_ONLY" = true ]; then
    install_packages
    check_default_shell
elif [ "$SKIP_PACKAGES" = true ]; then
    create_symlinks
else
    install_packages
    create_symlinks
    check_default_shell
fi

if [ "$backup_made" = true ]; then
    echo -e "${YELLOW}Backups saved in:${NC} ${BACKUP_DIR}"
fi
echo -e "${GREEN}Done! Installation process finished.${NC}"
echo -e "${CYAN}Tip:${NC} Any changes made to ~/.zshrc, ~/.tmux.conf, ~/.vimrc, or ~/.config/starship.toml are directly reflected in this repository."
echo -e "     To push updates, just run: ${BLUE}dot && git commit -am '...' && git push${NC}"
