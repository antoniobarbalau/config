git config --global user.name "antoniobarbalau"
git config --global user.email "antoniobarbalau@gmail.com"

sudo apt install -y gcc g++ cmake compton neovim
sudo apt install -y mpd ncmpcpp mpc mpv

sudo apt install -y zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp ./.zshrc ~/
cp ./dracula.zsh-theme ~/.oh-my-zsh/themes/

wget https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh
sudo sh Anaconda3-5.3.0-Linux-x86_64.sh
sudo chown -R $USER ~/anaconda3/

sudo apt install -y exuberant-ctags

conda install -c auto pyconfig

git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
cp init.vim ~/.config/nvim/
cp ./latex_template.tex ~/.config/nvim/
nvim +PluginInstall +qa

sudo apt install -y feh scrot imagemagick w3m-img

mkdir ~/.config/mpd
cp ./mpd.conf ~/.config/mpd/mpd.conf
sudo cp ./mpd.conf /etc/mpd.conf
cp ./ncmpcpp_config ~/.ncmpcpp/config
cp ./i3_config ~/.config/i3/config
cp ./lock.sh ~/.config/i3/
sudo cp ./i3status.conf /etc/i3status.conf
cp wallpaper.jpg ~/Pictures/
cp rick* ~/Pictures/

sudo apt install -y rxvt-unicode-256color
cp ./.Xresources ~/
xrdb ~/.Xresources

sudo apt install -y ranger
ranger --copy-config=all
cp ./rc.conf ~/.config/ranger/

sudo apt install zathura zathura-cb zathura-dev zathura-djvu zathura-pdf-poppler zathura-ps

sudo sed -i "s/quiet splash/quiet splash acpi_backlight=vendor acpi_osi='!Windows 2013' acpi_osi='!Windows 2012'/" /etc/default/grub
sudo update-grub


