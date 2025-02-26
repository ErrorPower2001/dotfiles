#
# ErrorPower Configuration
#


#
# History sizes
#
HISTSIZE=4096
HISTFILESIZE=4096


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


#
# Prompt config
#
PS0+="${ORANGE}==== Output ====${RESET}"
PS0+="\n"

OriginalPS1=$PS1
unset PS1

execCommandWhenPrompt() {
	# Prompt = a line
	terminal_columns=$(tput cols)
	printf \
		-v prompt_fill_line \
		'=%.0s' \
		$( seq 1 $terminal_columns )
	
	# Append history every command
	history -a
}
PROMPT_COMMAND=execCommandWhenPrompt

PS1+='${prompt_fill_line}'
PS1+="\n"
PS1+="${GREEN}[Host]${RESET}\h"
PS1+=" "
PS1+="${GREEN}[User]${RESET}\u"
PS1+=" "
PS1+="${GREEN}[Current]${RESET}\w"
PS1+="\n"
PS1+="\$"
PS1+=" "


#
# Alias
#
#...alias batx="awk '{print \$9}' | xargs bat"
#...alias lf="f(){ ls -la '$@' | awk '{print $9}'; unset -f f; }; f"
cdls() {
	cd "$@"
	ls -ahl .
}
#...unset cdls
lsb() {
	ls -ahl "$@"
	bat "$@"
}
unset lsb
bls() {
	bat "$@";
	ls -ahl "$@";
}
unset bls


#
# Proxy configuration
#
#...export use_proxy=true
#...export http_proxy="http://127.0.0.1:7890"
#...export https_proxy="http://127.0.0.1:7890"
#...export all_proxy="socks5://127.0.0.1:7891"


#
# Menu complete
#
bind '"\t":menu-complete'
bind '"\e[Z":menu-complete-backward'
