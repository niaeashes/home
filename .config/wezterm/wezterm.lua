local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.use_ime = true
config.window_background_opacity = 0.85
config.window_background_gradient = {
  orientation = 'Vertical',
  colors = {
    '#222222',
    '#000000',
    '#000000',
  },
  noise = 128,
}
config.macos_window_background_blur = 30
config.window_decorations = "RESIZE"

config.window_frame = {
  active_titlebar_bg = "none",
  inactive_titlebar_bg = "none",
}

config.show_new_tab_button_in_tab_bar = false

config.colors = {
  tab_bar = {
    inactive_tab_edge = "none",
  },
}

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local bright_color = '#FFAC1C'
    local dim_color = 'none'
    local text_in_bright_color = '#111111'
    local text_in_dim_color = '#808080'

    local tab_background = dim_color
    local tab_foreground = text_in_dim_color

    if tab.is_active then
      tab_background = bright_color
      tab_foreground = text_in_bright_color
    elseif hover then
      tab_background = bright_color
      tab_foreground = text_in_bright_color
    end

    local edge_foreground = '#FFAC1C'

    local title = tab_title(tab)

    return {
      { Background = { Color = dim_color } },
      { Foreground = { Color = tab_background } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = tab_background } },
      { Foreground = { Color = tab_foreground } },
      { Text = title },
      { Background = { Color = dim_color } },
      { Foreground = { Color = tab_background } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)

return config
