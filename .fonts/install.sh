#!/usr/bin/env bash
# Installs every font vendored in this directory into the current user's
# font path, so a fresh Linux install doesn't depend on Nerd Fonts/GitHub/etc
# being reachable or still hosting the same release.
set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST_DIR="${XDG_DATA_HOME:-$HOME/.local/share/fonts}/dotfiles"

mkdir -p "$DEST_DIR"

shopt -s globstar nullglob
for font in "$SRC_DIR"/**/*.ttf "$SRC_DIR"/**/*.otf; do
    cp -uv "$font" "$DEST_DIR/"
done

if command -v fc-cache >/dev/null 2>&1; then
    fc-cache -f "$DEST_DIR"
else
    echo "fc-cache not found — install fontconfig and re-run to refresh the font cache." >&2
fi
