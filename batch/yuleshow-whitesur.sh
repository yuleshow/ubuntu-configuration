#!/usr/bin/env bash
# WhiteSur macOS-style theme stack by vinceliuice.
# Replaces the old NoobsLab "Macbuntu" script (yuleshow-macbuntu.sh).
#
# Installs (per-user, no sudo needed for the themes themselves):
#   * WhiteSur-gtk-theme        https://github.com/vinceliuice/WhiteSur-gtk-theme
#   * WhiteSur-icon-theme       https://github.com/vinceliuice/WhiteSur-icon-theme
#   * WhiteSur-cursors          https://github.com/vinceliuice/WhiteSur-cursors
#   * WhiteSur-wallpapers       https://github.com/vinceliuice/WhiteSur-wallpapers
#
# The GTK-theme repo is cloned into ~/Applications/WhiteSur-gtk-theme so its
# tweaks.sh (Firefox / Dash-to-Dock / Flatpak / GDM) can be re-run later.
#
# MUST run after yuleshow-gnome.sh (User Themes + Dash to Dock extensions).
# Tested on Ubuntu 24.04 (noble) + GNOME 46.

set -e

REPO_DIR="$HOME/Applications/WhiteSur-gtk-theme"
WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

# Dependencies the installers use (sassc + gtk2-engines-murrine for GTK theme,
# libglib for gsettings schemas).
sudo apt update
sudo apt install -y git sassc gtk2-engines-murrine gnome-themes-extra libglib2.0-dev-bin

# -------- GTK theme (kept on disk for later tweaks.sh runs) ----------------
mkdir -p "$(dirname "$REPO_DIR")"
if [ -d "$REPO_DIR/.git" ]; then
    git -C "$REPO_DIR" pull --ff-only || true
else
    git clone --depth=1 https://github.com/vinceliuice/WhiteSur-gtk-theme.git "$REPO_DIR"
fi
(
    cd "$REPO_DIR"
    # -l  : install Libadwaita overrides (GTK4/libadwaita apps)
    ./install.sh -l
)

# -------- Icon theme -------------------------------------------------------
cd "$WORKDIR"
git clone --depth=1 https://github.com/vinceliuice/WhiteSur-icon-theme.git
(
    cd WhiteSur-icon-theme
    ./install.sh
)

# -------- Cursors ----------------------------------------------------------
git clone --depth=1 https://github.com/vinceliuice/WhiteSur-cursors.git
(
    cd WhiteSur-cursors
    ./install.sh
)

# -------- Wallpapers -------------------------------------------------------
git clone --depth=1 https://github.com/vinceliuice/WhiteSur-wallpapers.git
(
    cd WhiteSur-wallpapers
    # With no -t/-c/-s flags, install-wallpapers.sh installs every theme
    # variant (WhiteSur/Monterey/Ventura/Sonoma) in every color at 4k.
    ./install-wallpapers.sh
)

# -------- Apply the themes via gsettings -----------------------------------
# Guarded so the script still succeeds on headless / non-GNOME environments.
if command -v gsettings >/dev/null 2>&1; then
    gsettings set org.gnome.desktop.interface gtk-theme    "WhiteSur-Light"   || true
    gsettings set org.gnome.desktop.interface icon-theme   "WhiteSur"         || true
    gsettings set org.gnome.desktop.interface cursor-theme "WhiteSur-cursors" || true
    # user-theme (shell theme) requires the User Themes GNOME Shell extension.
    gsettings set org.gnome.shell.extensions.user-theme name "WhiteSur-Light" 2>/dev/null || true
fi

# -------- tweaks.sh: Firefox + Dash-to-Dock + Flatpak + GDM ----------------
# -f  Firefox Monterey theme (current profile)
# -d  Dash-to-Dock Monterey tweak (requires Dash to Dock extension)
# -F  Flatpak app theme overrides
# -g  GDM login-screen theme (needs sudo)
(
    cd "$REPO_DIR"
    ./tweaks.sh -f    || true
    ./tweaks.sh -d    || true
    ./tweaks.sh -F    || true
    sudo ./tweaks.sh -g || true
)

echo "WhiteSur installation complete. tweaks.sh lives at $REPO_DIR for re-runs."

