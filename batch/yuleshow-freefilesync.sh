# # make the directories
# if [ -d ~/Applications ]
# then
#     echo "~/Applications already exists"
# else
#     mkdir ~/Applications
#     echo "~/Applications doesn't exist, created one."
# fi


# cd ~/Applications
# wget https://freefilesync.org/download/FreeFileSync_11.4_Linux.tar.gz
# tar -zxvf FreeFileSync_11.4_Linux.tar.gz
# sudo cp ~/ubuntu-configuration/desktops/FreeFileSync.desktop /usr/share/applications
# rm FreeFileSync_11.4_Linux.tar.gz



FFS_VERSION=13.7
wget "https://freefilesync.org/download/FreeFileSync_${FFS_VERSION}_Linux.tar.gz"
tar -zxf "FreeFileSync_${FFS_VERSION}_Linux.tar.gz"
./FreeFileSync_${FFS_VERSION}_Install.run
rm -f "FreeFileSync_${FFS_VERSION}_Install.run" "FreeFileSync_${FFS_VERSION}_Linux.tar.gz"
