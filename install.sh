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
	fi
done

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
