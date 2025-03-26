#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


# Source *.bashrc
for shfile in $(echo ~/.config/bash/*.bashrc);
do
	[[ -e "${shfile}" ]] && \
		echo "Source ${shfile}" && \
		source "${shfile}" ;
done
