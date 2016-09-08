#!/bin/sh
FOLDER=~/dotgit
cd ~/dotgit || exit
FOLDER=$(pwd)
mkdir -p "${FOLDER}"

echo "Coping this script to ${FOLDER}"
cp ~/bin/dotgit.sh "${FOLDER}"

echo "Copying user dot files to ${FOLDER}"
cp ~/.zshrc.local "${FOLDER}/_.zshrc.local"
cp ~/.xinitrc "${FOLDER}/_.xinitrc"
cp ~/.Xresources "${FOLDER}/_.Xresources"
cp ~/.vimrc "${FOLDER}/_.vimrc"

echo "Coping user ~/.config files to ${FOLDER}/_.config"
mkdir -p "${FOLDER}/_.config/mpd"
cp ~/.config/mpd/mpd.conf "${FOLDER}/_.config/mpd"

echo "Copying /etc files to ${FOLDER}/etc"
mkdir -p "${FOLDER}/etc"
mkdir -p "${FOLDER}/etc/connman"
cp /etc/connman/main.conf "${FOLDER}/etc/connman"
mkdir -p "${FOLDER}/etc/"
cp /etc/pacman.conf "${FOLDER}/etc"
cp /etc/makepkg.conf "${FOLDER}/etc"


echo "Copying /var/lib files to ${FOLDER}/var/lib"
mkdir -p "${FOLDER}/var/lib/"
mkdir -p "${FOLDER}/var/lib/connman"
sudo cp /var/lib/connman/settings "${FOLDER}/var/lib/connman"
sudo chown "$(whoami):root" "${FOLDER}/var/lib/connman/settings"
echo "Copying /usr/share/devtools files to ${FOLDER}/usr/share/"
mkdir -p "${FOLDER}/usr/share/devtools/"
cp /usr/share/devtools/pacman-extra.conf "${FOLDER}/usr/share/devtools/"
