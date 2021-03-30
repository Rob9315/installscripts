#!/bin/sh
# CURL COMMAND
# sh -c "$(curl "https://raw.githubusercontent.com/rob9315/installscripts/master/ezauto.sh")"

[ -z "$tmppath" ] && eval "$(curl -s "https://raw.githubusercontent.com/Rob9315/installscripts/master/setdefaults.sh")"

read -p "Please enter the installscript name (without .sh)"$'\n'"> " distroname

[ $(expr "$(read -n 1 -p "Choose defaults? (y|N)"$'\n')" : '[Yy]') = 1 ] && eval "$(curl "$rawfilesurl/yes.sh")"

# start install script appropriate to distro
sh -c "$(curl -s "$rawfilesurl/os/$distroname.sh")"

# install software
sh -c "$(curl -s "$rawfilesurl/software.sh")"
