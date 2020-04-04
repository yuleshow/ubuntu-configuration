# # sudo dpkg --add-architecture i386
# wget -nc https://dl.winehq.org/wine-builds/Release.key
# sudo apt-key add Release.key
# rm Release.key
# sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/

# # sudo add-apt-repository ppa:ubuntu-wine/ppa -y
# sudo apt-get install wine-stable -y
# sudo apt-get install winetrickes -y


# wine ubuntu-configuration/windows-exe/picasa39-setup.exe
# wine ubuntu-configuration/windows-exe/mp3tagv289asetup.exe


wget http://ftp.br.debian.org/debian/pool/main/g/glibc/multiarch-support_2.28-10_i386.deb
sudo dpkg -i multiarch-support_2.28-10_i386.deb
rm multiarch-support_2.28-10_i386.deb
sudo dpkg --add-architecture i386
sudo apt --fix-broken install -y
sudo apt install libnss-mdns:i386 -y
sudo apt install python-gtk2 -y

wget https://media.codeweavers.com/pub/crossover/cxlinux/demo/crossover_19.0.1-1.deb
sudo dpkg -i crossover_*.deb
rm crossover_*.deb
