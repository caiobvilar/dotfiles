# dotfiles

my dotfiles for easy reconfiguration

## Basic Programs

* Rofi - app launcher (`$menu` in sway)
* Steam - games
* Spotify - music
* Dropbox - cloud for storing files
* Obsidian - notes and stuff
* Knotes - quick note taking
* VsCode - IDE
* Telegram - chatting
* TexStudio - LaTeX editor
* Librum - reader
* Blueman - Bluetooth manager
* KiCAD - PCB Layout and simulator
* FreeCAD - 3D Modeling and Engineering
* Blender - 3D Modeling in general
* GIMP - Image editor

Screenshots used to go through Flameshot; that's been replaced by the custom
`sway/scripts/k10_screenshot.py` script (bound via `exec_always` in `sway/config`), so Flameshot
is no longer a dependency.

Some of the list above wasn't actually installed as a tracked dnf/flatpak/snap package on this
host (Knotes, Librum, picom, Dropbox) — those are skipped by `install-apps.sh`; install them
yourself if you still want them. Spotify, KiCAD, FreeCAD, Blender, and GIMP *are* now in
**Apps & packages** below and get installed by the script.

## Apps & packages

Every non-base-system dnf/flatpak/snap package installed on this host (as of 2026-08-25), grouped
by source. Generated from `dnf5 repoquery --userinstalled`, `flatpak list`, and `snap list` —
base-OS/hardware-enablement packages (kernel, firmware, filesystem tools, NetworkManager
backends, printing stack, etc.) are left out since a fresh Fedora 44 Sway Spin install already
provides them. `install-apps.sh` installs all of it, including enabling the third-party repos.

**Fedora repos (`fedora`/`updates`)**

| Category | Packages |
|---|---|
| sway/Wayland desktop | `sway`, `swaybg`, `swayidle`, `swaylock`, `sway-config-fedora`, `sway-systemd`, `ironbar`, `alacritty`, `foot`, `SwayNotificationCenter`, `gammastep`, `gammastep-indicator`, `rofi`, `rofi-themes`, `kanshi`, `wlsunset`, `grim`, `slurp`, `wl-clipboard`, `wlr-randr`, `imv`, `nwg-wrapper`, `dunst`, `wev`, `wayland-utils`, `playerctl`, `network-manager-applet`, `blueman`, `pavucontrol`, `lm_sensors`, `gnome-disk-utility`, `papirus-icon-theme` |
| Dev toolchain | `git`, `gh`, `neovim`, `zsh`, `rust`, `rustup`, `cargo`, `gcc-c++`, `cmake`, `meson`, `doxygen`, `ccache`, `python3-pip`, `pipx`, `python3-devel`, `ruby-devel`, `htop`, `btop`, `tree` |
| Containers / virtualization | `podman`, `podman-compose`, `virt-manager`, `virt-install`, `virt-viewer`, `libvirt-daemon-kvm`, `qemu-kvm`, `vagrant`, `vagrant-libvirt` |
| Embedded / hardware dev | `stlink`, `can-utils`, `minicom`, `evtest`, `radeontop` |
| GPU compute (AMD ROCm) | `rocm-hip`, `rocm-opencl`, `rocm-runtime` |
| Security / VPN | `wireguard-tools`, `opensc`, `python3-fido2`, `fprintd-pam`, `warsaw` (banking smartcard support) |
| Media | `ffmpeg`, `mpv`, `vlc`, `obs-studio` |
| Office / documents | `libreoffice`, `calibre`, `okular`, `texstudio`, `texlive-scheme-full` |
| Creative / CAD | `gimp`, `blender`, `kicad` |
| File management | `Thunar`, `thunar-archive-plugin`, `xarchiver` |
| Browsers | `firefox`, `thunderbird` |
| Games | `steam` |
| Misc | `qbittorrent`, `mediawriter`, `snapd`, `jetbrains-mono-fonts` |

**Third-party repos** (enabled by `install-apps.sh` before installing from them)

| Repo | Packages |
|---|---|
| RPM Fusion free/nonfree | `telegram-desktop` (needs both RPM Fusion enabled for codecs/etc.) |
| VS Code (Microsoft) | `code` |
| Docker CE | `docker-ce`, `docker-ce-cli`, `docker-buildx-plugin`, `docker-compose-plugin` |
| Tailscale | `tailscale` |
| Slack (packagecloud) | `slack` |
| ProtonVPN | `proton-vpn-gtk-app`, `proton-vpn-daemon`, `proton-vpn-gnome-desktop` |
| Google Chrome | `google-chrome-stable` |
| COPR `el-file4138/zotero` | `zotero` |
| COPR `gui1ty/discord` | `Discord-installer` (also have Discord via snap — see below, somewhat redundant) |
| Zoom | downloaded rpm directly from zoom.us, not a persistent repo |

Also present but **not** wired into `install-apps.sh` (enabled, currently unused — skip unless you
actually want them): the `nordvpn` repo and the `phracek/PyCharm` COPR have no packages installed
from them on this host.

**Flatpak (flathub)**

`md.obsidian.Obsidian`, `com.stremio.Stremio`, `com.github.IsmaelMartinez.teams_for_linux`,
`org.freecad.FreeCAD`, `com.spotify.Client`

(Dropbox is deliberately *not* included — skip it even though it's available on flathub as
`com.dropbox.Client`.)

**Snap**

`discord` (yes, in addition to the COPR `Discord-installer` above — this host currently has both)

**Not covered by dnf/flatpak/snap at all** (build/fetch separately, see "Things you must edit by
hand" below): `ianny`, `phinger-cursors` (fetched from GitHub by `install-apps.sh` automatically).

## Fresh install — rebuilding this system from scratch

These steps take a freshly formatted machine to the same setup this repo describes. Written for
**Fedora 44 Sway Spin** (or Fedora Workstation + the sway desktop group) on the same AMD
CPU/GPU hardware this was built on — adjust package manager/hardware-specific bits if your
target differs.

### 1. Install packages

```sh
git clone git@github.com:caiobvilar/dotfiles.git ~/Development/dotfiles
~/Development/dotfiles/install-apps.sh
```

`install-apps.sh` enables every third-party repo this host uses (RPM Fusion, VS Code, Docker CE,
Tailscale, Slack, ProtonVPN, Google Chrome, the `zotero` and `discord` COPRs) and then installs
every dnf/flatpak/snap package/app listed in **Apps & packages** below. It's derived from
`dnf5 repoquery --userinstalled` plus `flatpak list` / `snap list` on the live host — see that
section for the full, categorized list and for what's deliberately *not* covered by the script.

`ianny` (idle/break reminder, autostarted from `sway/config`) is not packaged by Fedora — it's a
manually built/installed binary (lives at `/usr/local/bin/ianny` on this host). Build or fetch it
separately; sway's autostart line will just silently no-op if it's missing (`pkill -x ianny
2>/dev/null; ianny`).

### 2. Link configs

```sh
cd ~/Development/dotfiles

mkdir -p ~/.config
ln -sf ~/Development/dotfiles/sway/config      ~/.config/sway/config
ln -sf ~/Development/dotfiles/sway/scripts     ~/.config/sway/scripts
ln -sf ~/Development/dotfiles/sway/theme       ~/.config/sway/theme
mkdir -p ~/.config/sway/config.d
ln -sf ~/Development/dotfiles/sway/config.d/90-swayidle.conf ~/.config/sway/config.d/90-swayidle.conf
ln -sf ~/Development/dotfiles/ironbar/config.toml  ~/.config/ironbar/config.toml
ln -sf ~/Development/dotfiles/ironbar/style.css    ~/.config/ironbar/style.css

# Theme-aware configs (symlinks to night variant by default)
mkdir -p ~/.config/alacritty/themes
cp -r ~/Development/dotfiles/alacritty/themes/* ~/.config/alacritty/themes/
ln -sf ~/.config/alacritty/themes/night.toml ~/.config/alacritty/alacritty.toml
mkdir -p ~/.config/rofi/themes
cp -r ~/Development/dotfiles/rofi/themes/* ~/.config/rofi/themes/
ln -sf ~/.config/rofi/themes/night.rasi ~/.config/rofi/config.rasi
mkdir -p ~/.config/swaylock/themes
cp -r ~/Development/dotfiles/swaylock/themes/* ~/.config/swaylock/themes/
ln -sf ~/.config/swaylock/themes/night ~/.config/swaylock/config

ln -sf ~/Development/dotfiles/zsh/.zshrc           ~/.zshrc
ln -sf ~/Development/dotfiles/vim/.vimrc           ~/.vimrc

mkdir -p ~/.config/gammastep/hooks ~/.config/io.github.zefr0x.ianny
ln -sf ~/Development/dotfiles/gammastep/config.ini ~/.config/gammastep/config.ini
cp ~/Development/dotfiles/gammastep/hooks/period-switch.sh ~/.config/gammastep/hooks/period-switch.sh
chmod +x ~/.config/gammastep/hooks/period-switch.sh
ln -sf ~/Development/dotfiles/ianny/config.toml    ~/.config/io.github.zefr0x.ianny/config.toml

mkdir -p ~/.config/gtk-3.0 ~/.config/gtk-4.0
ln -sf ~/Development/dotfiles/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
ln -sf ~/Development/dotfiles/gtk-3.0/gtk.css      ~/.config/gtk-3.0/gtk.css
ln -sf ~/Development/dotfiles/gtk-4.0/settings.ini ~/.config/gtk-4.0/settings.ini
ln -sf ~/Development/dotfiles/gtk-4.0/gtk.css      ~/.config/gtk-4.0/gtk.css

mkdir -p ~/.config/environment.d
ln -sf ~/Development/dotfiles/environment.d/cursor.conf ~/.config/environment.d/cursor.conf

mkdir -p ~/.icons/default
ln -sf ~/Development/dotfiles/.icons/default/index.theme ~/.icons/default/index.theme

mkdir -p ~/.config/nvim/lua/plugins
ln -sf ~/Development/dotfiles/nvim/lua/plugins/cyberdream.lua ~/.config/nvim/lua/plugins/cyberdream.lua

mkdir -p ~/Pictures/Backgrounds
cp ~/Development/dotfiles/Pictures/Backgrounds/*.jpg ~/Pictures/Backgrounds/
```

(No install/symlink script exists for this yet — do it by hand, or write one if you're doing this
often. See `CLAUDE.md` for the full directory-by-directory rundown of what's live vs. legacy.)

### 3. Install fonts

```sh
~/Development/dotfiles/.fonts/install.sh
```

Installs every vendored Nerd Font package into `~/.local/share/fonts/dotfiles` and refreshes the
fontconfig cache — no dependency on Nerd Fonts/GitHub still hosting the same release. See
`.fonts/README.md`.

### 4. Set up zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
chsh -s "$(which zsh)"
```

Re-link `~/.zshrc` (step 2) *after* the oh-my-zsh installer runs, since it overwrites `~/.zshrc`
with its own default.

### 5. Things you must edit by hand afterward — nothing above handles these

* **`zsh/.zshrc` line ~80** — `HF_TOKEN` is committed as a placeholder (a real token was
  found live and redacted before committing, twice now — see git history). Fill in your own.
* **Monitor names** — `sway/config` and `ironbar/config.toml` hardcode `HDMI-A-1` / `DP-1`. Run
  `swaymsg -t get_outputs` on the new machine and fix names/rotation/workspace assignment if they
  differ.
* **Wallpaper path** — `sway/config` points at `~/Pictures/Backgrounds/purple_cyberpunk_4k.jpg`;
  step 2 above copies all four vendored wallpapers from `Pictures/Backgrounds/` into place, so
  this should already resolve as long as you ran that `cp`.
* **`gammastep`** — `gammastep/config.ini` is vendored and symlinked in step 2, using
  `adjustment-method=wayland` (for Sway/wlroots). Coordinates are set for Natal RN. Only touch
  if the new machine is in a different location — update `lat`/`lon` there.
* **ROCm / GPU env vars** — `zsh/.zshrc` sets `HSA_OVERRIDE_GFX_VERSION` and ROCm-related paths
  tuned for this machine's AMD GPU (RX 6600 XT). Adjust or drop these on different hardware.
* **`OLLAMA_MODEL=ministral-3-16k`** (used by the `graphify` skill, see the global
  `CLAUDE.md`) — pull it with:
  ```sh
  ollama pull ministral-3-16k
  ```
* **`swaync`** — this repo's `swaync/config.json` is not currently linked/active on the live
  host (swaync runs on its packaged defaults) — this mirrors that; don't link it unless you
  deliberately want to diverge from what's live now.

### Visual theme (day/night switching)

The desktop has two themes that switch automatically via gammastep hooks at sunrise/sunset:

- **Night** (default): cyberpunk purple palette from `purple_cyberpunk_4k.jpg`
- **Day**: solarpunk palette — warm cream backgrounds, botanical green accents, solar gold

Each app has theme variants in `themes/` subdirectories. The main config files are symlinks
to the active variant (created during "Link configs" step).

**Theme files:**

| App | Night | Day |
|---|---|---|
| Alacritty | `alacritty/themes/night.toml` | `alacritty/themes/day.toml` |
| Rofi | `rofi/themes/night.rasi` | `rofi/themes/day.rasi` |
| Swaylock | `swaylock/themes/night` | `swaylock/themes/day` |
| GTK 3/4 | Written by `sway/theme/night.sh` | Written by `sway/theme/day.sh` |

**Switching mechanism:**

- **Automatic**: `gammastep/hooks/period-switch.sh` fires on period changes (sunrise → day, sunset → night)
- **Manual**: `$mod+Shift+t` (day) / `$mod+Shift+n` (night) keybindings in sway

**Applied consistently across:**

- **Sway borders** — green accent (`#4A7C59`) during day, magenta (`#a020c0`) at night
- **Alacritty** — solarpunk or cyberpunk terminal palette (live reload via `alacritty msg`)
- **Rofi** — theme variant via symlink
- **Swaylock** — theme variant via symlink
- **GTK 3/4** — CSS rewritten by theme scripts + `Papirus` (day) / `Papirus-Dark` (night) icons
- **Wallpaper** — `solarpunk_4k.jpg` (day) / `purple_cyberpunk_4k.jpg` (night)
- **Ironbar** — restarted by theme scripts to pick up new CSS
- **Neovim** — always dark (Cyberdream.nvim), unchanged

**Note:** You need both wallpapers in `~/Pictures/Backgrounds/`:
- `purple_cyberpunk_4k.jpg` (night)
- `solarpunk_4k.jpg` (day)

### Legacy / not used on this host

`swaync/` runs on its packaged defaults — the repo's `swaync/config.json` is not linked. The
`vim/` directory holds a `.vimrc` for vim (distinct from neovim config).

## References

* [Husseinhareb's Dotfiles for i3](https://sw.kovidgoyal.net/kitty/)
* [Husseinhareb's Awesome Dotfiles](https://sw.kovidgoyal.net/kitty/)
* Firefox's addons:
    * uBlock Origin
    * Youtube AutoHD
    * BitWarden
    * Reddit Enhancement Suite
    * Simple Tab Groups