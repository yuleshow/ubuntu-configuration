# sudo apt-get install virtualbox-guest-additions-iso -y
# mkdir ~/Desktop/master-client
sudo umount /home/yuleshow/Desktop/master-client
sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) yuleshow-share ~/Desktop/master-client
