# wget https://launchpad.net/~hsoft/+archive/ubuntu/ppa/+build/11261317/+files/dupeguru_4.0.3~xenial_amd64.deb
# sudo dpkg -i dupeguru_4.0.3~xenial_amd64.deb
# sudo apt --fix-broken install -y
# sudo cp /usr/share/dupeguru/core/pe/_cache.cpython-35m-x86_64-linux-gnu.so /usr/share/dupeguru/core/pe/_cache.cpython-36m-x86_64-linux-gnu.so
# sudo cp /usr/share/dupeguru/core/pe/_cache.cpython-35m-x86_64-linux-gnu.so /usr/share/dupeguru/core/pe/_cache.cpython-37m-x86_64-linux-gnu.so
# sudo cp /usr/share/dupeguru/core/pe/_block.cpython-35m-x86_64-linux-gnu.so   /usr/share/dupeguru/core/pe/_block.cpython-36m-x86_64-linux-gnu.so
# sudo cp /usr/share/dupeguru/core/pe/_block.cpython-35m-x86_64-linux-gnu.so   /usr/share/dupeguru/core/pe/_block.cpython-37m-x86_64-linux-gnu.so
# sudo cp /usr/share/dupeguru/qt/pe/_block_qt.cpython-35m-x86_64-linux-gnu.so /usr/share/dupeguru/qt/pe/_block_qt.cpython-36m-x86_64-linux-gnu.so
# sudo cp /usr/share/dupeguru/qt/pe/_block_qt.cpython-35m-x86_64-linux-gnu.so /usr/share/dupeguru/qt/pe/_block_qt.cpython-37m-x86_64-linux-gnu.so
# sudo rm dupeguru_4.0.3~xenial_amd64.deb

# again
# wget http://www.yuleshow.com/files/ubuntu/dupeguru-master_build_2020-04-16.tar.gz 
# tar -zxf dupeguru-master_build_2020-04-16.tar.gz
# mv dupeguru-master_build_2020-04-16 ~/Applications
# sudo cp ~/ubuntu-configuration/desktops/dupeguru.desktop /usr/share/applications
# rm  dupeguru-master_build_2020-04-16.tar.gz

sudo apt install libdouble-conversion3 -y
sudo apt install libmd4c0 -y
sudo apt install libpcre2-16-0 -y
sudo apt install libqt5core5a -y
sudo apt install libqt5dbus5 -y
sudo apt install libqt5designer5 -y
sudo apt install libqt5gui5 -y
sudo apt install libqt5help5 -y
sudo apt install libqt5network5 -y
sudo apt install libqt5printsupport5 -y
sudo apt install libqt5sql5 -y
sudo apt install libqt5sql5-sqlite -y
sudo apt install libqt5svg5 -y
sudo apt install libqt5test5 -y
sudo apt install libqt5widgets5 -y
sudo apt install libqt5xml5 -y
sudo apt install libxcb-xinerama0 -y
sudo apt install libxcb-xinput0 -y
sudo apt install python3-pyqt5.sip -y
sudo apt install qt5-gtk-platformtheme -y
sudo apt install qttranslations5-l10n -y
sudo apt install qt5-image-formats-plugins -y
sudo apt install qtwayland5 -y
sudo apt install python3-pyqt5-dbg -y
sudo apt install libdouble-conversion3 -y
sudo apt install libmd4c0 -y
sudo apt install libpcre2-16-0 -y
sudo apt install libqt5core5a -y
sudo apt install libqt5dbus5 -y
sudo apt install libqt5designer5 -y
sudo apt install libqt5gui5 -y
sudo apt install libqt5help5 -y
sudo apt install libqt5network5 -y
sudo apt install libqt5printsupport5 -y
sudo apt install libqt5sql5 -y
sudo apt install libqt5sql5-sqlite -y
sudo apt install libqt5svg5 -y
sudo apt install libqt5test5 -y
sudo apt install libqt5widgets5 -y
sudo apt install libqt5xml5 -y
sudo apt install libxcb-xinerama0 -y
sudo apt install libxcb-xinput0 -y
sudo apt install python3-pyqt5 -y
sudo apt install python3-pyqt5.sip -y
sudo apt install qt5-gtk-platformtheme -y
sudo apt install qttranslations5-l10n -y

# sudo apt install python3-pyqt5 -y
# wget https://launchpad.net/~dupeguru/+archive/ubuntu/ppa/+files/dupeguru_4.1.1-0~ppa~focal1_amd64.deb
wget https://launchpad.net/~dupeguru/+archive/ubuntu/ppa/+files/dupeguru_4.1.1-0~ppa~bionic1_amd64.deb
sudo dpkg -i dupeguru*.deb
rm dupeguru*.deb

