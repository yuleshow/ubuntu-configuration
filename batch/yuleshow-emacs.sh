#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# yuleshow-emacs.sh
#
# Install GNU Emacs (from the Ubuntu archive) and wire up ~/.emacs.d to the
# personal config repo yuleshow/yuleshow-new-emacs.
#
# Idempotent: safe to re-run. Existing config is preserved as ~/.emacs.d.bak
# on first run; subsequent runs just `git pull` the repo.
# ---------------------------------------------------------------------------
set -euo pipefail

REPO_URL="https://github.com/yuleshow/yuleshow-new-emacs.git"
REPO_DIR="$HOME/yuleshow-new-emacs"
BACKUP_ROOT="$HOME/yuleshow-emacs-backup"

# --- Install Emacs + git ---------------------------------------------------
# DEBIAN_FRONTEND=noninteractive avoids the tzdata/keyboard prompts that the
# `emacs` meta package can pull in on a fresh system.
sudo apt update
sudo apt install -y git
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y emacs

# ---------------------------------------------------------------------------
# Optional: build Emacs from source instead of using apt. Uncomment the whole
# block to use. The -dev packages live here (not above) so they're only
# pulled when actually building.
# ---------------------------------------------------------------------------
# EMACS_VER=30.1
# sudo apt install -y \
#     autoconf cmake build-essential texinfo \
#     libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev \
#     libgtk2.0-dev libgtk-3-dev libncurses-dev gnutls-dev
# tmp="$(mktemp -d)"
# (
#     cd "$tmp"
#     wget "https://ftp.gnu.org/gnu/emacs/emacs-${EMACS_VER}.tar.gz"
#     tar -zxf "emacs-${EMACS_VER}.tar.gz"
#     cd "emacs-${EMACS_VER}"
#     ./autogen.sh
#     ./configure
#     make -j"$(nproc)"
#     sudo make install
# )
# rm -rf "$tmp"

# --- Clone (or update) the config repo -------------------------------------
if [ -d "$REPO_DIR/.git" ]; then
    echo "$REPO_DIR already exists; pulling latest..."
    git -C "$REPO_DIR" pull --ff-only || true
else
    git clone "$REPO_URL" "$REPO_DIR"
fi

# --- Symlink ~/.emacs.d -> $REPO_DIR ---------------------------------------
# Modern Emacs looks at ~/.emacs.d/init.el for everything (packages, themes,
# auto-saves). Point it at the repo so edits there are picked up live.
if [ -L "$HOME/.emacs.d" ]; then
    # Existing symlink (possibly stale) — replace unconditionally.
    echo "~/.emacs.d is a symlink -> $(readlink "$HOME/.emacs.d"); replacing."
    rm "$HOME/.emacs.d"
elif [ -d "$HOME/.emacs.d" ]; then
    # Real directory — back it up so we never destroy existing config.
    echo "~/.emacs.d is a directory; backing up to ~/.emacs.d.bak"
    rm -rf "$HOME/.emacs.d.bak"
    mv "$HOME/.emacs.d" "$HOME/.emacs.d.bak"
fi
ln -s "$REPO_DIR" "$HOME/.emacs.d"
echo "Created symlink: ~/.emacs.d -> $REPO_DIR"

# --- Backup / auto-save directories ---------------------------------------
# The Emacs config is expected to redirect backups + auto-saves here so the
# project tree stays clean.
mkdir -p "$BACKUP_ROOT/backups" \
         "$BACKUP_ROOT/auto-save" \
         "$BACKUP_ROOT/auto-save-list"
echo "Ensured $BACKUP_ROOT/ exists"

echo "Done! Start Emacs to use your new configuration."
