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
  - `sway/theme/` — day/night theme switching scripts (`day.sh` = solarpunk, `night.sh` = cyberpunk).
  - `sway/scripts/` — helper scripts invoked from sway keybindings/autostart: lock-screen image
    generation (`create_lock_img_left.sh` / `create_lock_img_right.sh`, multi-monitor aware),
    `k10_screenshot_wrapper.sh`, `idle-guarded-dpms.sh`, `idle-guarded-lock.sh`,
    `idle-inhibit-toggle.sh`, `ryzen-power.py`, `ntfy_listener.py`, `youtube_channel_backup.sh`.
- `ironbar/` — status bar config for sway (replaced waybar as of 2026-08-25).
  - `ironbar/config.toml` — module layout (workspaces, clock, volume, sys_info, tray, power menu)
    for both monitors (HDMI-A-1 bottom, DP-1 top + bottom sensor strip).
  - `ironbar/style.css` — cyberpunk purple CSS with palette extracted from the wallpaper.
- `rofi/` — app launcher theme. `themes/night.rasi` (cyberpunk) and `themes/day.rasi` (solarpunk).
  `config.rasi` is a symlink to the active variant.
- `swaylock/` — screen locker config. `themes/night` and `themes/day` variants. `config` is a symlink.
- `gtk-3.0/`, `gtk-4.0/` — GTK settings. CSS is rewritten by theme scripts (not symlinked).
  Night: Adwaita-dark + Papirus-Dark + purple accents. Day: Adwaita + Papirus + green accents.
- `environment.d/cursor.conf` — sets `XCURSOR_THEME=phinger-cursors-dark` and `XCURSOR_SIZE=24`
  for the next login session.
- `.icons/default/index.theme` — sets the default cursor theme to phinger-cursors-dark.
- `nvim/lua/plugins/cyberdream.lua` — Cyberdream.nvim colorscheme for neovim (always dark).
- `gammastep/` — color temperature config + `hooks/period-switch.sh` for automatic day/night switching.
- `alacritty/` — terminal emulator config. `themes/night.toml` (cyberpunk) and `themes/day.toml`
  (solarpunk). `alacritty.toml` is a symlink to the active variant.
- `Pictures/Backgrounds/` — wallpaper files referenced by theme scripts. Copy into
  `~/Pictures/Backgrounds/`, don't symlink (data directory, not config). Needs both
  `purple_cyberpunk_4k.jpg` (night) and `solarpunk_4k.jpg` (day).
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
- The desktop has a day/night theme system. Each app has `themes/night.*` and `themes/day.*`
  variants. The main config files (`alacritty.toml`, `config.rasi`, `swaylock/config`) are
  symlinks to the night variant by default. GTK CSS is rewritten by the theme scripts.
  Theme scripts: `sway/theme/day.sh` (solarpunk) and `sway/theme/night.sh` (cyberpunk purple).
  Gammastep hook: `gammastep/hooks/period-switch.sh` triggers on sunrise/sunset.
- Night palette: cyberpunk purple (`#a020c0` accent, `#0a0018` bg). Day palette: solarpunk
  (`#4A7C59` botanical green, `#FAF6EE` warm cream, `#D4A03C` solar gold).
- Neovim is always dark (Cyberdream.nvim) — not affected by theme switching.
