#!/usr/bin/env sh
# Script to copy my dotfiles and other configuration files

FOLDER=~/dotgit
cd ~/dotgit || exit
FOLDER=$(pwd)
mkdir -p "${FOLDER}"

echo "Coping this script to ${FOLDER}"
cp ~/bin/dotgit.sh "${FOLDER}"

echo "Copying user dot files to ${FOLDER}"
# Copy anything in .zshrc.local that doesn't have a space in front of it
sed -e 's/^ .*//' ~/.zshrc.local > "${FOLDER}/_.zshrc.local"
cp ~/.xinitrc "${FOLDER}/_.xinitrc"
cp ~/.Xresources "${FOLDER}/_.Xresources"
cp ~/.vimrc "${FOLDER}/_.vimrc"

echo "Copying atom configuration files"
mkdir -p "${FOLDER}/_.atom"
cp ~/.atom/keymap.cson "${FOLDER}/_.atom/"
cp ~/.atom/styles.less "${FOLDER}/_.atom/"
cp ~/.atom/config.cson "${FOLDER}/_.atom/"

echo "Coping user ~/.config files to ${FOLDER}/_.config"
mkdir -p "${FOLDER}/_.config/mpd"
cp ~/.config/mpd/mpd.conf "${FOLDER}/_.config/mpd"

echo "Copying /etc files to ${FOLDER}/etc"
mkdir -p "${FOLDER}/etc"
mkdir -p "${FOLDER}/etc/connman"
cp /etc/connman/main.conf "${FOLDER}/etc/connman"
cp /etc/dnsmasq.conf "${FOLDER}/etc"
cp /etc/sysctl.conf "${FOLDER}/etc"
cp /etc/pacman.conf "${FOLDER}/etc"
cp /etc/makepkg.conf "${FOLDER}/etc"


echo "Copying /var/lib files to ${FOLDER}/var/lib"
mkdir -p "${FOLDER}/var/lib/"
mkdir -p "${FOLDER}/var/lib/connman"
echo "Copying /usr/lib/systemd/system files"
mkdir -p "${FOLDER}/usr/lib/systemd/system"
cp /usr/lib/systemd/system/connman.service "${FOLDER}/usr/lib/systemd/system"
sudo cp /var/lib/connman/settings "${FOLDER}/var/lib/connman"
sudo chown "$(whoami):root" "${FOLDER}/var/lib/connman/settings"
echo "Copying /usr/share/devtools files to ${FOLDER}/usr/share/"
mkdir -p "${FOLDER}/usr/share/devtools/"
cp /usr/share/devtools/pacman-extra.conf "${FOLDER}/usr/share/devtools/"
