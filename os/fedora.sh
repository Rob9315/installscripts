#!/bin/sh
#
# sh -c "$(curl "https://raw.githubusercontent.com/Rob9315/installscripts/master/os/fedora.sh")"
# 

[ -z "$tmppath" ] && eval "$(curl -s "https://raw.githubusercontent.com/Rob9315/installscripts/master/setdefaults.sh")"

# do updates
sudo dnf update -y

# install something to enable repos
sudo dnf install dnf-plugins-core

# enable repos
#RPMFusion
sudo dnf install -y \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
#Brave
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
#VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# refresh repos
sudo dnf check-update -y

# install stuff
sudo dnf install gnome-tweaks gnome-extensions-app code-insiders go npm brave-browser lpf-spotify-client discord papirus-icon-theme sassc zsh gawk youtube-dl flameshot gnome-shell-extension-appindicator gnome-shell-extension-caffeine tldr wine.i686 util-linux-user libappindicator libappindicator-gtk3 https://negativo17.org/repos/uld/fedora-33/x86_64/uld-1.00.39-1.fc33.x86_64.rpm -y
# uninstall stuff
sudo dnf remove gnome-shell-extension-background-logo -y

# launch other scripts
# sh -c "$(curl -s "$tmppath/software.sh")"
