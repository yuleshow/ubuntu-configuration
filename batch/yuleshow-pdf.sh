
sudo apt install gdebi-core -y
sudo apt install libxml2:i386 -y
sudo apt install libcanberra-gtk-module:i386 -y
sudo apt install gtk2-engines-murrine:i386 -y
sudo apt install libatk-adaptor:i386 -y

wget ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb
sudo dpkg -i AdbeRdr9.5.5-1_i386linux_enu.deb
rm AdbeRdr9.5.5-1_i386linux_enu.deb

sudo apt install okular -y

sudo apt install djview -y



