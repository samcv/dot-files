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
cp ~/.XCompose "${FOLDER}/_.XCompose"
cp ~/.Xresources "${FOLDER}/_.Xresources"
cp ~/.vimrc "${FOLDER}/_.vimrc"
cp ~/.profile "${FOLDER}/_.profile"
cp ~/.perlcriticrc "${FOLDER}/_.perlcriticrc"

echo "Copying includes"
mkdir -p "${FOLDER}/includes/st"
cp ~/svn/community/st/trunk/config.h "${FOLDER}/includes/st"

echo "Copying atom configuration files"
mkdir -p "${FOLDER}/_.atom"
cp ~/.atom/keymap.cson "${FOLDER}/_.atom/"
cp ~/.atom/styles.less "${FOLDER}/_.atom/"
cp ~/.atom/config.cson "${FOLDER}/_.atom/"

echo "Coping user ~/.config files to ${FOLDER}/_.config"
mkdir -p "${FOLDER}/_.config/mpd"
cp ~/.config/mpd/mpd.conf "${FOLDER}/_.config/mpd"
cp ~/.config/chromium-flags.conf "${FOLDER}/_.config"
echo "Copying /etc files to ${FOLDER}/etc"
mkdir -p "${FOLDER}/etc"
cp /etc/dnsmasq.conf "${FOLDER}/etc"
cp /etc/sysctl.conf "${FOLDER}/etc"
cp /etc/pacman.conf "${FOLDER}/etc"
cp /etc/mkinitcpio.conf "${FOLDER}/etc"
cp /etc/makepkg.conf "${FOLDER}/etc"
sudo cp /etc/resolv.conf "${FOLDER}/etc"
cp /etc/thinkfan.conf "${FOLDER}/etc"
mkdir -p "${FOLDER}/etc/udev/rules.d"
cp /etc/udev/rules.d/10-trackpoint.rules "${FOLDER}/etc/udev/rules.d"

echo "Copying /etc/connman files"
mkdir -p "${FOLDER}/etc/connman"
cp /etc/connman/main.conf "${FOLDER}/etc/connman"

echo "Copying /etc/modprobe.d files"
mkdir -p "${FOLDER}/etc/modprobe.d"
cp /etc/modprobe.d/thinkpad_acpi.conf "${FOLDER}/etc/modprobe.d"

echo "Copying profile.d contents to ${FOLDER}/etc/profile.d"
mkdir -p "${FOLDER}/etc/profile.d"
cp /etc/profile.d/perl6bin.sh "${FOLDER}/etc/profile.d"
cp /etc/profile.d/vdpau_driver.sh "${FOLDER}/etc/profile.d"
cp /etc/profile.d/compose.sh "${FOLDER}/etc/profile.d"




echo "Copying /var/lib files to ${FOLDER}/var/lib"
mkdir -p "${FOLDER}/var/lib/"
mkdir -p "${FOLDER}/var/lib/connman"

echo "Copying /usr/lib/systemd/system files"
mkdir -p "${FOLDER}/usr/lib/systemd/system"
cp /usr/lib/systemd/system/connman.service "${FOLDER}/usr/lib/systemd/system"
cp /usr/lib/systemd/system/dnscrypt-proxy* "${FOLDER}/usr/lib/systemd/system"
cp /usr/lib/systemd/system/hwclocksync* "${FOLDER}/usr/lib/systemd/system"

sudo cp /var/lib/connman/settings "${FOLDER}/var/lib/connman"
sudo chown "$(whoami):root" "${FOLDER}/var/lib/connman/settings"

echo "Copying /usr/share/devtools files to ${FOLDER}/usr/share/"
mkdir -p "${FOLDER}/usr/share/devtools/"
cp /usr/share/devtools/pacman-extra.conf "${FOLDER}/usr/share/devtools/"
