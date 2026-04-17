# VirtualBox 7.1 (latest) via Oracle's official apt repository for Ubuntu 24.04 (noble).
# Reference: https://www.virtualbox.org/wiki/Linux_Downloads

# Add Oracle VirtualBox signing key
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc \
    | sudo gpg --dearmor --yes -o /usr/share/keyrings/oracle-virtualbox-2016.gpg

# Add the noble repo
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian noble contrib" \
    | sudo tee /etc/apt/sources.list.d/virtualbox.list

sudo apt update
sudo apt install -y virtualbox-7.1
sudo apt --fix-broken install -y

