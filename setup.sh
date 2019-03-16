#!/bin/bash

<<<<<<< HEAD
pip3 install -m distro
=======

# Useful functions
function get_download_url {
	wget -q -nv -O- https://api.github.com/repos/$1/$2/releases/latest 2>/dev/null |  jq -r '.assets[] | select(.browser_download_url | contains("linux-amd64")) | .browser_download_url'
}


# Start repo setup
# RPMFusion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# dotnet COPR
sudo dnf -y copr enable @dotnet-sig/dotnet

# Chrome
sudo dnf -y install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome

# End repo setup

# Start package install

# DNF
sudo dnf -y update

sudo dnf -y install gnome-tweaks arc-theme zsh guake											    						# Make shit look nice
sudo dnf -y install adobe-source-code-pro-fonts adobe-source-sans-pro-fonts powerline-fonts adobe-source-serif-pro-fonts	# Fonts
sudo dnf -y install virt-manager clementine filelight radare2 dnf-utils nano google-chrome-stable							# Frequently used programs
sudo dnf -y install boost-devel clang lldb llvm libcxx-devel gcc nano code valgrind dotnet          						# Dev stuff

# Flathub
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.spotify.Client
flatpak install flathub io.github.Hexchat

# Franz (AppImage)
# get_download_url meetfranz franz
#./franz*.AppImage
#mv franz*.AppImage ~/Desktop/AppImage/

# End package install

# Delete unused things
sudo dnf -y remove firefox
>>>>>>> 47c8d3a2554bcea518f7bf84462c36a10a46725c

# Git configs
git config --global usecdr.name "Michael Kwok"
git config --global user.email "michael.kwok00@gmail.com"

# Install antigen for zsh
curl -L git.io/antigen > ~/.antigen.zsh

# Link rcfiles
ln -s $PWD/zsh/zshrc ~/.zshrc

# Make directories
mkdir ~/Workspace
