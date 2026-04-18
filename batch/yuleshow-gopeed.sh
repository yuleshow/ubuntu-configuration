# Gopeed (latest release from GopeedLab/gopeed).
# Upstream publishes per-arch .deb files (linux-amd64 + linux-arm64).
GOPEED_VERSION=1.9.3
ARCH=$(dpkg --print-architecture)
case "$ARCH" in
    amd64|arm64) ;;
    *)
        echo "Skipping Gopeed: no upstream .deb for $ARCH."
        exit 0
        ;;
esac
wget "https://github.com/GopeedLab/gopeed/releases/download/v${GOPEED_VERSION}/Gopeed-v${GOPEED_VERSION}-linux-${ARCH}.deb"
sudo apt install -y "./Gopeed-v${GOPEED_VERSION}-linux-${ARCH}.deb"
rm -f "Gopeed-v${GOPEED_VERSION}-linux-${ARCH}.deb"
