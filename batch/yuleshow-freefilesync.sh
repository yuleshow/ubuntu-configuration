
# make the directories
if [ -d ~/Applications ]
then
    echo "~/Applications already exists"
else
    mkdir ~/Applications
    echo "~/Applications doesn't exist, created one."
fi

# wget https://freefilesync.org/download/FreeFileSync_10.5_Linux_64-bit.tar.gz
cd ~/Applications
# wget https://freefilesync.org/download/FreeFileSync_11.2_Linux.tar.gz
wget https://freefilesync.org/download/FreeFileSync_11.4_Linux.tar.gz
tar -zxvf FreeFileSync_11.4_Linux.tar.gz
# sudo mv FreeFileSync ~/Applications
sudo cp ~/ubuntu-configuration/desktops/FreeFileSync.desktop /usr/share/applications
rm FreeFileSync_11.4_Linux.tar.gz
