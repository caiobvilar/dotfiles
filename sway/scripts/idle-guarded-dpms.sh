#!/usr/bin/env bash
# swayidle "timeout" wrapper: no-op while the idle-inhibit flag is set
# (toggled by the swaybar idle_inhibitor block), else turns displays off.
FLAG="$HOME/.local/state/sway-status/idle-inhibited"
[[ -e "$FLAG" ]] && exit 0
swaymsg "output * dpms off"
