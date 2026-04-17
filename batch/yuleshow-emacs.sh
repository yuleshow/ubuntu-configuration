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

# wget https://ftp.gnu.org/gnu/emacs/emacs-30.1.tar.gz
# tar -zxf  emacs-30.1.tar.gz
# cd emacs-30.1
# ./autogen.sh
# ./configure
# make
# sudo make install
# cd ..
# rm -r -f emacs-30.1
# rm emacs-30.1.tar.gz

# for installing directly
sudo apt install emacs -y


# Modern convention: a single ~/.emacs.d/ directory holds everything
# (init.el, packages, themes, auto-saves). Avoid the legacy ~/.emacs file.
cd ~
git clone https://github.com/yuleshow/yuleshow-dotemacs.git

# Back up any pre-existing config so the symlink can be created cleanly.
[ -e ~/.emacs ]   && mv ~/.emacs   ~/.emacs.backup.$(date +%s)
[ -e ~/.emacs.d ] && [ ! -L ~/.emacs.d ] && mv ~/.emacs.d ~/.emacs.d.backup.$(date +%s)
[ -L ~/.emacs.d ] && rm ~/.emacs.d

ln -s ~/yuleshow-dotemacs ~/.emacs.d

# Ensure the entry point is named init.el (modern standard). If the repo
# still ships new.emacs as the main config, symlink it so Emacs picks it up.
if [ ! -e ~/.emacs.d/init.el ] && [ -e ~/.emacs.d/new.emacs ]; then
    ln -s new.emacs ~/.emacs.d/init.el
fi
