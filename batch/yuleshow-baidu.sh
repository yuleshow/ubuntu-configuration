# Baidu NetDisk 4.x (current as of 2026; check https://pan.baidu.com/download for a newer build)
BAIDU_VERSION=4.17.7
wget "https://issuepcdn.baidupcs.com/issue/netdisk/LinuxGuanjia/${BAIDU_VERSION}/baidunetdisk_${BAIDU_VERSION}_amd64.deb"
sudo apt install -y ./baidunetdisk_${BAIDU_VERSION}_amd64.deb
rm baidunetdisk_${BAIDU_VERSION}_amd64.deb
