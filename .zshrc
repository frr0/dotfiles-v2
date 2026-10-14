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
if command -v eza >/dev/null 2>&1; then
    alias ls='eza'
    alias la='eza -lah'
    alias lh='eza -lh'
else
    alias ls='ls --color=auto'
    alias la='ls -lah'
    alias lh='ls -lh'
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

# ------------------------------------------------------------------------------
# 7. Plugins
# ------------------------------------------------------------------------------
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
fi
