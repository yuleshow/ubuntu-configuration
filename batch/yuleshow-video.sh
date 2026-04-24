#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# yuleshow-video.sh
#
# Video / multimedia stack:
#   * codecs + demuxers        : gstreamer bad plugins, mpegdemux
#   * downloaders              : yt-dlp (youtube-dl successor)
#   * players                  : VLC (merged in from yuleshow-vlc.sh)
#   * transcoder               : HandBrake (GTK + CLI, arch-aware)
#   * editor                   : VidCutter (snap / flatpak)
#   * container tools          : mkvtoolnix + GUI
#   * subtitle editor          : Aegisub (apt → flatpak fallback)
#   * batch helper             : bin/yuleshow-batch_convert.sh → /usr/local/bin
#
# Arch-aware: the HandBrake PPA only ships amd64 builds, so on arm64
# (VirtualBox / Apple Silicon VMs) we jump straight to the Flathub build.
# `|| true` keeps `set -e` happy on offline / headless runs.
# ---------------------------------------------------------------------------
set -e

ARCH=$(uname -m)
echo "Detected architecture: $ARCH"

# --- Codecs, demuxers, downloader, player ---------------------------------
sudo apt update
sudo apt install -y \
    vlc \
    yt-dlp \
    mkvtoolnix \
    mkvtoolnix-gui \
    gstreamer1.0-plugins-bad-videoparsers \
    gstreamer1.0-plugins-bad

# --- HandBrake ------------------------------------------------------------
# On x86_64 prefer the upstream PPA (newer releases than Ubuntu archive),
# falling back to the Flathub build. HandBrake has NO arm64 build on
# Flathub or the PPA, so on arm64 we only try the Ubuntu archive and skip
# cleanly if it's missing.
echo "Installing HandBrake..."
if [ "$ARCH" = "x86_64" ]; then
    sudo add-apt-repository -y ppa:stebbins/handbrake-releases || true
    sudo apt update
    sudo apt install -y handbrake handbrake-cli \
        || flatpak install -y flathub fr.handbrake.ghb \
        || true
else
    sudo apt install -y handbrake handbrake-cli \
        || echo "HandBrake unavailable on $ARCH (no Flathub/PPA build); skipping."
fi

# ClipGrab is unmaintained (last release 2021, AppImage URL is now 404);
# yt-dlp above covers the same use case.
# ~/ubuntu-configuration/batch/yuleshow-clipgrab.sh

# --- Parabolic (GUI frontend for yt-dlp) ----------------------------------
flatpak install -y flathub org.nickvision.tubeconverter || true

# --- VidCutter ------------------------------------------------------------
# VidCutter PPA has no 24.04+ builds; snap/flatpak are the portable routes.
sudo snap install vidcutter \
    || flatpak install -y flathub com.ozmartians.VidCutter \
    || true

# --- Aegisub (subtitle editor, .ass/.srt) ---------------------------------
sudo apt install -y aegisub \
    || flatpak install -y flathub org.aegisub.Aegisub \
    || true

# --- Custom batch-convert helper ------------------------------------------
BATCH_CONVERT_SRC="$HOME/ubuntu-configuration/bin/yuleshow-batch_convert.sh"
if [ -f "$BATCH_CONVERT_SRC" ]; then
    echo "Installing yuleshow-batch_convert.sh to /usr/local/bin..."
    sudo cp "$BATCH_CONVERT_SRC" /usr/local/bin/
    sudo chmod +x /usr/local/bin/yuleshow-batch_convert.sh
fi
