#!/bin/sh
cd /tmp
git clone https://github.com/rob9315/matcherial-gtk-theme.git
cd matcherial-gtk-theme
sh ./parse-sass.sh
sh ./install.sh
