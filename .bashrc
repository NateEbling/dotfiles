# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# force ignoredups and ignorespace
HISTCONTROL=ignoreboth
# these commands in conjunction make history work across terminals
shopt -s histappend
PROMPT_COMMAND="history -a"
# keep a lot of bash history
HISTSIZE=50000
HISTFILESIZE=10000000

export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

EDITOR=vim

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# cd to possibly nonexisting dir
ccd() { mkdir -p "$@" && cd "$@"; }

# enter nix-shell with dev command
dev() { nix-shell -p "$@"; }

export ZIG_INSTALL=$(find ~ -maxdepth 1 -type d -name 'zig-linux-x86_64-*' | sort | tail -n 1)

if [ -d "$ZIG_INSTALL" ]; then
    export PATH="$ZIG_INSTALL:$PATH"
fi

# add ~/bin to PATH
export PATH="~/local/bin:$PATH"
