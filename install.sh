#!/bin/bash

function error_input(){
	echo "<WRONG INPUT> $1 is not a valid input!"
}

function appImage_install_debian(){
    local url_stable="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
    local url_nightly="https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage"
	eval "curl -sL \$url_$1 -o nvim"
	chmod u+x nvim
	sudo mv nvim /bin/
}

function show_version(){
	echo "Do you want show version? (y/n): "
	read -r choice
	case "$choice" in
		'y'|'Y')
			/bin/nvim --version
		;;
	esac
}

function greetings(){
	printf "\n<SUCCESS> The installation is complete!\n"
	echo "==> Contribute with us giving this repo a Star ⭐"
	echo "Maintainers:"
	printf "\t  |        <NAME>        |   <GITHUB>   |      <EMAIL>      |\n"
	printf "\t  | Lucas R. de Almeida  | @propilideno |   hello@propi.dev |\n\n"
}

# This should be good if you don't have sudo permission on computer
# Like when you're on college or a public computer
function appImage_install(){
	while true; do
		echo "S - Stable"
		echo "N - Nightly"
		echo "What version do you want install? (S/N): "
		read -r choice
		case "$choice" in
			's'|'S')
				appImage_install_debian "stable"
				break
			;;
			'n'|'N')
				appImage_install_debian "nightly"
				break
			;;
			*)
				error_input "$choice"
			;;
		esac
	done
}

function main(){
	echo "== Auto Install NVIM =="
	appImage_install
	greetings
	show_version
}

main
