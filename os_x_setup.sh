#!/bin/sh

# カレントディレクトリを取得
DEST=`dirname ${0}`

cd ~
if [ ! -e ~/.zshrc ]; then
	ln -s $DEST/.zshrc ~/.zshrc
elif [ ! -L ~/.zshrc ]; then
	echo "Replace .zshrc for dotfiles"
	mv ~/.zshrc ~/.zshrc.old
	ln -s $DEST/.zshrc ~/.zshrc
fi
if [ ! -e ~/.vimrc ]; then
	ln -s $DEST/.vimrc ~/.vimrc
elif [ ! -L ~/.vimrc ]; then
	echo "Replace .vimrc for dotfiles"
	mv ~/.vimrc ~/.vimrc.old
	ln -s $DEST/.vimrc ~/.vimrc
fi

# Environment of NeoBundle for Vim
if [ ! -e ~/.vim ]; then
	echo "No ~/.vim directory detected."
	mkdir -p ~/.vim/bundle
	echo "~/.vim directory created."
fi
if [ ! -e ~/.vim/bundle/neobundle.vim ]; then
	echo "No 'NeoBundle' for Vim plugin detected."
	echo "Installing NeoBundle..."
	git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
	vim +NeoBundleInstall +q
fi
