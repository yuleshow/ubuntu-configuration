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
VIPS_VERSION=8.16.2
wget "https://github.com/libvips/libvips/releases/download/v${VIPS_VERSION}/vips-${VIPS_VERSION}.tar.xz"
tar xJf "vips-${VIPS_VERSION}.tar.xz"

cd "vips-${VIPS_VERSION}"
./configure
make
sudo make install
sudo ldconfig
cd ..

rm -f "vips-${VIPS_VERSION}.tar.xz"
rm -rf "vips-${VIPS_VERSION}"
