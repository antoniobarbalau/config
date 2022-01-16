sudo pacman -Sy compton scrot --noconfirm
cp ./i3_config ~/.config/i3/config
cp ./lock.sh ~/.config/i3/
sudo cp ./i3status.conf /etc/i3status.conf

sudo pacman -Sy rxvt-unicode --noconfirm
cp ./.Xresources ~/
xrdb ~/.Xresources

sudo pacman -Sy neovim nodejs npm --noconfirm
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qa

sudo pacman -Sy pavucontrol blueman firefox nautilus nmtui --noconfirm
