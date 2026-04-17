# Xtreme Download Manager 8.0.29 (latest release from subhra74/xdm)
XDM_VERSION=8.0.29
wget "https://github.com/subhra74/xdm/releases/download/${XDM_VERSION}/xdm-setup-${XDM_VERSION}.tar.xz"
tar -xvf xdm-setup-${XDM_VERSION}.tar.xz
sudo ./install.sh
rm -f xdm-setup-${XDM_VERSION}.tar.xz install.sh readme.txt
