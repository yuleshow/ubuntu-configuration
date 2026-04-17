# make the directories
if [ -d ~/Applications ]
then
    echo "~/Applications already exists"
else
    mkdir ~/Applications
    echo "~/Applications doesn't exist, created one."
fi

# Use torbrowser-launcher from the official Ubuntu 24.04 (noble) universe repo.
# It downloads/verifies/updates Tor Browser automatically - much more robust than pinning a version.
sudo apt install -y torbrowser-launcher

# First run will fetch the current Tor Browser; no wget/desktop-file copy needed.
