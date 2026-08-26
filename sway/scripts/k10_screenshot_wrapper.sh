#!/bin/bash
# Keep exactly one instance of k10_screenshot.py running, always.
exec 9>/tmp/k10_screenshot.lock
flock -n 9 || exit 0
while true; do
  python3 /home/hellscoffe/.config/sway/scripts/k10_screenshot.py >> /tmp/k10_screenshot.log 2>&1
  sleep 5
done
