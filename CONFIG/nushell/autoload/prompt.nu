# vim:shiftwidth=8:noexpandtab:foldmethod=marker:

let __ORIGINAL__PROMPT_COMMAND:            closure = $env.PROMPT_COMMAND
let __ORIGINAL__PROMPT_COMMAND_RIGHT:      closure = $env.PROMPT_COMMAND_RIGHT

let __ORIGINAL__PROMPT_INDICATOR:           string = $env.PROMPT_INDICATOR
let __ORIGINAL__PROMPT_INDICATOR_VI_INSERT: string = $env.PROMPT_INDICATOR_VI_INSERT
let __ORIGINAL__PROMPT_INDICATOR_VI_NORMAL: string = $env.PROMPT_INDICATOR_VI_NORMAL
let __ORIGINAL__PROMPT_MULTILINE_INDICATOR: string = $env.PROMPT_MULTILINE_INDICATOR

$env.PROMPT_COMMAND = { ||
	def powerline [--background-color: int, --content: string] {
		let separator_character = "\u{e0b0}"
		let color = ($background_color - 10)
		$"\e[7;($color)m($separator_character) ($content) \e[0;($color)m($separator_character)\e[0m"
	}

	[
		(powerline --background-color 42 --content "Nushell")
		(powerline --background-color 44 --content $"\e[(37 + 10)m(whoami)@((sys host).hostname)")

		"\e[7;90m\u{e0b0}\e[0m"
		"\e[100m "
		$"(do $__ORIGINAL__PROMPT_COMMAND)"
		"\e[100m "
		"\e[0;90m\u{e0b0}\e[0m"

		"\n"
	] | str join
}

# $env.PROMPT_COMMAND_RIGHT = { ||
# 	# let c = (do $__ORIGINAL__PROMPT_COMMAND_RIGHT)
# 	# let len = $c | ansi strip | str length
# 	# print --no-newline $"\e[F\e[999C\e[($len - 7)D($c)"
# 	[
# 		$"(do $__ORIGINAL__PROMPT_COMMAND_RIGHT)"
# 	] | str join
# }

# $env.config.edit_mode = "vi"
$env.PROMPT_INDICATOR_VI_INSERT = "(vi:ins)> "
$env.PROMPT_INDICATOR_VI_NORMAL = "(vi:cmd)> "
