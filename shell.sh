#!/bin/sh
sudo chsh --shell /bin/zsh $USER
cd /usr/share/fonts
sudo wget -N https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
fc-cache -f -v
cd ~
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
if ![[ grep -q 'source ~/powerlevel10k/powerlevel10k.zsh-theme' ~/.zshrc ]] ; then
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
fi
