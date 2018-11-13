git config --global user.name "antoniobarbalau"
git config --global user.email "antoniobarbalau@gmail.com"

sudo apt install -y gcc g++ cmake compton neovim
sudo apt install -y mpd ncmpcpp mpc

sudo apt install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp ./.zshrc ~/
cp ./dracula.zsh-theme ~/.oh-my-zsh/themes/

wget https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh
sudo sh Anaconda3-5.3.0-Linux-x86_64.sh
sudo chown -R $USER ~/anaconda3/

pip install neovim

sudo apt install -y exuberant-ctags

conda install -c auto pyconfig

git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
cp init.vim ~/.config/nvim/
nvim +PluginInstall +qa
~/.config/nvim/bundle/YouCompleteMe/install.py --clang-completer

sudo apt install -y feh

mkdir ~/.config/mpd
cp ./mpd.conf ~/.config/mpd/mpd.conf
cp ./i3_config ~/.config/i3/config
cp ./lock.sh ~/.config/i3/
sudo cp ./i3status.conf /etc/i3status.conf
cp wallpaper.jpg ~/Pictures/
cp rick* ~/Pictures/

sudo apt install rxvt-unicode-256color
cp ./.Xresources ~/
xrdb ~/.Xresources

sudo apt install ranger
ranger --copy-config=all
cp ./rc.conf ~/.config/ranger/

sudo sed -i "s/quiet splash/quiet splash acpi_backlight=vendor acpi_osi='!Windows 2013' acpi_osi='!Windows 2012'/" /etc/default/grub
sudo update-grub

