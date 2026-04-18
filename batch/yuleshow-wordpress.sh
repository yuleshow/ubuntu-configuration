# WordPress.com desktop client — upstream .deb is amd64 only.
ARCH=$(dpkg --print-architecture)
if [ "$ARCH" != "amd64" ]; then
    echo "Skipping WordPress desktop: upstream publishes amd64 only (this host is $ARCH). Use the web app at https://wordpress.com instead."
    exit 0
fi
wget 'https://public-api.wordpress.com/rest/v1.1/desktop/linux/download?type=deb' -O wordpress.deb
sudo apt install -y ./wordpress.deb
rm wordpress.deb
