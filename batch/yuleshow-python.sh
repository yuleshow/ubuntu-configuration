# ---------------------------------------------------------------------------
# yuleshow-python.sh
#
# Python 3 runtime + a dedicated virtualenv for every script under
# ~/ubuntu-configuration/bin/yuleshow-*.
#
# Why a venv (not `pip install --user --break-system-packages`):
#   * Ubuntu 23.04+ marks system Python as externally-managed (PEP 668).
#   * Pinning all deps inside one venv avoids clashes with apt-installed
#     python3-* packages and with other tools installed via pipx.
#
# Layout:
#   venv interpreter   : $HOME/.local/share/yuleshow-venv/bin/python3
#   launcher copies    : $HOME/.local/bin/yuleshow-*          (shebang
#                        rewritten to point at the venv interpreter)
#
# Library → consumers (import name in parens when different):
#   Pillow                → rename, rename-folder, mahjong,
#                           avif2jpg, heif-jpg               (PIL)
#   pillow-avif-plugin    → yuleshow-avif2jpg                (pillow_avif)
#   pillow-heif           → yuleshow-heif-jpg                (pillow_heif)
#   pdf2image             → yuleshow-pdf2jpg (+ poppler-utils OS)
#   opencc                → yuleshow-tags-c2t
#   lunarcalendar         → yuleshow-lunar-folder-rename
#   exif                  → yuleshow-rename-original
#   exifread              → yuleshow-rename-exifread,
#                           yuleshow-rename-folder-exifread
#   pyexiv2               → yuleshow-get-tags, yuleshow-tags-c2t
#   chardet               → misc encoding helpers
# ---------------------------------------------------------------------------
set -e

VENV_PATH="$HOME/.local/share/yuleshow-venv"
LOCAL_BIN="$HOME/.local/bin"
REPO_BIN="$HOME/ubuntu-configuration/bin"

# --- System Python + native build deps ------------------------------------
# libexiv2-dev  : required to build pyexiv2 from source
# libheif-dev   : required by pillow-heif wheels that fall back to source
# poppler-utils : pdf2image shells out to pdftoppm / pdftocairo
echo "Installing Python interpreter and native build dependencies..."
sudo apt update
sudo apt install -y \
    python3 \
    python3-dev \
    python3-venv \
    python3-tk \
    libexiv2-dev \
    libheif-dev \
    poppler-utils

# --- Create / refresh the venv --------------------------------------------
if [ ! -x "$VENV_PATH/bin/python3" ]; then
    echo "Creating virtualenv at $VENV_PATH..."
    mkdir -p "$(dirname "$VENV_PATH")"
    python3 -m venv "$VENV_PATH"
fi

"$VENV_PATH/bin/python3" -m pip install --upgrade pip

PY_PKGS=(
    "Pillow"
    "pillow-avif-plugin"
    "pillow-heif"
    "pdf2image"
    "opencc"
    "lunarcalendar"
    "exif"
    "exifread"
    "pyexiv2"
    "chardet"
)

echo "Installing Python libraries into the venv..."
"$VENV_PATH/bin/python3" -m pip install --upgrade "${PY_PKGS[@]}"

# --- Rewrite shebangs of bin/yuleshow-* scripts in place ------------------
# The scripts under the repo's bin/ folder ship with `#!/usr/bin/env python3`,
# which resolves to the system interpreter and can't see the venv's libs.
# We rewrite each Python script's shebang to point directly at the venv
# interpreter so the user can run them straight from the repo (or from a
# symlink in ~/.local/bin) without any PATH juggling. Non-Python scripts
# are left alone. This modifies the working copy on purpose - commit the
# resulting shebang changes if you want the whole machine to stay in sync.
echo "Rewriting Python shebangs in $REPO_BIN to use the venv..."
VENV_SHEBANG="#!$VENV_PATH/bin/python3"

if [ -d "$REPO_BIN" ]; then
    for src in "$REPO_BIN"/yuleshow-*; do
        [ -f "$src" ] || continue
        first_line=$(head -n 1 "$src")
        case "$first_line" in
            "#!"*python*)
                if [ "$first_line" != "$VENV_SHEBANG" ]; then
                    # Write new shebang + original body through a temp file
                    # so we don't truncate the script mid-read.
                    tmp=$(mktemp)
                    {
                        printf '%s\n' "$VENV_SHEBANG"
                        tail -n +2 "$src"
                    } > "$tmp"
                    cat "$tmp" > "$src"
                    rm -f "$tmp"
                fi
                ;;
        esac
        chmod +x "$src"
    done
fi

# --- Symlink bin/yuleshow-* into ~/.local/bin so they are on PATH ---------
echo "Symlinking launchers into $LOCAL_BIN..."
mkdir -p "$LOCAL_BIN"
for src in "$REPO_BIN"/yuleshow-*; do
    [ -f "$src" ] || continue
    ln -sf "$src" "$LOCAL_BIN/$(basename "$src")"
done

# --- Ensure ~/.local/bin is on PATH ---------------------------------------
case "$SHELL" in
    */zsh)  PROFILE="$HOME/.zshrc"   ;;
    */bash) PROFILE="$HOME/.bashrc"  ;;
    *)      PROFILE="$HOME/.profile" ;;
esac
LINE='export PATH="$HOME/.local/bin:$PATH"'
if [ -f "$PROFILE" ] && ! grep -qF "$LINE" "$PROFILE"; then
    echo "$LINE" >> "$PROFILE"
    echo "Added ~/.local/bin to PATH in $PROFILE"
fi

echo "Python venv ready at $VENV_PATH; repo bin/ scripts now point at it."
