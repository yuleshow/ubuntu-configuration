#!/usr/bin/env bash
# Resolve the directory of this script so the batch/ calls below work no
# matter the current working directory (and even when invoked via sudo).
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# begin
# "$SCRIPT_DIR"/batch/yuleshow-begin.sh

# Initial
sudo apt update
sudo apt upgrade -y
sudo apt install cmake -y
sudo apt install git -y
sudo apt install npm -y
# sudo apt install yum -y
sudo apt install snap -y
sudo apt install curl

# sudo apt install python-pip -y
sudo apt install automake -y
sudo apt install xz-utils -y # for tar.xz
sudo apt install rar unrar p7zip-full p7zip-rar -y # for other compress/extract

sudo apt install openjdk-17-jre -y

# install the decodes
# sudo apt install ubuntu-restricted-extras -y
sudo apt install ubuntu-restricted-addons -y
sudo apt install software-properties-common -y



# make the directories
if [ -d ~/Applications ]
then
    echo "~/Applications already exists"
else
    mkdir ~/Applications
    echo "~/Applications doesn't exist, created one."
fi


git clone https://github.com/yuleshow/ubuntu-configuration.git

# copy bin files
sudo cp "$SCRIPT_DIR"/bin/* /usr/local/bin




######### above imported from yuleshow-begin.sh
#######################################################

"$SCRIPT_DIR"/batch/yuleshow-python.sh
# Install every CLI tool + Python library the bin/yuleshow-* scripts need
# (exiftool, poppler, libheif, Pillow, pillow-heif, pdf2image, opencc, ...).
"$SCRIPT_DIR"/batch/yuleshow-bin-tools.sh
# comment the following line for test the script
"$SCRIPT_DIR"/batch/yuleshow-fonts.sh
"$SCRIPT_DIR"/batch/yuleshow-flatpak.sh
"$SCRIPT_DIR"/batch/yuleshow-emacs.sh
"$SCRIPT_DIR"/batch/yuleshow-browser.sh
"$SCRIPT_DIR"/batch/yuleshow-filezilla.sh
"$SCRIPT_DIR"/batch/yuleshow-insync.sh
"$SCRIPT_DIR"/batch/yuleshow-language.sh
# "$SCRIPT_DIR"/batch/yuleshow-teamviewer.sh
# "$SCRIPT_DIR"/batch/yuleshow-wechat.sh
"$SCRIPT_DIR"/batch/yuleshow-virtualbox.sh
"$SCRIPT_DIR"/batch/yuleshow-cleaner.sh
"$SCRIPT_DIR"/batch/yuleshow-whatever.sh
# "$SCRIPT_DIR"/batch/yuleshow-aria2.sh
"$SCRIPT_DIR"/batch/yuleshow-smartgit.sh
"$SCRIPT_DIR"/batch/yuleshow-rename.sh
"$SCRIPT_DIR"/batch/yuleshow-calibre.sh
"$SCRIPT_DIR"/batch/yuleshow-baidu.sh
"$SCRIPT_DIR"/batch/yuleshow-guake.sh
# "$SCRIPT_DIR"/batch/yuleshow-whitesur.sh   # replaces the old macbuntu stack
"$SCRIPT_DIR"/batch/yuleshow-mac-simple.sh
"$SCRIPT_DIR"/batch/yuleshow-xdm.sh
"$SCRIPT_DIR"/batch/yuleshow-wordpress.sh

"$SCRIPT_DIR"/batch/yuleshow-gnome.sh
# "$SCRIPT_DIR"/batch/yuleshow-dupeguru.sh
"$SCRIPT_DIR"/batch/yuleshow-audio.sh
"$SCRIPT_DIR"/batch/yuleshow-tools.sh

# "$SCRIPT_DIR"/batch/yuleshow-vips.sh   # moved to iphone batch
# "$SCRIPT_DIR"/batch/yuleshow-tifig.sh  # moved to iphone batch
# "$SCRIPT_DIR"/batch/yuleshow-crossover.sh   # disabled by request
"$SCRIPT_DIR"/batch/yuleshow-telegram.sh
"$SCRIPT_DIR"/batch/yuleshow-pdf.sh


# "$SCRIPT_DIR"/batch/yuleshow-freefilesync.sh
"$SCRIPT_DIR"/batch/yuleshow-goldendict.sh
"$SCRIPT_DIR"/batch/yuleshow-postit.sh
"$SCRIPT_DIR"/batch/yuleshow-gdm-background.sh
# comment the following line for test the script
"$SCRIPT_DIR"/batch/yuleshow-iphone.sh
"$SCRIPT_DIR"/batch/yuleshow-video.sh
"$SCRIPT_DIR"/batch/yuleshow-bashrc.sh


# final
"$SCRIPT_DIR"/batch/yuleshow-final.sh
