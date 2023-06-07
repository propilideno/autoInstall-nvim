#!/bin/bash

function install_debian(){
    local url="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
    curl -sL $url -o nvim
	chmod u+x nvim
	sudo mv nvim /bin/
}

install_debian
