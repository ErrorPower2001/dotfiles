-- 获取 Wezterm 接口
local wezterm = require('wezterm')

-- 配置组
local config = {}

-- 对于较新版本的 Wezterm，使用 config_builder 将帮助获取简洁的错误信息
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- 在这里进行配置

-- 配置主题
-- Source: https://github.com/mbadolato/iTerm2-Color-Schemes
config.color_scheme = 'Afterglow'
-- Source: https://github.com/sonph/onehalf
-- config.color_scheme = 'OneHalfDark'

-- Shell
config.default_prog = { 'pwsh', '-Login' }

-- Font
config.font = wezterm.font('Maple Mono SC NF')

-- 行列宽
config.initial_cols = 120
config.initial_rows = 30

-- Wezterm Event
-- GUI start event
-- 当 wezterm 以界面启动时调用
wezterm.on( 'gui-startup',
	function(cmd)
		-- Wezterm window position configuration
		-- 获取对象
		local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
		-- 设置窗口启动位置
		window:gui_window():set_position(20, 60)
		window:gui_window():set_position(20, 20)
		---window:gui_window():set_inner_size(1280, 720)
	end
)

-- 标题栏设置
config.window_decorations = "RESIZE"

-- 最后，应用你的配置
return config
