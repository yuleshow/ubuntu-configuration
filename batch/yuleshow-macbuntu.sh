# wget http://drive.noobslab.com/data/Mac/MacBuntu-Wallpapers.zip

wget http://www.yuleshow.com/files/Macbuntu/MacBuntu-Wallpapers.zip
unzip MacBuntu-Wallpapers.zip
mv MacBuntu-Wallpapers ~/Pictures/
rm MacBuntu-Wallpapers.zip

# sudo add-apt-repository ppa:noobslab/macbuntu -y
# sudo apt-get update
# sudo apt-get install macbuntu-os-icons-v1804 -y
# sudo apt-get install macbuntu-os-ithemes-v1804 -y
# uncomment above 4 lines for version lower than 19.04

wget http://www.yuleshow.com/files/Macbuntu/Macbuntu-themes.tar.gz
sudo tar -xvf Macbuntu-themes.tar.gz --strip 1 -C /usr/share/themes
rm Macbuntu-themes.tar.gz 

wget http://www.yuleshow.com/files/Macbuntu/Macbuntu-icons.tar.gz
sudo tar -xvf Macbuntu-icons.tar.gz --strip 1 -C /usr/share/icons
rm Macbuntu-icons.tar.gz
# for version higher than 19.10, use the above 4 lines
# wget -O mac-fonts.zip http://drive.noobslab.com/data/Mac/macfonts.zip
wget http://www.yuleshow.com/files/Macbuntu/mac-fonts.zip
sudo unzip mac-fonts.zip -d /usr/share/fonts
rm mac-fonts.zip
sudo fc-cache -f -v

# spotlight alternative
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_19.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_19.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
sudo apt-get install albert -y

# plank dock
sudo apt-get install plank -y
wget http://www.yuleshow.com/files/Macbuntu/Macbuntu-plank-themes.tar.gz
sudo tar -xvf Macbuntu-plank-themes.tar.gz --strip 1 -C /usr/share/plank/themes
rm Macbuntu-plank-themes.tar.gz

# sudo apt-get install macbuntu-os-plank-theme-v1804 -y
# above for 18.04

sudo apt remove gnome-shell-extension-ubuntu-dock -y
