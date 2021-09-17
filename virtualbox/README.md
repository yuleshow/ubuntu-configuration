Install the extension from https://download.virtualbox.org/virtualbox/6.1.26/Oracle_VM_VirtualBox_Extension_Pack-6.1.26.vbox-extpack

For MacOS:
- Add virtual image
- Run the code

## code

    VBoxManage modifyvm "MacOS" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
    VBoxManage setextradata "MacOS" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMacOS11,5"
    VBoxManage setextradata "MacOS" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
    VBoxManage setextradata "MacOS" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
    VBoxManage setextradata "MacOS" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
    VBoxManage setextradata "MacOS" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1


Where the `MacOS` is the image name, can be showed by `VBoxManage list vms`

------------

Again on ubuntu, something like this should do the trick:

    sudo apt-get install build-essential pkg-config libglib2.0-dev libexpat1-dev libjpeg-dev libexif-dev libpng-dev libtiff-dev
    wget https://github.com/jcupitt/libvips/releases/download/v8.6.1/vips-8.6.1.tar.gz
    tar xzf vips-8.6.1.tar.gz
    cd vips-8.6.1
    ./configure
    make
    sudo make install


## Build

    git clone --recursive https://github.com/monostream/tifig.git
    mkdir tifig/build &&聽cd tifig/build
    cmake ..
    make


## Usage

Convert the fullsize picture:

    # tifig -v -p image.heic output.jpg
    Grid is 4032x3024 pixels in tiles 8x6
    Export & decode HEVC: 97ms
    Saving image: 55ms
    Total Time: 160ms

Create a thumbnail with max width of 800px:

    # tifig -v -p --width 800 image.heic thumbnail.jpg
    Grid is 4032x3024 pixels in tiles 8x6
    Export & decode HEVC: 113ms
    Saving image: 100ms
    Total Time: 243ms
