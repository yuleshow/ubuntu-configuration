# InSync (latest) via official apt repo for Ubuntu 24.04 (noble)
# Reference: https://help.insynchq.com/installation-and-setup/linux-installation/

wget -qO- https://apt.insync.io/gpg/ACCAF35C.gpg \
    | sudo gpg --dearmor --yes -o /usr/share/keyrings/insync.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/insync.gpg] http://apt.insync.io/ubuntu noble non-free contrib" \
    | sudo tee /etc/apt/sources.list.d/insync.list

sudo apt update
sudo apt install -y insync insync-nautilus
