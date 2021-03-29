
#!/bin/sh
# only launch this after you have read what it does or have it launch from a different script
# sh -c "$(curl "https://raw.githubusercontent.com/Rob9315/installscripts/master/non-distro-specific.sh")"

prechosen_or_prompted_command() {
  while [ -z "${!1}" ]
  do
    read -n 1 -p "Do you want to install '$2'?$4 (Y|N) " yn
    case $yn in
      [Yy]*) export $1="1";;
      [Nn]*) export $1="0";;
      *) echo -e "";;
    esac
  done
  if [ ${!1} -eq 1 ]
  then
    sh -c "$3"
  fi 
}

prechosen_or_prompted_command "spotify" "Spotify (adblock)" "$(curl "https://raw.githubusercontent.com/Rob9315/installscripts/master/spotify.sh")"
prechosen_or_prompted_command "shell" "Shell" "$(curl "https://raw.githubusercontent.com/Rob9315/installscripts/master/shell.sh")"
echo -e "shell=$shell $([ $shell="1" ])"
if [ $shell = "1" ] ; then 
  $(read -p "termfont=$termfont")
  export termfont='MesloLGS NF'
  $(read -p "termfont=$termfont")
fi
prechosen_or_prompted_command "gsettings" "Patch some Gnome settings" "$(curl "https://raw.githubusercontent.com/Rob9315/installscripts/master/gsettings-patches.sh")"
# prechosen_or_prompted_command "git" "Set up Git" "$(curl "https://raw.githubusercontent.com/Rob9315/installscripts/master/git.sh")"
prechosen_or_prompted_command "gtktheme" "Matcherial Theme" "$(curl "https://raw.githubusercontent.com/Rob9315/installscripts/master/gtktheme.sh")" " (you will need to have sassc installed)"
