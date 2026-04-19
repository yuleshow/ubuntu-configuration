#!/usr/bin/env bash
# MacTahoe macOS-style theme stack by vinceliuice.
# Replaces the old WhiteSur script.
#
# Installs (per-user, no sudo needed for the themes themselves):
#   * MacTahoe-gtk-theme        https://github.com/vinceliuice/MacTahoe-gtk-theme
#   * MacTahoe-icon-theme       https://github.com/vinceliuice/MacTahoe-icon-theme
#   * MacTahoe cursors          (bundled inside MacTahoe-icon-theme/cursors)
#   * MacTahoe wallpapers       (bundled inside MacTahoe-gtk-theme/wallpaper)
#
# The GTK-theme repo is cloned into ~/Applications/MacTahoe-gtk-theme so its
# tweaks.sh (Firefox / Flatpak / GDM) can be re-run later.
#
# MUST run after yuleshow-gnome.sh (User Themes + Dash to Dock extensions).
# Tested on Ubuntu 24.04 (noble) + GNOME 46.

set -e

GTK_REPO_DIR="$HOME/Applications/MacTahoe-gtk-theme"
WALLPAPER_DIR="$HOME/Pictures/Wallpapers/MacTahoe"
WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

# Dependencies the installers use (sassc + gtk2-engines-murrine for GTK theme,
# libglib for gsettings schemas).
sudo apt update
sudo apt install -y git sassc gtk2-engines-murrine gnome-themes-extra libglib2.0-dev-bin

# -------- GTK theme (kept on disk for later tweaks.sh runs) ----------------
mkdir -p "$(dirname "$GTK_REPO_DIR")"
if [ -d "$GTK_REPO_DIR/.git" ]; then
    git -C "$GTK_REPO_DIR" pull --ff-only || true
else
    git clone --depth=1 https://github.com/vinceliuice/MacTahoe-gtk-theme.git "$GTK_REPO_DIR"
fi
(
    cd "$GTK_REPO_DIR"
    # -l  : install Libadwaita overrides (GTK4/libadwaita apps)
    ./install.sh -l
)

# -------- Icon theme (also ships the MacTahoe cursors) --------------------
cd "$WORKDIR"
git clone --depth=1 https://github.com/vinceliuice/MacTahoe-icon-theme.git
(
    cd MacTahoe-icon-theme
    ./install.sh
    # Cursor theme lives in the cursors/ subfolder of the icon-theme repo.
    if [ -x cursors/install.sh ]; then
        (cd cursors && ./install.sh) || true
    fi
)

# -------- Wallpapers (bundled in the gtk-theme repo) -----------------------
# MacTahoe-gtk-theme has no install-wallpapers.sh; just copy the images
# into ~/Pictures/Wallpapers/MacTahoe so they show up in GNOME's picker.
if [ -d "$GTK_REPO_DIR/wallpaper" ]; then
    mkdir -p "$WALLPAPER_DIR"
    cp -rn "$GTK_REPO_DIR/wallpaper/." "$WALLPAPER_DIR/" || true
fi

# -------- Apply the themes via gsettings -----------------------------------
# Guarded so the script still succeeds on headless / non-GNOME environments.
if command -v gsettings >/dev/null 2>&1; then
    gsettings set org.gnome.desktop.interface gtk-theme    "MacTahoe"          || true
    gsettings set org.gnome.desktop.interface icon-theme   "MacTahoe"          || true
    gsettings set org.gnome.desktop.interface cursor-theme "MacTahoe-cursors"  || true
    # user-theme (shell theme) requires the User Themes GNOME Shell extension.
    gsettings set org.gnome.shell.extensions.user-theme name "MacTahoe" 2>/dev/null || true
fi

# -------- tweaks.sh: Firefox + Flatpak + GDM -------------------------------
# -f  Firefox theme (current profile)
# -F  Flatpak app theme overrides
# -g  GDM login-screen theme (needs sudo)
(
    cd "$GTK_REPO_DIR"
    ./tweaks.sh -f      || true
    ./tweaks.sh -F      || true
    sudo ./tweaks.sh -g || true
)

echo "MacTahoe installation complete. tweaks.sh lives at $GTK_REPO_DIR for re-runs."
