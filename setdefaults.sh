#!/bin/sh
# a yes|no prompt
promptyn() {
  clear
  [ -z "${!1}" ] && read -n 1 -p "Do you want to install '$2'?$4 (y|N)"$'\n'"> " yn && [ "$yn" = "Y" ] || [ "$yn" = "y" ] && export $1="1" || export $1="0"
  echo -e ""
  [ ${!1} -eq 1 ] && sh -c "$3"
}
export -f promptyn

# a input prompt
# maybe later

export tmppath="/tmp/$(date "+%Y%W")"
export rawfilesurl="https://raw.githubusercontent.com/Rob9315/installscripts/master"
