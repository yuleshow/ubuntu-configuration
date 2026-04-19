# Runtime deps for Emacs (installed regardless of install method).
sudo apt install -y git

# ---------------------------------------------------------------------------
# Optional: build Emacs from source. Uncomment the whole block below to use.
# The build-only -dev packages are kept here so they ship together with the
# code that actually needs them; they are NOT pulled when installing via apt.
# ---------------------------------------------------------------------------
# sudo apt install -y \
#     autoconf cmake build-essential texinfo \
#     libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev \
#     libgtk2.0-dev libgtk-3-dev libncurses-dev gnutls-dev
#
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
# (init.el, packages, themes, auto-saves). The legacy ~/.emacs file is
# managed manually if needed; this script only wires up ~/.emacs.d.
cd ~
git clone https://github.com/yuleshow/yuleshow-dotemacs.git

# Back up any pre-existing ~/.emacs.d so the symlink can be created cleanly.
[ -e ~/.emacs.d ] && [ ! -L ~/.emacs.d ] && mv ~/.emacs.d ~/.emacs.d.backup.$(date +%s)
[ -L ~/.emacs.d ] && rm ~/.emacs.d

ln -s ~/yuleshow-dotemacs ~/.emacs.d
