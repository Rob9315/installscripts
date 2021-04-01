#!/bin/sh
# only launch this after you have read what it does or have it launch from a different script
# sh -c "$(curl "https://raw.githubusercontent.com/Rob9315/installscripts/master/software.sh")"

promptyn() {
    clear && [ -z "${!1}" ] && read -n 1 -p "Do you want to install '$2'?$4 (y|N)"$'\n'"> " yn && echo "$yn" | grep -q "[Yy]" && export $1=$? && echo -e ""
    [ "${!1}" = "0" ] && sh -c "$3"
}

[ -z "$tmppath" ] && eval "$(curl -s "https://raw.githubusercontent.com/Rob9315/installscripts/master/setdefaults.sh")"

promptyn "spotify" "Spotify (adblock)" "$(curl -s "$rawfilesurl/software/spotify.sh")"
promptyn "shell" "Shell" "$(curl -s "$rawfilesurl/software/shell.sh")"
[ "$shell" = "0" ] && export termfont='MesloLGS NF'
[ "$shell" = "0" ] && echo -e "yes" || echo -e "no"
echo -e "termfont: '$termfont'"
read -n 1
promptyn "dotfiles" "rob9315's dotfiles" "$(curl -s "$rawfilesurl/software/dotfiles.sh")"
promptyn "gsettings" "Patch some Gnome settings" "$(curl -s "$rawfilesurl/software/gsettings-patches.sh")"
promptyn "gtktheme" "Matcherial Theme" "$(curl -s "$rawfilesurl/software/gtktheme.sh")" " (you will need to have sassc installed)"

