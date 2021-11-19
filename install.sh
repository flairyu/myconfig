#!/usr/bin/env bash
echo "Restore configs..."

packbase="zsh git vim curl wget tmux"
if [ -n "$(command -v yum)" ]; then
    apt="sudo yum -y"
    packs="$packbase the_silver_searcher"
elif [ -n "$(command -v apt)" ]; then
    apt="sudo apt -y"
    packs="$packbase silversearcher-ag"
else
    echo "not support system"
    exit
fi

echo "1. install softwares:"
$apt install $packs
git config --global credential.helper store
git clone https://github.com/flairyu/myconfig.git $HOME/.myconfig
# git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

echo "2. link config files"
cd $HOME
cp .myconfig/zshrc .zshrc
cp .myconfig/myenv.sh .myenv.sh
cp .myconfig/p10k.zsh .p10k.zsh
cp -r .myconfig/.vim $HOME/
cp .myconfig/vimrc .vimrc
vim +PlugInstall +qall

echo "3. generate home/bin"
cp -R .myconfig/bin $HOME

echo "4. install zsh themes"
sh -c $HOME/.myconfig/install_p10k.sh
# sh -c $HOME/.myconfig/install_omzsh.sh

echo "5. change shell, you need relogin later"
chsh -s /usr/bin/zsh

echo "Done."
