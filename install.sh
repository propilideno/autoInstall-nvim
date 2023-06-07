#!/bin/bash

function install_debian(){
    local url_stable="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
    local url_nightly="https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage"
    curl -sL $url_stable -o nvim
	chmod u+x nvim
	sudo mv nvim /bin/
}

install_debian
