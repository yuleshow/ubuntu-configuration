# InSync
# sudo cp ubuntu-configuration/list.d/insync.list /etc/apt/sources.list.d
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
# sudo apt update
# sudo apt install insync insync-nautilus -y


# wget https://d2t3ff60b2tol4.cloudfront.net/builds/insync_3.2.9.40883-focal_amd64.deb
wget https://d2t3ff60b2tol4.cloudfront.net/builds/insync_3.5.3.50123-focal_amd64.deb
sudo dpkg -i insync*.deb
rm insync*.deb
