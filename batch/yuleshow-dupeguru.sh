wget https://launchpad.net/~hsoft/+archive/ubuntu/ppa/+build/11261317/+files/dupeguru_4.0.3~xenial_amd64.deb
sudo dpkg -i dupeguru_4.0.3~xenial_amd64.deb
sudo apt --fix-broken install -y
sudo cp /usr/share/dupeguru/core/pe/_cache.cpython-35m-x86_64-linux-gnu.so /usr/share/dupeguru/core/pe/_cache.cpython-36m-x86_64-linux-gnu.so
sudo cp /usr/share/dupeguru/core/pe/_cache.cpython-35m-x86_64-linux-gnu.so /usr/share/dupeguru/core/pe/_cache.cpython-37m-x86_64-linux-gnu.so
sudo cp /usr/share/dupeguru/core/pe/_block.cpython-35m-x86_64-linux-gnu.so   /usr/share/dupeguru/core/pe/_block.cpython-36m-x86_64-linux-gnu.so
sudo cp /usr/share/dupeguru/core/pe/_block.cpython-35m-x86_64-linux-gnu.so   /usr/share/dupeguru/core/pe/_block.cpython-37m-x86_64-linux-gnu.so
sudo cp /usr/share/dupeguru/qt/pe/_block_qt.cpython-35m-x86_64-linux-gnu.so /usr/share/dupeguru/qt/pe/_block_qt.cpython-36m-x86_64-linux-gnu.so
sudo cp /usr/share/dupeguru/qt/pe/_block_qt.cpython-35m-x86_64-linux-gnu.so /usr/share/dupeguru/qt/pe/_block_qt.cpython-37m-x86_64-linux-gnu.so
sudo rm dupeguru_4.0.3~xenial_amd64.deb
