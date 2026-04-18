# TeamViewer — upstream publishes per-arch .deb files at download.teamviewer.com.
ARCH=$(dpkg --print-architecture)
case "$ARCH" in
    amd64|arm64|armhf|i386) ;;
    *)
        echo "Skipping TeamViewer: no upstream .deb for $ARCH."
        exit 0
        ;;
esac
wget "https://download.teamviewer.com/download/linux/teamviewer_${ARCH}.deb"
sudo apt install -y "./teamviewer_${ARCH}.deb"
rm "teamviewer_${ARCH}.deb"
