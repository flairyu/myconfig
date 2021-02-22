#!/usr/bin/env bash
echo "Restore configs..."

packbase="zsh git vim curl wget axel tmux"
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
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sh -c $HOME/.myconfig/install_zsh.sh
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

echo "2. link config files"
cd $HOME
rm -f .zshrc
rm -f .vimrc
ln -s .myconfig/zshrc .zshrc
ln -s .myconfig/vimrc .vimrc
vim +PluginInstall +qall

echo "3. generate home/bin"
cp -R .myconfig/bin $HOME

echo "Done."
