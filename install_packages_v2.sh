#!/bin/bash

read -p "Enter the package you want to install: " packages

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit 1
fi

for pkg in "${packages[@]}"
do
	if dpkg -s $pkg &> /dev/null
	then
		echo "$pkg is already installed."
	else
		echo "Installing $pkg"
		sudo apt install -y $pkg
	fi
done	

