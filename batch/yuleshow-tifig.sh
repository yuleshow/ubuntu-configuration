sudo apt-get install doxygen -y
cd ~
git clone --recursive https://github.com/monostream/tifig.git
mkdir tifig/build && cd tifig/build
cmake ..
make
cd /home/yuleshow/tifig/build
sudo cp tifig /usr/local/bin
cd ..
cd ..
rm -r -f tifig



