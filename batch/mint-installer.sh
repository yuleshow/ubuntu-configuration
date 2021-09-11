sudo apt install cinnamon -y


mkdir ~/mint-themes
	cd ~/mint-themes
	wget http://packages.linuxmint.com/pool/main/m/mint-x-icons/mint-x-icons_1.5.5_all.deb
             

        wget http://packages.linuxmint.com/pool/main/m/mint-y-icons/mint-y-icons_1.5.0_all.deb
	wget http://packages.linuxmint.com/pool/main/m/mint-themes/mint-themes_1.8.8_all.deb
        sudo dpkg -i mint-x-icons_*.deb
        sudo dpkg -i mint-y-icons_*.deb
        sudo dpkg -i mint-themes_*.deb
	cd ..
        sudo rm -rf mint-themes/
