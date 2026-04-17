# The upstream PPA hasn't published noble (24.04) builds; fall back to the
# most recent compatible series (jammy 22.04) which installs on noble.
sudo add-apt-repository -y ppa:umang/indicator-stickynotes || true
sudo cp ~/ubuntu-configuration/sources.list.d/umang-ubuntu-indicator-stickynotes-noble.list /etc/apt/sources.list.d/
sudo apt-get update
sudo apt-get install -y indicator-stickynotes
