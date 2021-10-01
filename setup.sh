#!/usr/bin/env bash

# Update and upgrade
echo "Check for updates..."
sudo apt update && apt list -u && sudo apt upgrade -y

# Install some command line and GUI utilities
echo "Setting up some utilites and apps..."
sudo apt install alacritty code curl git gnome-tweaks lm-sensors neofetch ubuntu-restricted-extras vlc wget zsh zsh-autosuggestions -y

# Install OMZSH and PL10K
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ""
git clone --depth 1 https://github.com/romkatv/powerlevel10k.git /home/$USER/.oh-my-zsh/custom/themes/powerlevel10k

# Download and install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
rm -rf ./google-chrome-stable_current_amd64.deb

# Switch from noveau to integrated graphics via System76 Power extension
echo "Set graphics to integrated (iGPU) for better battery life..."
sudo system76-power graphics integrated

# Switch to ZSH and reboot
echo "Rebooting system..."
chsh -s /usr/bin/zsh
sudo reboot