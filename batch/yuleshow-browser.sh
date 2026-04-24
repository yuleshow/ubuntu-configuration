# Install browsers: Google Chrome, Microsoft Edge, Opera, and Tor Browser.
# Each is isolated so a failure in one does not skip the others.

# -------- Google Chrome (amd64 only; Chromium on arm64) --------------------
if [ "$(dpkg --print-architecture)" = "amd64" ]; then
    wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
        && sudo dpkg -i google-chrome-stable_current_amd64.deb \
        && sudo apt-get install -f -y
    rm -f google-chrome-stable_current_amd64.deb
else
    echo "Skipping google-chrome (no arm64 build); installing Chromium instead."
    sudo snap install chromium || sudo apt install -y chromium-browser || true
fi

# -------- Microsoft Edge stable (amd64 only; no arm64 build) ---------------
if [ "$(dpkg --print-architecture)" = "amd64" ]; then
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc \
        | sudo gpg --dearmor --yes -o /usr/share/keyrings/microsoft-edge.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-edge.gpg] https://packages.microsoft.com/repos/edge stable main" \
        | sudo tee /etc/apt/sources.list.d/microsoft-edge.list
    sudo apt update || true
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
        -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
        microsoft-edge-stable || \
        echo "microsoft-edge-stable install failed; continuing."
else
    echo "Skipping microsoft-edge-stable (upstream publishes amd64 only)."
fi

# -------- Opera stable (amd64 only; no arm64 build) -----------------------
if [ "$(dpkg --print-architecture)" = "amd64" ]; then
    wget -qO- https://deb.opera.com/archive.key \
        | sudo gpg --dearmor --yes -o /usr/share/keyrings/opera.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/opera.gpg] https://deb.opera.com/opera-stable/ stable non-free" \
        | sudo tee /etc/apt/sources.list.d/opera-stable.list
    sudo apt update || true
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
        -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
        opera-stable || echo "opera-stable install failed; continuing."
else
    echo "Skipping opera-stable (upstream publishes amd64 only)."
fi

# -------- Tor Browser (via torbrowser-launcher) ----------------------------
# torbrowser-launcher downloads and verifies the official Tor Browser on first run.
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
    -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
    torbrowser-launcher || echo "torbrowser-launcher install failed; continuing."

