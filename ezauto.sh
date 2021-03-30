#!/bin/sh
# CURL COMMAND
# sh -c "$(curl "https://raw.githubusercontent.com/rob9315/installscripts/master/ezauto.sh")"

[ -z "$tmppath" ] && $(curl -s "https://raw.githubusercontent.com/Rob9315/installscripts/master/setdefaults.sh")

read -p "Please enter the installscript name (without .sh)"$'\n'"> " distroname

[ $(expr "$(read -n 1 -p "Choose defaults? (y|N)"$'\n')" : '[Yy]') = 1 ] && $(curl -s "$rawfilesurl/yes.sh")

sh -c "$(curl -s "$rawfilesurl/os/$distroname.sh")"
