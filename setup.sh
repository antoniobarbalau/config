sudo pacman -Sy compton scrot --noconfirm
cp ./i3_config ~/.config/i3/config
sudo cp ./i3status.conf /etc/i3status.conf

sudo pacman -Sy rxvt-unicode --noconfirm
cp ./.Xresources ~/
xrdb ~/.Xresources

sudo pacman -Sy neovim nodejs npm --noconfirm
mkdir ~/.config/nvim/
cp ./init.vim ~/.config/nvim/
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qa

sudo pacman -Sy pavucontrol blueman firefox nautilus networkmanager --noconfirm
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager
