# Baidu NetDisk 4.x (current as of 2026; check https://pan.baidu.com/download for a newer build)
# Upstream ships amd64 only.
ARCH=$(dpkg --print-architecture)
if [ "$ARCH" != "amd64" ]; then
    echo "Skipping Baidu NetDisk: upstream publishes amd64 only (this host is $ARCH)."
    exit 0
fi
BAIDU_VERSION=4.17.7
wget "https://issuepcdn.baidupcs.com/issue/netdisk/LinuxGuanjia/${BAIDU_VERSION}/baidunetdisk_${BAIDU_VERSION}_amd64.deb"
sudo apt install -y ./baidunetdisk_${BAIDU_VERSION}_amd64.deb
rm baidunetdisk_${BAIDU_VERSION}_amd64.deb
