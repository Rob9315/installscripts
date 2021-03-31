#!/bin/sh

[ -z "$tmppath" ] && eval "$(curl -s "https://raw.githubusercontent.com/Rob9315/installscripts/master/setdefaults.sh")"

# DISCLAIMER
# this uses MY dotfiles. they might not be your preference

# add .cfg to .gitignore
grep -q "\.cfg" .gitignore || echo ".cfg" >> .gitignore

git clone --bare 'https://github.com/rob9315/dotfiles' $HOME/.cfg/.git
alias config='/usr/bin/git --git-dir=$HOME/.cfg/.git --work-tree=$HOME'
config pull -f
[ -e ~/.zshrc ] && grep -q "source ~/.zsh/aliases" ~/.zshrc || echo "source ~/.zsh/aliases" >> ~/.zshrc
config config --local status.showUntrackedFiles no
config checkout -f
