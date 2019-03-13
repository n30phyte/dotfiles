#!/bin/bash

pip3 install -m distro

# Git configs
git config --global usecdr.name "Michael Kwok"
git config --global user.email "michael.kwok00@gmail.com"

# Install antigen for zsh
curl -L git.io/antigen > ~/.antigen.zsh

# Link rcfiles
ln -s $PWD/zsh/zshrc ~/.zshrc

# Make directories
mkdir ~/Workspace
