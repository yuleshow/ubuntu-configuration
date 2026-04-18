# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo dpkg -i google-chrome*
sudo apt-get install -f
rm google-chrome-stable_current_amd64.deb


# Microsoft Edge (stable) via the official Microsoft apt repo.
# Reference: https://learn.microsoft.com/en-us/linux/install
wget -qO- https://packages.microsoft.com/keys/microsoft.asc \
    | sudo gpg --dearmor --yes -o /usr/share/keyrings/microsoft-edge.gpg
echo "deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/microsoft-edge.gpg] https://packages.microsoft.com/repos/edge stable main" \
    | sudo tee /etc/apt/sources.list.d/microsoft-edge.list
sudo apt update
sudo apt install -y microsoft-edge-stable


# opera
# wget https://download3.operacdn.com/pub/opera/desktop/77.0.4054.277/linux/opera-stable_77.0.4054.277_amd64.deb
# wget https://download3.operacdn.com/pub/opera/desktop/78.0.4093.112/linux/opera-stable_78.0.4093.112_amd64.deb
# sudo dpkg -i opera-stable*.deb
# sudo apt install -f
# rm opera-stable*.deb

# ~/ubuntu-configuration/batch/yuleshow-opera.sh

~/ubuntu-configuration/batch/yuleshow-tor.sh
