#!/bin/sh

# CURL COMMAND:
# sh -c "$(curl "https://raw.githubusercontent.com/Rob9315/installscripts/master/fedora.sh")"

# do updates
sudo dnf update -y

# install something to enable repos
sudo dnf install dnf-plugins-core

# enable repos
#RPMFusion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# Brave
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
# VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# refresh repos
sudo dnf check-update -y

# install stuff
sudo dnf install gnome-tweaks gnome-extensions-app code-insiders go npm brave-browser lpf-spotify-client discord papirus-icon-theme sassc zsh gawk youtube-dl -y

# launch other scripts
sh -c "$(curl "https://raw.githubusercontent.com/Rob9315/installscripts/master/non-distro-specific.sh")"
