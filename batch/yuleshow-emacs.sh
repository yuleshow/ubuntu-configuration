# for compiling
sudo apt install autoconf -y
sudo apt install cmake -y
sudo apt install build-essential -y
sudo apt install texinfo -y
sudo apt install libx11-dev -y
sudo apt install libxpm-dev -y
sudo apt install libjpeg-dev -y
sudo apt install libpng-dev -y
sudo apt install libgif-dev -y
sudo apt install libtiff-dev -y
sudo apt install libgtk2.0-dev -y
sudo apt install libncurses-dev -y
sudo apt install gnutls-dev -y
sudo apt install libgtk-3-dev -y
# sudo apt install mailutils -y
sudo apt install ispell -y
sudo apt install git -y

# wget http://gnu.mirror.iweb.com/emacs/emacs-27.1.tar.gz
# tar -zxf  emacs-27.1.tar.gz
# cd emacs-27.1
# ./autogen.sh
# ./configure
# make
# sudo make install
# cd ..
# rm -r -f emacs-27.1
# rm emacs-27.1.tar.gz

# for installing directly
sudo apt install emacs -y



git clone https://github.com/yuleshow/yuleshow-dotemacs.git
ln -s yuleshow-dotemacs ~/.emacs.d
ln -s yuleshow-dotemacs/new.emacs ~/.emacs
