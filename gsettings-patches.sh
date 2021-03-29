#!/bin/sh
# set terminal font if not already set
if [ -z $termfont ]
then
  termfont="Monospace"
fi
# get active profile id
term_active_profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
term_active_profile=${term_active_profile:1:-1}

gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$term_active_profile/ font "$termfont 10"
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$term_active_profile/ use-system-font false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$term_active_profile/ use-theme-colors true
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$term_active_profile/ login-shell true
