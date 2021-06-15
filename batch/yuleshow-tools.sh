sudo apt install unrar -y
sudo apt install neofetch -y

sudo pip3 install thefuck 


sudo apt install whois -y
sudo apt install gimp -y
sudo apt install gimp-help-en -y
# sudo apt install puddletag -y

sudo apt install djview -y
sudo apt install audacity -y
sudo apt install pulseaudio -y
sudo apt install pavucontrol -y
# for backup
sudo apt install duplicity -y

# temperature monitor
sudo snap install indicator-sensors

# desktop item editor
sudo apt install alacarte -y

sudo add-apt-repository ppa:flacon -y
sudo apt install flacon -y

# sudo snap install --candidate freac

sudo apt install gparted -y
sudo apt install synaptic -y
sudo apt install bleahbit -y
sudo apt install dconf-editor -y
sudo apt install preload -y
sudo apt install gufw -y

sudo apt install locate -y

if [ -d ~/Applications ]
then
    echo "~/Applications already exists"
else
    mkdir ~/Applications
    echo "~/Applications doesn't exist, created one."
fi
cd ~/Applications

wget https://github.com/enzo1982/freac/releases/download/v1.1.4/freac-1.1.4-linux-x86_64.AppImage
chmod +x *.AppImage
sudo cp ~/ubuntu-configuration/desktops/freac.desktop /usr/share/applications/
