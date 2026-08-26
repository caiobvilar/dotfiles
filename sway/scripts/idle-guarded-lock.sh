#!/usr/bin/env bash
# swayidle "timeout" wrapper: no-op while the idle-inhibit flag is set
# (toggled by the swaybar idle_inhibitor block), else runs the normal lock.
FLAG="$HOME/.local/state/sway-status/idle-inhibited"
[[ -e "$FLAG" ]] && exit 0
/home/hellscoffe/create_lock_img.sh
swaylock -e -f -i /tmp/lockscreen.png
