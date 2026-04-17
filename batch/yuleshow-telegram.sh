# make the directories
if [ -d ~/Applications ]
then
    echo "~/Applications already exists"
else
    mkdir ~/Applications
    echo "~/Applications doesn't exist, created one."
fi

cd ~/Applications
# Telegram's official 'latest' endpoint redirects to the current tdesktop tarball.
wget -O tsetup-latest.tar.xz https://telegram.org/dl/desktop/linux
tar -xJf tsetup-latest.tar.xz
sudo cp ~/ubuntu-configuration/desktops/Telegram.desktop /usr/share/applications/
rm tsetup-latest.tar.xz
