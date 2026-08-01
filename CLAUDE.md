# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal Linux dotfiles for a tiling-WM desktop setup (currently sway on Wayland, with legacy
i3/bspwm/X11 configs kept around). There is no build system, package manifest, linter, or test
suite — changes are validated by reloading the relevant WM/bar/shell, not by running a command.

## Layout

- `sway/` — the active window manager config, verified against the live Fedora Sway Spin host
  (2026-08-01).
  - `sway/config` is the live config (matches `~/.config/sway/config`); `sway/_config` is an
    older/reference copy kept for diffing against past setups. When editing sway config, edit
    `sway/config`, not `_config`. (A stale nested `sway/sway/` duplicate tree was removed
    2026-08-01 — it didn't match the live config and only caused confusion.)
  - `sway/scripts/` — helper scripts invoked from sway keybindings/autostart: lock-screen image
    generation (`create_lock_img_left.sh` / `create_lock_img_right.sh`, multi-monitor aware),
    `ryzen-power.py` (Ryzen power/fan control, feeds waybar), `k10_screenshot.py`, and
    `ntfy_listener.py` / `youtube_channel_backup.sh`.
- `waybar/` — status bar config for sway, also verified live (2026-08-01). Same `_config`
  (reference) vs `config` (live) split as sway. (Its stale nested `waybar/waybar/` duplicate was
  likewise removed.) `waybar/scripts/` holds custom module scripts (e.g. `battery_ath50cbt.sh` for
  Bluetooth headset battery, surfaced via `custom/` modules referenced in `config`).
- `polybar/polybar/` — polybar configs for the X11/i3/bspwm setup, organized as themes
  (`blocks`, `colorblocks`, `cuts`, `docky`, `forest`, `grayblocks`, `hack`, `material`, `shades`,
  `shapes`), plus shared `panels/` and `pwidgets/`. `launch.sh` starts polybar.
- `i3/`, `bspwm/`, `sxhkd/`, `polybar/`, `swaync/` — X11/legacy configs with no corresponding
  `~/.config` entry on the current host (confirmed 2026-08-01, Fedora 44 Sway Spin) — kept as
  reference/history only, not actively synced.
- `alacritty/`, `vim/`, `zsh/` — terminal emulator, vim, and shell config, verified live
  (2026-08-01). `zsh/.zshrc` is the main shell entrypoint (real secrets are redacted to
  placeholders before committing — see Conventions below); `zsh/.zsh_functions/` holds a vendored
  completion script (`_alacritty`), not something sourced live from `~/.zshrc`.
- `.fonts/` — vendored Nerd Font packages (large binaries, not meant to be hand-edited), kept
  in-repo rather than fetched from upstream on each install. Run `.fonts/install.sh` on a fresh
  machine to copy them into `~/.local/share/fonts/dotfiles` and refresh the fontconfig cache; see
  `.fonts/README.md` for per-package upstream links/licenses. Currently vendors
  `NerdFonts-JetBrainsMono` (the font actually installed on this host, in `~/.local/share/fonts`),
  plus `NerdFonts-0xProto` and `NerdFonts-SymbolsOnly` (carried over from an earlier host — not
  currently installed live, kept for reference/future use).
- `random_scripts/` — standalone utilities unrelated to WM config (`backup_vps.sh`,
  `download_mdp_full_issues.py`).
- `Notes/` — a personal Obsidian/Joplin notes vault (career, PhD, personal, knowledge-base notes).
  Unrelated to the dotfiles proper; treat as user content, not code to refactor.

## Conventions to follow when editing

- No install/symlink script exists yet (see README TODO) — files are manually placed into
  `~/.config/...` or `~`. Don't assume a stow/symlink manager is in use.
- `sway/` and `waybar/` each carry both a `_config` (older/reference) and a `config` (current,
  live-verified) file. Before editing, diff against `~/.config/<app>/config` to confirm which is
  actually live rather than assuming — this repo has previously drifted from the real host config.
- Scripts referenced from WM keybindings/bar modules use absolute paths like
  `/home/hellscoffe/.config/sway/scripts/...` — keep new scripts consistent with that path
  convention if they're meant to be invoked the same way.
- Multi-monitor setups (`HDMI-A-1`, `DP-1`) are hardcoded in places (sway config, lock-screen
  scripts) — check both outputs when touching monitor-related config.
- `zsh/.zshrc` has held real, plaintext secrets before (a Hugging Face token was found live and
  redacted to a placeholder on 2026-08-01; an earlier commit — "fixed exposed token" — suggests
  this has happened more than once). Never copy the live `~/.zshrc` into this repo verbatim —
  diff it first and redact any token/API key to a placeholder before committing.
