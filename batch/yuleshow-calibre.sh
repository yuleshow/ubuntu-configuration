sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
cd ~/Applications
mkdir calibre4
cd calibre4
wget http://www.yuleshow.com/files/ubuntu/calibre-4.23.0-x86_64.txz
tar xvf calibre-4.23.0-x86_64.txz
sudo cp ~/ubuntu-configuration/desktops/calibre4.desktop /usr/share/applications
rm calibre-4.23.0-x86_64.txz


