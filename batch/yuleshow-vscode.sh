# Visual Studio Code (official Microsoft apt repo, amd64 + arm64)
wget -qO- https://packages.microsoft.com/keys/microsoft.asc \
    | sudo gpg --dearmor --yes -o /usr/share/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" \
    | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update || true
sudo apt install -y code
