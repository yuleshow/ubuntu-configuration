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

sudo apt install libc6 -y
sudo apt install libc6-dev -y
sudo apt install libc6:i386 -y
sudo apt install libc6-dev:i386 -y
sudo apt install libc6-i386 -y
sudo apt install libc6-dev-i386 -y
sudo apt install lib32z1 -y


wget http://ftp.br.debian.org/debian/pool/main/g/glibc/multiarch-support_2.28-10_i386.deb
sudo dpkg --add-architecture i386
sudo dpkg -i multiarch-support_2.28-10_i386.deb
rm multiarch-support_2.28-10_i386.deb

# sudo apt --fix-broken install -y
sudo apt install libnss-mdns:i386 -y
# sudo apt install python-gtk2 -y

# # https://media.codeweavers.com/pub/crossover/cxlinux/demo/crossover_20.0.0-1.deb
# # wget https://media.codeweavers.com/pub/crossover/cxlinux/demo/crossover_19.0.1-1.deb
# wget https://media.codeweavers.com/pub/crossover/cxlinux/demo/crossover_19.0.2-1.deb
# sudo dpkg -i crossover_*.deb
# rm crossover_*.deb
# sudo apt --fix-broken install -y
# sudo apt install -f
# sudo apt-get install libgsm1:i386 libopenal1:i386 libpulse0:i386 libudev1:i386 libxslt1.1:i386 -y
# sudo /opt/cxoffice/bin/cxfix missinglibsane missinglibsane.amd64

# sudo apt install libsane:i386

# wget https://media.codeweavers.com/pub/crossover/cxlinux/demo/crossover_20.0.0-1.deb
wget https://media.codeweavers.com/pub/crossover/cxlinux/demo/crossover_20.0.4-1.deb
sudo dpkg -i crossover_20.0.4-1.deb
sudo apt install -f -y
rm crossover_20.0.4-1.deb

sudo apt install gstreamer1.0-plugins-base:i386 -y
sudo apt install gstreamer1.0-plugins-good:i386 -y
sudo apt install gstreamer1.0-plugins-ugly:i386 -y
sudo apt install libcups2:i386 -y
sudo apt install libfreetype6:i386 -y
sudo apt install libgl1-mesa-glx:i386 -y
sudo apt install libglu1-mesa:i386 -y
sudo apt install libgsm1:i386 -y
sudo apt install libgstreamer1.0-0:i386 -y
sudo apt install libmpg123-0:i386 -y
sudo apt install libopenal1:i386 -y
sudo apt install libpng16-16:i386 -y
sudo apt install libpulse0:i386 -y
sudo apt install libudev1:i386 -y
sudo apt install libx11-6:i386 -y
sudo apt install libxcomposite1:i386 -y
sudo apt install libxcursor1:i386 -y
sudo apt install libxext6:i386 -y
sudo apt install libxi6:i386 -y
sudo apt install libxinerama1:i386 -y
sudo apt install libxrandr2:i386  -y
sudo apt install libxslt1.1:i386 -y

sudo /opt/cxoffice/bin/cxfix missinglibsane missinglibsane.amd64 -y

