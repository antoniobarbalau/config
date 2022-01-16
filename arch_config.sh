sudo pacman -Sy compton scrot imagemagick w3m-img --noconfirm

cp ./i3_config ~/.config/i3/config
cp ./lock.sh ~/.config/i3/
sudo cp ./i3status.conf /etc/i3status.conf

sudo pacman -Sy rxvt-unicode --noconfirm
cp ./.Xresources ~/
xrdb ~/.Xresources

sudo pacman -Sy ranger --noconfirm
ranger --copy-config=all
cp ./rc.conf ~/.config/ranger/

sudo pacman -Sy pavucontrol blueman --noconfirm


