git config --global user.name "antoniobarbalau"
git config --global user.email "antoniobarbalau@gmail.com"

apt install -y gcc g++ cmake compton python3-neovim
apt install -y mpd ncmpcpp mpc


wget https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh
sudo sh Anaconda3-5.3.0-Linux-x86_64.sh
sudo chown -R $USER ~/anaconda3/

sudo apt install -y exuberant-ctags

conda install -c auto pyconfig

git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
cp init.vim ~/.config/nvim/
nvim +PluginInstall
~/.config/nvim/bundle/YouCompleteMe/install.py --clang-completer

sudo apt install -y feh

mkdir ~/.config/mpd
cp ./mpd.conf ~/.config/mpd/mpd.conf
cp ./i3_config ~/.config/i3/config
sudo cp ./i3status.conf /etc/i3status.conf
cp wallpaper.jpg ~/Pictures/


sudo sed -i "s/quiet splash/quiet splash acpi_backlight=vendor acpi_osi='!Windows 2013' acpi_osi='!Windows 2012'/" /etc/default/grub
sudo update-grub

