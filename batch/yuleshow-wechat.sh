# First way
# # WeChat
# # Clone this repository
# git clone https://github.com/geeeeeeeeek/electronic-wechat.git
# # Go into the repository
# cd electronic-wechat
# # Install dependencies and run the app
# npm install && npm start


# Second way
# cd ~
# wget https://github.com/geeeeeeeeek/electronic-wechat/releases/download/V2.0/linux-x64.tar.gz
# tar -zxvf linux-x64.tar.gz
# mv electronic-wechat-linux-x64/ ~/Applications/
# sudo cp ~/ubuntu-configuration/desktops/wechat.desktop /usr/share/applications/
# rm linux-x64.tar.gz

# Third way, can't input Chinese with iBus
# sudo snap install electronic-wechat

# Forth way, again

if [ -d ~/Applications ]
then
    echo "~/Applications already exists"
else
    mkdir ~/Applications
    echo "~/Applications doesn't exist, created one."
fi
cd ~/Applications
wget http://www.yuleshow.com/files/ubuntu/wechat.tar.gz
tar -zxvf wechat.tar.gz
# sudo mv opt/electronic-wechat-linux-x64 /opt
sudo cp ~/ubuntu-configuration/desktops/wechat.desktop /usr/share/applications/
rm wechat.tar.gz
# rmdir opt
