sudo apt install plank -y

# curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
# echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
# sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
# sudo apt update
# sudo apt install albert -y


sudo apt install libmuparser2v5 -y
sudo apt install libqt5concurrent5
sudo apt install libqt5qmlworkerscript5 -y
sudo apt install qml-module-qtquick-window2 -y
sudo apt install qml-module-qtquick2 -y
sudo apt install qml-module-qtgraphicaleffects -y
sudo apt install qml-module-qtqml -y
sudo apt install qml-module-qtqml-models2 -y
sudo apt install qml-module-qtquick-layouts -y
sudo apt install qml-module-qtquick-controls -y

sudo apt install libpython3.9-minimal -y
sudo apt install libpython3.9-stdlib -y
sudo apt install libpython3.9 -y
sudo apt install libkf5webkit-dev -y
sudo apt install libqtquick5 -y
sudo apt install libqt5webkit5-dev -y
sudo apt install qtdeclarative5-dev -y
sudo apt install libqt5quick5-gles -y
sudo apt install libqt5quick5 -y

wget https://download.opensuse.org/repositories/home:/manuelschneid3r/Debian_Unstable/amd64/albert_0.17.2-0_amd64.deb
sudo dpkg -i albert*.deb
rm albert*.deb
