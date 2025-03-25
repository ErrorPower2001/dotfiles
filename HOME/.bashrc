#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


# Source ep.bashrc
[[ -f ~/.config/bash/000.bashrc ]] && . ~/.config/bash/000.bashrc
