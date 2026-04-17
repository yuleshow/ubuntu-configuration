# Python 2 is end-of-life and removed from Ubuntu 24.04 (noble).
# Keep Python 3 tooling only.
sudo apt install python3 -y
sudo apt install python3-dev -y
sudo apt install python3-pip -y
sudo apt install python3-setuptools -y
sudo apt install python3-venv -y
sudo apt install python3-tk -y
pip3 install --user chardet || true
