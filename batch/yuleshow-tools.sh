sudo apt install unrar -y
sudo apt install neofetch -y

# pay-respects — actively-maintained Rust replacement for the unmaintained
# `thefuck`. Upstream: https://github.com/iffse/pay-respects
# No Debian/Ubuntu package yet (ITP #1089677), so fetch the prebuilt
# release binary that matches the current architecture.
if ! command -v pay-respects >/dev/null 2>&1; then
    arch="$(uname -m)"
    case "$arch" in
        x86_64)          pr_target="x86_64-unknown-linux-gnu"  ;;
        aarch64|arm64)   pr_target="aarch64-unknown-linux-gnu" ;;
        *)               pr_target=""                          ;;
    esac
    if [ -n "$pr_target" ]; then
        pr_tmp="$(mktemp -d)"
        pr_url="$(curl -fsSL https://api.github.com/repos/iffse/pay-respects/releases/latest \
                  | grep -oE 'https://[^"]*'"$pr_target"'[^"]*\.tar\.gz' \
                  | head -n1)"
        if [ -n "$pr_url" ]; then
            curl -fsSL "$pr_url" -o "$pr_tmp/pr.tar.gz" \
                && tar -xzf "$pr_tmp/pr.tar.gz" -C "$pr_tmp" \
                && sudo install -m0755 \
                     "$(find "$pr_tmp" -type f -name pay-respects | head -n1)" \
                     /usr/local/bin/pay-respects
        fi
        rm -rf "$pr_tmp"
    fi
fi
# Shell aliases: add the F-key helper to bash/zsh rc files once.
#   In interactive bash:  eval "$(pay-respects --alias)"
#   In interactive zsh :  eval "$(pay-respects --alias)"
for rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
    [ -f "$rc" ] || continue
    if ! grep -q 'pay-respects --alias' "$rc"; then
        printf '\n# pay-respects (thefuck replacement)\neval "$(pay-respects --alias 2>/dev/null)"\n' >> "$rc"
    fi
done

# sudo pip3 install thefuck   # unmaintained; replaced by pay-respects above.


sudo apt install whois -y
sudo apt install gimp -y
sudo apt install gimp-help-en -y
# sudo apt install puddletag -y



# for backup
sudo apt install duplicity -y

# temperature monitor
# sudo snap install indicator-sensors
sudo apt install indicator-sensors -y

# desktop item editor
sudo apt install alacarte -y


# sudo snap install --candidate freac

sudo apt install gparted -y
sudo apt install synaptic -y
sudo apt install bleachbit -y
sudo apt install dconf-editor -y
# 'preload' was removed from Ubuntu 24.04+; skip if unavailable.
sudo apt install preload -y || true
sudo apt install gufw -y

sudo apt install plocate -y
sudo apt install gthumb -y
sudo apt install exfat-fuse -y
sudo apt install exfatprogs -y
~/ubuntu-configuration/batch/yuleshow-arronax.sh
