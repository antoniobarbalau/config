conda install -c auto pyconfig

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ets-labs/python-vimrc/master/setup.sh)"
~/.vim/bundle/YouCompleteMe/install.py --clang-completer



cp ./mpd.conf ~/.config/mpd/mpd.conf
cp ./i3_config ~/.config/i3/config
cp ./i3status.conf /etc/i3status.conf

