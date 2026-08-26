#!/bin/sh
# Cyberpunk night theme — deep purple + magenta accents
# Called by gammastep hook or manually via $mod+Shift+n

# Sway borders — cyberpunk purple
swaymsg client.focused          '#a020c0' '#a020c0' '#f0e6f7' '#8020a0'
swaymsg client.focused_inactive '#200040' '#200040' '#d7bfe6' '#602080'
swaymsg client.unfocused        '#120a24' '#120a24' '#808080' '#200040'
swaymsg client.urgent           '#d040f0' '#d040f0' '#f0e6f7' '#d040f0'
swaymsg client.placeholder      '#0a0018' '#0a0018' '#f0e6f7'

# Alacritty — auto-reloads when symlink target changes
ln -sfn ~/.config/alacritty/themes/night.toml ~/.config/alacritty/alacritty.toml

# Rofi — write config (app reads at launch)
ln -sfn ~/.config/rofi/themes/night.rasi ~/.config/rofi/config.rasi

# Swaylock — write config (app reads at lock time)
ln -sfn ~/.config/swaylock/themes/night ~/.config/swaylock/config

# GTK 3 — write CSS + signal
cat > ~/.config/gtk-3.0/gtk.css << 'CSSEOF'
@define-color accent_color #a020c0;
@define-color accent_bg_color #8020a0;
@define-color accent_fg_color #f0e6f7;
@define-color window_bg_color #0a0018;
@define-color window_fg_color #f0e6f7;
@define-color headerbar_bg_color #120a24;
@define-color headerbar_fg_color #f0e6f7;
@define-color card_bg_color #200040;
@define-color card_fg_color #f0e6f7;
@define-color dialog_bg_color #120a24;
@define-color dialog_fg_color #f0e6f7;
@define-color popover_bg_color #120a24;
@define-color popover_fg_color #f0e6f7;
@define-color shade_color rgba(0, 0, 0, 0.36);
@define-color scrollbar_outline_color rgba(0, 0, 0, 0.5);
@define-color sidebar_bg_color #120a24;
@define-color sidebar_fg_color #f0e6f7;
@define-color sidebar_shade_color rgba(0, 0, 0, 0.25);
CSSEOF

# GTK 4 — write CSS + signal
cat > ~/.config/gtk-4.0/gtk.css << 'CSSEOF'
@define-color accent_color #a020c0;
@define-color accent_bg_color #8020a0;
@define-color accent_fg_color #f0e6f7;
@define-color window_bg_color #0a0018;
@define-color window_fg_color #f0e6f7;
@define-color headerbar_bg_color #120a24;
@define-color headerbar_fg_color #f0e6f7;
@define-color card_bg_color #200040;
@define-color card_fg_color #f0e6f7;
@define-color dialog_bg_color #120a24;
@define-color dialog_fg_color #f0e6f7;
@define-color popover_bg_color #120a24;
@define-color popover_fg_color #f0e6f7;
CSSEOF

# GTK settings — Papirus-Dark + Adwaita-dark
cat > ~/.config/gtk-3.0/settings.ini << 'INIEOF'
[Settings]
gtk-theme-name=Adwaita-dark
gtk-icon-theme-name=Papirus-Dark
gtk-cursor-theme-name=phinger-cursors-dark
gtk-cursor-theme-size=24
gtk-font-name=Cantarell 11
gtk-application-prefer-dark-theme=1
INIEOF

cat > ~/.config/gtk-4.0/settings.ini << 'INIEOF'
[Settings]
gtk-theme-name=Adwaita-dark
gtk-icon-theme-name=Papirus-Dark
gtk-cursor-theme-name=phinger-cursors-dark
gtk-cursor-theme-size=24
gtk-font-name=Cantarell 11
gtk-application-prefer-dark-theme=1
INIEOF

# Wallpaper — cyberpunk purple
swaymsg output HDMI-A-1 bg /home/hellscoffe/Pictures/Backgrounds/purple_cyberpunk_4k.jpg fill
swaymsg output DP-1 bg /home/hellscoffe/Pictures/Backgrounds/purple_cyberpunk_4k.jpg fill transform 270

# Ironbar — restart with new CSS
killall -9 ironbar 2>/dev/null
sleep 0.5
ironbar &
