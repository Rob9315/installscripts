#!/bin/sh
# set terminal font if not already set
while [ -z $termfont ]
do
  read -p "Please input your preferred Terminal Font (when in doubt, pick Monospace): " termfont
done
# get active profile id
term_active_profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
term_active_profile=${term_active_profile:1:-1}

# terminal settings
echo -e $termfont
#echo -e \'$termfont 10\'
#echo -e "$(gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$term_active_profile/ font \'$termfont 11\')"
#gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$term_active_profile/ font "${termfont:0:-1} 11"
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$term_active_profile/ use-system-font false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$term_active_profile/ use-theme-colors true
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$term_active_profile/ login-shell true
# touchpad settings
gsettings set org.gnome.desktop.peripherals.touchpad edge-scrolling-enabled false
gsettings set org.gnome.desktop.peripherals.touchpad send-events 'enabled'
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing false
# mouse settings
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
# shortcuts
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "[]"
