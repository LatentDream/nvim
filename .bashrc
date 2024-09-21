# My Personal Aliases ----------
# Utils
alias lt='du -sh * | sort -h'
alias hg='history|grep'
alias mnt='mount | grep -E ^/dev | column -t'
alias va='source ./venv/bin/activate'
alias tcn='mv --force -t ~/.local/share/Trash '
# Git
alias gw='git worktree list'
alias st='git status'
alias startgit='cd `git rev-parse --show-toplevel` && git checkout main && git pull'
alias cg='cd `git rev-parse --show-toplevel`'
alias adog='git log --all --decorate --oneline --graph'
# Software
alias v='nvim'
alias y='yazi'
alias lg='lazygit'
alias ld='lazydocker'
# ls
alias ls='lsd -lgX --group-dirs first'
alias ll='ls -alF'
alias la='ls -A'
eval "$(zoxide init bash)"
# -------------------------------


# Enable fzf and z / zi ---------
eval "$(zoxide init bash)"
eval "$(fzf --bash)"

# Tmux session start
alias tmux-new='~/.config/scripts/create_tmux_session.sh'
alias tmux-new-conda='~/.config/scripts/create_tmux_session.sh conda-start'
alias tmux-new-poetry='~/.config/scripts/create_tmux_session.sh poetry'

# Conda
alias conda-start='eval "$(/home/dream/.miniconda3/bin/conda shell.bash hook)"'

# Yazi sub-shell ----------------
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
	    builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
