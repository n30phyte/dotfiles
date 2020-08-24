#!/bin/bash

# Start repo setup
# RPMFusion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Alacritty
sudo dnf copr enable pschyska/alacritty 
# End repo setup

# Start package install

# DNF
sudo dnf check-update

sudo dnf -y install zsh alacritty gnome-tweak-tool gtk-murrine-engine # Make shit look nice
sudo dnf -y install virt-manager radare2 dnf-utils neovim code piper qemu # Frequently used programs
sudo dnf -y install boost-devel clang lldb llvm libcxx-devel gcc code valgrind # Dev stuff

# Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.spotify.Client

# End package install

# Git configs
git config --global user.name "Michael Kwok"
git config --global user.email "michael.kwok00@gmail.com"

# Install antigen for zsh
curl -L git.io/antigen > ~/.antigen.zsh

# Link rcfiles
ln -s $PWD/zsh/zshrc ~/.zshrc
ln -s $PWD/vscode/settings.json ~/.config/Code/User/settings.json

ln -s $PWD/mako ~/.config/
ln -s $PWD/rofi ~/.config/
ln -s $PWD/sway ~/.config/
ln -s $PWD/termite ~/.config/
ln -s $PWD/waybar ~/.config/

# Make directories
mkdir ~/Workspace
