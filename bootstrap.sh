#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    --exclude "brew.sh" --exclude "liquidprompt/" --exclude ".vim/UltiSnips"\
		--exclude "README.md" --exclude "LICENSE-MIT.txt" --exclude "um" -avh --no-perms . ~;
	source ~/.zshrc;

  # VIM Plugin Management: https://github.com/junegunn/vim-plug
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  if [ ! -d $HOME/.vim/UltiSnips ]; then
    ln -s $HOME/dotfiles/.vim/UltiSnips $HOME/.vim/UltiSnips
  fi
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
  echo "dotfiles installed completed. Please don't forget to change your git username and email:";
  echo "    git config --global user.name \"Your Name\"";
  echo "    git config --global user.email you@example.com";
  echo "";
  echo "When you first start vim, please use :PlugInstall to install all the plugins."
  echo "Have fun!"
fi;
unset doIt;
