#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# yuleshow-install.sh — bootstrap installer.
#
# Usage:
#   1. Download JUST this file anywhere (e.g. ~/Downloads/yuleshow-install.sh).
#   2. chmod +x yuleshow-install.sh && ./yuleshow-install.sh
#
# The script clones (or updates) the yuleshow/ubuntu-configuration repo into
# $REPO_DIR (default: ~/ubuntu-configuration) and runs every batch installer
# from that clone — so the directory where you put this file does NOT need
# to contain batch/ or bin/.
# ---------------------------------------------------------------------------

REPO_URL="${REPO_URL:-https://github.com/yuleshow/ubuntu-configuration.git}"
REPO_DIR="${REPO_DIR:-$HOME/ubuntu-configuration}"

# ---------------------------------------------------------------------------
# Logging (tee to a log file; per-step PASS/FAIL summary; never abort on err)
# ---------------------------------------------------------------------------
LOG_FILE="${LOG_FILE:-$HOME/yuleshow-install-$(date +%Y%m%d-%H%M%S).log}"
SUMMARY_FILE="${LOG_FILE%.log}.summary.log"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "=============================================================="
echo " yuleshow-install.sh  started $(date '+%F %T')"
echo " host    : $(hostname)   user: $(whoami)"
echo " repo dir: $REPO_DIR"
echo " log     : $LOG_FILE"
echo " summary : $SUMMARY_FILE"
echo "=============================================================="

run() {
    local label="$1"; shift
    local start end dur rc
    start=$(date +%s)
    echo
    echo "----- [RUN] $label :: $* -----"
    "$@"
    rc=$?
    end=$(date +%s)
    dur=$(( end - start ))
    if [ $rc -eq 0 ]; then
        printf '[PASS] %s  (%ss)  :: %s\n' "$label" "$dur" "$*" | tee -a "$SUMMARY_FILE"
    else
        printf '[FAIL rc=%d] %s  (%ss)  :: %s\n' "$rc" "$label" "$dur" "$*" | tee -a "$SUMMARY_FILE"
    fi
    return $rc
}

finish() {
    echo
    echo "=============================================================="
    echo " Summary ($(date '+%F %T'))"
    echo "=============================================================="
    if [ -f "$SUMMARY_FILE" ]; then
        local pass fail
        pass=$(grep -c '^\[PASS\]' "$SUMMARY_FILE" || true)
        fail=$(grep -c '^\[FAIL'    "$SUMMARY_FILE" || true)
        echo " Total PASS: $pass"
        echo " Total FAIL: $fail"
        if [ "$fail" -gt 0 ]; then
            echo
            echo " Failures:"
            grep '^\[FAIL' "$SUMMARY_FILE" | sed 's/^/   /'
        fi
    fi
    echo " Full log : $LOG_FILE"
    echo " Summary  : $SUMMARY_FILE"
}
trap finish EXIT

# ---------------------------------------------------------------------------
# Unattended mode — make every downstream apt / dpkg / needrestart call
# non-interactive. Applies to every batch/yuleshow-*.sh invoked below.
# ---------------------------------------------------------------------------
export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical
export NEEDRESTART_MODE=a         # auto-restart services
export NEEDRESTART_SUSPEND=1      # suppress the needrestart TUI

# apt / dpkg global defaults: always assume yes, keep existing config files,
# don't use a pty (so output stays log-friendly).
sudo tee /etc/apt/apt.conf.d/99-yuleshow-unattended >/dev/null <<'EOF'
APT::Get::Assume-Yes "true";
APT::Get::Fix-Broken "true";
Dpkg::Use-Pty "0";
Dpkg::Options {
    "--force-confdef";
    "--force-confold";
};
EOF

# Same defaults for bare `dpkg -i …` calls in batch scripts.
sudo tee /etc/dpkg/dpkg.cfg.d/99-yuleshow-unattended >/dev/null <<'EOF'
force-confdef
force-confold
EOF

# needrestart: auto-restart services, skip kernel-upgrade prompt.
if [ -d /etc/needrestart/conf.d ]; then
    sudo tee /etc/needrestart/conf.d/99-yuleshow-unattended.conf >/dev/null <<'EOF'
$nrconf{restart} = 'a';
$nrconf{kernelhints} = 0;
EOF
fi

# Let the env vars above survive `sudo`.
sudo tee /etc/sudoers.d/99-yuleshow-unattended >/dev/null <<'EOF'
Defaults env_keep += "DEBIAN_FRONTEND DEBIAN_PRIORITY NEEDRESTART_MODE NEEDRESTART_SUSPEND"
EOF
sudo chmod 0440 /etc/sudoers.d/99-yuleshow-unattended

# ---------------------------------------------------------------------------
# Prerequisites and repo clone
# ---------------------------------------------------------------------------
run "apt update"                         sudo apt update
run "apt upgrade"                        sudo apt upgrade -y
run "install git"                        sudo apt install git -y
run "install cmake"                      sudo apt install cmake -y
run "install npm"                        sudo apt install npm -y
run "install snap"                       sudo apt install snap -y
run "install curl"                       sudo apt install curl -y
run "install automake"                   sudo apt install automake -y
run "install xz-utils"                   sudo apt install xz-utils -y               # for tar.xz
# 'rar' is non-free and no longer published for 24.04+; keep only the free unpackers.
run "install unrar/7z"                   sudo apt install unrar p7zip-full p7zip-rar -y
run "install openjdk-17-jre"             sudo apt install openjdk-17-jre -y
run "install ubuntu-restricted-addons"   sudo apt install ubuntu-restricted-addons -y
run "install software-properties-common" sudo apt install software-properties-common -y

# ~/Applications
if [ -d "$HOME/Applications" ]; then
    echo "$HOME/Applications already exists"
else
    run "mkdir ~/Applications" mkdir -p "$HOME/Applications"
fi

# Clone or update the repo. From here on, use $REPO_DIR for everything.
if [ -d "$REPO_DIR/.git" ]; then
    run "git pull ubuntu-configuration"  git -C "$REPO_DIR" pull --ff-only
else
    run "git clone ubuntu-configuration" git clone "$REPO_URL" "$REPO_DIR"
fi

# Sanity-check: the clone must contain batch/ before we proceed.
if [ ! -d "$REPO_DIR/batch" ]; then
    echo "[FATAL] $REPO_DIR/batch not found; aborting." | tee -a "$SUMMARY_FILE"
    exit 1
fi

# copy bin files
run "install bin/* -> /usr/local/bin" sudo cp "$REPO_DIR"/bin/* /usr/local/bin

######### above imported from yuleshow-begin.sh
#######################################################

run "python"          "$REPO_DIR"/batch/yuleshow-python.sh
# Install every CLI tool + Python library the bin/yuleshow-* scripts need
# (exiftool, poppler, libheif, Pillow, pillow-heif, pdf2image, opencc, ...).
run "bin-tools"       "$REPO_DIR"/batch/yuleshow-bin-tools.sh
# comment the following line for test the script
run "fonts"           "$REPO_DIR"/batch/yuleshow-fonts.sh
run "flatpak"         "$REPO_DIR"/batch/yuleshow-flatpak.sh
run "emacs"           "$REPO_DIR"/batch/yuleshow-emacs.sh
run "browser"         "$REPO_DIR"/batch/yuleshow-browser.sh
run "filezilla"       "$REPO_DIR"/batch/yuleshow-filezilla.sh
run "insync"          "$REPO_DIR"/batch/yuleshow-insync.sh
run "language"        "$REPO_DIR"/batch/yuleshow-language.sh
# run "teamviewer"    "$REPO_DIR"/batch/yuleshow-teamviewer.sh
# run "wechat"        "$REPO_DIR"/batch/yuleshow-wechat.sh
run "virtualbox"      "$REPO_DIR"/batch/yuleshow-virtualbox.sh
run "cleaner"         "$REPO_DIR"/batch/yuleshow-cleaner.sh
# run "aria2"         "$REPO_DIR"/batch/yuleshow-aria2.sh
run "smartgit"        "$REPO_DIR"/batch/yuleshow-smartgit.sh
run "calibre"         "$REPO_DIR"/batch/yuleshow-calibre.sh
run "baidu"           "$REPO_DIR"/batch/yuleshow-baidu.sh
run "guake"           "$REPO_DIR"/batch/yuleshow-guake.sh
# run "whitesur"      "$REPO_DIR"/batch/yuleshow-whitesur.sh   # moved below gnome (needs User Themes + Dash to Dock)
run "mac-simple"      "$REPO_DIR"/batch/yuleshow-mac-simple.sh
run "gopeed"          "$REPO_DIR"/batch/yuleshow-gopeed.sh
run "kopia"           "$REPO_DIR"/batch/yuleshow-kopia.sh
run "rescuezilla"     "$REPO_DIR"/batch/yuleshow-rescuezilla.sh
run "vscode"          "$REPO_DIR"/batch/yuleshow-vscode.sh
run "wordpress"       "$REPO_DIR"/batch/yuleshow-wordpress.sh

run "gnome"           "$REPO_DIR"/batch/yuleshow-gnome.sh
# WhiteSur must run AFTER gnome (requires User Themes + Dash to Dock extensions).
run "whitesur"        "$REPO_DIR"/batch/yuleshow-whitesur.sh
# run "dupeguru"      "$REPO_DIR"/batch/yuleshow-dupeguru.sh
run "audio"           "$REPO_DIR"/batch/yuleshow-audio.sh
run "tools"           "$REPO_DIR"/batch/yuleshow-tools.sh

# run "crossover"     "$REPO_DIR"/batch/yuleshow-crossover.sh   # disabled by request
run "telegram"        "$REPO_DIR"/batch/yuleshow-telegram.sh
run "pdf"             "$REPO_DIR"/batch/yuleshow-pdf.sh

# run "freefilesync"  "$REPO_DIR"/batch/yuleshow-freefilesync.sh
run "goldendict"      "$REPO_DIR"/batch/yuleshow-goldendict.sh
run "postit"          "$REPO_DIR"/batch/yuleshow-postit.sh
run "gdm-background"  "$REPO_DIR"/batch/yuleshow-gdm-background.sh
# comment the following line for test the script
run "iphone"          "$REPO_DIR"/batch/yuleshow-iphone.sh
run "video"           "$REPO_DIR"/batch/yuleshow-video.sh

# final
run "final"           "$REPO_DIR"/batch/yuleshow-final.sh
