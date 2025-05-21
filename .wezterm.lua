local wezterm = require 'wezterm';

return {
  colors = {
    background = "#ffffea",  
    foreground = "#000000",
    cursor_bg = "#000000",  
    cursor_fg = "#ffffea", 
    selection_bg = "#000000", 
    selection_fg = "#ffffea",
  },

  font = wezterm.font("JetBrains Mono NL"),  
  font_size = 12.0,  

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
}
