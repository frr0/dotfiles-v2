# ==============================================================================
#  ZSH CONFIGURATION (.zshrc)
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. Environment & PATH
# ------------------------------------------------------------------------------
# Prevent duplicate entries in PATH
typeset -U path PATH

# User binaries & global packages
export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$PATH"

# Default editor and terminal settings
export EDITOR="nvim"
export VISUAL="nvim"
export CLICOLOR=1
export LS_COLORS='di=34:ln=36:so=35:pi=33:ex=32:*.tar=31:*.zip=31:*.gz=31:*.jpg=35:*.png=35'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

# Pager colors for man pages
export LESS_TERMCAP_md="$(tput bold 2>/dev/null; tput setaf 2 2>/dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2>/dev/null)"

# ------------------------------------------------------------------------------
# 2. History Options
# ------------------------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY          # Append history to file on exit rather than overwrite
setopt SHARE_HISTORY           # Share command history across concurrent sessions
setopt HIST_IGNORE_DUPS        # Do not record duplicate consecutive commands
setopt HIST_IGNORE_ALL_DUPS    # Remove older duplicate entries from history
setopt HIST_IGNORE_SPACE       # Do not record commands beginning with a space
setopt HIST_REDUCE_BLANKS      # Remove extra blank spaces from history entries

# ------------------------------------------------------------------------------
# 3. Shell Options & Directory Navigation
# ------------------------------------------------------------------------------
setopt AUTO_CD                 # Type a directory name to cd into it
setopt INTERACTIVE_COMMENTS    # Allow '#' comments in interactive shell

# ------------------------------------------------------------------------------
# 4. Completion System
# ------------------------------------------------------------------------------
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# ------------------------------------------------------------------------------
# 5. Aliases
# ------------------------------------------------------------------------------
# Colors & grep
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Modern CLI tools
# eza (modern ls)
if command -v eza >/dev/null 2>&1; then
    alias ls='eza'
    alias la='eza -lah'
    alias lh='eza -lh'
else
    alias ls='ls --color=auto'
    alias la='ls -lah'
    alias lh='ls -lh'
fi

# bat (modern cat with syntax highlighting & paging)
if command -v bat >/dev/null 2>&1; then
    alias cat='bat'
    alias bcat='bat --paging=never'
fi

# fd (modern find)
if command -v fd >/dev/null 2>&1; then
    alias find='fd'
    alias fda='fd -u'              # Unrestricted (hidden + ignored files)
    alias fdd='fd --type d'        # Directories only
    alias fdf='fd --type f'        # Files only
fi

# ripgrep (modern fast grep)
if command -v rg >/dev/null 2>&1; then
    alias rg='rg --smart-case'
    alias rgi='rg -i'              # Case-insensitive
    alias rgh='rg --hidden'        # Include hidden files
    alias rgf='rg --files'         # List files searched by ripgrep
fi

# ugrep (grep with interactive query TUI)
if command -v ugrep >/dev/null 2>&1; then
    alias ug='ug -Q'               # Interactive query TUI mode
    alias ugz='ug -z'              # Search inside compressed files / archives
fi

# plocate (ultra-fast locate)
if command -v plocate >/dev/null 2>&1; then
    alias locate='plocate'
    alias updatedb='sudo updatedb'
fi

# htop (process viewer)
if command -v htop >/dev/null 2>&1; then
    alias top='htop'
fi

# fzf (fuzzy finder shortcuts & preview)
if command -v fzf >/dev/null 2>&1; then
    alias fz='fzf'
    alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

    # Open selected file in editor with bat preview
    fn() {
        local file
        file=$(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}') && [[ -n "$file" ]] && ${EDITOR:-nvim} "$file"
    }
fi

# yt-dlp (media downloader)
if command -v yt-dlp >/dev/null 2>&1; then
    alias ytdl='yt-dlp'
    alias yta='yt-dlp -x --audio-format mp3'
    alias ytv='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"'
fi

# podman (rootless containers)
if command -v podman >/dev/null 2>&1; then
    alias pd='podman'
    alias pps='podman ps'
    alias ppa='podman ps -a'
    alias pim='podman images'
fi

# tailscale (mesh VPN)
if command -v tailscale >/dev/null 2>&1; then
    alias ts='tailscale'
    alias tss='tailscale status'
    alias tsu='sudo tailscale up'
    alias tsd='sudo tailscale down'
fi

# Antigravity CLI (agy)
if command -v agy >/dev/null 2>&1; then
    alias agyc='agy -c'
    alias agyd='agy -d'
fi

# General utilities
alias c='clear'
alias q='exit'
alias s='source'
alias d='fzf'
alias r='ranger'
alias t='tmux'
alias k='tmux kill-server'
alias l='lazygit'
alias dc='lazydocker'
alias h='htop'
alias f='dolphin .'
alias gt='gdb -tui'
alias b='bash'
alias m='make'
alias a='cdh'
alias co='codium .'

# Editors & configurations
alias n='nvim'
alias v='vim'
alias p='nvim -p'
alias nn='cd ~/.config/nvim/ && nvim init.lua'
alias i3='nvim ~/.config/i3/config'
alias zc='nvim ~/.zshrc'
alias szc='source ~/.zshrc'
alias stc='nvim ~/.config/starship.toml'
alias tc='nvim ~/.tmux.conf'
alias vc='nvim ~/.vimrc'
alias niric='nvim ~/.config/niri/config.kdl'
alias nocc='nvim ~/.config/noctalia/config.toml'
alias idlec='nvim ~/.config/swayidle/config'
alias vsc='nvim ~/.config/Code/User/settings.json'
alias vsk='nvim ~/.config/Code/User/keybindings.json'

# Navigation
alias e='cd /mnt/c/Users/franc/'
alias dot='cd ~/Progetti/dotfiles'
alias sc='cd ~/.local/bin/scripts && ls -lah'
alias 19='cd ~/projects/COVID-19'

# Clipboard & display
alias copy='xclip -selection clipboard'
alias paste='xclip -selection clipboard -target image/png -out >'
alias mt='xrandr --output eDP-1 --off && xrandr --output DP-1 --auto --left-of HDMI-1'

# System maintenance (Arch Linux / Pacman / Flatpak)
alias up='sudo pacman -Syu && flatpak update -y && fwupdmgr refresh && fwupdmgr update'
alias rmpkg='sudo pacman -Rsn'
alias cleanch='sudo pacman -Scc'
alias fixpacman='sudo rm /var/lib/pacman/db.lck'

# Docker & remote hosts
alias lzd='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v /yourpath/config:/.config/jesseduffield/lazydocker lazyteam/lazydocker'
alias pi='ssh rpi@raspberrypi.local'
alias rpi='ssh rpi@100.81.217.118'

# Project scaffolding
alias cc='cp -r ~/projects/Project_create/c . && cd c && git init && nvim client.c'
alias ccc='cp -r ~/projects/Project_create/c_adv . && cd c_adv && git init && nvim client.c'
alias ccp='cp -r ~/projects/Project_create/cpp . && cd cpp && git init && nvim client.cpp'
alias cy='cp -r ~/projects/Project_create/py . && cd py && git init && nvim client.py'
alias cj='cp -r ~/projects/Project_create/java . && cd java && git init && nvim client.java'
alias cs='cp -r ~/projects/Project_create/sh . && cd sh && git init && chmod +x program.sh && nvim program.sh'
alias cm='cp -r ~/projects/Project_create/md/md . && cd md && git init && nvim note.md'
alias sl='cp -r ~/projects/Project_create/slides . && cd slides && git init && nvim note.md'
alias cl='cp -r ~/projects/Project_create/latex . && cd latex && git init && nvim main.tex'

# ------------------------------------------------------------------------------
# 6. External Tools & SDKs
# ------------------------------------------------------------------------------
# Fast Node Manager (fnm)
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
    export PATH="$FNM_PATH:$PATH"
    eval "$(fnm env)"
fi

# Google Cloud SDK
[[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]] && source "$HOME/google-cloud-sdk/path.zsh.inc"
[[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]] && source "$HOME/google-cloud-sdk/completion.zsh.inc"

# FZF integration with fd and bat
if command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix --hidden --follow --exclude .git'
fi

if command -v bat >/dev/null 2>&1; then
    export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'bat --style=numbers --color=always --line-range :500 {}'"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# ------------------------------------------------------------------------------
# 7. Plugins
# ------------------------------------------------------------------------------
# FZF (Key bindings: Ctrl+R history, Ctrl+T file search, Alt+C cd & completion)
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh

# Zsh Autosuggestions
[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# History Substring Search (with arrow key bindings)
if [[ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    [[ -n "${terminfo[kcuu1]}" ]] && bindkey "${terminfo[kcuu1]}" history-substring-search-up
    [[ -n "${terminfo[kcud1]}" ]] && bindkey "${terminfo[kcud1]}" history-substring-search-down
fi

# Arch Linux command-not-found handler
[[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]] && \
    source /usr/share/doc/pkgfile/command-not-found.zsh

# Syntax Highlighting (must be loaded AFTER completion and other plugins)
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ------------------------------------------------------------------------------
# 8. Prompt (Starship)
# ------------------------------------------------------------------------------
# Starship must be initialized at the very end of .zshrc
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
else
    # Fallback prompt with user@hostname, SSH, and container flags
    _fallback_prompt_precmd() {
        local ssh_flag=""
        [[ -n "$SSH_CONNECTION" || -n "$SSH_CLIENT" || -n "$SSH_TTY" ]] && ssh_flag="%F{magenta}[SSH]%f "
        local container_flag=""
        [[ -f /.dockerenv || -f /run/.containerenv || -n "$CONTAINER_ID" ]] && container_flag="%F{blue}[docker]%f "
        PROMPT="${ssh_flag}${container_flag}%F{cyan}%n%f@%F{green}%m%f %F{blue}%~%f %# "
    }
    autoload -Uz add-zsh-hook
    add-zsh-hook precmd _fallback_prompt_precmd
fi

# zoxide (smart directory jumper: z & zi)
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi
