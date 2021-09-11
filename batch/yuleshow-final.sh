sudo apt --fix-broken install -y
sudo apt clean
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

rm yuleshow-install.sh
ln -s ubuntu-configuration/yuleshow-install.sh yuleshow-install.sh
