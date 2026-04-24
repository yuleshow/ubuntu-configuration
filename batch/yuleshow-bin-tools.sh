#!/usr/bin/env bash
# yuleshow-bin-tools.sh
# ---------------------------------------------------------------------------
# Install native OS packages (CLI tools + shared libraries) required by the
# scripts under ~/ubuntu-configuration/bin/yuleshow-*.
#
# Python interpreter + libraries are handled by yuleshow-python.sh, which
# provisions a dedicated venv at ~/.local/share/yuleshow-venv and rewrites
# the launcher shebangs in ~/.local/bin accordingly. This script only cares
# about the non-Python side (exiftool, poppler, libheif, imagemagick, etc).
#
# Cross-platform: works on Ubuntu/Mint (apt) and macOS (Homebrew).
# One-click:      no interactive prompts.
# ---------------------------------------------------------------------------
set -u

OS="$(uname -s)"

install_linux() {
    echo "🐧 Detected Linux (apt)."
    sudo apt-get update
    sudo apt-get install -y \
        libimage-exiftool-perl \
        poppler-utils \
        libheif1 libheif-examples \
        imagemagick \
        mysql-client \
        build-essential \
        libjpeg-dev zlib1g-dev libfreetype6-dev \
        libheif-dev \
        libexiv2-dev
}

install_macos() {
    echo "🍎 Detected macOS (Homebrew)."
    if ! command -v brew >/dev/null 2>&1; then
        echo "❌ Homebrew is not installed. Install it first: https://brew.sh"
        exit 1
    fi
    brew update
    brew install \
        exiftool \
        poppler \
        libheif \
        imagemagick \
        mysql-client \
        exiv2
}

case "$OS" in
Linux)  install_linux  ;;
Darwin) install_macos ;;
*)      echo "❌ Unsupported OS: $OS"; exit 1 ;;
esac

echo "✅ yuleshow-bin-tools done."
