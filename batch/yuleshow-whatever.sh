# Whatever
sudo apt install libindicator7 libappindicator1 -y
wget https://sourceforge.net/projects/whatever-evernote-client/files/v1.0.0/Whatever_1.0.0_amd64.deb
sudo dpkg -i Whatever_1.0.0_amd64.deb
rm Whatever_1.0.0_amd64.deb
sudo apt --fix-broken install -y
