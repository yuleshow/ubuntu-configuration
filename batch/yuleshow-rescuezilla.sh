# Rescuezilla — Clonezilla-compatible disk imaging/restore GUI.
# Upstream ships AppImages (amd64) and a PPA; apt/flatpak builds lag.
# Strategy: try apt first (available on 24.04+), else download the latest
# AppImage into ~/Applications.

set -e

if sudo apt install -y rescuezilla; then
    exit 0
fi

echo "rescuezilla not in apt; falling back to AppImage."

ARCH="$(dpkg --print-architecture)"
if [ "$ARCH" != "amd64" ]; then
    echo "Rescuezilla AppImage is amd64-only; skipping on $ARCH."
    exit 0
fi

mkdir -p "$HOME/Applications"
cd "$HOME/Applications"

# Query GitHub for the latest AppImage asset URL.
APPIMAGE_URL=$(curl -fsSL https://api.github.com/repos/rescuezilla/rescuezilla/releases/latest \
    | grep -oE 'https://[^"]+rescuezilla[^"]*\.AppImage' \
    | head -n 1)

if [ -z "$APPIMAGE_URL" ]; then
    echo "Could not determine Rescuezilla AppImage URL; aborting."
    exit 1
fi

wget -O rescuezilla.AppImage "$APPIMAGE_URL"
chmod +x rescuezilla.AppImage
echo "Rescuezilla installed at ~/Applications/rescuezilla.AppImage"
