#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# yuleshow-gnome.sh
#
# GNOME desktop setup:
#   * core tools   : Tweaks, Extension Manager, Sushi (space-bar preview),
#                    User Themes (via gnome-shell-extensions)
#   * extensions   : Dash to Dock, Blur my Shell, Vitals, Lunar Calendar
#   * UI tweaks    : battery %, weekday in clock, night light, locate pointer
#   * power policy : performance profile when the hardware supports it
#
# Ubuntu 25.10 dropped the `gnome-shell-extension-dashtodock` /
# `gnome-shell-extension-blur-my-shell` archive packages, so extensions are
# installed from extensions.gnome.org via `gnome-extensions-cli` (`gext`).
#
# `|| true` is used on extension + gsettings calls so the script still
# completes on headless / non-GNOME sessions where those operations fail.
# ---------------------------------------------------------------------------
set -e

# --- Core GNOME packages ---------------------------------------------------
# gnome-shell-extensions ships the User Themes extension (needed by the
# MacTahoe shell theme), so no extra install step is required for it.
sudo apt update
sudo apt install -y \
    gnome-tweaks \
    gnome-shell-extension-manager \
    gnome-sushi \
    gnome-shell-extensions

# --- Install gnome-extensions-cli (gext) via pipx --------------------------
# pipx gives us an isolated venv for the CLI tool without touching system
# Python. $HOME/.local/bin must be on PATH for this shell to see `gext`.
sudo apt install -y pipx || true
pipx ensurepath >/dev/null 2>&1 || true
export PATH="$HOME/.local/bin:$PATH"
pipx install --force gnome-extensions-cli || true

# Allow extensions built for older shell versions to load (avoids "outdated"
# errors on fresh Ubuntu releases where extensions haven't caught up yet).
gsettings set org.gnome.shell disable-extension-version-validation true

# --- Install + enable extensions ------------------------------------------
# Extension UUIDs (stable identifiers used by extensions.gnome.org).
EXTENSIONS=(
    "dash-to-dock@micxgx.gmail.com"
    "blur-my-shell@aunetx"
    "Vitals@CoreCoding.com"
    "lunarcal@ailin.nemui"
)
# User Themes is already installed by the gnome-shell-extensions package;
# it just needs enabling.
USER_THEMES_UUID="user-theme@gnome-shell-extensions.gcampax.github.com"

if command -v gext >/dev/null 2>&1; then
    for uuid in "${EXTENSIONS[@]}"; do
        gext install "$uuid" || true
        gext enable  "$uuid" || true
    done
    gext enable "$USER_THEMES_UUID" || true
else
    echo "gext unavailable; install extensions manually via Extension Manager."
fi

# --- Lunar Calendar extension fix -----------------------------------------
# The `lunarcal@ailin.nemui` extension depends on the separate
# `ChineseCalendar` JS library (hosted at
# https://gitlab.gnome.org/Nei/ChineseCalendar) which is not bundled with
# the extension on extensions.gnome.org. It also lags behind current GNOME
# releases, so its metadata.json shell-version list needs patching. Steps:
#   1. fetch + install the ChineseCalendar library (install.sh drops files
#      into ~/.local/share/ChineseCalendar)
#   2. symlink the backend JS files into the extension's backend dir
#   3. inject the current GNOME major version into metadata.json
#   4. re-enable the extension via gext
# Guarded so the script keeps going on non-GNOME / offline sessions.
LUNARCAL_EXT_ID="lunarcal@ailin.nemui"
LUNARCAL_EXT_DIR="$HOME/.local/share/gnome-shell/extensions/$LUNARCAL_EXT_ID"
LUNARCAL_LIB_DIR="$HOME/.local/share/ChineseCalendar"
LUNARCAL_LIB_VERSION="20250205"
LUNARCAL_LIB_URL="https://gitlab.gnome.org/Nei/ChineseCalendar/-/archive/${LUNARCAL_LIB_VERSION}/ChineseCalendar-${LUNARCAL_LIB_VERSION}.tar.gz"

if [ -d "$LUNARCAL_EXT_DIR" ]; then
    echo "Installing ChineseCalendar backend library for lunarcal..."
    LUNARCAL_TMP=$(mktemp -d)
    if wget -q --show-progress -O "$LUNARCAL_TMP/lib.tar.gz" "$LUNARCAL_LIB_URL"; then
        tar -xzf "$LUNARCAL_TMP/lib.tar.gz" -C "$LUNARCAL_TMP" --strip-components=1
        if [ -x "$LUNARCAL_TMP/install.sh" ]; then
            ( cd "$LUNARCAL_TMP" && ./install.sh ) || true
        else
            chmod +x "$LUNARCAL_TMP/install.sh" 2>/dev/null || true
            ( cd "$LUNARCAL_TMP" && ./install.sh ) || true
        fi
    else
        echo "Failed to download ChineseCalendar library; skipping lunarcal patch."
    fi
    rm -rf "$LUNARCAL_TMP"

    if [ -d "$LUNARCAL_LIB_DIR" ]; then
        echo "Patching lunarcal extension backend symlinks..."
        mkdir -p "$LUNARCAL_EXT_DIR/backend"
        ln -sf "$LUNARCAL_LIB_DIR/calendar.js"     "$LUNARCAL_EXT_DIR/backend/ChineseCalendar.js"
        ln -sf "$LUNARCAL_LIB_DIR/calendarData.js" "$LUNARCAL_EXT_DIR/backend/calendarData.js"
        ln -sf "$LUNARCAL_LIB_DIR/utilities.js"    "$LUNARCAL_EXT_DIR/backend/utilities.js"

        if command -v gnome-shell >/dev/null 2>&1 && [ -f "$LUNARCAL_EXT_DIR/metadata.json" ]; then
            GNOME_VER=$(gnome-shell --version | grep -oE '[0-9]+' | head -1)
            if [ -n "$GNOME_VER" ] && ! grep -q "\"$GNOME_VER\"" "$LUNARCAL_EXT_DIR/metadata.json"; then
                echo "Adding GNOME $GNOME_VER to lunarcal metadata.json..."
                sed -i "s/\"shell-version\": \[/\"shell-version\": [ \"$GNOME_VER\", /" \
                    "$LUNARCAL_EXT_DIR/metadata.json"
            fi
        fi

        command -v gext >/dev/null 2>&1 && gext enable "$LUNARCAL_EXT_ID" || true
        echo "Lunar calendar patched. Log out and back in, then enable 'Show Lunar in Panel' in extension settings."
    fi
fi

# --- Desktop UI tweaks -----------------------------------------------------
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-show-weekday       true
gsettings set org.gnome.desktop.interface locate-pointer           true
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

