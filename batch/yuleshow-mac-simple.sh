sudo apt install plank -y

# curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
# echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
# sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
# sudo apt update
# sudo apt install albert -y


sudo apt install libmuparser2v5 -y
sudo apt install libqt5concurrent5 -y
sudo apt install libqt5qmlworkerscript5 -y
sudo apt install qml-module-qtquick-window2 -y
sudo apt install qml-module-qtquick2 -y
sudo apt install qml-module-qtgraphicaleffects -y
sudo apt install qml-module-qtqml -y
sudo apt install qml-module-qtqml-models2 -y
sudo apt install qml-module-qtquick-layouts -y
sudo apt install qml-module-qtquick-controls -y

# Ubuntu 24.04 (noble) ships Python 3.12.
sudo apt install libpython3.12-minimal -y
sudo apt install libpython3.12-stdlib -y
sudo apt install libpython3.12 -y
sudo apt install qtdeclarative5-dev -y
sudo apt install libqt5quick5 -y

# Albert launcher (latest) from the project's official openSUSE OBS repo for Ubuntu 24.04.
# Reference: https://albertlauncher.github.io/installing/
wget -qO- https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_24.04/Release.key \
    | gpg --dearmor \
    | sudo tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_24.04/ /' \
    | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
sudo apt update
sudo apt install -y albert
