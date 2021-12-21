#!/usr/bin/env bash

# Update and upgrade
echo "Check for updates..."
sudo apt update && apt list -u && sudo apt upgrade -y

# Install some command line and GUI utilities
echo "Setting up some utilites and apps..."
sudo apt install alacritty code curl git gnome-tweaks qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils lm-sensors neofetch octave radeontop ubuntu-restricted-extras vlc wget zsh zsh-autosuggestions -y

# Install btm
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.6.5/bottom_0.6.5_amd64.deb
sudo dpkg -i ./bottom_0.6.5_amd64.deb
rm -rf ./bottom_0.6.5_amd64.deb

# Install OMZSH and PL10K
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ""
git clone --depth 1 https://github.com/romkatv/powerlevel10k.git /home/$USER/.oh-my-zsh/custom/themes/powerlevel10k

# Download and install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
rm -rf ./google-chrome-stable_current_amd64.deb

# Setup MS Edge
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-beta.list'
sudo rm microsoft.gpg
sudo apt update
sudo apt install microsoft-edge-beta -y

# Switch from noveau/nvidia to integrated graphics via System76 Power extension
echo "Set graphics to integrated (iGPU) for better battery life..."
sudo system76-power graphics integrated

# Switch to ZSH and reboot
echo "Rebooting system..."
chsh -s /usr/bin/zsh
sudo reboot