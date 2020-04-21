git config --global user.name "antoniobarbalau"
git config --global user.email "antoniobarbalau@gmail.com"

sudo apt install -y gcc g++ cmake compton neovim
sudo apt-get remove gnome-shell-extension-desktop-icons -y

sudo apt install -y zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp ./.zshrc ~/
cp ./dracula.zsh-theme ~/.oh-my-zsh/themes/

sudo apt install -y exuberant-ctags
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
cp init.vim ~/.config/nvim/
nvim +PluginInstall +qa

sudo apt install -y feh scrot imagemagick w3m-img

cp ./i3_config ~/.config/i3/config
cp ./lock.sh ~/.config/i3/
sudo cp ./i3status.conf /etc/i3status.conf
cp ./pictures/rick* ~/Pictures/
cp ./pictures/yellow\ planet.jpg ~/Pictures/

sudo apt install -y rxvt-unicode-256color
cp ./.Xresources ~/
xrdb ~/.Xresources

sudo apt install -y ranger
ranger --copy-config=all
cp ./rc.conf ~/.config/ranger/

sudo apt install -y texlive-full
sudo apt install -y pavucontrol blueman


