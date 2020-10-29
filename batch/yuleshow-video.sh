wget https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-releases/+files/handbrake-cli_1.3.3.1-zhb-1ppa1~focal1_amd64.deb
wget https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-releases/+files/handbrake-gtk_1.3.3.1-zhb-1ppa1~focal1_amd64.deb
# sudo add-apt-repository ppa:stebbins/handbrake-releases
# sudo apt-get update
# sudo apt-get install handbrake-gtk -y
# sudo apt-get install handbrake-cli -y 
sudo dpkg -i *.deb
sudo rm *.deb
