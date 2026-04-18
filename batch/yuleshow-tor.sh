# Install Tor Browser from the upstream tarball into ~/Applications.
# Upstream only publishes x86_64 Linux builds; skip on arm64/other.

TOR_URL="https://www.torproject.org/dist/torbrowser/15.0.9/tor-browser-linux-x86_64-15.0.9.tar.xz"
TOR_ARCHIVE="$(basename "$TOR_URL")"

if [ "$(dpkg --print-architecture)" != "amd64" ]; then
    echo "Skipping Tor Browser: upstream only ships x86_64 Linux tarballs."
    return 0 2>/dev/null || exit 0
fi

mkdir -p "$HOME/Applications"
cd "$HOME/Applications"

wget -q --show-progress "$TOR_URL"
tar -xJf "$TOR_ARCHIVE"
rm -f "$TOR_ARCHIVE"

# Register the bundled launcher with the desktop environment so it shows up
# in the applications menu.
if [ -x "$HOME/Applications/tor-browser/Browser/start-tor-browser" ]; then
    "$HOME/Applications/tor-browser/Browser/start-tor-browser" --register-app
fi
