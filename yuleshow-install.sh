#!/usr/bin/env bash
# Resolve the directory of this script so the batch/ calls below work no
# matter the current working directory (and even when invoked via sudo).
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ---------------------------------------------------------------------------
# Logging
# ---------------------------------------------------------------------------
# All output (stdout + stderr) goes to the terminal AND to a log file.
# Each wrapped command also emits a PASS/FAIL summary line with its exit code
# and duration, so you can grep the log afterwards to see what broke.
#
#   LOG_FILE env var overrides the default location.
#   Default: ~/yuleshow-install-YYYYmmdd-HHMMSS.log
# ---------------------------------------------------------------------------
LOG_FILE="${LOG_FILE:-$HOME/yuleshow-install-$(date +%Y%m%d-%H%M%S).log}"
SUMMARY_FILE="${LOG_FILE%.log}.summary.log"

# Mirror everything (stdout + stderr) to the log file.
exec > >(tee -a "$LOG_FILE") 2>&1

echo "=============================================================="
echo " yuleshow-install.sh  started $(date '+%F %T')"
echo " host: $(hostname)   user: $(whoami)"
echo " log : $LOG_FILE"
echo " summary: $SUMMARY_FILE"
echo "=============================================================="

# run <label> <command...>
# Executes the command, records PASS/FAIL (with exit code + duration) to both
# the full log and a short summary file. Never aborts the installer on error.
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

# At exit, print a compact summary so the operator sees failures at a glance.
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
# begin
# "$SCRIPT_DIR"/batch/yuleshow-begin.sh
# ---------------------------------------------------------------------------

# Initial
run "apt update"                         sudo apt update
run "apt upgrade"                        sudo apt upgrade -y
run "install cmake"                      sudo apt install cmake -y
run "install git"                        sudo apt install git -y
run "install npm"                        sudo apt install npm -y
# run "install yum"                      sudo apt install yum -y
run "install snap"                       sudo apt install snap -y
run "install curl"                       sudo apt install curl -y

# run "install python-pip"               sudo apt install python-pip -y
run "install automake"                   sudo apt install automake -y
run "install xz-utils"                   sudo apt install xz-utils -y               # for tar.xz
run "install rar/7z"                     sudo apt install rar unrar p7zip-full p7zip-rar -y

run "install openjdk-17-jre"             sudo apt install openjdk-17-jre -y

# install the decodes
# run "install ubuntu-restricted-extras" sudo apt install ubuntu-restricted-extras -y
run "install ubuntu-restricted-addons"   sudo apt install ubuntu-restricted-addons -y
run "install software-properties-common" sudo apt install software-properties-common -y


# make the directories
if [ -d ~/Applications ]; then
    echo "~/Applications already exists"
else
    run "mkdir ~/Applications" mkdir ~/Applications
fi

run "git clone ubuntu-configuration"  git clone https://github.com/yuleshow/ubuntu-configuration.git

# copy bin files
run "install bin/* -> /usr/local/bin" sudo cp "$SCRIPT_DIR"/bin/* /usr/local/bin


######### above imported from yuleshow-begin.sh
#######################################################

run "python"          "$SCRIPT_DIR"/batch/yuleshow-python.sh
# Install every CLI tool + Python library the bin/yuleshow-* scripts need
# (exiftool, poppler, libheif, Pillow, pillow-heif, pdf2image, opencc, ...).
run "bin-tools"       "$SCRIPT_DIR"/batch/yuleshow-bin-tools.sh
# comment the following line for test the script
run "fonts"           "$SCRIPT_DIR"/batch/yuleshow-fonts.sh
run "flatpak"         "$SCRIPT_DIR"/batch/yuleshow-flatpak.sh
run "emacs"           "$SCRIPT_DIR"/batch/yuleshow-emacs.sh
run "browser"         "$SCRIPT_DIR"/batch/yuleshow-browser.sh
run "filezilla"       "$SCRIPT_DIR"/batch/yuleshow-filezilla.sh
run "insync"          "$SCRIPT_DIR"/batch/yuleshow-insync.sh
run "language"        "$SCRIPT_DIR"/batch/yuleshow-language.sh
# run "teamviewer"    "$SCRIPT_DIR"/batch/yuleshow-teamviewer.sh
# run "wechat"        "$SCRIPT_DIR"/batch/yuleshow-wechat.sh
run "virtualbox"      "$SCRIPT_DIR"/batch/yuleshow-virtualbox.sh
run "cleaner"         "$SCRIPT_DIR"/batch/yuleshow-cleaner.sh
run "whatever"        "$SCRIPT_DIR"/batch/yuleshow-whatever.sh
# run "aria2"         "$SCRIPT_DIR"/batch/yuleshow-aria2.sh
run "smartgit"        "$SCRIPT_DIR"/batch/yuleshow-smartgit.sh
run "rename"          "$SCRIPT_DIR"/batch/yuleshow-rename.sh
run "calibre"         "$SCRIPT_DIR"/batch/yuleshow-calibre.sh
run "baidu"           "$SCRIPT_DIR"/batch/yuleshow-baidu.sh
run "guake"           "$SCRIPT_DIR"/batch/yuleshow-guake.sh
# run "whitesur"      "$SCRIPT_DIR"/batch/yuleshow-whitesur.sh   # replaces the old macbuntu stack
run "mac-simple"      "$SCRIPT_DIR"/batch/yuleshow-mac-simple.sh
run "xdm"             "$SCRIPT_DIR"/batch/yuleshow-xdm.sh
run "wordpress"       "$SCRIPT_DIR"/batch/yuleshow-wordpress.sh

run "gnome"           "$SCRIPT_DIR"/batch/yuleshow-gnome.sh
# run "dupeguru"      "$SCRIPT_DIR"/batch/yuleshow-dupeguru.sh
run "audio"           "$SCRIPT_DIR"/batch/yuleshow-audio.sh
run "tools"           "$SCRIPT_DIR"/batch/yuleshow-tools.sh

# run "vips"          "$SCRIPT_DIR"/batch/yuleshow-vips.sh   # moved to iphone batch
# run "tifig"         "$SCRIPT_DIR"/batch/yuleshow-tifig.sh  # moved to iphone batch
# run "crossover"     "$SCRIPT_DIR"/batch/yuleshow-crossover.sh   # disabled by request
run "telegram"        "$SCRIPT_DIR"/batch/yuleshow-telegram.sh
run "pdf"             "$SCRIPT_DIR"/batch/yuleshow-pdf.sh


# run "freefilesync"  "$SCRIPT_DIR"/batch/yuleshow-freefilesync.sh
run "goldendict"      "$SCRIPT_DIR"/batch/yuleshow-goldendict.sh
run "postit"          "$SCRIPT_DIR"/batch/yuleshow-postit.sh
run "gdm-background"  "$SCRIPT_DIR"/batch/yuleshow-gdm-background.sh
# comment the following line for test the script
run "iphone"          "$SCRIPT_DIR"/batch/yuleshow-iphone.sh
run "video"           "$SCRIPT_DIR"/batch/yuleshow-video.sh
run "bashrc"          "$SCRIPT_DIR"/batch/yuleshow-bashrc.sh


# final
run "final"           "$SCRIPT_DIR"/batch/yuleshow-final.sh
#!/usr/bin/env bash
# Resolve the directory of this script so the batch/ calls below work no
# matter the current working directory (and even when invoked via sudo).
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# begin
# "$SCRIPT_DIR"/batch/yuleshow-begin.sh

# Initial
sudo apt update
sudo apt upgrade -y
sudo apt install cmake -y
sudo apt install git -y
sudo apt install npm -y
# sudo apt install yum -y
sudo apt install snap -y
sudo apt install curl

# sudo apt install python-pip -y
sudo apt install automake -y
sudo apt install xz-utils -y # for tar.xz
sudo apt install rar unrar p7zip-full p7zip-rar -y # for other compress/extract

sudo apt install openjdk-17-jre -y

# install the decodes
# sudo apt install ubuntu-restricted-extras -y
sudo apt install ubuntu-restricted-addons -y
sudo apt install software-properties-common -y



# make the directories
if [ -d ~/Applications ]
then
    echo "~/Applications already exists"
else
    mkdir ~/Applications
    echo "~/Applications doesn't exist, created one."
fi


git clone https://github.com/yuleshow/ubuntu-configuration.git

# copy bin files
sudo cp "$SCRIPT_DIR"/bin/* /usr/local/bin




######### above imported from yuleshow-begin.sh
#######################################################

"$SCRIPT_DIR"/batch/yuleshow-python.sh
# Install every CLI tool + Python library the bin/yuleshow-* scripts need
# (exiftool, poppler, libheif, Pillow, pillow-heif, pdf2image, opencc, ...).
"$SCRIPT_DIR"/batch/yuleshow-bin-tools.sh
# comment the following line for test the script
"$SCRIPT_DIR"/batch/yuleshow-fonts.sh
"$SCRIPT_DIR"/batch/yuleshow-flatpak.sh
"$SCRIPT_DIR"/batch/yuleshow-emacs.sh
"$SCRIPT_DIR"/batch/yuleshow-browser.sh
"$SCRIPT_DIR"/batch/yuleshow-filezilla.sh
"$SCRIPT_DIR"/batch/yuleshow-insync.sh
"$SCRIPT_DIR"/batch/yuleshow-language.sh
# "$SCRIPT_DIR"/batch/yuleshow-teamviewer.sh
# "$SCRIPT_DIR"/batch/yuleshow-wechat.sh
"$SCRIPT_DIR"/batch/yuleshow-virtualbox.sh
"$SCRIPT_DIR"/batch/yuleshow-cleaner.sh
"$SCRIPT_DIR"/batch/yuleshow-whatever.sh
# "$SCRIPT_DIR"/batch/yuleshow-aria2.sh
"$SCRIPT_DIR"/batch/yuleshow-smartgit.sh
"$SCRIPT_DIR"/batch/yuleshow-rename.sh
"$SCRIPT_DIR"/batch/yuleshow-calibre.sh
"$SCRIPT_DIR"/batch/yuleshow-baidu.sh
"$SCRIPT_DIR"/batch/yuleshow-guake.sh
# "$SCRIPT_DIR"/batch/yuleshow-whitesur.sh   # replaces the old macbuntu stack
"$SCRIPT_DIR"/batch/yuleshow-mac-simple.sh
"$SCRIPT_DIR"/batch/yuleshow-xdm.sh
"$SCRIPT_DIR"/batch/yuleshow-wordpress.sh

"$SCRIPT_DIR"/batch/yuleshow-gnome.sh
# "$SCRIPT_DIR"/batch/yuleshow-dupeguru.sh
"$SCRIPT_DIR"/batch/yuleshow-audio.sh
"$SCRIPT_DIR"/batch/yuleshow-tools.sh

# "$SCRIPT_DIR"/batch/yuleshow-vips.sh   # moved to iphone batch
# "$SCRIPT_DIR"/batch/yuleshow-tifig.sh  # moved to iphone batch
# "$SCRIPT_DIR"/batch/yuleshow-crossover.sh   # disabled by request
"$SCRIPT_DIR"/batch/yuleshow-telegram.sh
"$SCRIPT_DIR"/batch/yuleshow-pdf.sh


# "$SCRIPT_DIR"/batch/yuleshow-freefilesync.sh
"$SCRIPT_DIR"/batch/yuleshow-goldendict.sh
"$SCRIPT_DIR"/batch/yuleshow-postit.sh
"$SCRIPT_DIR"/batch/yuleshow-gdm-background.sh
# comment the following line for test the script
"$SCRIPT_DIR"/batch/yuleshow-iphone.sh
"$SCRIPT_DIR"/batch/yuleshow-video.sh
"$SCRIPT_DIR"/batch/yuleshow-bashrc.sh


# final
"$SCRIPT_DIR"/batch/yuleshow-final.sh
