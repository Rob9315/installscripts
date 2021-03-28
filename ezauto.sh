#!/bin/sh
# CURL COMMAND
# sh -c "$(curl "https://raw.githubusercontent.com/rob9315/installscripts/master/ezauto.sh")"

read -p "Please enter the installscript name (without .sh): " distroname
read -n 1 -p "Do you want to use the program defaults? (y|N)" yn
case $yn in
  [Yy]*) yn="1";;
  *) yn="0";;
esac
if [ $yn -eq 1 ]
then
  $(curl "https://raw.githubusercontent.com/Rob9315/installscripts/master/defaults.sh")
fi
sh -c "$(curl "https://raw.githubusercontent.com/Rob9315/installscripts/master/$distroname.sh")"
