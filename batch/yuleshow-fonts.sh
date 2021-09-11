# fonts
# sudo apt install ttf-mscorefonts-installer -y
cd ~
git clone https://www.github.com/yuleshow/chinese-fonts.git
sudo ln -s ~/chinese-fonts /usr/share/fonts/chinese-fonts
sudo ln -s ~/ubuntu-configuration/yuleshow-extra-fonts /usr/share/fonts/yuleshow-extra-fonts
sudo fc-cache -f -v

sudo add-apt-repository ppa:font-manager/staging -y
sudo apt-get update
sudo apt-get install font-manager -y
