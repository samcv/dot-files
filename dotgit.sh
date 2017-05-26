#!/usr/bin/env sh
# Script to copy my dotfiles and other configuration files

FOLDER="$HOME/git/samcv/dot-files"
mkdir -p "${FOLDER}"
cd "$FOLDER" || exit
FOLDER="$(pwd)"

echo "Coping this script to ${FOLDER}"
cp ~/bin/dotgit.sh "${FOLDER}"

echo "Copying user dot files to ${FOLDER}"
# Copy anything in .zshrc.local that doesn't have a space in front of it
sed -e 's/^ .*//' ~/.zshrc.local > "${FOLDER}/.zshrc.local"
cp ~/.xinitrc "${FOLDER}/.xinitrc"
cp ~/.XCompose "${FOLDER}/.XCompose"
cp ~/.Xresources "${FOLDER}/.Xresources"
cp ~/.vimrc "${FOLDER}/.vimrc"
cp ~/.profile "${FOLDER}/.profile"
cp ~/.perlcriticrc "${FOLDER}/.perlcriticrc"
cp ~/.gitconfig "${FOLDER}/.gitconfig"
cp -R ~/.profile.d/ "${FOLDER}/"

cp ~/git/UCD-samcv/.nav-marker-rules "${FOLDER}/.nav-marker-rules"

echo "Copying includes"
mkdir -p "${FOLDER}/includes/st"
cp ~/svn/community/st/trunk/config.h "${FOLDER}/includes/st"

echo "Copying atom configuration files"
mkdir -p "${FOLDER}/.atom"
cp ~/.atom/keymap.cson "${FOLDER}/.atom/"
cp ~/.atom/styles.less "${FOLDER}/.atom/"
cp ~/.atom/config.cson "${FOLDER}/.atom/"

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
cp /etc/locale.conf "${FOLDER}/etc"
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
mkdir -p "${FOLDER}/etc/systemd/system"
cp -R /etc/systemd/system/*.d ${FOLDER}/etc/systemd/system



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

mkdir -p "$FOLDER/bin"
cp "$HOME/bin/kwrite" "$FOLDER/bin"
