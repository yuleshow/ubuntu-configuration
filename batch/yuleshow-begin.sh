# Initial
sudo apt update
sudo apt upgrade -y
sudo apt install cmake -y
sudo apt install git -y
sudo apt install npm -y
# sudo apt install yum -y
sudo apt install snap -y
sudo apt install curl -y
sudo apt install python3-pip -y
# sudo apt install python-pip -y
sudo apt install automake -y
sudo apt install xz-utils -y # for tar.xz
sudo apt install rar unrar p7zip-full p7zip-rar -y # for other compress/extract

sudo apt install openjdk-13-jre -y

# install the decodes
sudo apt install ubuntu-restricted-extras -y
sudo apt install ubuntu-restricted-addons -y



# make the directories
if [ -d ~/Applications ]
then
    echo "~/Applications already exists"
else
    mkdir ~/Applications
    echo "~/Applications doesn't exist, created one."
fi


git clone https://github.com/yuleshow/ubuntu-configuration.git

# copy bin files
sudo cp ubuntu-configuration/bin/* /usr/local/bin

