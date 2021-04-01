#!/bin/sh

[ -z "$tmppath" ] && eval "$(curl -s "https://raw.githubusercontent.com/Rob9315/installscripts/master/setdefaults.sh")"

#clone adblock
git clone https://github.com/abba23/spotify-adblock-linux.git $tmppath/spotify-adblock-linux || git -C $tmppath/spotify-adblock-linux pull -f
cd $tmppath/spotify-adblock-linux

#wget new release, untar it
echo -e "wget-ing cef.tar.bz2" && wget -nc -O cef.tar.bz2 https://cef-builds.spotifycdn.com/cef_binary_89.0.15%2Bgdef70e4%2Bchromium-89.0.4389.90_linux64_minimal.tar.bz2
[ -e $tmppath/spotify-adblock-linux/include ] && echo -e "cef.tar.bz2 was already un-tar-ed, if adblock doesn't work, delete '$tmppath' and try again" || ( echo -e "un-tar-ing cef.tar.bz2" && tar -xf cef.tar.bz2 --wildcards '*include' --strip-components=1 )


#install
echo -e "installing spotify-adblock"
sudo make install

echo -e "creating .desktop files"

# create .desktop file for launch
touch ~/.local/share/applications/spotify-adblock.desktop
echo "[Desktop Entry]
Type=Application
Name=Spotify (adblock)
GenericName=Music Player
Icon=spotify-client
TryExec=spotify
Exec=env LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify %U
Terminal=false
MimeType=x-scheme-handler/spotify;
Categories=Audio;Music;Player;AudioVideo;
StartupWMClass=spotify" >~/.local/share/applications/spotify-adblock.desktop

# create .desktop file for updates
touch ~/.local/share/applications/spotify-adblock-update.desktop
echo "[Desktop Entry]
Type=Application
Name=Spotify (adblock-update)
Icon=spotify-client
Exec=sh -c 'curl -s \"$rawfilesurl/software/spotify.sh\" | sh'
Terminal=true" >~/.local/share/applications/spotify-adblock-update.desktop
