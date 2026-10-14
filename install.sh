#!/usr/bin/env bash
# ==============================================================================
# Dotfiles Installation & Symlinking Script
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
NC='\033[0m' # No Color

DRY_RUN=false

# Usage information
usage() {
    cat <<EOF
Usage: ./install.sh [OPTIONS]

Options:
  -n, --dry-run   Show actions that would be taken without modifying anything
  -h, --help      Display this help message

This script links:
  • .zshrc     -> ~/.zshrc
  • .tmux.conf -> ~/.tmux.conf (and ~/.config/tmux/tmux.conf)
  • .vimrc     -> ~/.vimrc

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
        -h|--help)
            usage
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            usage
            ;;
    esac
done

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Dotfiles Installer & Symlink Manager  ${NC}"
echo -e "${BLUE}========================================${NC}"
echo -e "Repository location: ${CYAN}${DOTFILES_DIR}${NC}"
if [ "$DRY_RUN" = true ]; then
    echo -e "${YELLOW}[DRY RUN MODE] No changes will be made.${NC}\n"
else
    echo ""
fi

# List of files to link: "source_file_rel_path:destination_path"
LINKS=(
    ".zshrc:${HOME}/.zshrc"
    ".tmux.conf:${HOME}/.tmux.conf"
    ".tmux.conf:${HOME}/.config/tmux/tmux.conf"
    ".vimrc:${HOME}/.vimrc"
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
if [ "$backup_made" = true ]; then
    echo -e "${YELLOW}Backups saved in:${NC} ${BACKUP_DIR}"
fi
echo -e "${GREEN}Done! All dotfiles are linked and active.${NC}"
echo -e "${CYAN}Tip:${NC} Any changes made to ~/.zshrc, ~/.tmux.conf, or ~/.vimrc are directly reflected in this repository."
echo -e "     To push updates, just run: ${BLUE}dot && git commit -am '...' && git push${NC}"
