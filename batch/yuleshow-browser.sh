# Install three browsers: Google Chrome, Microsoft Edge, and Tor Browser.
# Each is isolated so a failure in one does not skip the others.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# -------- Google Chrome (amd64 only) ---------------------------------------
if [ "$(dpkg --print-architecture)" = "amd64" ]; then
    wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
        && sudo dpkg -i google-chrome-stable_current_amd64.deb \
        && sudo apt-get install -f -y
    rm -f google-chrome-stable_current_amd64.deb
else
    echo "Skipping google-chrome (no arm64 build); Edge + Chromium cover that slot."
fi

# -------- Microsoft Edge stable (amd64 only; no arm64 build) ---------------
if [ "$(dpkg --print-architecture)" = "amd64" ]; then
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc \
        | sudo gpg --dearmor --yes -o /usr/share/keyrings/microsoft-edge.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-edge.gpg] https://packages.microsoft.com/repos/edge stable main" \
        | sudo tee /etc/apt/sources.list.d/microsoft-edge.list
    sudo apt update || true
    sudo apt install -y microsoft-edge-stable || \
        echo "microsoft-edge-stable install failed; continuing."
else
    echo "Skipping microsoft-edge-stable (upstream publishes amd64 only); installing Chromium instead."
    sudo snap install chromium || sudo apt install -y chromium-browser || true
fi

# -------- Tor Browser (via torbrowser-launcher) ----------------------------
"$SCRIPT_DIR"/yuleshow-tor.sh

