#!/bin/sh

[ -z "$tmppath" ] && eval "$(curl -s "https://raw.githubusercontent.com/Rob9315/installscripts/master/setdefaults.sh")"

mkdir -p "$tmppath/matcherial-gtk-theme"
cd "$tmppath/matcherial-gtk-theme"
git clone https://github.com/rob9315/matcherial-gtk-theme.git || git pull -f
sh ./parse-sass.sh
sh ./install.sh
