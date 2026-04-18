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
sudo apt install mpegdemux -y
# youtube-dl is unmaintained; yt-dlp is the community-maintained successor.
sudo apt install yt-dlp -y
sudo apt install ffmpeg -y
# snap install playlist-dl

~/ubuntu-configuration/batch/yuleshow-vlc.sh
# ClipGrab is unmaintained (last release 2021, AppImage URL is now 404);
# yt-dlp above covers the same use case.
# ~/ubuntu-configuration/batch/yuleshow-clipgrab.sh

# VidCutter PPA has no builds for 24.04+ on launchpad; try flatpak/snap instead.
# sudo add-apt-repository ppa:ozmartian/apps -y
# sudo apt install vidcutter -y
sudo snap install vidcutter || flatpak install -y flathub com.ozmartians.VidCutter || true


sudo apt install mkvtoolnix -y
sudo apt install mkvtoolnix-gui -y
sudo cp ~/ubuntu-configuration/bin/batch_convert.sh /usr/local/bin
