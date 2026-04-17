sudo apt install cinnamon -y

# Fetch the latest mint-themes/-x-icons/-y-icons from packages.linuxmint.com (wilma, Mint 22).
mkdir -p ~/mint-themes
cd ~/mint-themes

base="http://packages.linuxmint.com/pool/main/m"
for pkg in mint-x-icons mint-y-icons mint-themes; do
    # Grab the newest available .deb for each package (sorted lexicographically is good enough here)
    latest=$(curl -s "${base}/${pkg}/" | grep -oE "${pkg}_[0-9][^\"]*_all\.deb" | sort -V | tail -1)
    if [ -n "${latest}" ]; then
        wget "${base}/${pkg}/${latest}"
    fi
done

sudo dpkg -i mint-x-icons_*.deb mint-y-icons_*.deb mint-themes_*.deb || sudo apt --fix-broken install -y
cd ..
sudo rm -rf mint-themes/
