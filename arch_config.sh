sudo pacman -Syyu compton feh scrot imagemagick w3m-img

cp ./i3_config ~/.config/i3/config
cp ./lock.sh ~/.config/i3/
sudo cp ./i3status.conf /etc/i3status.conf

sudo pacman -Syyu rxvt-unicode
cp ./.Xresources ~/
xrdb ~/.Xresources

sudo pacman -Syyu ranger
ranger --copy-config=all
cp ./rc.conf ~/.config/ranger/

sudo pacman -Syyu pavucontrol blueman


