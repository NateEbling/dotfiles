#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"

EDITOR=vim

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u\[\033[01;38m\]@\h:\w\[\033[00m\]\$ '

export ZIG_INSTALL=$(find ~ -maxdepth 1 -type d -name 'zig-x86_64-linux-*' | sort | tail -n 1)

if [ -d "$ZIG_INSTALL" ]; then
    export PATH="$ZIG_INSTALL:$PATH"
fi

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/arch_sign
