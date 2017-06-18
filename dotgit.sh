#!/usr/bin/env zsh
# Script to copy my dotfiles and other configuration files
move_folder_contents_to () {
    [[ $2 ]] && copy_to="$2" || exit $LINENO
    if [[ ! -e "$2" ]]; then
        mkdir -p "$copy_to"
    fi
    if [[ -d $1 && -d $2 ]]; then
        find "$1" -maxdepth 1 -mindepth 1 -exec echo sudo cp -r {} --> "$2" \;
        find "$1" -maxdepth 1 -mindepth 1 -exec sudo cp -r {} "$2" \;
    else
        printf "Either ‘%s’ or ‘%s’ do not exist or aren't directories\n" "$1" "$2"
    fi
}
FOLDER="$HOME/git/samcv/dot-files"
mkdir -p "${FOLDER}"
cd "$FOLDER" || exit
FOLDER="$(pwd)"

echo "Copying user dot files to ${FOLDER}"

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
copy_to_git_repo () {
    i="$1"
    [[ $2 ]] && file="$HOME/$i" || file="$i"
    copy_to=$(get_new_folder "$i")
    if [[ -d "$file" ]]; then
        copy_to="$(get_new_folder_folder "$i")"
        if [[ ! -d "$file" ]]; then
            mkdir -p "$copy_to"
        fi
        move_folder_contents_to "$file" "$copy_to"
    elif [[ -f "$file" && -d "$copy_to" ]]; then
        cp "$file" "$(get_new_folder "$i")"
    elif [[ ! -f "$file" ]]; then
        printf "Can't find file %s\n" "$file"
    elif [[ ! -d "$copy_to" ]]; then
        printf "Can't find copy-to folder: '%s'\n" "$copy_to"
    fi
}
home_array=(
    .Xresources .XCompose .xinitrc .gitconfig .zpreztorc .zshrc.local .zshrc .vimrc
    .profile .perlcriticrc
    bin/gitstatus-reverse.p6
    .atom/keymap.cson .atom/keymap.cson .atom/styles.less

    .config/mpd/ .config/chromium-flags.conf

    git/samcv/UCD/.nav-marker-rules

    svn/community/st/trunk/config.h
    bin/kwrite
    svn/community/st/trunk/config.h
    .config/plasma-workspace/env/
    .config/zsh
    .profile.d
)
system=(
    /etc/dnsmasq.conf
    /etc/sysctl.conf
    #/etc/pacman.conf
    /etc/mkinitcpio.conf
    /etc/makepkg.conf
    /etc/thinkfan.conf
    /etc/locale.conf
    /etc/connman
    /etc/udev/rules.d/
    /etc/modprobe.d/

    /etc/profile.d/

    /usr/lib/systemd/system/connman.service

    /var/lib/connman/settings
    /usr/share/devtools/pacman-extra.conf
    /usr/share/devtools/pacman-extra.conf

)
# ~/ files
for i in $home_array; do
    copy_to_git_repo "$i" "$HOME"
done
# system files
for i in $system; do
    copy_to_git_repo "$i"
done
# Don't fail in case we can't find some of these files
setopt nullglob
system_globbed=(
    /usr/lib/systemd/system/dnscrypt-proxy*
    /etc/systemd/system/*.d
    /usr/lib/systemd/system/hwclocksync*
)
copy_to_git_repo_globbed () {
    [[ $1 ]] && glob="$1" || exit $LINENO
    #setopt GLOB
    for i in $glob; do
        echo $i
        #sudo chown -R "$(whoami):root" "${FOLDER}${i}" #
    done

}
echo '#############'
for i in $system_globbed; do
    #echo $i
    copy_to_git_repo_globbed "$i"
done
exit


echo "Copying /usr/lib/systemd/system files" #
mkdir -p "${FOLDER}/usr/lib/systemd/system" #


echo "Copying /usr/share/devtools files to ${FOLDER}/usr/share/" #
mkdir -p "${FOLDER}/usr/share/devtools/" #
cp /usr/share/devtools/pacman-extra.conf "${FOLDER}/usr/share/devtools/" #

mkdir -p "$FOLDER/bin" #
cp "$HOME/bin/kwrite" "$FOLDER/bin" #
