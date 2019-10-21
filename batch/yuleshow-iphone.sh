# iphone
sudo apt-get install libtool m4 -y
sudo apt install libimobiledevice-utils ifuse -y

sudo mkdir /media/iPhone
sudo chown yuleshow:yuleshow /media/iPhone

sudo apt install gawk -y
sudo apt install clang -y


sudo apt install cython -y
cd ~
wget https://www.libimobiledevice.org/downloads/libplist-2.0.0.tar.bz2
tar -vxjf libplist-2.0.0.tar.bz2
cd libplist-2.0.0
./configure
sudo make
sudo make install
sudo ldconfig
cd ..
sudo rm -r -f libplist-2.0.0
rm libplist-2.0.0.tar.bz2

git clone https://github.com/libimobiledevice/libusbmuxd.git
cd libusbmuxd
./autogen.sh
./configure
sudo make
sudo make install
sudo ldconfig
cd ..
sudo rm -r -f libusbmuxd
         
git clone https://github.com/libimobiledevice/libimobiledevice.git
cd libimobiledevice
sudo apt install libssl-dev
./autogen.sh
./configure
sudo make
sudo make install
sudo ldconfig
cd ..
sudo rm -r -f libimobiledevice


git clone https://github.com/libimobiledevice/usbmuxd.git
cd usbmuxd
./autogen.sh
sudo make
sudo make install
sudo ldconfig
cd ..
sudo rm -r -f usbmuxd
