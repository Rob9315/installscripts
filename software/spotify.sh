#!/bin/sh

[ -z "$tmppath" ] && eval "$(curl -s "https://raw.githubusercontent.com/Rob9315/installscripts/master/setdefaults.sh")"

#go to tmp, clone adblock and cd into adblock repo
cd $tmpfolder
git clone https://github.com/abba23/spotify-adblock-linux.git
cd spotify-adblock-linux

#wget new release, untar it
echo -e "wget-ing cef.tar.bz2"
wget -nc -O cef.tar.bz2 https://cef-builds.spotifycdn.com/cef_binary_88.1.6%2Bg4fe33a1%2Bchromium-88.0.4324.96_linux64_minimal.tar.bz2
echo -e "un-tar-ing cef.tar.bz2"
tar -xf cef.tar.bz2 --wildcards '*include' --strip-components=1

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