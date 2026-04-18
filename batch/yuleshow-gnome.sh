sudo apt-get install chrome-gnome-shell -y
sudo apt install gnome-tweaks -y
sudo apt install gnome-panel -y
sudo apt install gnome-shell-extensions -y
sudo apt install gnome-sushi -y

# Extension Manager (GNOME Shell) — the actively-maintained GUI for
# discovering/installing/updating extensions from extensions.gnome.org.
# Upstream: https://github.com/mjakeman/extension-manager
sudo apt install -y gnome-shell-extension-manager \
    || flatpak install -y flathub com.mattjakeman.ExtensionManager \
    || true

gsettings set org.gnome.desktop.interface show-battery-percentage true
