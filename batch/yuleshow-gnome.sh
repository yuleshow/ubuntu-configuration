#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# yuleshow-gnome.sh
#
# GNOME desktop setup:
#   * core tools   : Tweaks, Extension Manager, Sushi (space-bar preview),
#                    User Themes (via gnome-shell-extensions)
#   * extensions   : Dash to Dock, Blur my Shell, Vitals, Lunar Calendar
#   * UI tweaks    : battery %, weekday in clock, night light, locate pointer
#   * power policy : performance profile when the hardware supports it
#
# Ubuntu 25.10 dropped the `gnome-shell-extension-dashtodock` /
# `gnome-shell-extension-blur-my-shell` archive packages, so extensions are
# installed from extensions.gnome.org via `gnome-extensions-cli` (`gext`).
#
# `|| true` is used on extension + gsettings calls so the script still
# completes on headless / non-GNOME sessions where those operations fail.
# ---------------------------------------------------------------------------
set -e

# --- Core GNOME packages ---------------------------------------------------
# gnome-shell-extensions ships the User Themes extension (needed by the
# MacTahoe shell theme), so no extra install step is required for it.
sudo apt update
sudo apt install -y \
    gnome-tweaks \
    gnome-shell-extension-manager \
    gnome-sushi \
    gnome-shell-extensions

# --- Install gnome-extensions-cli (gext) via pipx --------------------------
# pipx gives us an isolated venv for the CLI tool without touching system
# Python. $HOME/.local/bin must be on PATH for this shell to see `gext`.
sudo apt install -y pipx || true
pipx ensurepath >/dev/null 2>&1 || true
export PATH="$HOME/.local/bin:$PATH"
pipx install --force gnome-extensions-cli || true

# Allow extensions built for older shell versions to load (avoids "outdated"
# errors on fresh Ubuntu releases where extensions haven't caught up yet).
gsettings set org.gnome.shell disable-extension-version-validation true

# --- Install + enable extensions ------------------------------------------
# Extension UUIDs (stable identifiers used by extensions.gnome.org).
EXTENSIONS=(
    "dash-to-dock@micxgx.gmail.com"
    "blur-my-shell@aunetx"
    "Vitals@CoreCoding.com"
    "lunarcal@ailin.nemui"
)
# User Themes is already installed by the gnome-shell-extensions package;
# it just needs enabling.
USER_THEMES_UUID="user-theme@gnome-shell-extensions.gcampax.github.com"

if command -v gext >/dev/null 2>&1; then
    for uuid in "${EXTENSIONS[@]}"; do
        gext install "$uuid" || true
        gext enable  "$uuid" || true
    done
    gext enable "$USER_THEMES_UUID" || true
else
    echo "gext unavailable; install extensions manually via Extension Manager."
fi

# --- Desktop UI tweaks -----------------------------------------------------
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-show-weekday       true
gsettings set org.gnome.desktop.interface locate-pointer           true
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

# --- Power profile ---------------------------------------------------------
# Prefer performance; fall back to balanced on laptops/VMs that don't
# expose a performance profile. The trailing `|| true` keeps `set -e` happy.
powerprofilesctl set performance \
    || powerprofilesctl set balanced \
    || true
