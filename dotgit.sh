#!/usr/bin/env zsh
# Script to copy my dotfiles and other configuration files
move_folder_contents_to () {
    if [[ ! -e "$2" ]]; then
        mkdir -p "$copy_to"
    fi
    if [[ -d "$1" && -d "$2" ]]; then
        find "$1" -maxdepth 1 -mindepth 1 -exec echo cp -r {} "$2" \;
        find "$1" -maxdepth 1 -mindepth 1 -exec cp -r {} "$2" \;
    else
        printf "Either ‘%s’ or ‘%s’ do not exist or aren't directories\n" "$1" "$2"
    fi
}
FOLDER="$HOME/git/samcv/dot-files"
mkdir -p "${FOLDER}"
cd "$FOLDER" || exit
FOLDER="$(pwd)"

echo "Copying user dot files to ${FOLDER}"
# Copy anything in .zshrc.local that doesn't have a space in front of it
sed -e 's/^ .*//' "$HOME/.zshrc.local" > "${FOLDER}/.zshrc.local"
move_folder_contents_to "$HOME/.profile.d/" "${FOLDER}/"
get_file_folder () {
    readlink -f "$(dirname "$1")"
}
get_postfix () {
    get_file_folder "$1" | sed -e "s|${FOLDER}||g"
}
get_new_folder () {
    printf "%s%s" "${FOLDER}" "$(get_postfix "$1")"
}
get_new_folder_folder () {
    printf "%s/%s" "${FOLDER}" "$1"
}
home_array=(
    .Xresources .XCompose .xinitrc .gitconfig .zpreztorc .zshrc.local .zshrc .vimrc
    .profile .perlcriticrc
    bin/gitstatus-reverse.p6
    .atom/keymap.cson .atom/keymap.cson .atom/styles.less

    .config/mpd/mpd.conf .config/chromium-flags.conf

    git/samcv/UCD/.nav-marker-rules

    svn/community/st/trunk/config.h
    bin/kwrite

    .config/plasma-workspace/env/
)
for i in $home_array; do
    file="$HOME/$i"
    copy_to=$(get_new_folder "$i")
    if [[ -d "$file" ]]; then
        copy_to="$(get_new_folder_folder "$i")"
        if [[ ! -d "$file" ]]; then
            mkdir -p "$copy_to"
        fi
        move_folder_contents_to "$file" "$copy_to"
        exit
    elif [[ -f "$file" && -d "$copy_to" ]]; then
        cp "$file" "$(get_new_folder "$i")"
    elif [[ ! -f "$file" ]]; then
        printf "Can't find file %s\n" "$file"
    elif [[ ! -d "$copy_to" ]]; then
        printf "Can't find copy-to folder: '%s'\n" "$copy_to"
    fi
done
echo "Copying includes" #
mkdir -p "${FOLDER}/includes/st" #
cp ~/svn/community/st/trunk/config.h "${FOLDER}/includes/st" #

echo "Copying atom configuration files" #
mkdir -p "${FOLDER}/.atom" #
cp ~/.atom/keymap.cson "${FOLDER}/.atom/" #
cp ~/.atom/styles.less "${FOLDER}/.atom/" #
cp ~/.atom/config.cson "${FOLDER}/.atom/" #

echo "Coping user ~/.config files to ${FOLDER}/.config" #
mkdir -p "${FOLDER}/.config/mpd" #
cp ~/.config/mpd/mpd.conf "${FOLDER}/.config/mpd" #
cp ~/.config/chromium-flags.conf "${FOLDER}/.config" #
echo "Copying /etc files to ${FOLDER}/etc"
system=(
    etc/dnsmasq.conf
    /etc/sysctl.conf
    #/etc/pacman.conf
    /etc/mkinitcpio.conf
    /etc/makepkg.conf
    /etc/thinkfan.conf
    /etc/locale.conf

    /etc/connman/main.conf

    /etc/udev/rules.d/10-trackpoint.rules
    /etc/modprobe.d/thinkpad_acpi.conf

    /etc/profile.d/perl6bin.sh
    /etc/profile.d/vdpau_driver.sh

    /usr/lib/systemd/system/connman.service
    # TODO /usr/lib/systemd/system/dnscrypt-proxy*
    # TODO /etc/systemd/system/*.d
    # TODO /usr/lib/systemd/system/dnscrypt-proxy*
    # TODO /usr/lib/systemd/system/hwclocksync*

    /var/lib/connman/settings
    /usr/share/devtools/pacman-extra.conf

)
mkdir -p "${FOLDER}/etc"
cp /etc/dnsmasq.conf "${FOLDER}/etc" #
cp /etc/sysctl.conf "${FOLDER}/etc" #
cp /etc/pacman.conf "${FOLDER}/etc" #
cp /etc/mkinitcpio.conf "${FOLDER}/etc" #
cp /etc/makepkg.conf "${FOLDER}/etc" #
sudo cp /etc/resolv.conf "${FOLDER}/etc" #
cp /etc/thinkfan.conf "${FOLDER}/etc" #
cp /etc/locale.conf "${FOLDER}/etc" #
mkdir -p "${FOLDER}/etc/udev/rules.d" #
cp /etc/udev/rules.d/10-trackpoint.rules "${FOLDER}/etc/udev/rules.d" #

echo "Copying /etc/connman files"
mkdir -p "${FOLDER}/etc/connman"
cp /etc/connman/main.conf "${FOLDER}/etc/connman" #

echo "Copying /etc/modprobe.d files" #
mkdir -p "${FOLDER}/etc/modprobe.d" #
cp /etc/modprobe.d/thinkpad_acpi.conf "${FOLDER}/etc/modprobe.d" #

echo "Copying profile.d contents to ${FOLDER}/etc/profile.d" #
mkdir -p "${FOLDER}/etc/profile.d" #
cp /etc/profile.d/perl6bin.sh "${FOLDER}/etc/profile.d" #
cp /etc/profile.d/vdpau_driver.sh "${FOLDER}/etc/profile.d" #
mkdir -p "${FOLDER}/etc/systemd/system" #
cp -R /etc/systemd/system/*.d ${FOLDER}/etc/systemd/system #



echo "Copying /var/lib files to ${FOLDER}/var/lib" #
mkdir -p "${FOLDER}/var/lib/" #
mkdir -p "${FOLDER}/var/lib/connman" #

echo "Copying /usr/lib/systemd/system files" #
mkdir -p "${FOLDER}/usr/lib/systemd/system" #
cp /usr/lib/systemd/system/connman.service "${FOLDER}/usr/lib/systemd/system" #
cp /usr/lib/systemd/system/dnscrypt-proxy* "${FOLDER}/usr/lib/systemd/system" #
cp /usr/lib/systemd/system/hwclocksync* "${FOLDER}/usr/lib/systemd/system" #

sudo cp /var/lib/connman/settings "${FOLDER}/var/lib/connman" #
sudo chown "$(whoami):root" "${FOLDER}/var/lib/connman/settings" #

echo "Copying /usr/share/devtools files to ${FOLDER}/usr/share/" #
mkdir -p "${FOLDER}/usr/share/devtools/" #
cp /usr/share/devtools/pacman-extra.conf "${FOLDER}/usr/share/devtools/" #

mkdir -p "$FOLDER/bin" #
cp "$HOME/bin/kwrite" "$FOLDER/bin" #
