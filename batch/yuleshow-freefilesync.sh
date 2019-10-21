# wget https://freefilesync.org/download/FreeFileSync_10.5_Linux_64-bit.tar.gz
tar -zxvf ubuntu-configuration/sources/FreeFileSync_10.5_Linux_64-bit.tar.gz
sudo mv FreeFileSync/ /opt/
sudo unzip /opt/FreeFileSync/Resources.zip -d /opt/FreeFileSync/Resources/
sudo cp ubuntu-configuration/desktops/FreeFileSync.desktop /usr/share/applications
# rm FreeFileSync_10.5_Linux_64-bit.tar.gz
