#!/usr/bin/env bash
echo "Restore configs..."

$packbase="zsh git vim curl wget axel"
if [ -n "$(command -v yum)" ]; then
    apt="yum -y"
    packs="$packbase the_silver_searcher"
elif [ -n "$(command -v apt)" ]; then
    apt="apt -y"
    packs="$packbase silversearcher-ag"
else
    echo "not support system"
    exit
fi

echo "1. install softwares:"
$apt install $packs
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "2. link config files"
cd $HOME
rm .zshrc
rm .vimrc
ln -s .myconfig/zshrc .zshrc
ln -s .myconfig/vimrc .vimrc
vim +PluginInstall +qall

echo "Done."
