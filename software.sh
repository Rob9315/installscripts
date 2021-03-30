#!/bin/sh
# only launch this after you have read what it does or have it launch from a different script
# sh -c "$(curl "https://raw.githubusercontent.com/Rob9315/installscripts/master/software.sh")"

promptyn() {
  clear
  [ -z "${!1}" ] && read -n 1 -p "Do you want to install '$2'?$4 (y|N)"$'\n'"> " yn && [ "$yn" = "Y" ] || [ "$yn" = "y" ] && export $1="1" || export $1="0"
  echo -e ""
  [ ${!1} -eq 1 ] && sh -c "$3"
}

[ -z "$tmppath" ] && eval "$(curl -s "https://raw.githubusercontent.com/Rob9315/installscripts/master/setdefaults.sh")"

promptyn "spotify" "Spotify (adblock)" "$(curl -s "$rawfilesurl/software/spotify.sh")"
promptyn "shell" "Shell" "$(curl -s "$rawfilesurl/software/shell.sh")" # "" "export termfont='MesloLGS NF'"
[ $shell -eq 1 ] && export termfont='MesloLGS NF'
promptyn "gsettings" "Patch some Gnome settings" "$(curl -s "$rawfilesurl/software/gsettings-patches.sh")"
promptyn "gtktheme" "Matcherial Theme" "$(curl -s "$rawfilesurl/software/gtktheme.sh")" " (you will need to have sassc installed)"
