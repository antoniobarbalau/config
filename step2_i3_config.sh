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

sudo apt install dconf-cli
profile_id="$(dconf list /org/gnome/terminal/legacy/profiles:/)"
dconf write /org/gnome/terminal/legacy/profiles:/${profile_id}background-color "'rgb(0,0,0)'"
#dconf write /org/gnome/terminal/legacy/profiles:/${profile_id}foreground-color "'rgb(255,255,255)'"
dconf write /org/gnome/terminal/legacy/profiles:/${profile_id}background-transparency-percent 60
dconf write /org/gnome/terminal/legacy/profiles:/${profile_id}scrollbar-policy "'never'"
dconf write /org/gnome/terminal/legacy/profiles:/${profile_id}palette "['rgb(46,52,54)', 'rgb(204,0,0)', 'rgb(255,255,255)', 'rgb(196,160,0)', 'rgb(52,101,164)', 'rgb(117,80,123)', 'rgb(6,152,154)', 'rgb(211,215,207)', 'rgb(85,87,83)', 'rgb(239,41,41)', 'rgb(102,102,102)', 'rgb(252,233,79)', 'rgb(153,153,153)', 'rgb(173,127,168)', 'rgb(52,226,226)', 'rgb(238,238,236)']"


dconf write /org/gnome/terminal/legacy/profiles:/${profile_id}use-theme-colors false

