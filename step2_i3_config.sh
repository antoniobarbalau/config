conda install -c auto pyconfig

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ets-labs/python-vimrc/master/setup.sh)"
~/.vim/bundle/YouCompleteMe/install.py --clang-completer

sudo apt install feh

mkdir ~/.config/mpd
cp ./mpd.conf ~/.config/mpd/mpd.conf
cp ./i3_config ~/.config/i3/config
sudo cp ./i3status.conf /etc/i3status.conf
cp wall.jpg ~/Pictures/

echo "set -o vi" >> ~/.bashrc
echo "set number relativenumber" >> ~/.vimrc

