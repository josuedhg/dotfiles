#!/usr/bin/bash

CONFIG_FOLDER="$PWD/config/"
TARGET_CONFIG_FOLDER="$HOME/.config/"

if [ ! -d "$TARGET_CONFIG_FOLDER" ]; then
	mkdir -p $TARGET_CONFIG_FOLDER
fi
for folder in $(ls $CONFIG_FOLDER); do
	if [ ! -d "$TARGET_CONFIG_FOLDER/$folder" ]; then
		ln -sf $CONFIG_FOLDER/$folder $TARGET_CONFIG_FOLDER/$folder
	fi
done
