#!/bin/sh

[ -z "$tmppath" ] && $(curl -s "https://raw.githubusercontent.com/Rob9315/installscripts/master/setdefaults.sh")

# change default shell
sudo chsh --shell /bin/zsh $USER

# install fonts
sudo wget -nc -P /usr/share/fonts \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k || git -C ~/powerlevel10k pull -f
grep -q 'source ~/powerlevel10k/powerlevel10k.zsh-theme' ~/.zshrc && echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
