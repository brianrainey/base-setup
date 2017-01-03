#!/bin/bash

if [ -z $2 ] 
then
  echo "Usage: init [Full Name] [Email]"
  exit 1
fi

cd ~

sudo apt install -y git stow emacs-nox vim-nox tmux

git config --global user.name "$1"
git config --global user.email "$2"
git config --global push.default simple
git config --global core.editor vim

git clone https://github.com/brianrainey/.emacs.d.git
git clone https://github.com/brianrainey/.dotfiles.git

cd .dotfiles

stow bangrc
stow tmux
stow vim

echo "source ~/.bangrc" >> ~/.bashrc
