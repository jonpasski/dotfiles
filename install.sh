#TODO need to source a file for an optional dotfiles directory
if [ -r ~/.dotfiles ]; then
    source ~/.dotfiles
fi
DOTFILES=${DOTFILES:-~/src/dotfiles}; 
BACKUPS=${DOTFILES}/backups

#TODO use test, very hackish for all of the below
mkdir -p ${BACKUPS}/{vim,bash}

cp ~/.vimrc ${BACKUPS}/vim/
ln -fs ${DOTFILES}/vim/vimrc ~/.vimrc

cp ~/.bash_login ${BACKUPS}/bash/
ln -fs ${DOTFILES}/bash/bash_login ~/.bash_login

# vundle
mkdir -p ~/.vim/bundle
(cd ${DOTFILES} && git submodule init &&  git submodule update)

cp -R ~/.vim/bundle/vundle ${BACKUPS}/vim/vundle
ln -fs ${DOTFILES}/vundle ~/.vim/bundle/vundle
