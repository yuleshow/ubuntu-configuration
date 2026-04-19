# Language packs — only en-US, Traditional Chinese (zh-Hant) and
# Simplified Chinese (zh-Hans / Unicode Chinese) are installed.

# ---------------- English (US) ---------------------------------------------
sudo apt install hunspell -y
sudo apt install hunspell-en-us -y
sudo apt install hyphen-en-us -y
sudo apt install mythes-en-us -y

# ---------------- Shared CJK fonts -----------------------------------------
# 1. 黑體基礎包
sudo apt install fonts-noto-cjk -y

# 2. 宋體/明體包
sudo apt install fonts-noto-serif-cjk -y

# 3. 黑體進階字重包
sudo apt install fonts-noto-cjk-extra -y

# ---------------- Input method (RIME) --------------------------------------
sudo apt install ibus-rime -y

