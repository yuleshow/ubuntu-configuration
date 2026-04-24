#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# yuleshow-flatpak.sh
#
# Flatpak runtime setup:
#   * flatpak engine           (from Ubuntu archive; new enough on 25.10+)
#   * gnome-software integration so Flathub apps show up in Software
#   * Flathub remote added system-wide
#   * basic Mesa GL driver to avoid blank-icon / render glitches in VMs
#
# `|| true` / `2>/dev/null` guards keep the script useful on non-GNOME
# sessions and headless installs.
# ---------------------------------------------------------------------------
set -e

echo "Installing Flatpak engine and GNOME Software integration..."
sudo apt update
sudo apt install -y \
    flatpak \
    gnome-software-plugin-flatpak \
    libgl1-mesa-dri

# Add Flathub as a system-wide remote. --if-not-exists makes re-runs safe.
echo "Registering Flathub remote..."
sudo flatpak remote-add --if-not-exists flathub \
    https://flathub.org/repo/flathub.flatpakrepo

# Reload gnome-software so the Flatpak plugin picks up the new remote.
killall gnome-software 2>/dev/null || true

echo "Flatpak ready. Log out and back in so new app icons appear on the dock."
