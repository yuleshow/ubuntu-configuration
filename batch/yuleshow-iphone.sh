
~/ubuntu-configuration/batch/yuleshow-ipadcharge.sh
# iphone
sudo apt-get install libtool m4 -y
sudo apt install libimobiledevice-utils -y
sudo apt install ifuse -y
sudo apt install libusb-1.0-0-dev -y
sudo apt install libplist-dev -y


if [ -d /media/iPhone ]
then
    echo "/media/iPhone exists, skip."
else
    sudo mkdir /media/iPhone
    sudo chown yuleshow:yuleshow /media/iPhone
    
    echo "/media/iPhone doesn't exist, created one."
fi





sudo apt install gawk -y
sudo apt install clang -y

sudo apt install cython -y
cd ~

## libplist from libimobiledevice.org
# wget https://www.libimobiledevice.org/downloads/libplist-2.0.0.tar.bz2
# tar -vxjf libplist-2.0.0.tar.bz2
# cd libplist-2.0.0
# ./configure
# sudo make
# sudo make install
# sudo ldconfig
# cd ..
# sudo rm -r -f libplist-2.0.0
# rm libplist-2.0.0.tar.bz2

## libplist from github
git clone https://github.com/libimobiledevice/libplist.git
cd libplist
./autogen.sh
make
sudo make install
cd ..
rm -r -f libplist


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

~/ubuntu-configuration/batch/yuleshow-vips.sh
~/ubuntu-configuration/batch/yuleshow-tifig.sh
