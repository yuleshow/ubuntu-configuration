# wget https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-releases/+files/handbrake-cli_1.3.3.1-zhb-1ppa1~focal1_amd64.deb
# wget https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-releases/+files/handbrake-gtk_1.3.3.1-zhb-1ppa1~focal1_amd64.deb
# # sudo add-apt-repository ppa:stebbins/handbrake-releases
# # sudo apt-get update
# # sudo apt-get install handbrake-gtk -y
# # sudo apt-get install handbrake-cli -y 
# sudo dpkg -i *.deb
# sudo rm *.deb


# flatpak install flathub fr.handbrake.ghb
sudo apt install gstreamer1.0-plugins-bad-videoparsers -y
sudo apt install gstreamer1.0-plugins-bad -y
# sudo apt install gstreamer1.0-plugins-bad-faad -y
sudo apt install mpegdemux -y
sudo apt install youtube-dl -y
sudo apt install ffmpeg -y
# snap install playlist-dl

~/ubuntu-configuration/batch/yuleshow-vlc.sh
~/ubuntu-configuration/batch/yuleshow-clipgrab.sh

sudo add-apt-repository ppa:ozmartian/apps -y
sudo apt install vidcutter -y


sudo apt install mkvtoolnix -y
sudo apt install mkvtoolnix-gui -y
sudo cp ~/ubuntu-configuration/bin/batch_convert.sh /usr/local/bin
