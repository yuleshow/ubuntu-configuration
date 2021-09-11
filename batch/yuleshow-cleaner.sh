# wget https://launchpad.net/~gerardpuig/+archive/ubuntu/ppa/+files/ubuntu-cleaner_1.0.4-1_all.deb
# sudo apt install ./ubuntu-cleaner_1.0.4-1_all.deb
# rm ubuntu-cleaner_1.0.4-1_all.deb
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:gerardpuig/ppa -y
sudo apt update
sudo apt install ubuntu-cleaner -y
