#!/bin/sh

[ -z "$tmppath" ] && eval "$(curl -s "https://raw.githubusercontent.com/Rob9315/installscripts/master/setdefaults.sh")"

mkdir -p "$tmppath"
git -C "$tmppath/" clone https://github.com/rob9315/matcherial-gtk-theme.git || git -C "$tmppath/matcherial-gtk-theme/" pull -f
cd "$tmppath/matcherial-gtk-theme"
sh "$tmppath/matcherial-gtk-theme/parse-sass.sh" && sh "$tmppath/matcherial-gtk-theme/install.sh" || (echo "It seems there was a problem, the cache will be cleared. Please try again." && rm -rf "$tmppath/matcherial-gtk-theme")
