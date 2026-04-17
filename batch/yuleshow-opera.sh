# Opera (latest stable) via the official apt repo for Ubuntu 24.04 (noble)
# Reference: https://www.opera.com/download

wget -qO- https://deb.opera.com/archive.key \
    | sudo gpg --dearmor --yes -o /usr/share/keyrings/opera.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/opera.gpg] https://deb.opera.com/opera-stable/ stable non-free" \
    | sudo tee /etc/apt/sources.list.d/opera-stable.list

sudo apt update
sudo apt install -y opera-stable
