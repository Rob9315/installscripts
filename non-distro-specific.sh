#!/bin/sh
# only launch this after you have read what it does or have it launch from a different script
# sh -c "$(curl "https://raw.githubusercontent.com/Rob9315/installscripts/master/non-distro-specific.sh")"

prechosen_or_prompted_command() {
  while [ -z "${!1}" ]
  do
    read -p "Do you want to install '$2'?$4" yn
    case $yn in
      [Yy]*) declare "$1"="1";;
      [Nn]*) declare "$1"="0";;
      *) echo "Please answer yes or no.";;
    esac
  done
  if [ ${!1} -eq 1 ]
  then
    sh -c "$3"
  fi 
}

prechosen_or_prompted_command "spotify" "Spotify (adblock)" "curl \"https://raw.githubusercontent.com/Rob9315/installscripts/master/spotify.sh\" | sh"
# prechosen_or_prompted_command "shell" "Shell" "curl \"https://raw.githubusercontent.com/Rob9315/installscripts/master/shell.sh\" | sh"
# prechosen_or_prompted_command "git" "Set up Git" "curl \"https://raw.githubusercontent.com/Rob9315/installscripts/master/git.sh\" | sh"
prechosen_or_prompted_command "gtktheme" "Matcherial Theme" "curl \"https://raw.githubusercontent.com/Rob9315/installscripts/master/gtktheme.sh\" | sh" " (you will need to have sassc installed)"
