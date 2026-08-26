# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal Linux dotfiles for a tiling-WM desktop setup (sway on Wayland). There is no build
system, package manifest, linter, or test suite — changes are validated by reloading the
relevant WM/bar/shell, not by running a command. The desktop uses a unified cyberpunk purple
palette extracted from the wallpaper.

## Layout

- `sway/` — the active window manager config, verified against the live Fedora Sway Spin host.
  - `sway/config` is the live config (matches `~/.config/sway/config`).
  - `sway/config.d/90-swayidle.conf` — overrides the Fedora-packaged swayidle defaults.
  - `sway/scripts/` — helper scripts invoked from sway keybindings/autostart: lock-screen image
    generation (`create_lock_img_left.sh` / `create_lock_img_right.sh`, multi-monitor aware),
    `k10_screenshot_wrapper.sh`, `idle-guarded-dpms.sh`, `idle-guarded-lock.sh`,
    `idle-inhibit-toggle.sh`, `ryzen-power.py`, `ntfy_listener.py`, `youtube_channel_backup.sh`.
- `ironbar/` — status bar config for sway (replaced waybar as of 2026-08-25).
  - `ironbar/config.toml` — module layout (workspaces, clock, volume, sys_info, tray, power menu)
    for both monitors (HDMI-A-1 bottom, DP-1 top + bottom sensor strip).
  - `ironbar/style.css` — cyberpunk purple CSS with palette extracted from the wallpaper.
- `rofi/` — app launcher theme (`config.rasi`) with cyberpunk purple styling.
- `swaylock/` — screen locker config with purple accent colors.
- `gtk-3.0/`, `gtk-4.0/` — GTK settings (Adwaita-dark + Papirus-Dark icons + phinger cursor)
  and CSS accent overrides (purple `#a020c0`).
- `environment.d/cursor.conf` — sets `XCURSOR_THEME=phinger-cursors-dark` and `XCURSOR_SIZE=24`
  for the next login session.
- `.icons/default/index.theme` — sets the default cursor theme to phinger-cursors-dark.
- `nvim/lua/plugins/cyberdream.lua` — Cyberdream.nvim colorscheme for neovim (LazyVim).
- `gammastep/config.ini` — color temperature adjustment (wayland method, coordinates for Natal RN).
- `alacritty/` — terminal emulator config with cyberpunk color palette.
- `Pictures/Backgrounds/` — wallpaper files referenced by `sway/config`. Copy into
  `~/Pictures/Backgrounds/`, don't symlink (data directory, not config).
- `swaync/` — SwayNotificationCenter config (runs on packaged defaults, not linked).
- `.fonts/` — vendored Nerd Font packages. Run `.fonts/install.sh` on a fresh machine.
- `zsh/`, `vim/` — shell and vim config. `zsh/.zshrc` has secrets redacted before committing.
- `install-apps.sh` — reinstalls every dnf/flatpak/snap app + enables third-party repos.
  Also installs phinger-cursors from GitHub (not in Fedora repos).
- `random_scripts/` — standalone utilities unrelated to WM config.
- `Notes/` — personal Obsidian/Joplin notes vault. User content, not code to refactor.

## Conventions to follow when editing

- Config-linking is manual (no symlink manager). `install-apps.sh` only handles packages.
- Scripts referenced from WM keybindings use absolute paths like
  `/home/hellscoffe/.config/sway/scripts/...` — keep new scripts consistent.
- Multi-monitor setups (`HDMI-A-1`, `DP-1`) are hardcoded in sway config, ironbar config,
  and lock-screen scripts — check both outputs when touching monitor-related config.
- `zsh/.zshrc` has held real, plaintext secrets before. Never copy it verbatim — diff and
  redact any token/API key before committing.
- The cyberpunk purple palette is defined in `sway/config` (border colors), `ironbar/style.css`,
  `alacritty/alacritty.toml`, `gtk-3.0/gtk.css`, `gtk-4.0/gtk.css`, `rofi/config.rasi`, and
  `swaylock/config`. When changing colors, keep them consistent across all files.
