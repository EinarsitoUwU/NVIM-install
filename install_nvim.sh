#!/bin/bash
#Script for ···einarssini···
dir=$(cat dir.txt)
ruta=/home/$(whoami)/$dir/$1
down() {
	if [ -d "$ruta" ]
		then
   			echo "El directorio existe"
   			cd $ruta
   			wget -c https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
			chmod +x $ruta/nvim.appimage
		else
   			echo "El directorio no existe"
   			mkdir $ruta
   			cd $ruta
   			wget -c https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
			chmod +x $ruta/nvim.appimage
	fi
}
aliase() {
	echo "alias nvim="$ruta/./nvim.appimage" " >> /home/$(whoami)/.zshrc  
}
vimplug() {
	mkdir /home/$(whoami)/.config/nvim
	mkdir /home/$(whoami)/.config/nvim/plugins
	mkdir /home/$(whoami)/.config/nvim/autoload/
	cd /home/$(whoami)/.config/nvim/
	wget -c https://raw.githubusercontent.com/EinarsitoUwU/My-dot-files/master/init.vim
	cd /home/$(whoami)/.config/nvim/autoload
	wget -c https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

}
down
aliase
vimplug
