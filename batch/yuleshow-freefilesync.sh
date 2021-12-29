# for submit test of smartgit

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



# wget https://freefilesync.org/download/FreeFileSync_11.12_Linux.tar.gz
# wget https://freefilesync.org/download/FreeFileSync_11.13_Linux.tar.gz
wget https://freefilesync.org/download/FreeFileSync_11.15_Linux.tar.gz
tar -zxf FreeFileSync_11.15_Linux.tar.gz
./FreeFileSync_11.15_Install.run 
rm FreeFileSync_11.15_Install.run
rm FreeFileSync_11.15_Linux.tar.gz
