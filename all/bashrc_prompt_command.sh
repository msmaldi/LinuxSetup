#!/bin/bash

cat << EOF >> ~/.bashrc

# Custom Prompt Command, assert you have git installed'
__prompt_command() {
    PS1=''
    PS1+='\[\033[1;97m\][\$?] '
    PS1+='\${debian_chroot:+(\$debian_chroot)}'
    if [ "`id -u`" -eq 0 ]; then
        PS1+='\[\033[1;31m\]\u@\h'
    else
        PS1+='\[\033[1;92m\]\u@\h'
    fi
    PS1+='\[\033[00m\]:'
    PS1+='\[\033[1;94m\]\w'
    PS1+='\[\033[1;93m\]\$(__git_ps1)'
    if [ "`id -u`" -eq 0 ]; then
        PS1+='\[\033[0;31m\]\n\$ '
    else
        PS1+='\[\033[00m\]\n\$ '
    fi
    PS1+='\[\033[00m\]'
}
export PROMPT_COMMAND="__prompt_command; \${PROMPT_COMMAND}"
EOF