# make the directories
if [ -d ~/Applications ]
then
    echo "~/Applications already exists"
else
    mkdir ~/Applications
    echo "~/Applications doesn't exist, created one."
fi

cd ~/Applications
# wget https://download.clipgrab.org/ClipGrab-3.8.5-x86_64.AppImage
# wget https://download.clipgrab.org/ClipGrab-3.8.9-x86_64.AppImage
# wget https://download.clipgrab.org/ClipGrab-3.8.14-x86_64.AppImage
# wget https://download.clipgrab.org/ClipGrab-3.9.6-x86_64.AppImage
wget https://download.clipgrab.org/ClipGrab-3.9.6-x86_64.AppImage
chmod +x ClipGrab*.AppImage
sudo cp ~/ubuntu-configuration/desktops/ClipGrab.desktop /usr/share/applications

