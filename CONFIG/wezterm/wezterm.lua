-- vim:shiftwidth=8:noexpandtab:foldmethod=marker:

-- 获取 Wezterm 接口
local wezterm = require('wezterm')

wezterm.on('gui-startup',
	function(cmd)
		local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
		window:gui_window():set_position(40, 40)
	end
)

local v_padding = 8

local target = wezterm.target_triple
local default_prog

if     string.find(target, "windows") then
	default_prog = { 'pwsh', '-Login' }
elseif string.find(target, "darwin") then
	default_prog = { '/bin/zsh', '-l' }
elseif string.find(target, "linux") then
	default_prog = { '/usr/bin/bash', '-l' }
else
	default_prog = { '/bin/sh', '-l' }
end

-- 最后，应用你的配置
return {
	--[[
		Color & Appearance 
	--]]

	-- Color Scheme
	color_scheme = "Campbell (Gogh)",

	-- Tab Bar Appearance & Colors
	use_fancy_tab_bar = true,
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = false,
	--..tab_bar_at_bottom = true,
	tab_max_width = 8,
	--[[
	window_frame = {
		font_size = 12.0,
	},
	--]]

	--[[
		Fonts
	--]]
	-- font = wezterm.font("Maple Mono NF CN"),
	font = wezterm.font("IosevkaTerm Nerd Font Mono"),
	bold_brightens_ansi_colors = true,
	font_size = 12.0,


	--[[
		Launching Programs
	--]]
	default_prog = default_prog,

	--[[
		ALL
	--]]
	initial_cols = 128,
	initial_rows = 32,
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	window_padding = {
		left = v_padding,
		right = v_padding,
		top = v_padding,
		bottom = v_padding - 8,
	},
}
