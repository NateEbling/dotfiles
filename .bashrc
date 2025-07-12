#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=50000
HISTFILESIZE=10000000

EDITOR=vim

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export ZIG_INSTALL=$(find ~ -maxdepth 1 -type d -name 'zig-x86_64-linux-*' | sort | tail -n 1)

if [ -d "$ZIG_INSTALL" ]; then
    export PATH="$ZIG_INSTALL:$PATH"
fi
