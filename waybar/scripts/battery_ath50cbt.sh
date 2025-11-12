#!/usr/bin/env bash
set -euo pipefail

DEVICE_MAC="00:0A:45:0B:9D:90"

OUTPUT="$(bluetoothctl info "$DEVICE_MAC" 2>/dev/null || true)"

PCT=""
while IFS= read -r line; do
  if [[ "$line" =~ [Bb]attery[[:space:]]Percentage: ]]; then
    # Plain percentage (decimal)
    if [[ "$line" =~ ([0-9]+)% ]]; then
      PCT="${BASH_REMATCH[1]}"
    # Hex value handling (strip 0x)
    elif [[ "$line" =~ (0x[0-9A-Fa-f]+) ]]; then
      HEX="${BASH_REMATCH[1]#0x}"
      PCT=$((16#$HEX))
    fi
  fi
done <<<"$OUTPUT"

if [[ -n "$PCT" && "$PCT" -ge 0 && "$PCT" -le 100 ]]; then
  echo "Ath-M50xBT: ${PCT}%"
  exit 0
fi

echo "Ath-M50xBT: battery data not available via bluetoothctl"
