#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


# Source ep.bashrc
[[ -f ~/epcommon.bashrc ]] && . ~/epcommon.bashrc

# Menu complete
bind '"\t":menu-complete'
bind '"\e[Z":menu-complete-backward'
