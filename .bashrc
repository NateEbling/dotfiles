# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -a'

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
