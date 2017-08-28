#!/bin/bash

## Installing Vundle ##
#Needs git to be installed: sudo apt install git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## Download my vimrc ##
curl -sSL https://raw.githubusercontent.com/Sanhajio/vim-ide/master/vimrc -o ~/.vimrc

## Install plugins ##
#Needs vim to be installed: sudo apt install vim
#Tagbar needs ctags: sudo apt install exuberant-ctags
vim +PluginInstall +qall

##Installing Valloric YCM
#Needs cmake: sudo apt-get install build-essential cmake
#Needs python: sudo apt-get install python-dev python3-dev
#Needs xbuild: sudo apt-get install mono-xbuild
#Needs exuberant-ctags: sudo apt-get install exuberant-ctags
cd ~/.vim/bundle/YouCompleteMe
./install.py --all
cd ~
