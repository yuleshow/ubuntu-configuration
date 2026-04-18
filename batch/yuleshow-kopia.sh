# Kopia — fast, encrypted, deduplicating backup tool.
# Installs the official apt repo so `kopia` (CLI) and `kopia-ui` (GUI) stay
# up to date across upgrades. Works on amd64 and arm64.

set -e

curl -fsSL https://kopia.io/signing-key \
    | sudo gpg --dearmor -o /etc/apt/keyrings/kopia-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/kopia-keyring.gpg] https://packages.kopia.io/apt/ stable main" \
    | sudo tee /etc/apt/sources.list.d/kopia.list > /dev/null

sudo apt update
sudo apt install -y kopia kopia-ui
