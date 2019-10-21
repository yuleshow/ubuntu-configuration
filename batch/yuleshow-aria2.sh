# aria2
cd ~
mkdir ~/aria2
cp ubuntu-configuration/aria2/aria2.conf ~/aria2
cp ubuntu-configuration/aria2/aria2.sh ~/aria2
touch ~/aria2/aria2.session
sudo apt install aria2 -y

wget https://github.com/mayswind/AriaNg-DailyBuild/archive/master.zip
unzip master.zip
rm master.zip
