#!/usr/bin/bash

CONFIG_FOLDER="$PWD/config/"
TARGET_CONFIG_FOLDER="$HOME/.config/"

HOME_FOLDER="$PWD/home/"

git submodule update --init

if [ ! -d "$TARGET_CONFIG_FOLDER" ]; then
	mkdir -p $TARGET_CONFIG_FOLDER
fi
for folder in $(ls $CONFIG_FOLDER); do
	if [ ! -d "$TARGET_CONFIG_FOLDER/$folder" ]; then
		ln -sf $CONFIG_FOLDER/$folder $TARGET_CONFIG_FOLDER/$folder
	fi
done

for config in $(ls $HOME_FOLDER); do
	if [ ! -d "$HOME/.$config" ]; then
		ln -sf $HOME_FOLDER/$config $HOME/.$config
	else
		for subconfig in $(ls $HOME_FOLDER/$config); do
			if [ -d "$HOME/$config/$subconfig" ] && [ ! -d "$HOME/.$config/$subconfig" ]; then
				mkdir -p $HOME/.$config/$subconfig
			fi
			cp -r $HOME_FOLDER/$config/$subconfig $HOME/.$config/$subconfig
		done
	fi
done

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && ~/.bash_it/install.sh --silent --no-modify-config
