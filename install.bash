#!/bin/bash

#TODO need to source a file for an optional dotfiles directory
if [ -r ~/.dotfiles ]; then
    source ~/.dotfiles
fi
DOTFILES=${DOTFILES:-~/src/dotfiles}; 
BACKUPS=${DOTFILES}/backups

#TODO use test, very hackish for all of the below
#TODO use dates in the backup files, very hackish for all of the below
mkdir -p ${BACKUPS}/{vim,bash,screen}

cp ~/.vimrc ${BACKUPS}/vim/
ln -fs ${DOTFILES}/vim/vimrc ~/.vimrc

cp ~/.bash_login ${BACKUPS}/bash/
ln -fs ${DOTFILES}/bash/bash_login ~/.bash_login
ln -fs ${DOTFILES}/bash/bash_login ~/.bashrc

cp ~/.inputrc ${BACKUPS}/bash/
ln -fs ${DOTFILES}/bash/inputrc ~/.inputrc

# screen
cp ~/.screenrc ${BACKUPS}/screen/
ln -fs ${DOTFILES}/screen/screenrc ~/.screenrc

# ssh
chmod o+x ${DOTFILES}/ssh/rc
ln -fs ${DOTFILES}/ssh/rc ~/.ssh/rc

if [ -f "${DOTFILES}/screen/screenrc-${OSTYPE}" ];
then
    ln -fs ${DOTFILES}/screen/screenrc-${OSTYPE} ~/.screenrc_local
else
    touch ~/.screenrc_local
fi

# vundle
mkdir -p ~/.vim/bundle
(cd ${DOTFILES} && git submodule init &&  git submodule update)

cp -R ~/.vim/bundle/vundle ${BACKUPS}/vim/vundle
ln -fs ${DOTFILES}/vundle ~/.vim/bundle/vundle
