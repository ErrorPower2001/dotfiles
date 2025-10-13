OriginalPS0=$PS0
OriginalPS1=$PS1
OriginalPS2=$PS2
OriginalPS3=$PS3


unset PS0
PS0=""
PS0+="\e[7m"
PS0+="==== Output ===="
PS0+="\e[0m"
PS0+="\n"


FUNC_PROMPT() {
	# Fill "=" a line
	#... >>>printf -v fill_line_prompt \
	#... >>>	'=%.0s' $(seq 1 $COLUMNS)
	printf '=%.0s' $(seq 1 $COLUMNS)

	# Append history every command
	history -a; history -c; history -r
}
PROMPT_COMMAND=FUNC_PROMPT

unset PS1
PS1=""

#... >>>PS1+='${fill_line_prompt}'
#... >>>PS1+="\n"

PS1+="\e[32m[Host]\e[0m\H"
PS1+=" "
PS1+="\e[32m[User]\e[0m\u"
PS1+=" "
PS1+="\e[32m[Path]\e[0m\w"

PS1+="\n\$"
PS1+=" "
