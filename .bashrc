#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Modern CLI aliases
command -v eza >/dev/null 2>&1 && alias ls='eza'
command -v bat >/dev/null 2>&1 && alias cat='bat'
command -v fd >/dev/null 2>&1 && alias find='fd'
command -v rg >/dev/null 2>&1 && alias rg='rg --smart-case'
command -v ugrep >/dev/null 2>&1 && alias ug='ug -Q'
command -v plocate >/dev/null 2>&1 && alias locate='plocate'
command -v htop >/dev/null 2>&1 && alias top='htop'
command -v fzf >/dev/null 2>&1 && alias fz='fzf'
command -v yt-dlp >/dev/null 2>&1 && alias ytdl='yt-dlp'
command -v podman >/dev/null 2>&1 && alias pd='podman'
command -v tailscale >/dev/null 2>&1 && alias ts='tailscale'
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init bash)"
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
else
    _prompt_flags=""
    [[ -n "$SSH_CONNECTION" || -n "$SSH_CLIENT" || -n "$SSH_TTY" ]] && _prompt_flags="[SSH] "
    [[ -f /.dockerenv || -f /run/.containerenv || -n "$CONTAINER_ID" ]] && _prompt_flags="${_prompt_flags}[docker] "
    PS1="${_prompt_flags}[\u@\h \W]\$ "
fi


# Added by Antigravity CLI installer
export PATH="/home/francesco/.local/bin:$PATH"
. "$HOME/.cargo/env"
