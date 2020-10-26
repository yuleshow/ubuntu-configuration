# wget https://freefilesync.org/download/FreeFileSync_10.5_Linux_64-bit.tar.gz
wget https://freefilesync.org/download/FreeFileSync_11.2_Linux.tar.gz
tar -zxvf FreeFileSync_11.2_Linux.tar.gz
sudo mv FreeFileSync ~/Applications
sudo cp ubuntu-configuration/desktops/FreeFileSync.desktop /usr/share/applications
rm FreeFileSync_11.2_Linux.tar.gz
