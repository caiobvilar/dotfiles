#!/usr/bin/env bash
# Reinstalls every app/package this host has beyond a stock Fedora 44 Sway Spin
# install: third-party repos, dnf packages, flatpaks, and snaps. Meant to run
# once on a freshly formatted machine, after the base OS install.
#
# Idempotent-ish: re-running is safe (dnf/flatpak/snap all no-op on already
# installed packages), but repo-add steps assume they haven't been added yet.
set -euo pipefail

if ! command -v dnf5 >/dev/null 2>&1; then
    echo "dnf5 not found — this script targets Fedora 44+. Aborting." >&2
    exit 1
fi

sudo() { command sudo "$@"; }

echo "==> Enabling third-party repos"

# RPM Fusion (free + nonfree)
sudo dnf5 install -y \
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

# fedora-workstation-repositories gives us the cisco-openh264 toggle
sudo dnf5 install -y fedora-workstation-repositories
sudo dnf5 config-manager setopt fedora-cisco-openh264.enabled=1

# VS Code (Microsoft)
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf5 config-manager addrepo --id=code --set=name="Visual Studio Code" \
    --set=baseurl=https://packages.microsoft.com/yumrepos/vscode \
    --set=gpgkey=https://packages.microsoft.com/keys/microsoft.asc --set=gpgcheck=1

# Docker CE
sudo dnf5 config-manager addrepo --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo

# Tailscale
sudo dnf5 config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo

# Slack (packagecloud)
sudo dnf5 config-manager addrepo --id=slack --set=name=Slack \
    --set=baseurl=https://packagecloud.io/slacktechnologies/slack/fedora/21/x86_64 \
    --set=gpgkey=https://packagecloud.io/slacktechnologies/slack/gpgkey --set=gpgcheck=1

# ProtonVPN
sudo dnf5 install -y "https://repo.protonvpn.com/fedora-$(rpm -E %fedora)-stable/protonvpn-stable-release-1.0.4-1.noarch.rpm"

# Google Chrome
sudo dnf5 config-manager addrepo --id=google-chrome --set=name="Google Chrome" \
    --set=baseurl=https://dl.google.com/linux/chrome/rpm/stable/x86_64 \
    --set=gpgkey=https://dl.google.com/linux/linux_signing_key.pub --set=gpgcheck=1

# COPRs
sudo dnf5 copr enable -y el-file4138/zotero
sudo dnf5 copr enable -y gui1ty/discord

echo "==> Installing dnf packages"

sudo dnf5 install -y \
    `# sway/Wayland desktop` \
    sway swaybg swayidle swaylock sway-config-fedora sway-systemd \
    ironbar alacritty foot SwayNotificationCenter gammastep gammastep-indicator \
    rofi rofi-themes kanshi wlsunset grim slurp wl-clipboard wlr-randr imv \
    nwg-wrapper dunst wev wayland-utils playerctl \
    network-manager-applet blueman pavucontrol lm_sensors gnome-disk-utility \
    papirus-icon-theme \
    `# dev toolchain` \
    git git-core gh neovim zsh rust rustup cargo gcc-c++ cmake meson doxygen ccache \
    python3-pip pipx python3-devel ruby-devel htop btop tree \
    `# containers / virtualization` \
    podman podman-compose docker-ce docker-ce-cli docker-buildx-plugin docker-compose-plugin \
    virt-manager virt-install virt-viewer libvirt-daemon-kvm libvirt-daemon-config-network \
    qemu-kvm vagrant vagrant-libvirt \
    `# embedded / hardware dev` \
    stlink can-utils minicom evtest radeontop \
    `# GPU compute` \
    rocm-hip rocm-opencl rocm-runtime \
    `# security / VPN` \
    wireguard-tools tailscale opensc python3-fido2 fprintd-pam \
    proton-vpn-gtk-app proton-vpn-daemon proton-vpn-gnome-desktop warsaw \
    `# media` \
    ffmpeg mpv vlc obs-studio \
    `# office / documents` \
    libreoffice calibre okular texstudio texlive-scheme-full \
    `# creative / CAD` \
    gimp blender kicad \
    `# file management` \
    Thunar thunar-archive-plugin xarchiver \
    `# browsers / chat / misc desktop apps` \
    firefox thunderbird google-chrome-stable code slack telegram-desktop \
    zotero Discord-installer \
    `# games` \
    steam \
    `# misc utilities` \
    qbittorrent mediawriter snapd \
    jetbrains-mono-fonts

echo "==> Enabling services for what was just installed (docker-ce, libvirt need their daemons up)"
sudo systemctl enable --now docker
sudo systemctl enable --now libvirtd

echo "==> Zoom (downloaded rpm, not a persistent repo on this host)"
sudo dnf5 install -y https://zoom.us/client/latest/zoom_x86_64.rpm || \
    echo "    Zoom install failed/skipped — check https://zoom.us/download for the current rpm URL."

echo "==> Flatpak (flathub) apps"
sudo dnf5 install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub md.obsidian.Obsidian com.stremio.Stremio \
    com.github.IsmaelMartinez.teams_for_linux org.freecad.FreeCAD com.spotify.Client

echo "==> Snap apps (snapd itself was installed as part of the main dnf block above)"
sudo systemctl enable --now snapd.socket
sudo ln -sf /var/lib/snapd/snap /snap 2>/dev/null || true
sudo snap install discord

echo "==> Installing phinger cursors (not in Fedora repos — fetched from GitHub)"
PHINGER_VER="v2.1"
curl -sL "https://github.com/phisch/phinger-cursors/releases/download/${PHINGER_VER}/phinger-cursors-variants.tar.bz2" \
    -o /tmp/phinger-cursors.tar.bz2
mkdir -p /tmp/phinger-extract
tar xjf /tmp/phinger-cursors.tar.bz2 -C /tmp/phinger-extract 2>/dev/null || true
mkdir -p ~/.local/share/icons
cp -r /tmp/phinger-extract/phinger-cursors-dark ~/.local/share/icons/
cp -r /tmp/phinger-extract/phinger-cursors-dark-left ~/.local/share/icons/
rm -rf /tmp/phinger-cursors.tar.bz2 /tmp/phinger-extract
echo "    phinger-cursors-dark installed to ~/.local/share/icons/"

cat <<'EOF'

==> Done.

Not handled by this script (see README.md "Fresh install" section for details):
  - Config symlinking (see README "Link configs" step — must be done manually)
  - Cursor/GTK theme activation (environment.d/cursor.conf + ~/.icons/default/index.theme
    are symlinked in the "Link configs" step; reboot or re-login to apply)
  - ianny (manually built binary, not packaged)
  - the qwen3-8b-noreason-16k Ollama model (must be rebuilt locally, see README)
  - Dropbox (available on flathub as com.dropbox.Client if you want it; deliberately
    left out of this script)
EOF
