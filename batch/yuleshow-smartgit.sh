# SmartGit — syntevo moved to smartgit.dev and no longer publishes a 'latest'
# alias, so scrape the current .deb URL from the download page.
cd ~

DEB_URL=$(curl -sL https://www.smartgit.dev/download/ \
    | grep -oE 'https://download\.smartgit\.dev/smartgit/smartgit-[0-9_]+-linux_amd64\.deb' \
    | head -n 1)

if [ -z "$DEB_URL" ]; then
    echo "Could not determine SmartGit .deb URL; aborting."
    exit 1
fi

wget -O smartgit-latest.deb "$DEB_URL"
sudo apt install -y ./smartgit-latest.deb
rm smartgit-latest.deb
