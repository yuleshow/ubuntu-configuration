# # sudo apt install git -y
# # sudo apt install make -y
# # sudo apt install gcc  -y
# sudo apt install libgtk-3-dev -y
# sudo apt libpolkit-gobject-1-dev -y
# # git clone https://github.com/thiggy01/gdm-background.git
# # cd gdm-background/
# # make
# # sudo make install
# # cd ..
# # rm -r -f gdm-background


# sudo cp ~/ubuntu-configuration/bin/gdm-background /usr/local/bin/
# sudo cp ~/ubuntu-configuration/desktops/gdm-background.desktop /usr/share/applications/

sudo apt install  libglib2.0-dev-bin -y
sudo apt install  python3-distutils -y

wget https://github.com/thiggy01/gdm-background/releases/download/v1.0/gdm-background_1.0_amd64.deb
sudo dpkg -i gdm*.deb
rm gdm*.deb
