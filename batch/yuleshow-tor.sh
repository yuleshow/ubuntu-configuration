# make the directories
if [ -d ~/Applications ]
then
    echo "~/Applications already exists"
else
    mkdir ~/Applications
    echo "~/Applications doesn't exist, created one."
fi

cd ~/Applications
# wget https://www.torproject.org/dist/torbrowser/9.0.7/tor-browser-linux64-9.0.7_en-US.tar.xz
# wget https://www.torproject.org/dist/torbrowser/10.0.2/tor-browser-linux64-10.0.2_en-US.tar.xz
wget https://dist.torproject.org/torbrowser/10.5.2/tor-browser-linux64-10.5.2_en-US.tar.xz
tar -xJf tor-browser-linux64-*.tar.xz
sudo cp ~/ubuntu-configuration/desktops/Tor.desktop /usr/share/applications/
rm tor-browser-linux64-*.tar.xz
