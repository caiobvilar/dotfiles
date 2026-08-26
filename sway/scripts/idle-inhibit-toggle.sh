#!/usr/bin/env bash
# Toggle the idle-inhibit flag file consulted by idle-guarded-lock.sh /
# idle-guarded-dpms.sh. Click target for the swaybar idle_inhibitor block.
FLAG="$HOME/.local/state/sway-status/idle-inhibited"
mkdir -p "$(dirname "$FLAG")"
if [[ -e "$FLAG" ]]; then
    rm -f "$FLAG"
else
    touch "$FLAG"
fi
