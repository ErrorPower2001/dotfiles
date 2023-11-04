#!/bin/bash
#
# ErrorPower Configuration
#


# Color constant
#
BLACK="\[$(tput setaf 0)\]"
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
ORANGE="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
PURPLE="\[$(tput setaf 5)\]"
CYAN="\[$(tput setaf 6)\]"
WHITE="\[$(tput setaf 7)\]"
RESET="\[$(tput sgr0)\]"


# Prompt config
#
PS0="${ORANGE}==== Output ====${RESET}\n"
PS1="\n\n${GREEN}[Host]${WHITE}\h${GREEN} [User]${WHITE}\u${GREEN} [Current]${WHITE}\w${GREEN}\n\$ ${RESET}"


# Alias
#
####alias batx="awk '{print \$9}' | xargs bat"

####alias lf="f(){ ls -la '$@' | awk '{print $9}'; unset -f f; }; f"

####bls() {
####	bat "$@";
####	ls -ahl "$@";
####}

cd_ls() {
	cd "$@"
	ls -ahl .
}
alias cd='cd_ls'

lls() {
	ls -ahl "$@"
	bat "$@"
}


# Proxy configuration
#
####export use_proxy=true
####export http_proxy="http://127.0.0.1:7890"
####export https_proxy="http://127.0.0.1:7890"
####export all_proxy="socks5://127.0.0.1:7891"
