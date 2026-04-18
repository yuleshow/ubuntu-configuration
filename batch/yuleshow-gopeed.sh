# Gopeed (latest release from GopeedLab/gopeed)
GOPEED_VERSION=1.9.3
wget "https://github.com/GopeedLab/gopeed/releases/download/v${GOPEED_VERSION}/Gopeed-v${GOPEED_VERSION}-linux-amd64.deb"
sudo apt install -y ./Gopeed-v${GOPEED_VERSION}-linux-amd64.deb
rm -f Gopeed-v${GOPEED_VERSION}-linux-amd64.deb
