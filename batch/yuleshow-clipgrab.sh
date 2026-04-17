# make the directories
if [ -d ~/Applications ]
then
    echo "~/Applications already exists"
else
    mkdir ~/Applications
    echo "~/Applications doesn't exist, created one."
fi

cd ~/Applications
CLIPGRAB_VERSION=3.9.11
wget "https://download.clipgrab.org/ClipGrab-${CLIPGRAB_VERSION}-x86_64.AppImage"
chmod +x ClipGrab*.AppImage
sudo cp ~/ubuntu-configuration/desktops/ClipGrab.desktop /usr/share/applications

