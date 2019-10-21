sudo apt-get install virtualbox-guest-additions-iso
mkdir ~/host
sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) yuleshow-share ~/host
