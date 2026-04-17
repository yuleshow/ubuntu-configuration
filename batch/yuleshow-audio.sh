sudo apt install audacity -y
# sudo apt install pulseaudio -y
sudo apt install pavucontrol -y
sudo add-apt-repository ppa:flacon -y
sudo apt install flacon -y


sudo apt install libfdk-aac-dev libfdk-aac2 -y


# make the directories
if [ -d ~/Applications ]
then
    echo "~/Applications already exists"
else
    mkdir ~/Applications
    echo "~/Applications doesn't exist, created one."
fi


FREAC_VERSION=1.1.7
wget "https://github.com/enzo1982/freac/releases/download/v${FREAC_VERSION}/freac-${FREAC_VERSION}-linux-x86_64.AppImage"
chmod +x freac*.AppImage
mv freac*.AppImage ~/Applications
sudo cp ~/ubuntu-configuration/desktops/freac.desktop /usr/share/applications/
