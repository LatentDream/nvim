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
# Tmux
alias t='tmux'
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
alias cs='eval "$(/home/dream/.miniconda3/bin/conda shell.bash hook)"'


# Yazi sub-shell ----------------
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
	    builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}


# Default stuff -----------------
export EDITOR="/usr/bin/vim" 


# User tools directory ----------
export PATH="$HOME/tools/:$PATH"

# Ctrl + f to find a folder + start session -------
fzf_tmux_dirs() {
    local selected_dir=$(find ~/repo ~/tmp ~/Documents/repo ~/repo/tmp -maxdepth 1 -type d 2>/dev/null | fzf)
    if [[ -n "$selected_dir" ]]; then
        local session_name=$(basename "$selected_dir" | tr . _)
        
        if [[ -z "$TMUX" ]]; then
            # Create new session with editor window
            tmux new-session -s "$session_name" -c "$selected_dir" -n Editor "nvim; $SHELL" \; \
                new-window -n Terminal \; \
                select-window -t Editor
        else
            # If session doesn't exist, create it
            if ! tmux has-session -t "$session_name" 2>/dev/null; then
                tmux new-session -d -s "$session_name" -c "$selected_dir" -n Editor "nvim; $SHELL" \; \
                    new-window -n Terminal \; \
                    select-window -t Editor
            fi
            tmux switch-client -t "$session_name"
        fi
    fi
}

bind -x '"\C-f":"fzf_tmux_dirs"'

# # Start SSH agent function
# start_agent() {
#     echo "Initializing new SSH agent..."
#     ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#     chmod 600 "${SSH_ENV}"
#     . "${SSH_ENV}" > /dev/null
#     ssh-add ~/.ssh/github
# }
#
# # Set environment file location
# SSH_ENV="$HOME/.ssh/agent-environment"
#
# # Source SSH settings if they exist
# if [ -f "${SSH_ENV}" ]; then
#     . "${SSH_ENV}" > /dev/null
#     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#         start_agent;
#     }
# else
#     start_agent;
# fi
