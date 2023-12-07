sudo apt update
sudo apt install neovim

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install lts/iron

mkdir ~/.config/nvim/
cp ./init.vim ~/.config/nvim/
cp ./coc-settings.json ~/.config/nvim/
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qa
