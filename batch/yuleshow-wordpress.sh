wget https://public-api.wordpress.com/rest/v1.1/desktop/linux/download?type=deb
# https://apps.wordpress.com/d/linux-deb
mv download\?type\=deb wordpress.deb
sudo dpkg -i wordpress.deb
rm wordpress.deb
