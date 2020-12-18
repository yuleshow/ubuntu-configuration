mkdir ~/mint-themes
	cd ~/mint-themes
	wget http://packages.linuxmint.com/pool/main/m/mint-x-icons/mint-x-icons_1.5.5_all.deb
             
	wget http://packages.linuxmint.com/pool/main/m/mint-y-icons/mint-y-icons_1.4.6_all.deb
	wget http://packages.linuxmint.com/pool/main/m/mint-themes/mint-themes_1.8.7_all.deb
        sudo dpkg -i *.deb
        
	cd ..
        sudo rm -rf mint-themes/
