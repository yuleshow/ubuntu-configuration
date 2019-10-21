# # sudo dpkg --add-architecture i386
# wget -nc https://dl.winehq.org/wine-builds/Release.key
# sudo apt-key add Release.key
# rm Release.key
# sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/

# # sudo add-apt-repository ppa:ubuntu-wine/ppa -y
# sudo apt-get install wine-stable -y
# sudo apt-get install winetrickes -y


# wine ubuntu-configuration/windows-exe/picasa39-setup.exe
# wine ubuntu-configuration/windows-exe/mp3tagv289asetup.exe


wget https://media.codeweavers.com/pub/crossover/cxlinux/demo/crossover_18.1.0-1.deb
sudo dpkg -i crossover_18.1.0-1.deb
rm crossover_18.1.0-1.deb
