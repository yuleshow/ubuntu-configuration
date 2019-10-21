sudo apt-get install libavcodec-dev libswscale-dev -y
sudo apt install ffmpeg -y

sudo apt-get install build-essential pkg-config libglib2.0-dev libexpat1-dev libjpeg-dev libexif-dev libpng-dev libtiff-dev -y
sudo apt-get install libvips -y
cd ~
wget https://github.com/libvips/libvips/releases/download/v8.6.1/vips-8.6.1.tar.gz
# wget https://github.com/jcupitt/libvips/releases/download/v8.6.1/vips-8.6.1.tar.gz
tar xzf vips-8.6.1.tar.gz
cd vips-8.6.1
./configure
make
sudo make install
sudo ldconfig
cd ..
rm vips-8.6.1.tar.gz
rm -f -r vips-8.6.1
