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

# Dash to Dock + Blur my Shell + User Themes.
#
# Ubuntu 25.10 dropped the `gnome-shell-extension-dashtodock` and
# `gnome-shell-extension-blur-my-shell` packages from the archive, so we
# install them from extensions.gnome.org via `gnome-extensions-cli` (gext).
# User Themes is provided by the `gnome-shell-extensions` meta package
# installed above, so no extra step is needed.
sudo apt install -y pipx || true
pipx ensurepath >/dev/null 2>&1 || true
export PATH="$HOME/.local/bin:$PATH"
pipx install --force gnome-extensions-cli || true

if command -v gext >/dev/null 2>&1; then
    gext install dash-to-dock@micxgx.gmail.com || true
    gext install blur-my-shell@aunetx           || true
    gext enable  user-theme@gnome-shell-extensions.gcampax.github.com || true
    gext enable  dash-to-dock@micxgx.gmail.com  || true
    gext enable  blur-my-shell@aunetx           || true
else
    echo "gext unavailable; install Dash to Dock / Blur my Shell via Extension Manager."
fi

gsettings set org.gnome.desktop.interface show-battery-percentage true
