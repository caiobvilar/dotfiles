#!/bin/sh
# Solarpunk day theme — warm cream + botanical greens + solar gold
# Called by gammastep hook or manually via $mod+Shift+t

# Sway borders — botanical green
swaymsg client.focused          '#4A7C59' '#4A7C59' '#2D3A2E' '#52B788'
swaymsg client.focused_inactive '#EDE8DD' '#EDE8DD' '#6B7A65' '#C8C2B5'
swaymsg client.unfocused        '#C8C2B5' '#C8C2B5' '#6B7A65' '#EDE8DD'
swaymsg client.urgent           '#C07060' '#C07060' '#FAF6EE' '#C07060'
swaymsg client.placeholder      '#FAF6EE' '#FAF6EE' '#2D3A2E'

# Alacritty — auto-reloads when symlink target changes
ln -sfn ~/.config/alacritty/themes/day.toml ~/.config/alacritty/alacritty.toml

# Rofi — write config (app reads at launch)
ln -sfn ~/.config/rofi/themes/day.rasi ~/.config/rofi/config.rasi

# Swaylock — write config (app reads at lock time)
ln -sfn ~/.config/swaylock/themes/day ~/.config/swaylock/config

# GTK 3 — write CSS + signal
cat > ~/.config/gtk-3.0/gtk.css << 'CSSEOF'
@define-color accent_color #4A7C59;
@define-color accent_bg_color #52B788;
@define-color accent_fg_color #FAF6EE;
@define-color window_bg_color #FAF6EE;
@define-color window_fg_color #2D3A2E;
@define-color headerbar_bg_color #EDE8DD;
@define-color headerbar_fg_color #2D3A2E;
@define-color card_bg_color #E5DFD3;
@define-color card_fg_color #2D3A2E;
@define-color dialog_bg_color #EDE8DD;
@define-color dialog_fg_color #2D3A2E;
@define-color popover_bg_color #EDE8DD;
@define-color popover_fg_color #2D3A2E;
@define-color shade_color rgba(0, 0, 0, 0.08);
@define-color scrollbar_outline_color rgba(0, 0, 0, 0.15);
@define-color sidebar_bg_color #EDE8DD;
@define-color sidebar_fg_color #2D3A2E;
@define-color sidebar_shade_color rgba(0, 0, 0, 0.08);
CSSEOF

# GTK 4 — write CSS + signal
cat > ~/.config/gtk-4.0/gtk.css << 'CSSEOF'
@define-color accent_color #4A7C59;
@define-color accent_bg_color #52B788;
@define-color accent_fg_color #FAF6EE;
@define-color window_bg_color #FAF6EE;
@define-color window_fg_color #2D3A2E;
@define-color headerbar_bg_color #EDE8DD;
@define-color headerbar_fg_color #2D3A2E;
@define-color card_bg_color #E5DFD3;
@define-color card_fg_color #2D3A2E;
@define-color dialog_bg_color #EDE8DD;
@define-color dialog_fg_color #2D3A2E;
@define-color popover_bg_color #EDE8DD;
@define-color popover_fg_color #2D3A2E;
CSSEOF

# GTK settings — Papirus light + Adwaita
cat > ~/.config/gtk-3.0/settings.ini << 'INIEOF'
[Settings]
gtk-theme-name=Adwaita
gtk-icon-theme-name=Papirus
gtk-cursor-theme-name=phinger-cursors-dark
gtk-cursor-theme-size=24
gtk-font-name=Cantarell 11
gtk-application-prefer-dark-theme=0
INIEOF

cat > ~/.config/gtk-4.0/settings.ini << 'INIEOF'
[Settings]
gtk-theme-name=Adwaita
gtk-icon-theme-name=Papirus
gtk-cursor-theme-name=phinger-cursors-dark
gtk-cursor-theme-size=24
gtk-font-name=Cantarell 11
gtk-application-prefer-dark-theme=0
INIEOF

# Wallpaper — solarpunk
swaymsg output HDMI-A-1 bg /home/hellscoffe/Pictures/Backgrounds/solarpunk_4k.jpg fill
swaymsg output DP-1 bg /home/hellscoffe/Pictures/Backgrounds/solarpunk_4k.jpg fill transform 270

# Ironbar — restart with new CSS
killall -9 ironbar 2>/dev/null
sleep 0.5
ironbar &
