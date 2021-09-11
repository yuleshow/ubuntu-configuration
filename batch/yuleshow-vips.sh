sudo apt install libavcodec-dev -y
sudo apt install libswscale-dev -y


sudo apt install build-essential -y
sudo apt install pkg-config -y
sudo apt install libglib2.0-dev -y
sudo apt install libexpat1-dev -y
sudo apt install libjpeg-dev -y
sudo apt install libexif-dev -y
sudo apt install libpng-dev -y
sudo apt install libtiff-dev -y
sudo apt install libvips -y

cd ~
#wget https://github.com/libvips/libvips/releases/download/v8.6.1/vips-8.6.1.tar.gz
wget https://github.com/libvips/libvips/releases/download/v8.10.6/vips-8.10.6.tar.gz
# wget https://github.com/jcupitt/libvips/releases/download/v8.6.1/vips-8.6.1.tar.gz
tar xzf vips-8.10.6.tar.gz

cd vips-8.10.6
./configure
make
sudo make install
sudo ldconfig
cd ..

rm vips-8.10.6.tar.gz
rm -f -r vips-8.10.6
