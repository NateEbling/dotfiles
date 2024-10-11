# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi

if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# cd to possibly nonexisting dir
ccd() { mkdir -p "$@" && cd "$@"; }

export ZIG_INSTALL=$(find ~ -maxdepth 1 -type d -name 'zig-linux-x86_64-*' | sort | tail -n 1)

if [ -d "$ZIG_INSTALL" ]; then
    export PATH="$ZIG_INSTALL:$PATH"
fi

. "$HOME/.cargo/env"
