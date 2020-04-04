cd ~/Applications
wget https://www.torproject.org/dist/torbrowser/9.0.7/tor-browser-linux64-9.0.7_en-US.tar.xz
tar -xJf tor-browser-linux64-*.tar.xz
sudo cp ~/ubuntu-configuration/desktops/Tor.desktop /usr/share/applications/
rm tor-browser-linux64-*.tar.xz
