sudo pacman -Sy compton scrot --noconfirm
cp ./i3_config ~/.config/i3/config
cp ./lock.sh ~/.config/i3/
sudo cp ./i3status.conf /etc/i3status.conf

sudo pacman -Sy rxvt-unicode --noconfirm
cp ./.Xresources ~/
xrdb ~/.Xresources

sudo pacman -Sy pavucontrol blueman firefox nautilus --noconfirm
