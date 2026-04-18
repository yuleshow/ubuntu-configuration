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

# Dash to Dock — macOS/Unity-style dock. Ubuntu ships the Ubuntu-Dock fork by
# default; this installs the upstream extension so it can be toggled/configured
# from Extension Manager.
sudo apt install -y gnome-shell-extension-dashtodock || true

# Blur my Shell — translucent blur for panel/overview/dash.
# Upstream: https://github.com/aunetx/blur-my-shell
sudo apt install -y gnome-shell-extension-blur-my-shell || true

# User Themes — required to apply custom shell themes (e.g. WhiteSur).
sudo apt install -y gnome-shell-extensions \
    gnome-shell-extension-manager \
    gnome-shell-extension-prefs 2>/dev/null || true
# The shipped 'gnome-shell-extensions' meta already provides user-theme on
# Ubuntu 24.04; on older/leaner installs fall back to the standalone package.
sudo apt install -y gnome-shell-extension-user-theme 2>/dev/null || true

gsettings set org.gnome.desktop.interface show-battery-percentage true
