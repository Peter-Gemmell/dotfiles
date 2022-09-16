#!/bin/bash
#
# Setting up a new instance
#
echo Update & upgrade system
sudo apt-get update
sudo apt-get full-upgrade -y

# Configure Git
git config --global user.email "peter.gemmell@mths.ca"
git config --global user.name "peter.gemmell"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global fetch.prune true

# Github & SSH
echo "Enter 3 times"
ssh-keygen -t ed25519 -C "peter.gemmell@mths.ca"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
echo "Copy that and bring to setting"
echo "once done press enter"
read any_key
echo "type yes"
echo "press enter"
read any_key
ssh -T git@github.com

# NeoVim
sude apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg config unzip curl doxygen
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
