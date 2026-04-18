# InSync (latest) via official apt repo.
# Reference: https://help.insynchq.com/installation-and-setup/linux-installation/
# Key must be fetched via keyserver (the old per-file URL is gone and triggers
# NO_PUBKEY A684470CACCAF35C on apt update).

sudo install -d -m0755 /usr/share/keyrings
sudo gpg --no-default-keyring --keyring /usr/share/keyrings/insync.gpg \
    --keyserver keyserver.ubuntu.com \
    --recv-keys ACCAF35C \
    || wget -qO- https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key \
        | sudo gpg --dearmor --yes -o /usr/share/keyrings/insync.gpg

# Use the current Ubuntu codename; fall back to noble if lsb_release is missing.
INSYNC_CODENAME="$(lsb_release -cs 2>/dev/null || echo noble)"
echo "deb [signed-by=/usr/share/keyrings/insync.gpg] http://apt.insync.io/ubuntu ${INSYNC_CODENAME} non-free contrib" \
    | sudo tee /etc/apt/sources.list.d/insync.list

sudo apt update || true
sudo apt install -y insync insync-nautilus || \
    echo "Skipping insync (no package available for ${INSYNC_CODENAME}/$(dpkg --print-architecture))."
