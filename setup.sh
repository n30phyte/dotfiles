#!/bin/bash

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

sudo dnf -y install zsh											    			# Make shit look nice
sudo dnf -y install adobe-source-code-pro-fonts adobe-source-sans-pro-fonts powerline-fonts adobe-source-serif-pro-fonts	# Fonts
sudo dnf -y install virt-manager clementine radare2 dnf-utils nano google-chrome-stable						# Frequently used programs
sudo dnf -y install boost-devel clang lldb llvm libcxx-devel gcc nano code valgrind dotnet          				# Dev stuff

# Flathub
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.spotify.Client
flatpak install flathub com.meetfranz.Franz

# End package install

# Delete unused things
sudo dnf -y remove firefox

# Git configs
git config --global user.name "Michael Kwok"
git config --global user.email "michael.kwok00@gmail.com"

# Install antigen for zsh
curl -L git.io/antigen > ~/.antigen.zsh

# Link rcfiles
ln -s $PWD/zsh/zshrc ~/.zshrc

# Make directories
mkdir ~/Workspace
