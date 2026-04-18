# iPhone / iPad support.
#
# Ubuntu 24.04+ ships current libimobiledevice / ifuse / usbmuxd in apt, so
# no source builds are needed anymore. HEIC -> JPEG is handled by the Python
# tool bin/yuleshow-heif-jpg (Pillow + pillow-heif, installed by
# yuleshow-bin-tools.sh), so libheif CLI tools are optional.

# Tools for mounting the device (Camera Roll via ifuse ~/iPhone).
sudo apt install -y libimobiledevice-utils ifuse usbmuxd

# Create the shared mount point once, owned by the current user.
if [ ! -d /media/iPhone ]; then
    sudo mkdir /media/iPhone
    sudo chown "$USER:$USER" /media/iPhone
    echo "Created /media/iPhone"
fi
