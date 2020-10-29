# make the directories
if [ -d ~/Applications ]
then
    echo "~/Applications already exists"
else
    mkdir ~/Applications
    echo "~/Applications doesn't exist, created one."
fi

cd ~/Applications
# wget https://updates.tdesktop.com/tlinux/tsetup.1.8.8.tar.xz
wget https://updates.tdesktop.com/tlinux/tsetup.2.4.4.tar.xz
tar -xJf tsetup.2.4.4.tar.xz
sudo cp ~/ubuntu-configuration/desktops/Telegram.desktop /usr/share/applications/
rm tsetup.2.4.4.tar.xz
