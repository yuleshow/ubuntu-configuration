# Calibre official installer. Do not rely on `sudo -v` (it fails under an
# already-rooted non-interactive shell); pipe straight to sudo sh.
wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh \
    | sudo env PATH="$PATH" sh /dev/stdin isolated=y


# if [ -d ~/Applications ]
# then
#     echo "~/Applications already exists"
# else
#     mkdir ~/Applications
#     echo "~/Applications doesn't exist, created one."
# fi

# cd ~/Applications
# mkdir calibre4
# cd calibre4
# wget http://www.yuleshow.com/files/ubuntu/calibre-4.23.0-x86_64.txz
# tar xvf calibre-4.23.0-x86_64.txz
# sudo cp ~/ubuntu-configuration/desktops/calibre4.desktop /usr/share/applications
# rm calibre-4.23.0-x86_64.txz


