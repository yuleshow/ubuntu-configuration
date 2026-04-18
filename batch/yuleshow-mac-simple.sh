sudo apt install plank -y

# curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
# echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
# sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
# sudo apt update
# sudo apt install albert -y


sudo apt install libmuparser2v5 -y
sudo apt install libqt5concurrent5 -y
sudo apt install libqt5qmlworkerscript5 -y
sudo apt install qml-module-qtquick-window2 -y
sudo apt install qml-module-qtquick2 -y
sudo apt install qml-module-qtgraphicaleffects -y
sudo apt install qml-module-qtqml -y
sudo apt install qml-module-qtqml-models2 -y
sudo apt install qml-module-qtquick-layouts -y
sudo apt install qml-module-qtquick-controls -y

# Ubuntu 24.04 (noble) ships Python 3.12.
sudo apt install libpython3.12-minimal -y
sudo apt install libpython3.12-stdlib -y
sudo apt install libpython3.12 -y
sudo apt install qtdeclarative5-dev -y
sudo apt install libqt5quick5 -y

# Albert launcher. Prefer the Ubuntu universe package (available on 24.04+);
# fall back to the openSUSE OBS build for the closest matching Ubuntu release.
if ! sudo apt install -y albert; then
    UBU_VER="$(lsb_release -rs 2>/dev/null || echo 24.04)"
    # OBS publishes xUbuntu_22.04 / 24.04 / 25.04. Pick the newest <= current.
    case "$UBU_VER" in
        25.*|26.*) OBS_SERIES=xUbuntu_25.04 ;;
        24.*)      OBS_SERIES=xUbuntu_24.04 ;;
        *)         OBS_SERIES=xUbuntu_22.04 ;;
    esac
    wget -qO- "https://download.opensuse.org/repositories/home:manuelschneid3r/${OBS_SERIES}/Release.key" \
        | gpg --dearmor \
        | sudo tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null
    echo "deb http://download.opensuse.org/repositories/home:/manuelschneid3r/${OBS_SERIES}/ /" \
        | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
    sudo apt update || true
    sudo apt install -y albert || echo "Skipping albert (no build for ${OBS_SERIES})."
fi
