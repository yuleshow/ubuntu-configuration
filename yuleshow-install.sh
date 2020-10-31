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

# install the decodes
sudo apt install ubuntu-restricted-extras -y



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
sudo cp ubuntu-configuration/bin/* /usr/local/bin

~/ubuntu-configuration/batch/yuleshow-python.sh
~/ubuntu-configuration/batch/yuleshow-fonts.sh
~/ubuntu-configuration/batch/yuleshow-flatpak.sh
~/ubuntu-configuration/batch/yuleshow-emacs.sh
~/ubuntu-configuration/batch/yuleshow-chrome.sh
~/ubuntu-configuration/batch/yuleshow-filezilla.sh
~/ubuntu-configuration/batch/yuleshow-insync.sh
~/ubuntu-configuration/batch/yuleshow-language.sh
~/ubuntu-configuration/batch/yuleshow-vlc.sh
~/ubuntu-configuration/batch/yuleshow-teamviewer.sh
~/ubuntu-configuration/batch/yuleshow-wechat.sh
~/ubuntu-configuration/batch/yuleshow-virtualbox.sh
~/ubuntu-configuration/batch/yuleshow-whatever.sh
~/ubuntu-configuration/batch/yuleshow-aria2.sh
~/ubuntu-configuration/batch/yuleshow-smartgit.sh
~/ubuntu-configuration/batch/yuleshow-rename.sh
# ~/ubuntu-configuration/batch/yuleshow-iphone.sh
~/ubuntu-configuration/batch/yuleshow-calibre.sh
~/ubuntu-configuration/batch/yuleshow-baidu.sh
~/ubuntu-configuration/batch/yuleshow-guake.sh
# ~/ubuntu-configuration/batch/yuleshow-macbuntu.sh
~/ubuntu-configuration/batch/yuleshow-xdm.sh
~/ubuntu-configuration/batch/yuleshow-wordpress.sh
~/ubuntu-configuration/batch/yuleshow-ipadcharge.sh
~/ubuntu-configuration/batch/yuleshow-gnome.sh
~/ubuntu-configuration/batch/yuleshow-dupeguru.sh
~/ubuntu-configuration/batch/yuleshow-tools.sh
~/ubuntu-configuration/batch/yuleshow-vips.sh
~/ubuntu-configuration/batch/yuleshow-tifig.sh
~/ubuntu-configuration/batch/yuleshow-crossover.sh
~/ubuntu-configuration/batch/yuleshow-telegram.sh
~/ubuntu-configuration/batch/yuleshow-tor.sh
~/ubuntu-configuration/batch/yuleshow-adobereader.sh
~/ubuntu-configuration/batch/yuleshow-clipgrab.sh
~/ubuntu-configuration/batch/yuleshow-arronax.sh
~/ubuntu-configuration/batch/yuleshow-freefilesync.sh
~/ubuntu-configuration/batch/yuleshow-bashrc.sh


# final
~/ubuntu-configuration/batch/yuleshow-final.sh
