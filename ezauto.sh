#!/bin/sh
# CURL COMMAND
# sh -c "$(curl "https://raw.githubusercontent.com/rob9315/installscripts/master/ezauto.sh")"

[ -z "$tmppath" ] && eval "$(curl -s "https://raw.githubusercontent.com/Rob9315/installscripts/master/setdefaults.sh")"

read -p "Please enter the name of your distro (corresponding script's name)"$'\n'"> " distroname

read -n 1 -p "Do you want to use the defaults? (y|N)"$'\n'"> " yn && echo "$yn" | grep -q "[Yy]" && echo -e "" && eval "$(curl "$rawfilesurl/yes.sh")"

# start install script appropriate to distro
sh -c "$(curl -s "$rawfilesurl/os/$distroname.sh")"

# install software
sh -c "$(curl -s "$rawfilesurl/software.sh")"
