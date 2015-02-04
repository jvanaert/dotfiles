#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "init/" --exclude ".osx" \
    -avh --no-perms . ~;

  # Copy GNU ls solarized dark theme over
  cp init/dircolors-solarized/dircolors.256dark ~/.solarized-dark.dircolors
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
