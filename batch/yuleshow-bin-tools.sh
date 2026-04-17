#!/usr/bin/env bash
# yuleshow-bin-tools.sh
# ---------------------------------------------------------------------------
# Install every OS package and Python library required by the scripts under
# ~/ubuntu-configuration/bin/yuleshow-*.
#
# Cross-platform: works on Ubuntu/Mint (apt) and macOS (Homebrew).
# One-click:      no interactive prompts.
# ---------------------------------------------------------------------------
set -u

OS="$(uname -s)"

# --- Python packages required by the yuleshow-* scripts ---------------------
# Pillow              -> all image scripts
# pillow-avif-plugin  -> yuleshow-avif2jpg  (import name: pillow_avif)
# pillow-heif         -> yuleshow-heif-jpg  (replaces macOS sips, works on Linux too)
# pdf2image           -> yuleshow-pdf2jpg   (needs poppler on the system)
# opencc              -> yuleshow-cover     (Traditional<->Simplified Chinese)
# lunarcalendar       -> yuleshow-lunar-folder-rename
# exif                -> yuleshow-rename-original
PY_PKGS=(
    "Pillow"
    "pillow-avif-plugin"
    "pillow-heif"
    "pdf2image"
    "opencc"
    "lunarcalendar"
    "exif"
)

install_linux() {
    echo "🐧 Detected Linux (apt)."
    sudo apt-get update
    sudo apt-get install -y \
        python3 python3-pip python3-venv \
        libimage-exiftool-perl \
        poppler-utils \
        libheif1 libheif-examples \
        imagemagick \
        mysql-client \
        build-essential libjpeg-dev zlib1g-dev libfreetype6-dev \
        libheif-dev

    echo "🐍 Installing Python libs (user, --break-system-packages)..."
    python3 -m pip install --user --break-system-packages --upgrade "${PY_PKGS[@]}"
}

install_macos() {
    echo "🍎 Detected macOS (Homebrew)."
    if ! command -v brew >/dev/null 2>&1; then
        echo "❌ Homebrew is not installed. Install it first: https://brew.sh"
        exit 1
    fi
    brew update
    brew install \
        python \
        exiftool \
        poppler \
        libheif \
        imagemagick \
        mysql-client

    # Python lives in /opt/homebrew on Apple Silicon; pip install --user works fine.
    echo "🐍 Installing Python libs..."
    python3 -m pip install --user --break-system-packages --upgrade "${PY_PKGS[@]}"
}

case "$OS" in
Linux)  install_linux  ;;
Darwin) install_macos ;;
*)      echo "❌ Unsupported OS: $OS"; exit 1 ;;
esac

# --- Ensure ~/.local/bin is on PATH so user pip scripts are reachable -------
case "$SHELL" in
*/zsh)  PROFILE="$HOME/.zshrc"   ;;
*/bash) PROFILE="$HOME/.bashrc"  ;;
*)      PROFILE="$HOME/.profile" ;;
esac
LINE='export PATH="$HOME/.local/bin:$PATH"'
if [ -f "$PROFILE" ] && ! grep -qF "$LINE" "$PROFILE"; then
    echo "$LINE" >> "$PROFILE"
    echo "➕ Added ~/.local/bin to PATH in $PROFILE"
fi

echo "✅ yuleshow-bin-tools done."
