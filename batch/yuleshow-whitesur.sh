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
# Tested on Ubuntu 24.04 (noble) + GNOME 46.

set -e

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT
cd "$WORKDIR"

# Dependencies the installers use (sassc + gtk2-engines-murrine for GTK theme,
# libglib for gsettings schemas).
sudo apt update
sudo apt install -y git sassc gtk2-engines-murrine gnome-themes-extra libglib2.0-dev-bin

# -------- GTK theme --------------------------------------------------------
git clone --depth=1 https://github.com/vinceliuice/WhiteSur-gtk-theme.git
(
    cd WhiteSur-gtk-theme
    # -l  : install Libadwaita overrides (GTK4/libadwaita apps)
    # -m  : also install into /usr/share/themes via sudo (system-wide)
    ./install.sh -l
)

# -------- Icon theme -------------------------------------------------------
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
    # Valid -t values are: whitesur | monterey | ventura | sonoma.
    ./install-wallpapers.sh
)

# -------- Apply the themes via gsettings -----------------------------------
# Guarded so the script still succeeds on headless / non-GNOME environments.
if command -v gsettings >/dev/null 2>&1; then
    gsettings set org.gnome.desktop.interface gtk-theme    "WhiteSur-Light" || true
    gsettings set org.gnome.desktop.interface icon-theme   "WhiteSur"       || true
    gsettings set org.gnome.desktop.interface cursor-theme "WhiteSur-cursors" || true
    # user-theme (shell theme) requires the User Themes GNOME Shell extension.
    gsettings set org.gnome.shell.extensions.user-theme name "WhiteSur-Light" 2>/dev/null || true
fi

echo "WhiteSur installation complete."
